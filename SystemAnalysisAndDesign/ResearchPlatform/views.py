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

def form(request):
	# print request

	return render_to_response("form.html", context_instance=RequestContext(request))
