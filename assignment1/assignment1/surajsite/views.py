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
		return response    
	except Exception as e:
		print e
		logger.debug(e)
		logging.warning(e)
		return render_to_response('templates/analytics.html', {"charttype":"error","chartdata":str(e)},
							  context_instance=RequestContext(request))    


@login_required(login_url='/login/')
def analytics2(request):
	try:
		dataSource = {}
		dataSource['chart'] = { 
			"caption": "User Statistics",
		    "paletteColors" : "#0075c2",
		    "bgColor" : "#ffffff",
		    "borderAlpha": "20",
		    "canvasBorderAlpha": "0",
		    "usePlotGradientColor": "0",
		    "plotBorderAlpha": "10",
		    "showXAxisLine": "1",
		    "xAxisLineColor" : "#999999",
		    "showValues" : "0",
		    "divlineColor" : "#999999",
		    "divLineIsDashed" : "1",
		    "showAlternateHGridColor" : "0",
	        "showValues": "0",
	        "theme": "zune"
			}

		dataSource['data'] = []
		dataSource['linkeddata'] = []

		user = request.user.username
		usr = SiteUser.objects.filter(username=user)[0]
		obj = UserLogs.objects.filter(user=usr).values_list('obj')
		obj_c = obj.distinct().count()
		link = UserLogs.objects.filter(user=usr).values_list('link')
		link_c = link.distinct().count()
		main_link = UserLogs.objects.filter(user=usr).values_list('main_link')
		main_link_c = main_link.distinct().count()
		action = UserLogs.objects.filter(user=usr).values_list('action')
		action_c = action.distinct().count()

		#Add one with timestamp
		n = 0
		temp = {"Action":action_c,"Object":obj_c,"Link":link_c,"ParentLink":main_link_c}		
		for key, value in temp.iteritems():
		  data = {}
		  data['label'] = key
		  data['value'] = value
		  data['link'] = 'newchart-json-'+ key
		  dataSource['data'].append(data)
		  n += 1	
		  linkData = {}
		  linkData['id'] = n
		  linkedchart = {}
		  linkedchart['chart'] = {
			"caption" : "Detailed " + key +" Info",
			"showValues": "0",
			"theme": "zune",
		    "paletteColors" : "#0075c2",
		    "bgColor" : "#ffffff",
		    "borderAlpha": "20",
		    "canvasBorderAlpha": "0",
		    "usePlotGradientColor": "0",
		    "plotBorderAlpha": "10",
		    "showXAxisLine": "1",
		    "xAxisLineColor" : "#999999",
		    "showValues": "0",
		    "divlineColor" : "#999999",
		    "divLineIsDashed" : "1",
		    "showAlternateHGridColor" : "0"
			}

		  linkedchart['data'] = []
		  
		  val = ""
		  if key == 'Action':
		  	objects = UserLogs.objects.filter(user=usr).values('action').annotate(total=Count('action')).order_by('total')
		  	val = "action"
		  elif key == 'Object':
		  	objects = UserLogs.objects.filter(user=usr).values('obj').annotate(total=Count('obj')).order_by('total')
		  	val = "obj"
		  elif key == 'Link':
		  	objects = UserLogs.objects.filter(user=usr).values('link').annotate(total=Count('link')).order_by('total')
		  	val = "link"
		  elif key == 'ParentLink':
		  	objects = UserLogs.objects.filter(user=usr).values('main_link').annotate(total=Count('main_link')).order_by('total')
		  	val = "main_link"
		  
		  for each in objects:
		  	arrDara = {}
		  	if str(each[val]).strip() == '':
		  		each[val] = "Undefined"
			arrDara['label'] = each[val]
			arrDara['value'] = each['total']
			linkedchart['data'].append(arrDara)

		  linkData['linkedchart'] = linkedchart
		  dataSource['linkeddata'].append(linkData)

		column2D = FusionCharts("column2D", "ex1" , "600", "350", "chart-1", "json", dataSource)
		return render(request, 'templates/analytics2.html', {'output': column2D.render()})
	except Exception as e:
		print e
		#logger.debug(e)
		#logging.warning(e)