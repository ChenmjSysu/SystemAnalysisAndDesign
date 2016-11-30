#coding=utf8
from django.shortcuts import render_to_response, render
from django.http import HttpResponse, HttpResponseRedirect, Http404
import django.contrib.staticfiles
import time
import json
from django.contrib import auth
from django.utils.http import urlquote
import datetime
from django.core.context_processors import csrf
from django import template
from django.template.loader import get_template
from django.template import Context
from django.template import RequestContext
import os
import mimetypes
from django.core import serializers

from django.contrib.auth.models import User  
from forms import LoginForm, RegisterForm

from models import *

# A DjangoUeditor Demo
def form(request):
	# print request

	return render_to_response("form.html", context_instance=RequestContext(request))

def index(request):
	result = dict()
	news = Announcement.objects.filter(type="News").order_by("-submittime")[:3]
	notices = Announcement.objects.filter(type="Notice").order_by("-submittime")[:3]
	result["news"] = news
	result["notices"] = notices
	result["header"] = "header"
	return render_to_response("index.html", result, context_instance=RequestContext(request))

def Analysis(request):
	result = {"header": "analysis"}
	return render_to_response("analysis.html", result, context_instance=RequestContext(request))

def Teams(request, id="1"):
	mainTeam = Team.objects.filter(isMain = True)[0]
	currentTeam = Team.objects.get(id=int(id))
	teams = Team.objects.filter(isMain = False)
	print mainTeam
	print teams
	return render_to_response("team.html", {"mainTeam": mainTeam, "teams": teams, "header": "team", "currentTeam": currentTeam, "team": True, "member": False}, context_instance=RequestContext(request))

def Members(request, id="1"):
	response_data = dict()
	mainTeam = Team.objects.filter(isMain = True)[0]
	teams = Team.objects.filter(isMain = False)
	currentMember = Member.objects.filter(id = int(id))
	if len(currentMember) == 0:
		response_data["result"] = "fail"
		response_data["message"] = "user type is not exist"
		return HttpResponse(json.dumps(response_data), content_type = "application/json")
	else:
		currentMember = currentMember[0]
		response_data["result"] = "success"
		response_data["message"] = currentMember.toDict()
		# return HttpResponse(json.dumps(response_data), content_type = "application/json")
		return render_to_response("team.html", {"mainTeam": mainTeam, "teams": teams, "header": "team", "currentMember": currentMember, "team": False, "member": True}, context_instance=RequestContext(request))


def About(request, id="1"):
	biologicalCategory = BiologicalCategory.objects.all()
	biologicalName = BiologicalName.objects.get(id = int(id))
	result = dict()
	result["biologicalCategory"] = biologicalCategory
	result["biologicalName"] = biologicalName
	result["header"] = "about"
	return render_to_response("about.html", result, context_instance=RequestContext(request))	

def Progress(request, id="1"):
	biologicalCategory = BiologicalCategory.objects.all()
	biologicalName = BiologicalName.objects.get(id = int(id))
	result = dict()
	result["biologicalCategory"] = biologicalCategory
	result["biologicalName"] = biologicalName
	result["header"] = "progress"
	return render_to_response("progress.html", result, context_instance=RequestContext(request))	

# Login
def login(request):
	if request.method == "GET":
		return render_to_response("login.html", RequestContext(request))

	else:
		response_data = {}
		response_data["result"] = "success"
		form = LoginForm(request.POST)
		if form.is_valid():			
			username = form.cleaned_data["username"]
			password = form.cleaned_data["password"]
			user = auth.authenticate(username = username, password = password)
			if user is not None and user.is_active:
				auth.login(request, user)
				# print request.user.is_authenticated()
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			else:
				response_data["result"] = "fail"
				response_data["message"] = "user is None or password is not correct"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
		response_data["result"] = "fail"
		response_data["message"] = "input is not valid"
		return HttpResponse(json.dumps(response_data), content_type = "application/json")

# Logout
def logout(request):
	auth.logout(request)  
	return HttpResponseRedirect('/')  

# Register
def register(request):
	if request.method == "GET":
		return render_to_response("register.html")
	else:
		response_data = {}
		response_data["result"] = "success"
		errors = list()
		form = RegisterForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data["username"]
			password1 = form.cleaned_data["password1"]
			password2 = form.cleaned_data["password2"]
			email = username
			usertype = form.cleaned_data["usertype"]

			if password2 != password1:
				errors.append("two passwords are not the same")
				response_data["result"] = "fail"
				response_data["message"] = "two passwords are not same"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")

			filterResult = User.objects.filter(username = username)
			if len(filterResult) != 0:
				errors.append("username existed")
				response_data["result"] = "fail"
				response_data["message"] = "username is already existed"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			
			permission = Permission.objects.filter(type = usertype)
			print usertype
			print "+++"
			if len(permission) == 0: 
				response_data["result"] = "fail"
				response_data["message"] = "user type is not exist"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			print username, password1
			user = User()
			user.username = username
			user.set_password(password1)
			user.email = email
			user.save()						
			userType = UserType.objects.create(user = user, permission = permission[0])
			userType.save()
			#login after registering
			newUser = auth.authenticate(username = username, password = password1)
			if newUser is not None:
				auth.login(request, newUser)
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			else:
				try:
					user = User.objects.get(username = username)
					usertype = UserType.objects.get(user = user)
					usertype.delete()
					user.delete()
				except:
					pass
				response_data["result"] = "fail"
				response_data["message"] = "unknown error"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
		else:
			# errors.extend(RegisterForm.errors.value())
			response_data["result"] = "fail"
			response_data["message"] = "input is not valid"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")

# # About the Projects
# def AboutProject(request):
# 	biologicalCategory = BiologicalCategory.objects.all()


# # The Progress of projects
# def ProjectProgress(request):
# 	biologicalCategory = BiologicalCategory.objects.all()

# Get a list of notices/news
def List(request, type):
	announcements = Announcement.objects.filter(type = type).order_by("-submittime")
	count = announcements.count()	
	countPerPage = int(request.GET.get("countPerPage", 10))
	pageCount = count / countPerPage
	if count % countPerPage != 0:
		pageCount += 1
	pid = request.GET.get("pid", 0)
	announcements = announcements[pid * countPerPage : (pid + 1) * countPerPage]
	# get the title, editor and submittime
	response_data = {}
	response_data["result"] = "success"
	response_data["message"] = list()
	for announcement in announcements:
		response_data["message"].append({"title": announcement.title, "editor": announcement.editor.username, "submittime": announcement.submittime.strftime("%Y-%m-%d %H:%M:%S"), "id": announcement.id})
	
	return HttpResponse(json.dumps(response_data), content_type = "application/json")

def ShowList(request, type):
	announcements = Announcement.objects.filter(type = type).order_by("-submittime")
	return render_to_response("list.html", {"announcements": announcements, "type": type}, context_instance=RequestContext(request))

# Get a notice/news according to ID
def Detail(request, type, id):
	response_data = {}
	aid = int(id)
	announcement = Announcement.objects.filter(id = aid).filter(type = type)
	response_data = {}	
	if len(announcement) > 0:
		response_data["result"] = "success"
		response_data["message"] = announcement[0].toDict()	
		print response_data	
		return HttpResponse(json.dumps(response_data), content_type = "application/json")
	else:
		response_data["result"] = "fail"
		response_data["message"] = "an error id"
		return HttpResponse(json.dumps(response_data), content_type = "application/json")

def ShowDetail(request, id):
	announcement = Announcement.objects.get(id=id)
	type = announcement.type
	return render_to_response("detail.html", {"announcement": announcement, "type": type}, context_instance=RequestContext(request))

# Add a notice/news
def Add(request, type):
	response_data = {}	
	if request.user.is_authenticated():
		if Permission.objects.get(type = request.user.type.permission.type).write == False:
			response_data["result"] = "fail"
			response_data["message"] = "permission denied"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")
		if request.method == "GET":
			return render_to_response()
		else:
			content = request.POST.get("content", None)
			title = request.POST.get("title", None)
			announcement = Announcement.objects.create(title = title, content = content, editor = request.user, type = type)
			announcement.save()
			if content is None or title is None or content == "" or title == "":
				response_data["result"] = "fail"
				response_data["message"] = "content or title can not be null or empty"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			response_data["result"] = "success"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")
	else:
		response_data["result"] = "fail"
		response_data["message"] = "please login first"
		return HttpResponse(json.dumps(response_data), content_type = "application/json")

# Delete a notice/news according to Aid
# Pass th Aid with name "aid"
def Delete(request, type):
	response_data = {}
	login(request)
	if request.user.is_authenticated():
		if Permission.objects.get(type = request.user.type.permission.type).write == False:
			response_data["result"] = "fail"
			response_data["message"] = "permission denied"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")
		if request.method == "POST":
			aid = request.POST.get("aid", None)
			announcement = Announcement.objects.filter(id = int(aid))
			if announcement.count() <= 0:
				response_data["result"] = "fail"
				response_data["message"] = "%s with id %s is not found" % (type, aid)
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
			else:
				announcement.delete()
				response_data["result"] = "success"
				return HttpResponse(json.dumps(response_data), content_type = "application/json")
		else:
			response_data["result"] = "fail"
			response_data["message"] = "post only"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")
	else:
		response_data["result"] = "fail"
		response_data["message"] = "please login first"
		return HttpResponse(json.dumps(response_data), content_type = "application/json")

# pass a notice/news according to Aid
# Pass th Aid with name "aid"
# def PassAnnouncement(request, type):
# 	if request.user.is_authenticated():
# 		if not request.user.type == "super manager":
# 			return HttpResponse("Permission Denied")
# 		if request.method == "POST":
# 			aid = request.POST.get("aid", None)
# 			announcement = Announcement.objects.filter(id = int(aid))
# 			if announcement.count() <= 0:
# 				return HttpResponse("%s with id %s is not found" % (type, aid))
# 			else:
# 				announcement.status = "Passed"
# 				announcement.save()
# 				return HttpResponse("Pass OK")	
# 		else:
# 			return HttpResponse("POST ONLY")
# 	else:
# 		return HttpResponse("Login first")


def Articles(request):
	articles = Article.objects.all()
	temp = dict()
	for article in articles:
		year = article.year
		if not temp.has_key(year):
			temp[year] = list()
		temp[year].append(article.toDict())
	result = list()
	for year in sorted(temp.keys(), reverse = True):
		result.append({"year": year, "articles": temp[year]})
	return render_to_response("publishedArticles.html", {"result": result, "header": "publishedArticles"}, context_instance=RequestContext(request))

def Conference(request, id="1"):
	conferences = AcademicConference.objects.all()
	# result = list()
	# yearSet = set()
	# for conference in conferences:
	# 	year = conference.year
	# 	yearSet.add(year)
	# for year in sorted(list(yearSet), reverse = True):
	# 	result.append({"year": year, "conferences": AcademicConference.objects.filter(year = year).all()})
	# print result

	temp = dict()
	for conference in conferences:
		year = conference.year
		if not temp.has_key(year):
			temp[year] = list()
		temp[year].append(conference.toDict())
	result = list()
	for year in sorted(temp.keys(), reverse = True):
		result.append({"year": year, "conferences": temp[year]})
	currentCon = AcademicConference.objects.get(id=id)
	return render_to_response("conference.html", {"result": result, "header": "conference", "currentCon": currentCon}, context_instance=RequestContext(request))

def DataTools(request):
	dataTools = DataTool.objects.all()
	return render_to_response("dataTool.html", {"dataTools": dataTools, "header": "tools"}, context_instance=RequestContext(request))

def Manage(request):
	result = dict()
	result["news"] = Announcement.objects.filter(type="News")
	result["notice"] = Announcement.objects.filter(type="Notice")
	return render_to_response("manage.html", result, context_instance=RequestContext(request))