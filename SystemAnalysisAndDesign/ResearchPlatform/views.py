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

def form(request):
	# print request

	return render_to_response("form.html", context_instance=RequestContext(request))

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

def logout(request):
	auth.logout(request)  
	return HttpResponseRedirect('/')  

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
