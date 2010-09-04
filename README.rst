Github Hooks for Spilka
=======================

These hooks setup the following addresses:

http://hooks.hpfem.org/all-update.py

http://hooks.hpfem.org/hermes-update.py

That you then put into the ``Admin``/``Service Hooks``/``Post-Receive URLs`` of
your repository at github and github then access those URLs wheneve someone
pushes something into that repository at github.

These URLs are served at Spilka, so apache launches the ``all-update.py`` or
``hermes-update.py`` scripts (see this git repo) and they update the local git
repositories (mirrors) at Spilka as well as update the docs or anything else
that is needed.

Setup
-----

Redirect ``hooks.hpfem.org`` to your server. Add this to your apache config::

  <VirtualHost *>
      ServerName hooks.hpfem.org
      ServerAdmin ondrej@certik.cz
      DocumentRoot /var/www3/hooks
      <Directory /var/www3/hooks>
          Options ExecCGI +FollowSymLinks
          Allow from all
          AllowOverride all
          Order allow,deny
          AddHandler cgi-script cgi py
      </Directory>

      ErrorLog /var/log/apache2/gitweb_error.log
  </VirtualHost>

And create ``/var/www3/hooks/hermes-update.py`` (with the contents of the file from this git repo).

And then put this into your ``sudoers`` file::

  www-data ALL=NOPASSWD: /bin/su git -c /bin/sh update-repos.sh
  www-data ALL=NOPASSWD: /bin/su git -c /bin/sh update-hermes-repo.sh

and create the ``update-repos.sh`` and ``update-hermes-repo.sh`` scripts (take them from this git repo).

Then just setup the ``origin`` remote in the ``/home/git/repositories/hermes.git`` to point to the github repo you want to pull from::

  git remote add origin git://github.com/hpfem/hermes.git

Then add the url ``http://hooks.hpfem.org/hermes-update.py`` to the Post-Receive URLs in the admin site.

You can test it by accessing the url http://hooks.hpfem.org/hermes-update.py, it should print::

  Running update script.
    Done.
  Output:
  Running as:
  uid=1009(git) gid=1009(git) groups=1009(git),1011(h2dev),1012(femhubdev)
  Updating repository...
    Done.
