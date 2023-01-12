.. _installation-ubuntu:

======================================
Linux - Ubuntu 20.04 LTS (Focal Fossa)
======================================

Most of the configuration steps described in this document apply to any modern
Linux environment, however some of them will apply only to Ubuntu and likely to
any Ubuntu-based distribution. **Please be aware**: we do our release 
development and testing using Ubuntu LTS releases, and cannot guarantee that 
other versions, distributions, or operating systems will work as expected with
the following instructions. 

This document is based in `Ubuntu 20.04 LTS (Focal Fossa)`_. Once you have
installed it, you should be able to follow the instructions described below.
In particular, we are going to use Ubuntu packages that can be found under the
`repositories`_ *main* and *universe*.

.. IMPORTANT::

   Please make sure you have reviewed the :ref:`requirements
   <installation-requirements>` before proceeding. Also, you may want to
   consider setting up the :ref:`firewall <security-firewall>` before you start
   installing the services described below to avoid exposing them to outside
   access.

**Junmp to:**

* :ref:`installation-ubuntu-dependencies`
* :ref:`installation-ubuntu-download`
* :ref:`installation-ubuntu-create-database`
* :ref:`installation-ubuntu-installer`
* :ref:`installation-ubuntu-configuration-files`
* :ref:`installation-ubuntu-security-considerations`
* :ref:`installation-ubuntu-serve`
* :ref:`installation-ubuntu-use-atom`


.. _installation-ubuntu-dependencies:

Install the dependencies
========================

.. _installation-ubuntu-dependencies-mysql:

MySQL
-----

AtoM |version| requires `MySQL`_ 8.0 or higher as it uses common table
expressions. Also, we've experienced very good results using Percona Server
for MySQL 8.0, so don't be afraid and use it if you want!

.. code-block:: bash

   sudo apt update
   sudo apt install mysql-server

.. TIP::

   The default MySQL installation is not completely secure, but it comes with a
   security script that can be executed to improve the default configuration:

   .. code-block:: bash

      sudo mysql_secure_installation

Finally, let’s configure our MySQL modes. The MySQL server can operate in
different SQL modes, which affects the SQL syntax MySQL supports and the data
validation checks it performs.

Paste the following values in a new file at ``/etc/mysql/conf.d/mysqld.cnf``
and save:

.. code-block:: bash

   [mysqld]
   sql_mode=ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
   optimizer_switch='block_nested_loop=off'

Now we’ll restart MySQL:

.. code-block:: bash

   sudo systemctl restart mysql

.. _installation-ubuntu-dependencies-elasticsearch:

Elasticsearch
-------------

A search server based on Apache Lucene and developed in Java that has brought
AtoM a lot of advanced features, performance and scalability. This is probably
the biggest change introduced in AtoM 2.x and we are pleased with the results.

Ubuntu doesn't provide a package but you can download it directly from the
`Elasticsearch site`_ if you are unable to download it using the method that
follows.

Make sure that `Java`_ is installed. In this example we are going to use
OpenJDK but Oracle's JVM would also work.

.. code-block:: bash

   sudo apt install openjdk-11-jre-headless apt-transport-https software-properties-common

After successfully installing Java, proceed to install Elasticsearch. Download
and install the public signing key used in their repository:

.. code-block:: bash

   wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

.. IMPORTANT::

   Don't miss the dash ( ``-`` ) at the end of the above command!

Now add their repository:

.. code-block:: bash

   echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

Ready to be installed. Run:

.. code-block:: bash

   sudo apt update
   sudo apt install elasticsearch

Start the service and configure it to start when the system is booted.

.. code-block:: bash

   sudo systemctl enable elasticsearch
   sudo systemctl start elasticsearch

.. _installation-ubuntu-dependencies-php:

PHP
---

Ubuntu 20.04 bundles PHP 7.4, which is much faster than older releases. The
following command will install it along with the rest of PHP extensions
:ref:`required <installation-requirements>` by AtoM:

.. code-block:: bash

   sudo apt install php-common php7.4-common php7.4-cli php7.4-curl php7.4-json php7.4-ldap php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-mbstring php7.4-xsl php7.4-zip php-apcu php-apcu-bc

If you are using Memcached as cache engine, you will also need to install
`php-memcache`:

.. code-block:: bash

   sudo apt install php-memcache

.. _installation-ubuntu-dependencies-gearman:

Gearman job server
------------------

Gearman job server is required by AtoM as of version 2.2.

.. code-block:: bash

   sudo apt install gearman-job-server

.. _installation-ubuntu-dependencies-other-packages:

Other packages
--------------
In order to generate PDF finding aids, AtoM requires Apache FOP to be
installed. Fortunately, Apache FOP can now be installed directly from
Ubuntu packages using the command below.

.. note::

   The command specified below uses the ``--no-install-recommends`` parameter:
   this is intentional and ensures that only dependencies are installed and
   not 'recommended' packages. If ``--no-install-recommends`` is not
   specified, openjdk-8-jre will be installed as a dependency for one of the
   recommended packages. Since openjdk-8-jre-headless was already installed in
   the Elasticsearch installation section above, we want to prevent installing
   the openjdk-8-jre package as well.

.. code-block:: bash

   sudo apt install --no-install-recommends fop libsaxon-java

Make sure the default java command points to the java version 11 binary (ignore
errors):

.. code-block:: bash

   sudo update-java-alternatives -s java-1.11.0-openjdk-amd64

.. TIP::

   To list all the available jdk installs and the java update-alternatives
   selections:

   .. code-block:: bash

      sudo update-java-alternatives -l
      sudo update-alternatives --get-selections | grep java

If you want AtoM to be able to process :term:`digital objects <digital object>`
in formats like JPEG or to extract the text from your PDF documents, there are
certain packages that you need to install. They are not mandatory but if they
are found in the system, AtoM will use them to produce digital object
derivatives from your :term:`master objects <master digital object>`. for
more information on each, see: :ref:`Requirements: other dependencies
<other-dependencies>`. The following will install all the recommended
dependencies at once:

.. code-block:: bash

   sudo apt install imagemagick ghostscript poppler-utils ffmpeg


.. _installation-ubuntu-download:

Download AtoM
=============

Now that we have installed and configured all dependencies, we are ready to
download and install AtoM itself. The safest way is to install AtoM from the
tarball, which you can find in the `download section`_. However, experienced
users may prefer to check out the code from our `public repository`_.

The following instructions assume that we are installing AtoM under
:file:`/usr/share/nginx` and that you are using AtoM |release|.

.. _installation-ubuntu-download-tarball:

Option 1: Download the tarball
------------------------------

.. code-block:: bash

   wget https://storage.accesstomemory.org/releases/atom-2.7.1.tar.gz
   sudo mkdir /usr/share/nginx/atom
   sudo tar xzf atom-2.7.1.tar.gz -C /usr/share/nginx/atom --strip 1

Please note that the tarball may not be available yet if this version is still
in development. In this case, you can try the alternative installation method
explained below.

.. _installation-ubuntu-download-git:

Option 2: Check out the code from our git repository
----------------------------------------------------

Install git:

.. code-block:: bash

   sudo apt install git

.. code-block:: bash

   sudo mkdir -p /usr/share/nginx/atom
   sudo git clone -b stable/2.7.x http://github.com/artefactual/atom.git /usr/share/nginx/atom

If you are not interested in downloading all the history from git, you could
also truncate it to a specific number of revisions, e.g.: just one revision

.. code-block:: bash

   git clone -b stable/2.7.x --depth 1 http://github.com/artefactual/atom.git /usr/share/nginx/atom

We use `Composer`_ to install and manage some third-party PHP libraries. To
install Composer download and run the Composer installer according to the
instructions at https://getcomposer.org/download/ in the "Command-line
installation" section.

Once Composer is installed you will need to run it to install the required
libraries. First, move to the AtoM folder:

.. code-block:: bash

   cd /usr/share/nginx/atom

For production sites, the development libraries do not need to be included:

.. code-block:: bash

   sudo ~/composer.phar install --no-dev

Or if you have installed Composer `globally`_:

.. code-block:: bash

   sudo composer install --no-dev

For development environments, the dev libraries should also be installed:

.. code-block:: bash

   sudo ~/composer.phar install

After downloading the code, you will need to compile the themes files:

.. code-block:: bash

   sudo apt install npm make
   sudo npm install -g "less@<4.0.0" n
   sudo n stable
   sudo npm install
   sudo npm run build
   sudo make -C /usr/share/nginx/atom/plugins/arDominionPlugin
   sudo make -C /usr/share/nginx/atom/plugins/arArchivesCanadaPlugin
   sudo rm -rf node_modules

.. _installation-ubuntu-create-database:

Create the database
===================

Assuming that you are running MySQL in localhost, please create the database
by running the following command using the password you created :ref:`earlier
<installation-ubuntu-dependencies-mysql>`:

.. code-block:: bash

   sudo mysql -h localhost -u root -p -e "CREATE DATABASE atom CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"

.. note::

   If you do not supply the MySQL root password after the -p, you will be
   prompted for it when you enter the command. If you do supply the password,
   there is no space following -p; in other words, ``-pPASSWORD``. (Replace
   PASSWORD with the password you created.) Remember, supplying the password
   on the command line is less secure as it may be visible to others in the
   .bash_history file.

Notice that the database has been called **atom**. Feel free to change its
name.

In case your MySQL server is **not** the same as your web server, replace
"localhost" with the address of your MySQL server.

.. warning::

   Plase make sure that you are using an empty database! Don't reuse an old
   database unless it's empty. You can always drop it by using the
   :command:`DROP DATABASE` command and then create it again.

Additionally, it's always a good idea to create a specific MySQL user for AtoM
to keep things safer. This is how you can create a user called ``atom`` with
password ``12345`` and the permissions needed for the database created above.

.. code-block:: bash

   sudo mysql -h localhost -u root -p -e "CREATE USER 'atom'@'localhost' IDENTIFIED BY '12345';"
   sudo mysql -h localhost -u root -p -e "GRANT ALL PRIVILEGES ON atom.* TO 'atom'@'localhost';"

Note that the ``INDEX``, ``CREATE`` and ``ALTER`` privileges are only necessary
during the installation process or when you are upgrading AtoM to a newer
version. They can be removed from the user once you are finished with the
installation or you can change the user used by AtoM in
:ref:`config.php <config-config-php>`.

.. _installation-ubuntu-installer:

Run the installer
=================

You should now be ready to run the installer. It's a simple command line
interface task that configures AtoM according to your environment, adds
the necessary tables and initial data to the recently created database and
creates the Elasticsearch index.

.. code-block:: bash

   cd /usr/share/nginx/atom
   php symfony tools:install

The installation task will ask for configuration details such as the location
of your database server. In some cases, it may provide default values, such as
``atom`` for the database name. If you have followed this document to the
letter (including creating a different database user in the database
configuration step :ref:`above <installation-ubuntu-create-database>`, this is
how you should fill the configuration:

* Database host: ``localhost``
* Database port: ``3306``
* Database name: ``atom``
* Database user: ``atom``
* Database password: ``12345``
* Search host: ``localhost``
* Search port: ``9200``
* Search index: ``atom``

Of course, some of these values will look very different if you are running
AtoM in a distributed way, where your services like MySQL or Elasticsearch are
running in separate machines.

The rest of the configuration can be filled as you need:

* Site title
* Site description
* Site base URL
* Admin email
* Admin username
* Admin password

.. TIP::

   You can always change the :term:`site title`, :term:`site description`, and
   :term:`Base URL` later via **Admin > Settings > Site information**. See:
   :ref:`site-information` for more information. The admin email, username and
   password can also be changed by an :term:`administrator` after installation
   via the :term:`user interface` - see: :ref:`edit-user`.

For more information about this task, including ways to automate it, check its
full documentation in :ref:`the command line tools page <cli-installer>`.

.. _installation-ubuntu-configuration-files:

Configure
=========

There are various settings that can only be configured via the command-line -
for example, the default timezone and culture of the application. Depending on
your local requirements, it may be preferable to configure some of these now.
For more information on these settings see: :ref:`customization-config-files`.

.. _installation-ubuntu-security-considerations:

Security considerations
=======================

Now that AtoM is configured and installed, please take a moment to read our
:ref:`security section <security>` where we will show you how to configure
the firewall in Ubuntu and other options in AtoM configuration.

We strongly encourage our users to configure a firewall because some of the
services configured should not be exposed in the wild, e.g. Elasticsearch was
not designed to be accessible from untrusted networks and it's a common attack
vector.

.. _installation-ubuntu-serve:

Serve
=====

There are many web servers out there capable of working well with `PHP`_.
`Apache`_ is probably the most popular and we like it, but we've found that
`Nginx`_ adapts itself much better to limited resource environments while it
also scales better and more predictably under high loads. You are welcome to
try other solutions, but the following documentation will focus on Nginx and
PHP-FPM.

Additionally, AtoM requires the configuration of a Gearman worker service.

.. _installation-ubuntu-serve-filesystem-permissions:

Filesystem permissions
----------------------

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

If you are planning to do DIP uploads from AM, check the :ref:`SWORD deposit
directory section <sword-directory>` to set the permissions of that
directory.

.. _installation-ubuntu-serve-workers:

Deployment of workers
---------------------

Gearman is used in AtoM to support asynchronous tasks, some of which are
core functionality such as updating the :term:`publication status` of a
descriptive hierarchy, moving descriptions to a new :term:`parent record`,
and much more. A worker is just a CLI task that you can run in a terminal
or supervise with specific tools like upstart, supervisord or systemd.
The worker will wait for jobs that are assigned by the job server.

We will use systemd to manage the AtoM worker; create the following service
file :file:`/usr/lib/systemd/system/atom-worker.service`:

.. code-block:: none

   [Unit]
   Description=AtoM worker
   After=network.target
   # High interval and low restart limit to increase the possibility
   # of hitting the rate limits in long running recurrent jobs.
   StartLimitIntervalSec=24h
   StartLimitBurst=3

   [Install]
   WantedBy=multi-user.target

   [Service]
   Type=simple
   User=www-data
   Group=www-data
   WorkingDirectory=/usr/share/nginx/atom
   ExecStart=/usr/bin/php7.4 -d memory_limit=-1 -d error_reporting="E_ALL" symfony jobs:worker
   KillSignal=SIGTERM
   Restart=on-failure
   RestartSec=30

.. IMPORTANT::

   If you are not using PHP 7.4, be sure to update the `ExecStart` filepath
   in the `[Service]` section of  the sample configuration block above!
   Currently it assumes PHP 7.4 is being used, and will not  work for
   installations using a different PHP version without modification.

Now reload systemd, enable and start the AtoM worker:

.. code-block:: bash

   sudo systemctl daemon-reload
   sudo systemctl enable atom-worker
   sudo systemctl start atom-worker

Check out the following page for more information about asynchronous jobs and
worker management: :ref:`maintenance-asynchronous-jobs`.

.. _installation-ubuntu-serve-php-fpm:

PHP-FPM
-------

Our favorite way to deploy AtoM is using `PHP-FPM`_, a process manager that
scales better than other solutions like FastCGI.

.. code-block:: bash

   sudo apt install php7.4-fpm

Let's add a new PHP pool for AtoM by adding the following contents in a new
file called :file:`/etc/php/7.4/fpm/pool.d/atom.conf`:

.. code-block:: ini

   [atom]

   ; The user running the application
   user = www-data
   group = www-data

   ; Use UNIX sockets if Nginx and PHP-FPM are running in the same machine
   listen = /run/php7.4-fpm.atom.sock
   listen.owner = www-data
   listen.group = www-data
   listen.mode = 0600

   ; The following directives should be tweaked based in your hardware resources
   pm = dynamic
   pm.max_children = 30
   pm.start_servers = 10
   pm.min_spare_servers = 10
   pm.max_spare_servers = 10
   pm.max_requests = 200

   chdir = /

   ; Some defaults for your PHP production environment
   ; A full list here: http://www.php.net/manual/en/ini.list.php
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

   ; APC
   php_admin_value[apc.enabled] = 1
   php_admin_value[apc.shm_size] = 64M
   php_admin_value[apc.num_files_hint] = 5000
   php_admin_value[apc.stat] = 0

   ; Zend OPcache
   php_admin_value[opcache.enable] = 1
   php_admin_value[opcache.memory_consumption] = 192
   php_admin_value[opcache.interned_strings_buffer] = 16
   php_admin_value[opcache.max_accelerated_files] = 4000
   php_admin_value[opcache.validate_timestamps] = 0
   php_admin_value[opcache.fast_shutdown] = 1

   ; This is a good place to define some environment variables, e.g. use
   ; ATOM_DEBUG_IP to define a list of IP addresses with full access to the
   ; debug frontend or ATOM_READ_ONLY if you want AtoM to prevent
   ; authenticated users
   env[ATOM_DEBUG_IP] = "10.10.10.10,127.0.0.1"
   env[ATOM_READ_ONLY] = "off"

The process manager has to be enabled and started:

.. code-block:: bash

   sudo systemctl enable php7.4-fpm
   sudo systemctl start php7.4-fpm

If the service fails to start, make sure that the configuration file has been
has been pasted properly. You can also check the syntax by running:

.. code-block:: bash

   sudo php-fpm7.4 --test

If you are not planning to use the default PHP pool (``www``), feel free to
remove it:

.. code-block:: bash

   sudo rm /etc/php/7.4/fpm/pool.d/www.conf
   sudo systemctl restart php7.4-fpm

.. _installation-ubuntu-serve-nginx:

Nginx
-----

In Ubuntu, the installation of Nginx is simple:

.. code-block:: bash

   sudo apt install nginx

.. WARNING::

   These instructions assume that the Nginx package is creating the
   directory :file:`/usr/share/nginx` and that is the location where we are
   going to place the AtoM sources. However, we have been told this location
   may be different in certain environments (e.g. :file:`/var/www`) or you may
   opt for a different location. If that is the case, please make sure that you
   update the configuration snippets that we share later in this document
   according to your location.

Nginx deploys a default server (aka VirtualHost, for Apache users) called
**default** and you can find it in :file:`/etc/nginx/sites-available/default`.
In order to install AtoM you could edit the existing server block or add a new
one. We are going to you show you how to do the latter:

.. code-block:: bash

   sudo touch /etc/nginx/sites-available/atom
   sudo ln -sf /etc/nginx/sites-available/atom /etc/nginx/sites-enabled/atom
   sudo rm /etc/nginx/sites-enabled/default

We have now created the configuration file and linked it from sites-enabled/,
which is the directory that Nginx will look for. This means that you could
disable a site by removing its symlink from sites-enabled/ while keeping the
original one under sites-available/, in case that you want to re-use it in the
future. You can do this with the Nginx default server.

The following is a recommended server block for AtoM. Put the following
contents in :file:`/etc/nginx/sites-available/atom`.

.. code-block:: nginx

   upstream atom {
      server unix:/run/php7.4-fpm.atom.sock;
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

Now you need to enable and reload Nginx:

.. code-block:: bash

   sudo systemctl enable nginx
   sudo systemctl reload nginx

.. _installation-ubuntu-use-atom:

Start using AtoM
================

Congratulations! Your new AtoM |version| installation should now be ready to
use. You can access it by entering your base URL into a web browser - the
:term:`administrator` account login details will be those you entered when
configuring the installer. See :ref:`getting-started-all` for further
information on your first steps using AtoM.

If you encounter any issues, we recommend consulting the 
:ref:`maintenance-troubleshooting` documentation for suggestions on how to
resolve common errors.

:ref:`Back to top <installation-ubuntu>` 


.. _`Ubuntu 20.04 LTS (Focal Fossa)`: http://releases.ubuntu.com/focal/
.. _`repositories`: https://help.ubuntu.com/community/Repositories/Ubuntu
.. _`download section`: http://www.accesstomemory.org/download
.. _`public repository`: https://github.com/artefactual/atom
.. _`Elasticsearch site`: https://www.elastic.co/downloads/elasticsearch
.. _`Java`: https://www.java.com/en/
.. _`Composer`: https://getcomposer.org/
.. _`globally`: https://getcomposer.org/doc/00-intro.md#globally
.. _`MySQL`: https://www.mysql.com/
.. _`PHP`: http://php.net/
.. _`Apache`: https://httpd.apache.org/
.. _`Nginx`: http://nginx.com/
.. _`PHP-FPM`: http://php-fpm.org/
