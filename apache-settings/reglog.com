<VirtualHost *:80>
    ServerName www.reglog.com
    ServerAlias reglog.com
    ServerAdmin admin@reglog.com
  DirectoryIndex index.html

    DocumentRoot ~/www/venv/reglog/site/www.reglog.com

  WSGIDaemonProcess reglog processes=2 threads=5 display-name=reglog user=<user_name> group=<user_group>
    WSGIScriptAlias / ~/www/venv/reglog/reglog/apache/django.wsgi

  <Directory ~/www/venv/reglog/reglog/apache>
    WSGIProcessGroup reglog
    Order deny,allow
    Allow from all
  </Directory>

    <Directory ~/www/venv/reglog/site/www.reglog.com>
        Order deny,allow
        Allow from all
    </Directory>

  Alias /static/media/ ~/www/venv/reglog/site/www.reglog.com/static/media/
    <Directory ~/www/venv/reglog/site/www.reglog.com/static/media>
        Order deny,allow
        Allow from all
    </Directory>

    Alias /static/ ~/www/venv/reglog/site/www.reglog.com/static/
    Alias /images/ ~/www/venv/reglog/site/www.reglog.com/static/images/
  Alias /css/ ~/www/venv/reglog/site/www.reglog.com/static/css/

    ErrorLog ~/www/vevn/reglog/site/www.reglog.com/logs/error.log
    CustomLog ~/www/venv/reglog/site/www.reglog.com/logs/access.log combined
  ServerSignature On
</VirtualHost>
