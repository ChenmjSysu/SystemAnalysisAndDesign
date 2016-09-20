#coding: utf8
from django.db import models
from django.contrib.auth.models import User  

# Create your models here.

class Member(models.Model):
	name = models.CharField(u"姓名", max_length = 20)
	profile = models.TextField(u"简介", blank=True, null=True) # 研究方向/研究成果
	user = models.OneToOneField(User, blank = True, null = True)

class Team(models.Model):
	name = models.CharField(u"名称", max_length = 10)
	isMain = models.BooleanField(u"是否主要团队", default = False)
	introduction = models.TextField(u"团队介绍") #简介/研究方向/课题任务
	publishArticles = models.ManyToManyField("Article", related_name = "from_team")

class Article(models.Model):
	order = models.CharField(u"序号", max_length = 10)
	title = models.CharField(u"标题", max_length = 200)
	author = models.CharField(u"作者", max_length = 50)
	year = models.IntegerField(u"年份")
	link = models.CharField(u"链接", max_length = 200)

class BiologicalCategory(models.Model):
	name = models.CharField(u"生物类别", max_length = 20)

class BiologicalName(models.Model):
	name = models.CharField(u"生物名称", max_length = 20)
	category = models.ForeignKey("BiologicalCategory", related_name = "biology")

class Project(models.Model):
	introduction = models.TextField(u"基本信息介绍")
	biologyName = models.OneToOneField("BiologicalName")
	database = models.TextField(u"相关数据库")
	publishArticles = models.ManyToManyField("Article", related_name = "from_project")
	relatedArticles = models.ManyToManyField("Article", related_name = "about_project")

class ProjectProgress(models.Model):
	content = models.TextField(u"内容")
	abstract = models.TextField(u"摘要")

class AcademicConference(models.Model):
	name = models.CharField(u"名称", max_length = 100)
	detail = models.TextField(u"详情")
	year = models.IntegerField(u"年份")

class Announcement(models.Model):
	title = models.CharField(u"标题", max_length = 50)
	content = models.TextField(u"内容")
	editor = models.ForeignKey(User, related_name = "notices")
	type = models.CharField(u"类型", choices = ((u'0',u'News'),(u'1',u'Notice')), max_length = 10)
	readCount = models.IntegerField(u"阅读数量")
	status = models.CharField(u"状态", choices = ((u"C", u"Checking"), (u"P", u"Passed")), max_length = 10)
	datetime = models.DateTimeField(u"发表时间")
