from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from django.conf import settings

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

import xadmin
xadmin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'SystemAnalysisAndDesign.views.home', name='home'),
    # url(r'^SystemAnalysisAndDesign/', include('SystemAnalysisAndDesign.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
    url(r'^xadmin/', include(xadmin.site.urls)),
)

urlpatterns += patterns("ResearchPlatform.views",
    url(r'^$', "index"),
	url(r'^index/$', "index"),
	url(r'^login/$', "login"),
    url(r'^logout/$', "logout"),
	url(r'^register/$', "register"),
    url(r'^about/(\d+)/$', 'About'),
    url(r'^about/$', 'About'),
    url(r'^progress/(\d+)/$', 'Progress'),
    url(r'^progress/$', 'Progress'),
    url(r'^team/$', "Teams"),
    url(r'^team/(\d+)/$', "Teams"),
    url(r'^member/(\d+)/$', "Members"),  
    url(r'^publishedArticles/$', "Articles"),
    url(r'^conference/$', "Conference"),
    url(r'^conference/(\d+)/$', "Conference"),
    url(r'^addNews/$', TemplateView.as_view(template_name="addNews.html")),
    url(r'^add/(\w+)', "Add"),
    url(r'^list/(\w+)', "List"),
    url(r'^manage/$', "Manage"),
    url(r'^delete/(\w+)', "Delete"),    
    url(r'^form/$', "form"),
    url(r'^dataTool/$', "DataTools"),
    url(r'^(\w+)/(\d+)/', "Detail"), 
)

urlpatterns += patterns("",
    url(r'^ueditor/', include('DjangoUeditor.urls' )),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.MEDIA_ROOT}),
)
