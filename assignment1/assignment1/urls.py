"""assignment1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""

from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.views.generic.base import TemplateView
from surajsite import views

urlpatterns = [
    url(r'^login/$', auth_views.login, {'template_name': 'templates/login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, {'template_name': 'templates/logout.html'}, name='logout'),
#    url(r'^profile/$', TemplateView.as_view(template_name='templates/index.html'), name='profile'),
    url(r'^profile/$', views.profile, name='profile'),
    url(r'^record/$', views.record, name='record'),
    url(r'^$', views.index, name='index'),
    url(r'^index/$', views.index, name='index'),
    url(r'^admin/', admin.site.urls),
]
