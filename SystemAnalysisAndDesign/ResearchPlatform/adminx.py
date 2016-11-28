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


class ConferenceAdmin(object):
    pass

site.register(UserType, UserTypeAdmin)
site.register(Permission, PermissionAdmin)
site.register(Announcement, AnnouncementAdmin)
site.register(Member, MemberAdmin)
site.register(Team, TeamAdmin)
site.register(AcademicConference, ConferenceAdmin)