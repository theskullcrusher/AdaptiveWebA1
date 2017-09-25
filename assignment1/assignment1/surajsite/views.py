from django.shortcuts import render, render_to_response
from django.http import HttpResponse, JsonResponse
from django.template.response import TemplateResponse
from assignment1.surajsite.models import *
from datetime import datetime
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
import django_tables2 as tables
from django.views.decorators.csrf import csrf_exempt
import traceback
import logging
logger = logging.getLogger(__name__)
import random
import datetime
import time
from django.db.models import Count, Sum, Max, Min
from copy import deepcopy
from assignment1.fusioncharts import FusionCharts

class LogTable(tables.Table):
	class Meta:
		model = UserLogs
		attrs = {'class': 'mytable1'}

class LoginLogTable(tables.Table):
	class Meta:
		model = LoginLogs
		attrs = {'class': 'mytable'}

def index(request):
	return redirect('/login/')


@login_required(login_url='/login/')
def profile(request):    

	user = request.user.username
	usr = SiteUser.objects.filter(username=user)[0]
	rows = UserLogs.objects.filter(user=usr).order_by('-timestamp')
	table = LogTable(rows) 

	rows1 = LoginLogs.objects.filter(username=user).values('id','action','username','timestamp').order_by('-timestamp')
	table1 = LoginLogTable(rows1)
	response = render_to_response("templates/profile.html", {"table": table, "table1":table1},
							  context_instance=RequestContext(request))
	response.set_cookie("userId",user)
	return response

@csrf_exempt
def record(request):
  try:
	user = ""
#    if request.user.is_authenticated():
#        user = request.user.username 
#    else:
#        responseData = {
#            'success' : False,
#            'status' : 401
#        }
#        return JsonResponse(responseData)
 
	user = str(request.POST.get("userId", ""))
	user = user.replace("'","")
	if user == "":
		responseData = {
			'success' : False,
			'status' : 401
		}
		return JsonResponse(responseData)
  
	action = str(request.POST.get("action", ""))
	link = str(request.POST.get("link",""))
	if 'http' not in link and link.strip() != "":
		link = 'https://stackoverflow.com' + link
	main_link = str(request.POST.get("main_link",""))
	obj = str(request.POST.get("obj",""))

	timestamp = request.POST.get("timestamp","")
	time = datetime.fromtimestamp(float(timestamp)/1000.0)
	
	usr = SiteUser.objects.filter(username=user)[0]
	ul = UserLogs.objects.create(user=usr, action=action,link=link, timestamp=time,obj=obj, main_link=main_link)
	ul.save()

	responseData = {
		'success' : True,
		'status' : 200
	}
	return JsonResponse(responseData)
  except Exception as e:
	print e
	logger.debug(e)


@login_required(login_url='/login/')
#@csrf_exempt
def analytics(request):
	"""
		Analytics for user
	"""
	try:
		user = request.user.username
		usr = SiteUser.objects.filter(username=user)[0]
		objs = UserLogs.objects.filter(user=usr).values('action').annotate(total=Count('action')).order_by('total')
		xdata = []
		ydata = []
		for obj in objs:
			xdata.append(str(obj['action']))
			ydata.append(str(obj['total']))		
		#print str(xdata)
		#print str(ydata)
		color_list = ['#5d8aa8', '#e32636', '#efdecd', '#ffbf00', '#ff033e', '#a4c639',
                '#b2beb5', '#8db600', '#7fffd4', '#ff007f', '#ff55a3', '#5f9ea0']
		extra_serie = {
        	"tooltip": {"y_start": " event called ", "y_end": " times"},
        	"color_list": color_list
    		}
		chartdata = {'x': xdata, 'y1': ydata, 'extra1': extra_serie}
		charttype = "pieChart"
		data = {
			'charttype': charttype,
			'chartdata': chartdata,
			'chartcontainer': "piechart_container",
			'extra': {
			'x_is_date': False,
			'x_axis_format': '',
			'tag_script_js': True,
			'jquery_on_ready': False,
			}
			}

		objs_all = UserLogs.objects.all().values('action').annotate(total=Count('action')).order_by('total')		
		xdata1 = []
		ydata1 = []
		for obj in objs_all:
			xdata1.append(str(obj['action']))
			ydata1.append(str(obj['total']))		
		chartdata1 = {'x': xdata1, 'y1': ydata1, 'extra1': extra_serie}
		charttype1 = "pieChart"

		data['charttype1'] = charttype1
		data['chartdata1'] = chartdata1
		data['chartcontainer1'] = "piechart_container1"
		data['extra1'] = deepcopy(data['extra'])

		response = render_to_response('templates/analytics.html', data,
							  context_instance=RequestContext(request))
		print response
		return response    
	except Exception as e:
		print e
		logger.debug(e)
		logging.warning(e)
		return render_to_response('templates/analytics.html', {"charttype":"error","chartdata":str(e)},
							  context_instance=RequestContext(request))    


@login_required(login_url='/login/')
def demo(request):
    column2d = FusionCharts("column2d", "ex1", "600", "400", "chart-1", "json",
    """{  
    "chart": {
        "caption": "Monthly Revenue for last year",
        "subCaption": "Harry\'s Supermart",
        "xAxisName": "Month",
        "yAxisName": "Revenues (In USD)",
        "numberPrefix": "$",
        "theme": "zune"
    },
    "data": [{
        "label": "Jan",
        "value": "420000"
    }, {
        "label": "Feb",
        "value": "810000"
    }, {
        "label": "Mar",
        "value": "720000"
    }, {
        "label": "Apr",
        "value": "550000"
    }, {
        "label": "May",
        "value": "910000"
    }, {
        "label": "Jun",
        "value": "510000"
    }, {
        "label": "Jul",
        "value": "680000"
    }, {
        "label": "Aug",
        "value": "620000"
    }, {
        "label": "Sep",
        "value": "610000"
    }, {
        "label": "Oct",
        "value": "490000"
    }, {
        "label": "Nov",
        "value": "900000"
    }, {
        "label": "Dec",
        "value": "730000"
    }]
	}""")

    return render(request, 'templates/demo.html', {'output': column2d.render()})
