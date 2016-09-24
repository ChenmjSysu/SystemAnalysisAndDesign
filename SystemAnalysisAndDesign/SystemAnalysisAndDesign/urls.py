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
	url(r'^index/$', TemplateView.as_view(template_name="index.html")),
	url(r'^login/$', "login"),
	url(r'^register/$', "register"),
    url(r'^about/$', TemplateView.as_view(template_name="about.html")),
    url(r'^team/$', TemplateView.as_view(template_name="team.html")),
    url(r'^progress/$', TemplateView.as_view(template_name="progress.html")),
    url(r'^publishedArticles/$', TemplateView.as_view(template_name="publishedArticles.html")),
    url(r'^conference/$', TemplateView.as_view(template_name="conference.html")),
    url(r'^addNews/$', TemplateView.as_view(template_name="addNews.html")),
    url(r'^announcement/(\w+)', "AnnouncementList"),
    url(r'^announcement/(\w+)/(\d+)/', "GetAnnouncement"),
    url(r'^form/$', "form"),
)

urlpatterns += patterns("",
    url(r'^ueditor/', include('DjangoUeditor.urls' )),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.MEDIA_ROOT}),
)
