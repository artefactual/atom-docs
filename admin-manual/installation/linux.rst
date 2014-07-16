.. _installation-linux:

=====
Linux
=====

We use and recommend `Ubuntu Linux <http://www.ubuntu.com/>`__ as an easy to
use Linux distro with a large and lively community behind it - however, we've
obtained satisfactory results with a number of other distributions like
Debian, CentOS or Fedora. Most of the configuration steps described in this
document apply to any modern Linux environment, however some of them will
apply only to Ubuntu and likely to any Ubuntu-based distribution.

To be specific, this document is based in
`Ubuntu 12.04 LTS (Precise Pangolin) <http://releases.ubuntu.com/precise/>`_.
Once you have installed it, you should be able to follow the instructions
described below. In particular, we are going to use Ubuntu packages that can
be found under the
`repositories <https://help.ubuntu.com/community/Repositories/Ubuntu>`_ *main*
and *universe*.

.. IMPORTANT::

   Please make sure you have reviewed the :ref:`requirements
   <installation-requirements>` before proceeding.

.. _linux-install-dependencies:

Install the dependencies
========================

.. _linux-dependency-mysql:

MySQL
-----

We strongly recommend using `MySQL <https://www.mysql.com/>`__  5.5 as it's
much better than its previous major release in terms of speed, scalability and
user-friendliness. Also, we've experienced very good results using forks like
Percona Server or MariaDB, so don't be afraid and use them if you want!

Let's install MySQL using :command:`apt-get`:

.. code-block:: bash

   sudo apt-get install mysql-server-5.5

During the installation, you will be prompted to set a password for the default
administrator user (root). If you are setting one, please note it down as you
are going to need it :ref:`later <create-the-database-linux>`.

.. _linux-dependency-elasticsearch:

Elasticsearch
-------------

A relatively new search server based on Apache Lucene and developed in Java that
has brought AtoM a lot of advanced features, performance and scalability. This is
probably the biggest change introduced in AtoM |version| and we are pleased
with the results.

Ubuntu doesn't provide a package but you can download it directly from the
`Elasticsearch site <http://www.elasticsearch.org/download/>`_. It's always a
good idea to use the latest stable version available.

First, make sure that `Java <https://www.java.com/en/>`__ is installed.
Elasticsearch is compatible with both Java 6 and Java 7 and both can be found
in Ubuntu 12.04. In the command-line, enter:

.. code-block:: bash

   sudo apt-get install -y openjdk-7-jre-headless

After successfully installing Java, proceed to install Elasticsearch:

.. code-block:: bash

   wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.11.deb
   sudo dpkg -i elasticsearch-0.90.11.deb
   sudo rm elasticsearch-0.90.11.deb

.. IMPORTANT::

   AtoM 2.0 doesn't support Elasticsearch 1.0 or newer. Use 0.90.11 instead.

Make sure that the service has been started:

.. code-block:: bash

   sudo /etc/init.d/elasticsearch start

.. _linux-dependency-nginx:

Nginx
-----

There are many web servers out there capable of working well with
`PHP <http://php.net/>`__. `Apache <https://httpd.apache.org/>`__ is probably
the most popular and we like it, but we've found that
`Nginx <http://nginx.com/>`__ adapts itself much better to limited resource
environments while it also scales better and more predictably under high loads.
You are welcome to try other solutions, but the following documentation will
focus upon Nginx, our preferred web server solution.

The installation in Ubuntu is simple:

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
   sudo rm /etc/nginx/sites-available/default

We have now created the configuration file and linked it from sites-enabled/, which
is the directory that Nginx will look for. This means that you could
disable a site by removing its symlink from sites-enabled/ while keeping the
original one under sites-available/, in case that you want to re-use it in the
future. You can do this with the Nginx default server.

The following is a recommended server block for AtoM. Put the following contents
in :file:`/etc/nginx/sites-enabled/atom`.

.. code-block:: nginx

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

     # This is the most important part, as here we are redirecting some specific
     # requests to PHP-FPM so PHP can do its job passing data to and from the
     # web server.
     location ~ ^/(index|qubit_dev)\.php(/|$) {
       include /etc/nginx/fastcgi_params;
       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       fastcgi_split_path_info ^(.+\.php)(/.*)$;
       fastcgi_pass unix:/var/run/php5-fpm.atom.sock;
     }

     location ~* \.php$ {
       deny all;
       return 404;
     }

   }

Now you need to restart Nginx:

.. code-block:: bash

   sudo service nginx restart


.. _linux-dependency-php:

PHP
---

Our favorite way to deploy AtoM is using `PHP-FPM <http://php-fpm.org/>`__, a
process manager that scales better than other solutions like FastCGI. The
following command will install it along with the rest of PHP extensions
:ref:`required <installation-requirements>` by AtoM:

.. code-block:: bash

    sudo apt-get install php5-cli php5-fpm php5-curl php5-mysql php5-xsl php-apc

.. TIP::

   If you are using Ubuntu 12.04 but you still want to try PHP 5.4 or PHP 5.5,
   there is a PPA channel supported by Ondřej Surý. This is probably not the
   safest way to go as his channel is not backed by the official Ubuntu team,
   but thus far he is being very responsive, pushing new releases as soon
   as they come out. If you are interested, please visit one of the following
   links:

   * PHP 5.4 channel: https://launchpad.net/~ondrej/+archive/php5-oldstable
   * PHP 5.5 channel: https://launchpad.net/~ondrej/+archive/php5

Note that in PHP 5.5, php-apc was removed and its replacement for the user-space
caching capabilities is emulated by php5-apcu. Additionally, the JSON extension
is not included anymore as part of the PHP core, so you will have to install the
php5-json extension too.

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
   pm.max_children = 100
   pm.start_servers = 10
   pm.min_spare_servers = 10
   pm.max_spare_servers = 50
   pm.max_requests = 500

   chdir = /

   # Some defaults for your PHP production environment
   # A full list here: http://www.php.net/manual/en/ini.list.php
   php_admin_value[expose_php] = off
   php_admin_value[allow_url_fopen] = off
   php_admin_value[memory_limit] = 512M
   php_admin_value[max_execution_time] = 120
   php_admin_value[post_max_size] = 72M
   php_admin_value[upload_max_filesize] = 64M
   php_admin_value[max_file_uploads] = 10
   php_admin_value[cgi.fix_pathinfo] = 0
   php_admin_value[display_errors] = off
   php_admin_value[display_startup_errors] = off
   php_admin_value[html_errors] = off
   php_admin_value[apc.enabled] = 1
   php_admin_value[apc.shm_size] = 64M
   php_admin_value[apc.num_files_hint] = 5000
   php_admin_value[apc.stat] = 0
   php_admin_value[session.use_only_cookies] = 0

   # This is a good place to define some environment variables, e.g. use
   # ATOM_DEBUG_IP to define a list of IP addresses with full access to the
   # debug frontend or ATOM_READ_ONLY if you want AtoM to prevent
   # authenticated users
   env[ATOM_DEBUG_IP] = "10.10.10.10,127.0.0.1"
   env[ATOM_READ_ONLY] = "off"

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

.. _linux-other-packages:

Other packages
--------------

If you want AtoM to be able to process :term:`digital objects <digital object>`
in formats like JPEG or to extract the text from your PDF documents, there are
certain packages that you need to install. They are not mandatory but if they
are found in the system, AtoM will use them to produce digital object
derivatives from your :term:`master objects <master digital object>`. for
more information on each, see: :ref:`Requirements: other dependencies
<other-dependencies>`. The following will install all the recommended
dependencies at once:

.. code-block:: bash

   sudo apt-get install imagemagick ghostscript ffmpeg poppler-utils libavcodec-extra-53

.. _linux-install-atom:

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

.. _linux-install-tarball:

Option 1: Download the tarball
------------------------------

.. code-block:: bash

   wget http://storage.accesstomemory.org/releases/atom-2.0.1.tar.gz
   sudo mkdir /usr/share/nginx/atom
   sudo tar xzf atom-2.0.1.tar.gz -C /usr/share/nginx/atom --strip 1


.. _linux-checkout-git:

Option 2: Check out the code from our git repository
----------------------------------------------------

Install git:

.. code-block:: bash

   sudo apt-get install git

.. code-block:: bash

   sudo mkdir /usr/share/nginx/atom
   sudo git clone http://github.com/artefactual/atom.git /usr/share/nginx/atom
   cd /usr/share/nginx/atom
   sudo git checkout tags/v2.0.1

If you are not interested in downloading all the history from git, you could
also truncate it to a specific number of revisions, e.g.: just one revision

.. code-block:: bash

   git clone --depth 1 git@git.artefactual.com:atom.git /usr/share/nginx/atom

Once you've cloned the code from our git repository, you'll need to compile
the CSS files:

.. code-block:: bash

   sudo add-apt-repository ppa:chris-lea/node.js
   sudo apt-get update
   sudo apt-get install nodejs
   sudo npm install -g less@1.3.3
   cd /usr/share/nginx/atom/plugins/arDominionPlugin/
   sudo -u www-data make


.. _linux-filesystem-permissions:

Filesystem permissions
======================

By default, Nginx runs as the www-data user. There are a few directories under
AtoM that must be writable by the web server. The easiest was to ensure this is
to update the owner of the full directory and its contents by running:

.. code-block:: bash

   sudo chown -R www-data:www-data /usr/share/nginx/atom

.. _create-the-database-linux:

Create the database
===================

Assuming that you are running `MySQL <https://www.mysql.com/>`__ in localhost,
please create the database by running the following command using the
password you created :ref:`earlier <linux-dependency-mysql>`:

.. code-block:: bash

   mysql -h localhost -u root -pYOURSECRETPASSWORD -e "CREATE DATABASE atom CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

Notice that the database has been called **atom**. Feel free to change its name.
If you left the root password blank during the installation of
mysql-server-5.5, you don't need to add the ``-pYOURSECRETPASSWORD`` option shown
above.

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

   mysql -h localhost -u root -pYOURSECRETPASSWORD -e "GRANT INDEX, CREATE, SELECT, INSERT, UPDATE, DELETE, ALTER, LOCK TABLES ON atom.* TO 'atom'@'localhost' IDENTIFIED BY '12345';"


.. _linux-run-installer:

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
* Username
* E-mail address
* Password
