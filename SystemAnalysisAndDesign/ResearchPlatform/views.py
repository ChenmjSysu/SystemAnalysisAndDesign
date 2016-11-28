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
			email = form.cleaned_data["email"]
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
			print permission
			print "+++++++++++++++++"
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
			userType = UserType.objects.create(user = user, type = usertype, permission = permission[0])
			userType.save()
			#login after registering
			newUser = auth.authenticate(username = username, password = password1)
			if newUser is not None:
				auth.login(request, newUser)
				return render_to_response("")
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
			errors.extend(RegisterForm.errors.values())
			response_data["result"] = "fail"
			response_data["message"] = "input is not valid"
			return HttpResponse(json.dumps(response_data), content_type = "application/json")

# About the Projects
def AboutProject(request):
	biologicalCategory = BiologicalCategory.objects.all()

# Team
def Team(request):
	team = Team.objects.all()

# The Progress of projects
def ProjectProgress(request):
	biologicalCategory = BiologicalCategory.objects.all()

# Get a list of notices/news
def List(request, type):
	announcements = Announcement.objects.filter(type = type).order_by("submittime")
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

# Get a notice/news according to ID
def Detail(request, type, id):
	response_data = {}
	aid = int(id)
	announcement = Announcement.objects.filter(id = aid).filter(type = type)
	response_data = {}	
	if len(announcement) > 0:
		response_data["result"] = "success"
		response_data["message"] = announcement[0].toDict()		
		return HttpResponse(json.dumps(response_data), content_type = "application/json")
	else:
		response_data["result"] = "fail"
		response_data["message"] = "an error id"
		return HttpResponse(json.dumps(respons_data), content_type = "application/json")

# Add a notice/news
def Add(request, type):
	response_data = {}	
	if request.user.is_authenticated():
		if Permission.objects.get(type = request.user.type.type).write == False:
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
			if content is None or title is None:
				response_data["result"] = "fail"
				response_data["message"] = "content or title can not be null"
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
		if Permission.objects.get(type = request.user.type.type).write == False:
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


