#coding: utf8
from django.db import models
from django.contrib.auth.models import User  

# Create your models here.

user_type = (
	("SU", "SuperManager"),
	("Ma", "Manager"),
	("Lab", "LabUser"),
	("Co", "CommonUser"),
	)

class UserType(models.Model):
	user = models.OneToOneField(User, related_name = "type")
	type = models.CharField(u"用户类型", max_length = 20, choices = user_type)
	permission = models.ForeignKey("Permission")

	def __unicode__(self):
		return "user type %s" % type

class Permission(models.Model):
	type = models.CharField(u"用户类型", max_length = 20, choices = user_type, primary_key = True)
	write = models.BooleanField(u"写权限", default = False)
	read = models.BooleanField(u"读权限", default = True)

	def __unicode__(self):
		return "permission %s" % type

class Member(models.Model):
	name = models.CharField(u"姓名", max_length = 20)
	profile = models.TextField(u"简介", blank=True, null=True) # 研究方向/研究成果
	user = models.OneToOneField(User, blank = True, null = True, related_name = "member")

	def __unicode__(self):
		return name

class Team(models.Model):
	name = models.CharField(u"名称", max_length = 10)
	isMain = models.BooleanField(u"是否主要团队", default = False)
	introduction = models.TextField(u"团队介绍") #简介/研究方向/课题任务
	publishArticles = models.ManyToManyField("Article", related_name = "from_team")

	def __unicode__(self):
		return name

class Article(models.Model):
	order = models.IntegerField(u"序号", max_length = 10)
	title = models.CharField(u"标题", max_length = 200)
	author = models.CharField(u"作者", max_length = 50)
	year = models.IntegerField(u"年份")
	link = models.CharField(u"链接", max_length = 200)

	def __unicode__(self):
		return '%d %s' % (order, title)

class BiologicalCategory(models.Model):
	name = models.CharField(u"生物类别", max_length = 20)

	def __unicode__(self):
		return name

class BiologicalName(models.Model):
	name = models.CharField(u"生物名称", max_length = 20)
	category = models.ForeignKey("BiologicalCategory", related_name = "biology")

	def __unicode__(self):
		return name

class Project(models.Model):
	introduction = models.TextField(u"基本信息介绍")
	biology = models.OneToOneField("BiologicalName")
	database = models.TextField(u"相关数据库")
	publishArticles = models.ManyToManyField("Article", related_name = "from_project")
	relatedArticles = models.ManyToManyField("Article", related_name = "about_project")
	progress = models.OneToOneField("ProjectProgress", related_name = "project")

	def __unicode__(self):
		return biology.name

class ProjectProgress(models.Model):
	content = models.TextField(u"内容")
	abstract = models.TextField(u"摘要")

	def __unicode__(self):
		return project.biology.name

class AcademicConference(models.Model):
	name = models.CharField(u"名称", max_length = 100)
	detail = models.TextField(u"详情")
	year = models.IntegerField(u"年份")

	def __unicode__(self):
		return name

class Announcement(models.Model):
	title = models.CharField(u"标题", max_length = 50)
	content = models.TextField(u"内容")
	editor = models.ForeignKey(User, related_name = "notices")
	type = models.CharField(u"类型", choices = ((u"0",u"News"),(u"1",u"Notice")), max_length = 10)
	readCount = models.IntegerField(u"阅读数量", default = 0)
	status = models.CharField(u"状态", choices = ((u"C", u"Checking"), (u"P", u"Passed")), max_length = 10, default = "Checking")
	submittime = models.DateTimeField(u"提交时间", auto_now_add = True)
	passtime = models.DateTimeField(u"通过时间", blank = True, null = True)

	def __unicode__(self):
		return title
