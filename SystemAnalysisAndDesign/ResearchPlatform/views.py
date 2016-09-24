#coding=utf8
from django.shortcuts import render_to_response, render
from django.http import HttpResponse, HttpResponseRedirect, Http404
import django.contrib.staticfiles
import time
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

def hcy(request):
	return HttpResponse("SB 黄蠢瑶")



# A DjangoUeditor Demo
def form(request):
	# print request

	return render_to_response("form.html", context_instance=RequestContext(request))

# Login
def login(request):
	if request.method == "GET":
		return render_to_response("login.html", RequestContext(request))

	else:
		form = LoginForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data["username"]
			password = form.cleaned_data["password"]
			user = auth.authenticate(username = username, password = password)
			if user is not None and user.is_active:
				auth.login(request, user)
				return render_to_response("login success", RequestContext(request))
			else:
				return render_to_response("login fail")
		return render_to_response("login fail")

# Logout
def logout(request):
	auth.logout(request)  
	return HttpResponseRedirect('/')  

# Register
def register(request):
	if request.method == "GET":
		return render_to_response("register.html")
	else:
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
				return

			filterResult = User.objects.filter(username = username)
			if len(filterResult) != 0:
				errors.append("username existed")
				return
			user = User.objects.create(username = username, password = password1, email = email)
			user.save()
			userType = UserType.objects.create(user = user, type = usertype, permission = Permission.objects.get(usertype))
			userType.save()
			#login after registering
			newUser = auth.authenticate(username = username, password = password1)
			if newUser is not None:
				auth.login(request, newUser)
				return render_to_response("")
		else:
			errors.extend(RegisterForm.errors.values())
		return render_to_response("register fail")

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
def AnnouncementList(request, type):
	announcements = Announcement.objects.filter(type = type).order_by("datetime")
	count = announcements.count()	
	countPerPage = int(request.GET.get("countPerPage", 10))
	pageCount = count / countPerPage
	if count % countPerPage != 0:
		pageCount += 1
	pid = request.GET.get("pid", 0)
	announcements = announcement[pid * countPerPage : (pid + 1) * countPerPage]

	return HttpResponse(announcements)

# Get a notice/news according to ID
def GetAnnouncement(request, type, id):
	aid = int(id)
	announcement = announcements.objects.filter(id = a_id).filter(type = type)
	if len(announcement) > 0:
		return HttpResponse(announcement)
	else:
		return HttpResponse("An error Id")

# Add a notice/news
def AddAnnouncement(request, type):
	if request.user.is_authenticated():
		if Permission.objects.get(type = request.user.type.type).write == False:
			return HttpResponse("Permission Denied")
		if request.method == "GET":
			return HttpResponseRedirect("")			
		else:
			content = request.GET.get("content", None)
			title = request.GET.get("title", None)
			announcement = Announcement.objects.create(title = title, content = content, editor = request.user, type = type)
			announcement.save()
			if content is None or title is None:
				return HttpResponse("content or title can not be null")
			return HttpResponse("Submit ok")
	else:
		return HttpResponse("Login first")

# Delete a notice/news according to Aid
# Pass th Aid with name "aid"
def DeleteAnnouncement(request, type):
	if request.user.is_authenticated():
		if not request.user.type == "super manager":
			return HttpResponse("Permission Denied")
		if request.method == "POST":
			aid = request.POST.get("aid", None)
			announcement = Announcement.objects.filter(id = int(aid))
			if announcement.count() <= 0:
				return HttpResponse("%s with id %s is not found" % (type, aid))
			else:
				announcement.delete()
				return HttpResponse("Delete OK")	
		else:
			return HttpResponse("POST ONLY")
	else:
		return HttpResponse("Login first")

# pass a notice/news according to Aid
# Pass th Aid with name "aid"
def PassAnnouncement(request, type):
	if request.user.is_authenticated():
		if not request.user.type == "super manager":
			return HttpResponse("Permission Denied")
		if request.method == "POST":
			aid = request.POST.get("aid", None)
			announcement = Announcement.objects.filter(id = int(aid))
			if announcement.count() <= 0:
				return HttpResponse("%s with id %s is not found" % (type, aid))
			else:
				announcement.status = "Passed"
				announcement.save()
				return HttpResponse("Pass OK")	
		else:
			return HttpResponse("POST ONLY")
	else:
		return HttpResponse("Login first")