from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^$', direct_to_template, {'template': 'index.html'}),
    (r'^login/', include('reglog.login.urls')),
    (r'^register/', include('reglog.register.urls')),
    (r'^check-username/$', 'reglog.login.views.ajax_login_username_check'), # This is Ajax request.
    (r'^no/available/portrait/$', 'reglog.login.views.no_portrait'),
    (r'^admin/', include(admin.site.urls)),
)
