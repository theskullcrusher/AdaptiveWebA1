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
import time
from django.db.models import Count, Sum, Max, Min
from copy import deepcopy
from assignment1.fusioncharts import FusionCharts
import re
import random
from django.contrib.auth.models import User

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
	#logger.debug(e)


@login_required(login_url='/login/')
#@csrf_exempt
def analytics(request):
	"""
		Analytics for user
	"""
	try:
		# tab = request.GET.get('tab', '1')
		# if tab == '1':
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
		data1 = {
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

		data1['charttype1'] = charttype1
		data1['chartdata1'] = chartdata1
		data1['chartcontainer1'] = "piechart_container1"
		data1['extra1'] = deepcopy(data1['extra'])


		usr_count = SiteUser.objects.all().count()
		xdata2 = []
		ydata2 = []
		for obj in objs_all:
			xdata2.append(str(obj['action']))
			ydata2.append(float(obj['total'])/usr_count)		
		chartdata2 = {'x': xdata2, 'y1': ydata2, 'extra1': extra_serie}
		charttype2 = "pieChart"

		data1['charttype2'] = charttype2
		data1['chartdata2'] = chartdata2
		data1['chartcontainer2'] = "piechart_container2"
		data1['extra2'] = deepcopy(data1['extra'])


		# response = render_to_response('templates/analytics.html', data1,
		# 					  context_instance=RequestContext(request))
		# return response
		# else:
		data1['output'] = charts("column3D", "chart-1", 1, request, 1)
		data1['output1'] = charts("column3D","chart-2", 2, request, 2)

		data1['output2'] = charts("doughnut3D", "chart-3", 1, request, 3)
		data1['output3'] = charts("doughnut3D","chart-4", 2, request, 4)

		data1['output4'] = chartsDragNode("dragnode","chart-5", 1, request, 5)
		data1['output5'] = chartsDragNode("dragnode","chart-6", 2, request, 6)


		return render_to_response('templates/analytics.html', data1, context_instance=RequestContext(request))

	except Exception as e:
		print e
		logger.debug(e)
		logging.warning(e)
		


def charts(chart_type, chart_no, flag, request, flag1):
	"Get charts for DRY"
	dataSource = {}
	if flag == 1:
		caption = "User Statistics"
		subcaption = "Your Activity"
	elif flag == 2:
		caption = "User Statistics"
		subcaption = "All Users"

	dataSource['chart'] = { 
		"caption": caption,
		"subCaption": subcaption,
		"xAxisName": "Activity Type",
		"yAxisName": "Count",
		"paletteColors" : "#0075c2, #5d8aa8, #e32636, #efdecd, #ffbf00, #ff033e, #a4c639, #b2beb5, #8db600, #7fffd4, #ff007f, #ff55a3, #5f9ea0",
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
	if flag == 1:
		usr = SiteUser.objects.filter(username=user)[0]
		obj = UserLogs.objects.filter(user=usr).values_list('obj')
		obj_c = obj.distinct().count()
		link = UserLogs.objects.filter(user=usr).values_list('link')
		link_c = link.distinct().count()
		main_link = UserLogs.objects.filter(user=usr).values_list('main_link')
		main_link_c = main_link.distinct().count()
		action = UserLogs.objects.filter(user=usr).values_list('action')
		action_c = action.distinct().count()
	elif flag == 2:
		obj = UserLogs.objects.all().values_list('obj')
		obj_c = obj.distinct().count()
		link = UserLogs.objects.all().values_list('link')
		link_c = link.distinct().count()
		main_link = UserLogs.objects.all().values_list('main_link')
		main_link_c = main_link.distinct().count()
		action = UserLogs.objects.all().values_list('action')
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
	  linkData['id'] = str(key)
	  linkedchart = {}
	  linkedchart['chart'] = {
		"caption" : "Detailed " + key +" Info",
		"subCaption": "Drilldown details",
		"xAxisName": "Activity",
		"yAxisName": "Count",
		"showValues": "0",
		"theme": "zune",
		"paletteColors" : "#0075c2, #5d8aa8, #e32636, #efdecd, #ffbf00, #ff033e, #a4c639, #b2beb5, #8db600, #7fffd4, #ff007f, #ff55a3, #5f9ea0",
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
	  if flag == 1:
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
	  elif flag == 2:
		  if key == 'Action':
			objects = UserLogs.objects.all().values('action').annotate(total=Count('action')).order_by('total')
			val = "action"
		  elif key == 'Object':
			objects = UserLogs.objects.all().values('obj').annotate(total=Count('obj')).order_by('total')
			val = "obj"
		  elif key == 'Link':
			objects = UserLogs.objects.all().values('link').annotate(total=Count('link')).order_by('total')
			val = "link"
		  elif key == 'ParentLink':
			objects = UserLogs.objects.all().values('main_link').annotate(total=Count('main_link')).order_by('total')
			val = "main_link"

	  
	  for each in objects:
		arrDara = {}
		each[val] = str(each[val]).replace("https://stackoverflow.com","")
		each[val] = re.sub('\W+','', each[val])
		if str(each[val]).strip() == "" or str(each[val]).strip() == "#":
			each[val] = "Undefined"
		arrDara['label'] = each[val]
		arrDara['value'] = int(each['total'])
		linkedchart['data'].append(arrDara)

	  linkData['linkedchart'] = linkedchart
	  dataSource['linkeddata'].append(linkData)

	column2D = FusionCharts(chart_type, 'ex'+str(flag1) , "600", "350", chart_no, "json", dataSource)
	return column2D.render()



def chartsDragNode(chart_type, chart_no, flag, request, flag1):
	"Get charts for DRY"
	dataSource = {}
	if flag == "1":
		caption = "User-Object Mapping"
		subcaption = ""
	else:
		caption = "User-Link Mapping"
		subcaption = ""


	dataSource['chart'] = { 
		"caption": caption,
		"paletteColors" : "#0075c2, #5d8aa8, #e32636, #efdecd, #ffbf00, #ff033e, #a4c639, #b2beb5, #8db600, #7fffd4, #ff007f, #ff55a3, #5f9ea0",
		"xaxisminvalue": "0",
		"xaxismaxvalue": "100",
		"yaxisminvalue": "0",
		"yaxismaxvalue": "100",
		"is3d": "1",
		"showformbtn": "1",
		"viewmode": "0",
		"showplotborder": "1",
		"plotborderthickness": "4",
		"theme": "fint",
		"showcanvasborder": "1",
		"canvasborderalpha": "20",
		"animation": "0"
		}

	dataSource['dataset'] = []
	data = {}
	data['data'] = []
	dataSource['connectors'] = []
	connector = {
		"color": "#ffffff",
		"stdthickness": "10"
	}
	connector['connector'] = []

	colors = "#0075c2, #5d8aa8, #e32636, #efdecd, #ffbf00, #ff033e, #a4c639, #b2beb5, #8db600, #7fffd4, #ff007f, #ff55a3, #5f9ea0".split(', ')
	connector_item = {
				"strength": "2",
				"from": "",
				"to": "",
				"color": "",
				"arrowatstart": "0",
				"arrowatend": "0"
	}

	data_item1 = {
				"id": "",
				"label": "",
				"color": "#ffffff",
				"x": "",
				"y": "",
				"radius": "20",
				"shape": "circle"
	}
	data_item2 = {
				"id": "",
				"label": "",
				"color": "#ffffff",
				"x": "",
				"y": "",
				"radius": "30",
				"shape": "circle"
	}

	if flag == 1:
		objects = UserLogs.objects.all().values_list('obj', flat=True).distinct()
		objects = list(objects)
		if '' in objects:
			objects.remove('')
		objects_count = len(objects)
		users = User.objects.all()
		users_count = users.count()
		x_end = 1800
		y_end = 1800
		x_step = 1800/(objects_count+2)
		y_step = 1800/(users_count+2)
		x_start = x_step
		y_start = y_step

		for n, each in enumerate(objects):
			val = deepcopy(data_item2)
			val['id'] = val['label'] = re.sub('\W+','', each)
			val['x'] = x_start + n*x_step
			val['y'] = y_start
			data['data'].append(val)

		for n, each in enumerate(users):
			val = deepcopy(data_item1)
			val['id'] = str(each.id)
			val['label'] = str(each.username)
			val['x'] = x_start + n*y_step
			val['y'] = y_end
			data['data'].append(val)

		for each in objects:
			val = deepcopy(connector_item)
			ussers = UserLogs.objects.filter(obj=each).values_list('user_id', flat=True).distinct()
			#print "Len of users",ussers.count()
			rand_color = random.choice(colors)
			for us in ussers:
				val = deepcopy(connector_item)
				val['to'] = str(us)
				val['from'] = re.sub('\W+','', each)
				val['color'] = rand_color
				connector['connector'].append(val)

	else:
		objects = UserLogs.objects.all().values_list('main_link', flat=True).distinct()
		objects = list(objects)
		if '' in objects:
			objects.remove('')
		objects_count = len(objects)
		users = User.objects.all()
		users_count = users.count()
		x_end = 1800
		y_end = 1800
		x_step = 1800/(objects_count+2)
		y_step = 1800/(users_count+2)
		x_start = x_step
		y_start = y_step

		for n, each in enumerate(objects):
			val = deepcopy(data_item2)
			val['id'] = val['label'] = re.sub('\W+','', each)
			val['x'] = x_start + n*x_step
			val['y'] = y_start
			data['data'].append(val)

		for n, each in enumerate(users):
			val = deepcopy(data_item1)
			val['id'] = str(each.id)
			val['label'] = str(each.username)
			val['x'] = x_start + n*y_step
			val['y'] = y_end
			data['data'].append(val)

		for each in objects:
			val = deepcopy(connector_item)
			ussers = UserLogs.objects.filter(main_link=each).values_list('user_id', flat=True).distinct()
			#print "Len of users",ussers.count()
			rand_color = random.choice(colors)
			for us in ussers:
				val = deepcopy(connector_item)
				val['to'] = str(us)
				val['from'] = re.sub('\W+','', each)
				val['color'] = rand_color
				connector['connector'].append(val)
		

	dataSource['connectors'].append(connector)
	dataSource['dataset'].append(data)
	
	column2D = FusionCharts(chart_type, 'ex'+str(flag1) , "1800", "1000", chart_no, "json", dataSource)
	return column2D.render()