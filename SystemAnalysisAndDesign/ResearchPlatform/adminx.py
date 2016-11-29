from models import *
from xadmin import site

class UserTypeAdmin(object):
    pass

class PermissionAdmin(object):
    pass

class AnnouncementAdmin(object):
    pass

class MemberAdmin(object):
	pass

class TeamAdmin(object):
	pass

class ArticleAdmin(object):
	pass

class AcademicConferenceAdmin(object):
	pass

site.register(UserType, UserTypeAdmin)
site.register(Permission, PermissionAdmin)
site.register(Announcement, AnnouncementAdmin)
site.register(Member, MemberAdmin)
site.register(Team, TeamAdmin)
site.register(Article, ArticleAdmin)
site.register(AcademicConference, AcademicConferenceAdmin)