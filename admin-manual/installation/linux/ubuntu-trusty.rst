.. _installation-linux-ubuntu-trusty:

======================================
Linux - Ubuntu 14.04 LTS (Trusty Tahr)
======================================

Most of the configuration steps described in this
document apply to any modern Linux environment, however some of them will
apply only to Ubuntu and likely to any Ubuntu-based distribution.

This document is based in
`Ubuntu 14.04 LTS (Trusty Tahr) <http://releases.ubuntu.com/trusty/>`_. Once
you have installed it, you should be able to follow the instructions described
below. In particular, we are going to use Ubuntu packages that can be found
under the `repositories
<https://help.ubuntu.com/community/Repositories/Ubuntu>`_ *main* and *universe*.

.. IMPORTANT::

   Please make sure you have reviewed the :ref:`requirements
   <installation-requirements>` before proceeding. Also, you may want to
   consider setting up the :ref:`firewall <security-firewall>` before you start
   installing the services described below to avoid exposing them to outside
   access.

.. _linux-ubuntu-trusty-install-dependencies:

Install the dependencies
========================

.. _linux-ubuntu-trusty-dependency-mysql:

MySQL
-----

We strongly recommend using `MySQL <https://www.mysql.com/>`__  5.5 as it's
much better than the previous major release in terms of speed, scalability and
user-friendliness. Also, we've experienced very good results using forks like
Percona Server or MariaDB, so don't be afraid and use them if you want!

Let's install MySQL using :command:`apt-get`:

.. code-block:: bash

   sudo apt-get install mysql-server-5.5

During the installation, you will be prompted to set a password for the default
administrator user (root). We strongly recommend that you use a strong password
and please write it down as you are going to need it later.

.. warning::

   If you are planning to use MySQL 5.7 please be aware that it has not been
   fully tested yet and we know at least of `one bug <https://projects.artefactual.com/issues/9051>`__
   that has not been solved yet! MySQL 5.6 will work fine but it is not bundled
   in Ubuntu 14.04.

.. _linux-ubuntu-trusty-dependency-elasticsearch:

Elasticsearch
-------------

A relatively new search server based on Apache Lucene and developed in Java that
has brought AtoM a lot of advanced features, performance and scalability. This
is probably the biggest change introduced in AtoM 2.x and we are pleased with
the results.

Ubuntu doesn't provide a package but you can download it directly from the
`Elasticsearch site <https://www.elastic.co/downloads/elasticsearch>`_ if you
are unable to download it using the method that follows.

First, make sure that `Java <https://www.java.com/en/>`__ is installed. In this
example we are going to use OpenJDK but Oracle's JVM would also work.

.. code-block:: bash

   sudo apt-get install openjdk-7-jre-headless software-properties-common

After successfully installing Java, proceed to install Elasticsearch. Download
and install the public signing key used in their repository:

.. code-block:: bash

   wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -

Add the following to your /etc/apt/sources.list to enable the repository:

.. code-block:: bash

   deb http://packages.elasticsearch.org/elasticsearch/1.7/debian stable main

Ready to be installed. Run:

.. code-block:: bash

   sudo apt-get update
   sudo apt-get install elasticsearch

Start the service and configure it to start when the system is booted.

.. code-block:: bash

   sudo update-rc.d elasticsearch defaults 95 10
   sudo /etc/init.d/elasticsearch start

.. _linux-ubuntu-trusty-dependency-httpd:

Web server
----------

There are many web servers out there capable of working well with
`PHP <http://php.net/>`__. `Apache <https://httpd.apache.org/>`__ is probably
the most popular and we like it, but we've found that
`Nginx <http://nginx.com/>`__ adapts itself much better to limited resource
environments while it also scales better and more predictably under high loads.
You are welcome to try other solutions, but the following documentation will
focus upon Nginx and Apache, our preferred web server solutions.

.. WARNING::

   The following instructions assume that the Nginx package is creating the
   directory :file:`/usr/share/nginx` and that is the location where we are
   going to place the AtoM sources. However, we have been told this location may
   be different in certain environments (e.g. :file:`/var/www`) or you may opt
   for a different location. If that is the case, please make sure that you
   update the configuration snippets that we share later in this document
   according to your location.

.. _linux-ubuntu-trusty-dependency-httpd-nginx:

Nginx
`````

In Ubuntu, the installation of Nginx is simple:

.. code-block:: bash

   sudo apt-get install nginx

`Ubuntu <http://www.ubuntu.com/>`__ 12.04 uses Nginx 1.1. However, the team
behind Nginx provides an official PPA  (Personal Package Archive) channel for
Ubuntu users that supports more recent stable packages for the different
releases of Ubuntu, including 12.04. This could be a good choice if you want
to enjoy some of the latest features and improvements added to Nginx while
taking minimal risks in your production environments. If you are interested,
run the following commands:

.. code-block:: bash

   sudo add-apt-repository ppa:nginx/stable
   sudo apt-get update
   sudo apt-get install nginx

Nginx deploys a default server (aka VirtualHost, for Apache users) called
**default** and you can find it in :file:`/etc/nginx/sites-available/default`.
In order to install AtoM you could edit the existing server block or add a new
one. We are going to you show you how to do the latter:

.. code-block:: bash

   sudo touch /etc/nginx/sites-available/atom
   sudo ln -sf /etc/nginx/sites-available/atom /etc/nginx/sites-enabled/atom
   sudo rm /etc/nginx/sites-enabled/default

We have now created the configuration file and linked it from sites-enabled/, which
is the directory that Nginx will look for. This means that you could
disable a site by removing its symlink from sites-enabled/ while keeping the
original one under sites-available/, in case that you want to re-use it in the
future. You can do this with the Nginx default server.

The following is a recommended server block for AtoM. Put the following contents
in :file:`/etc/nginx/sites-available/atom`.

.. code-block:: nginx

   upstream atom {
     server unix:/var/run/php5-fpm.atom.sock;
   }

   server {

     listen 80;
     root /usr/share/nginx/atom;

     # http://wiki.nginx.org/HttpCoreModule#server_name
     # _ means catch any, but it's better if you replace this with your server
     # name, e.g. archives.foobar.com
     server_name _;

     client_max_body_size 72M;

     # http://wiki.nginx.org/HttpCoreModule#try_files
     location / {
       try_files $uri /index.php?$args;
     }

     location ~ /\. {
       deny all;
       return 404;
     }

     location ~* (\.yml|\.ini|\.tmpl)$ {
       deny all;
       return 404;
     }

     location ~* /(?:uploads|files)/.*\.php$ {
       deny all;
       return 404;
     }

     location ~* /uploads/r/(.*)/conf/ {

     }

     location ~* ^/uploads/r/(.*)$ {
       include /etc/nginx/fastcgi_params;
       set $index /index.php;
       fastcgi_param SCRIPT_FILENAME $document_root$index;
       fastcgi_param SCRIPT_NAME $index;
       fastcgi_pass atom;
     }

     location ~ ^/private/(.*)$ {
       internal;
       alias /usr/share/nginx/atom/$1;
     }

     location ~ ^/(index|qubit_dev)\.php(/|$) {
       include /etc/nginx/fastcgi_params;
       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       fastcgi_split_path_info ^(.+\.php)(/.*)$;
       fastcgi_pass atom;
     }

     location ~* \.php$ {
       deny all;
       return 404;
     }

   }

Now you need to restart Nginx:

.. code-block:: bash

   sudo service nginx restart

.. _linux-ubuntu-trusty-dependency-httpd-apache:

Apache
``````
.. warning::

   Remember that our preferred choice is
   :ref:`linux-ubuntu-trusty-dependency-httpd-nginx` but it is perfectly
   possible to use Apache and we have verified that it works.

Install the necessary packages:

.. code-block:: bash

   sudo apt-get install apache2 libapache2-mod-xsendfile

Enable the required modules:

.. code-block:: bash

   sudo a2enmod rewrite xsendfile

The configuration of your virtual server shoud look like the following:

.. code-block:: apache

    <VirtualHost *:80>
      DocumentRoot /var/www/atom
      RewriteEngine On
      RewriteRule ^/uploads/r/([^/]*)/conf/(.*)$ /var/www/atom/uploads/r/$1/conf/$2 [L]
      RewriteRule ^/uploads/(.*)$ /var/www/atom/uploads/$1 [L]
      <LocationMatch ^/uploads>
        XSendFile On
        XSendFilePath /var/www/atom/uploads
        SetEnv ATOM_XSENDFILE 1
      </LocationMatch>
    </VirtualHost>

You also need to decide if you are going to use php5-fpm or mod_php. We prefer
the former, in combination with Nginx, but you can combine php5-fpm and Apache
as long as you install the Apache module mod_fastcgi (the corresponding Ubuntu
package is called libapache2-mod-fastcgi). We have not tried this ourselves but
it is definitely `possible <https://wiki.apache.org/httpd/PHP-FPM>`__.

.. _linux-ubuntu-trusty-dependency-php:

PHP
---

You will need to ensure that you have at leat PHP 5.4 or higher installed - we
use PHP 5.5 in development - in addition to a number of PHP extentions,
described below.

Our favorite way to deploy AtoM is using `PHP-FPM <http://php-fpm.org/>`__, a
process manager that scales better than other solutions like FastCGI. The
following command will install it along with the rest of PHP extensions
:ref:`required <installation-requirements>` by AtoM:

.. code-block:: bash

    sudo apt-get install php5-cli php5-fpm php5-curl php5-mysql php5-xsl php5-json php5-ldap php-apc

If you are using Ubuntu 14.04, make sure that php5-readline is also installed.

.. code-block:: bash

    sudo apt-get install php5-readline

If you are using Apache, you will also need to install mod_php:

.. code-block:: bash

    sudo apt-get install libapache2-mod-php5

Let's add a new PHP pool for AtoM by adding the following contents in a new file
called :file:`/etc/php5/fpm/pool.d/atom.conf`:

.. code-block:: ini

   [atom]

   # The user running the application
   user = www-data
   group = www-data

   # Use UNIX sockets if Nginx and PHP-FPM are running in the same machine
   listen = /var/run/php5-fpm.atom.sock
   listen.owner = www-data
   listen.group = www-data
   listen.mode = 0600

   # The following directives should be tweaked based in your hardware resources
   pm = dynamic
   pm.max_children = 30
   pm.start_servers = 10
   pm.min_spare_servers = 10
   pm.max_spare_servers = 10
   pm.max_requests = 200

   chdir = /

   # Some defaults for your PHP production environment
   # A full list here: http://www.php.net/manual/en/ini.list.php
   php_admin_value[expose_php] = off
   php_admin_value[allow_url_fopen] = on
   php_admin_value[memory_limit] = 512M
   php_admin_value[max_execution_time] = 120
   php_admin_value[post_max_size] = 72M
   php_admin_value[upload_max_filesize] = 64M
   php_admin_value[max_file_uploads] = 10
   php_admin_value[cgi.fix_pathinfo] = 0
   php_admin_value[display_errors] = off
   php_admin_value[display_startup_errors] = off
   php_admin_value[html_errors] = off
   php_admin_value[session.use_only_cookies] = 0

   # APC, which is still used in PHP 5.5 for userland memory cache unless you
   # are switching to something like sfMemcacheCache
   php_admin_value[apc.enabled] = 1
   php_admin_value[apc.shm_size] = 64M
   php_admin_value[apc.num_files_hint] = 5000
   php_admin_value[apc.stat] = 0

   # Zend OPcache
   # Only in Ubuntu 14.04 (PHP 5.5).
   # Don't use this in Ubuntu 12.04, it won't work.
   php_admin_value[opcache.enable] = 1
   php_admin_value[opcache.enable_cli] = 0
   php_admin_value[opcache.memory_consumption] = 192
   php_admin_value[opcache.interned_strings_buffer] = 16
   php_admin_value[opcache.max_accelerated_files] = 4000
   php_admin_value[opcache.validate_timestamps] = 0
   php_admin_value[opcache.fast_shutdown] = 1

   # This is a good place to define some environment variables, e.g. use
   # ATOM_DEBUG_IP to define a list of IP addresses with full access to the
   # debug frontend or ATOM_READ_ONLY if you want AtoM to prevent
   # authenticated users
   env[ATOM_DEBUG_IP] = "10.10.10.10,127.0.0.1"
   env[ATOM_READ_ONLY] = "off"

Note that the section "Zend OPcache" won't work in Ubuntu 12.04. Comment it out
or remove it unless you are using Ubuntu 14.04.

The process manager has to be restarted:

.. code-block:: bash

   sudo service php5-fpm restart

If the service fails to start, make sure that the configuration file has been
has been pasted properly. You can also check the syntax by running:

.. code-block:: bash

   sudo php5-fpm --test

If you are not planning to use the default PHP pool (``www``), feel free to
remove it:

.. code-block:: bash

   sudo rm /etc/php5/fpm/pool.d/www.conf
   sudo service php5-fpm restart

.. _linux-ubuntu-trusty-other-packages:

Gearman job server
------------------

Gearman job server is required by AtoM as of version 2.2.

.. code-block:: bash

   sudo apt-get install gearman-job-server

Other packages
--------------

In order to generate PDF finding aids, AtoM requires `Apache FOP 2.1 <https://archive.apache.org/dist/xmlgraphics/fop/binaries/fop-1.0-bin.tar.gz>`__.
After downloading and extracting it, ensure you have the fop executable in your
system's executable path. Additionally, you may need to set the environmental
variable FOP_HOME to the folder path you extracted Apache FOP to, for example:

.. code-block:: bash

   sudo bash -c "\
       set -e \
       && mkdir /usr/share/fop-2.1 \
       && wget https://archive.apache.org/dist/xmlgraphics/fop/binaries/fop-2.1-bin.tar.gz -O /tmp/fop.tar.gz \
       && tar xvzf /tmp/fop.tar.gz --strip-components 1 -C /usr/share/fop-2.1 \
       && ln -s /usr/share/fop-2.1/fop /usr/bin/fop \
       && rm /tmp/fop.tar.gz \
       && echo 'FOP_HOME=/usr/share/fop-2.1' >> /etc/environment
   "

If you want AtoM to be able to process :term:`digital objects <digital object>`
in formats like JPEG or to extract the text from your PDF documents, there are
certain packages that you need to install. They are not mandatory but if they
are found in the system, AtoM will use them to produce digital object
derivatives from your :term:`master objects <master digital object>`. for
more information on each, see: :ref:`Requirements: other dependencies
<other-dependencies>`. The following will install all the recommended
dependencies at once:

.. code-block:: bash

   sudo apt-get install imagemagick ghostscript poppler-utils

Install ffmpeg from Archivematica's PPA, which works for both Ubuntu 12.04
(precise) and Ubuntu 14.04 (trusty).

.. code-block:: bash

   sudo add-apt-repository ppa:archivematica/externals
   sudo apt-get update
   sudo apt-get install ffmpeg

.. _linux-ubuntu-trusty-install-atom:

Download AtoM
=============

Now that we have installed and configured all dependencies, we are ready to
download and install AtoM itself. The safest way is to install AtoM from the
tarball, which you can find in the
`download section <http://www.accesstomemory.org/download/>`_. However,
experienced users may prefer to check out the code from our `public repository
<https://github.com/artefactual/atom>`__.

The following instructions assume that we are installing AtoM under
:file:`/usr/share/nginx` and that you are using AtoM |release|.

.. _linux-ubuntu-trusty-install-tarball:

Option 1: Download the tarball
------------------------------

.. code-block:: bash

   wget https://storage.accesstomemory.org/releases/atom-2.3.0.tar.gz
   sudo mkdir /usr/share/nginx/atom
   sudo tar xzf atom-2.3.0.tar.gz -C /usr/share/nginx/atom --strip 1

Please note that the tarball may not be available yet if this version is still
in development. In this case, you can try the alternative installation method
explained below.

.. _linux-ubuntu-trusty-checkout-git:

Option 2: Check out the code from our git repository
----------------------------------------------------

Install git:

.. code-block:: bash

   sudo apt-get install git

.. code-block:: bash

   sudo mkdir /usr/share/nginx/atom
   sudo git clone -b qa/2.4.x http://github.com/artefactual/atom.git /usr/share/nginx/atom
   cd /usr/share/nginx/atom

If you are not interested in downloading all the history from git, you could
also truncate it to a specific number of revisions, e.g.: just one revision

.. code-block:: bash

   git clone --depth 1 http://github.com/artefactual/atom.git /usr/share/nginx/atom

Once you've cloned the code from our git repository, you'll need to compile
the CSS files:

.. code-block:: bash

   curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
   sudo apt install nodejs make
   sudo npm install -g "less@<2.0.0"
   sudo make -C /usr/share/nginx/atom/plugins/arDominionPlugin

.. _linux-ubuntu-trusty-filesystem-permissions:

Filesystem permissions
======================

By default, Nginx runs as the www-data user. There are a few directories under
AtoM that must be writable by the web server. The easiest way to ensure this is
to update the owner of the AtoM directory and its contents by running:

.. code-block:: bash

   sudo chown -R www-data:www-data /usr/share/nginx/atom

If you are deploying AtoM in a shared environment we recommend you to pay
attention to the permissions assigned to **others**. The following is an
example on how to clear all mode bits for others:

.. code-block:: bash

   sudo chmod o= /usr/share/nginx/atom

.. _create-the-database-linux:

Create the database
===================

Assuming that you are running `MySQL <https://www.mysql.com/>`__ in localhost,
please create the database by running the following command using the
password you created :ref:`earlier <linux-ubuntu-trusty-dependency-mysql>`:

.. code-block:: bash

   mysql -h localhost -u root -p -e "CREATE DATABASE atom CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

Notice that the database has been called **atom**. Feel free to change its name.

In case your MySQL server is **not** the same as your web server, replace
"localhost" with the address of your MySQL server.

.. warning::

   Plase make sure that you are using an empty database! Don't reuse an old
   database unless it's empty. You can always drop it by using the
   :command:`DROP DATABASE` command and then create it again.

Additionally, it's always a good idea to create a specific MySQL user for AtoM
to keep things safer. This is how you can create an user called ``atom`` with
password ``12345`` and the permissions needed for the database created above.

.. code-block:: bash

   mysql -h localhost -u root -p -e "GRANT ALL ON atom.* TO 'atom'@'localhost' IDENTIFIED BY '12345';"

Note that the ``INDEX``, ``CREATE`` and ``ALTER`` privileges are only necessary
during the installation process or when you are upgrading AtoM to a newer
version. They can be removed from the user once you are finished with the
installation or you can change the user used by AtoM in :ref:`config.php <config-config-php>`.

.. _linux-ubuntu-trusty-run-installer:

Run the web installer
=====================

You should now be ready to run the installer. It's a simple web interface that
changes some internal configuration files according to your environment and adds
the necessary tables and initial data to the database recently created.

Open your browser and type the URL in the address bar. The URL can greatly
change depending on your web server configuration. The URL will usually be
something like http://localhost. AtoM will redirect you to the installer
automatically.

The installation process consists of a number of steps where you will be asked
for configuration details such as the location of your database server. If you
have followed this document to the letter, this is how you should fill the
following fields:

* Database name: ``atom``
* Database username: ``atom``
* Database password: ``12345``
* Database host: ``localhost``
* Database port: ``3306``
* Search host: ``localhost``
* Search port: ``9200``
* Search index: ``atom``

Of course, some of these fields will look very different if you are running
AtoM in a distributed way, where your services like MySQL or Elasticsearch are
running in separate machines.

The rest of the fields can be filled as you need:

* Site title
* Site description
* Site base URL
* Username
* E-mail address
* Password

.. TIP::

   You can always change the :term:`site title`, :term:`site description`, and
   :term:`Base URL` later via **Admin > Settings > Site information**. See:
   :ref:`site-information` for more information. The Username, email, and
   password can also be changed by an :term:`administrator` after installation
   via the :term:`user interface` - see: :ref:`edit-user`.

.. _linux-ubuntu-trusty-workers:

Deployment of workers
=====================

Optionally, you can use Gearman to add support for asynchronous tasks like
SWORD deposits, managing rights inheritance, and generating finding aids. Check
out the following page for further installation details:
:ref:`installation-asynchronous-jobs`.

.. _linux-ubuntu-trusty-configuration-files:

Configure AtoM via the command-line
===================================

There are various settings that can only be configured via the command-line -
for example, the default timezone of the application. Depending on your local
requirements, it may be preferable to configure some of these now. For more
information on these settings see: :ref:`customization-config-files`.

.. _linux-ubuntu-trusty-security-considerations:

Security considerations
=======================

Now that AtoM is installed, please take a moment to read our
:ref:`security section <security>` where we will show you how to
configure the firewall in Ubuntu and back up AtoM.

We strongly encourage our users to configure a firewall because some of the
services configured should not be exposed in the wild, e.g. Elasticsearch was
not designed to be accessible from untrusted networks and it's a common attack
vector.
