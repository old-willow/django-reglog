import os
import os.path
import sys
#import site

#root = os.path.join(os.path.dirname(__file__), '..')
#sys.path.insert(0, root)

# If I have python virtual environment.
#packages = os.path.join(os.path(root, 'environ/lib/python2.6/site-packages')
#sys.path.insert(0, packages)
#site.addsitedir(packeges)

sys.path.append('~/www/venv/reglog')
sys.path.append('~/www/venv/reglog/reglog')

os.environ['PYTHON_EGG_CACHE'] = '~/www/venv/reglog/egg_cache'
os.environ['DJANGO_SETTINGS_MODULE'] = 'reglog.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
