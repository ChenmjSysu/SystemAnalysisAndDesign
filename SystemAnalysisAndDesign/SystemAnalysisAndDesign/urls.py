from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'SystemAnalysisAndDesign.views.home', name='home'),
    # url(r'^SystemAnalysisAndDesign/', include('SystemAnalysisAndDesign.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

urlpatterns += patterns("ResearchPlatform.views",
	url(r'^index/$', TemplateView.as_view(template_name="index.html")),
	url(r'^login/$', TemplateView.as_view(template_name="login.html")),
	url(r'^register/$', TemplateView.as_view(template_name="register.html")),
    url(r'^about/$', TemplateView.as_view(template_name="about.html")),
    url(r'^team/$', TemplateView.as_view(template_name="team.html")),
    url(r'^progress/$', TemplateView.as_view(template_name="progress.html")),
    url(r'^publishedArticles/$', TemplateView.as_view(template_name="publishedArticles.html")),
    url(r'^conference/$', TemplateView.as_view(template_name="conference.html")),
    url(r'^dataTool/$', TemplateView.as_view(template_name="dataTool.html")),
    url(r'^addNews/$', TemplateView.as_view(template_name="addNews.html"))
	)
