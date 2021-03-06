# coding: utf8
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
    user = models.OneToOneField(User, related_name="type")
    permission = models.ForeignKey("Permission")

    def __unicode__(self):
        return "%s is %s" % (self.user.username, self.permission.type)


class Permission(models.Model):
    type = models.CharField(u"用户类型", max_length=20, choices=user_type)
    write = models.BooleanField(u"写权限", default=False)
    read = models.BooleanField(u"读权限", default=True)

    def __unicode__(self):
        return "permission of %s" % self.type


class Team(models.Model):
    name = models.CharField(u"名称", max_length=10)
    isMain = models.BooleanField(u"是否主要团队", default=False)
    introduction = models.TextField(u"团队介绍")  # 简介/研究方向/课题任务
    publishArticles = models.ManyToManyField("Article", related_name="from_team")

    def toDict(self):
        temp = dict()
        temp["name"] = self.name
        temp["isMain"] = self.isMain
        temp["introduction"] = self.introduction
        return temp

    def __unicode__(self):
        return self.name


class Member(models.Model):
    name = models.CharField(u"姓名", max_length=20)
    profile = models.TextField(u"简介", blank=True, null=True)  # 研究方向/研究成果
    user = models.OneToOneField(User, blank=True, null=True, related_name="member")
    team = models.ForeignKey(Team, blank=True, null=True, related_name="belong_team")

    def toDict(self):
        temp = dict()
        temp["name"] = self.name
        temp["profile"] = self.profile
        return temp

    def __unicode__(self):
        return self.name


class Article(models.Model):
    order = models.IntegerField(u"序号", max_length=10)
    title = models.CharField(u"标题", max_length=200)
    author = models.CharField(u"作者", max_length=50)
    year = models.IntegerField(u"年份")
    link = models.CharField(u"链接", max_length=200)

    def toDict(self):
        temp = dict()
        temp["order"] = self.order
        temp["title"] = self.title
        temp["author"] = self.author
        temp["year"] = self.year
        temp["link"] = self.link
        return temp

    def __unicode__(self):
        return '%d %s' % (self.order, self.title)


class BiologicalCategory(models.Model):
    name = models.CharField(u"生物类别", max_length=20)

    def __unicode__(self):
        return self.name


class BiologicalName(models.Model):
    name = models.CharField(u"生物名称", max_length=20)
    category = models.ForeignKey("BiologicalCategory", related_name="biology")

    def __unicode__(self):
        return self.name


class Project(models.Model):
    introduction = models.TextField(u"基本信息介绍")
    biology = models.OneToOneField("BiologicalName", related_name = "project")
    database = models.TextField(u"相关数据库")
    publishArticles = models.ManyToManyField("Article", related_name="from_project")
    relatedArticles = models.ManyToManyField("Article", related_name="about_project")
    progress = models.OneToOneField("ProjectProgress", related_name="project")

    def toDict(self):
        temp = dict()
        temp["introduction"] = self.introduction
        temp["biologyname"] = self.biology.name
        temp["database"] = self.database
        temp["progress"] = dict()
        temp["progress"]["abstract"] = self.progress.abstract
        return temp

    def __unicode__(self):
        return self.biology.name


class ProjectProgress(models.Model):
    content = models.TextField(u"内容")
    abstract = models.TextField(u"摘要")

    def toDict(self):
        temp = dict()
        temp["content"] = self.content
        temp["abstract"] = self.abstract
        return temp

    def __unicode__(self):
        return self.project.biology.name
        # return self.abstract


class AcademicConference(models.Model):
    name = models.CharField(u"名称", max_length=100)
    detail = models.TextField(u"详情")
    year = models.IntegerField(u"年份")

    def toDict(self):
        temp = dict()
        temp["name"] = self.name
        temp["detail"] = self.detail
        temp["year"] = self.year
        temp["id"] = self.id
        return temp

    def __unicode__(self):
        return self.name


class Announcement(models.Model):
    title = models.CharField(u"标题", max_length=50)
    content = models.TextField(u"内容")
    editor = models.ForeignKey(User, related_name="notices")
    type = models.CharField(u"类型", choices=((u"News", u"News"), (u"Notice", u"Notice")), max_length=10)
    readCount = models.IntegerField(u"阅读数量", default=0)
    status = models.CharField(u"状态", choices=((u"Checking", u"Checking"), (u"Passed", u"Passed")), max_length=10,
                              default="Checking")
    submittime = models.DateTimeField(u"提交时间", auto_now_add=True)
    passtime = models.DateTimeField(u"通过时间", blank=True, null=True)

    def toDict(self):
        a = dict()
        a["id"] = self.id
        a["title"] = self.title
        a["contemt"] = self.content
        a["editor"] = "self.editor.member.name"
        a["type"] = self.type
        a["readCount"] = self.readCount
        a["submittime"] = self.submittime.strftime("%Y-%m-%d %H:%M:%S")
        return a

    def __unicode__(self):
        return "%s(%s)" % (self.title, self.type)

class DataTool(models.Model):
    name = models.CharField(u"名称", max_length=50)
    link = models.CharField(u"链接", max_length=200)

    def __unicode__(self):
        return self.name