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
def analytics(request):
	"""
		Analytics for user
	"""
	try:
		objs = UserLogs.objects.all().values('action').annotate(total=Count('action'))
		xdata = []
		ydata = []
		for obj in objs:
			xdata.append(obj[0])
			ydata.append(obj[1])			

		extra_serie = {"tooltip": {"y_start": "", "y_end": " cal"}}
		chartdata = {'x': xdata, 'y1': ydata, 'extra1': extra_serie}
		charttype = "pieChart"

		data = {
			'charttype': charttype,
			'chartdata': chartdata,
		}
		return render_to_response('analytics.html', data,
							  context_instance=RequestContext(request))    
	except Exception as e:
		print e
		logger.debug(e)
