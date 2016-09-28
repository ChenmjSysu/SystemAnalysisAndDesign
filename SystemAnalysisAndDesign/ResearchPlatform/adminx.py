from models import *
from xadmin import site

class UserTypeAdmin(object):
    pass

class PermissionAdmin(object):
    pass

site.register(UserType, UserTypeAdmin)
site.register(Permission, PermissionAdmin)

