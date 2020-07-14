.. _customization-config-files:

===============================
Manage AtoM configuration files
===============================

Many settings in AtoM can be managed directly through the
:term:`user interface` via the **Admin > Settings** menu (see: :ref:`settings`
for details). However, there are also several configuration files maintained
in AtoM's code where various settings and configurations can be managed, and
which can be edited directly by a user via the command-line. These files can
be useful for customizing the behavior and performance of your application.
Details on each have been included below.


Relevant configuration files and how to change them
===================================================

From AtoM's root directory, use the ``nano`` command to open a file for editing
- e.g.:

.. code-block:: bash

   nano config/app.yml

You can save changes with ``CTRL+O + ENTER``, and exit with ``CTRL+X`` (you
will be asked to save if you haven't yet).

.. IMPORTANT::

   If you change any of the files listed below, clear the cache and restart
   PHP-FPM to apply the changes.

   * :ref:`maintenance-clear-cache`
   * :ref:`troubleshooting-restart-php-fpm`


Important files:
================

.. _config-app-yml:

config/app.yml
---------------

.. _htmlpurifier: http://htmlpurifier.org/

This is the primary file where AtoM-specific settings that cannot be managed
via the :term:`user interface` are maintained. This file includes settings
such as:

* Global digital object upload limit (in gigabytes) - can be set to -1 for
  unlimited, or set to a specific limit in GBs.
* Timeout limit for fetching digital objects from external services (in
  seconds) - default value is 10s
* Which cache engine you want to use (can use Memcached for a distributed
  cache, for example) - default is sfAPCCache
* Enable read-only mode, if you want to remove the login button and prevent
  users from logging into the application.
* Set a Google Analytics API key, for basic installation-wide analytics via
  Google - see: :ref:`maintenance-web-analytics`
* Set a Google Tag Manager API key, for further element-specific analytics
* Enable htmlpurifier_ - limits HTML on static pages to a white-list of approved
  elements and attributes, to prevent XSS - see: :ref:`security-static-pages`
  for more information.
* Increase the maximum allowed value for the full-width :term:`treeview` paging
  limit - see: :ref:`fwt-items-per-page`

.. image:: images/app-yml-settings.*
   :align: center
   :width: 70%
   :alt: An image of the app.yml file in the command-line

.. IMPORTANT::

   Symfony (the PHP framework that AtoM uses) has a cascading system of
   priorization for configuration files - if you create an ``app.yml`` file in
   ``apps/qubit/config/``, its settings will override those found in
   ``config/app.yml``. This can be useful if you want to change some
   configuration values without actually altering AtoM's installation
   defaults - Artefactual uses this method for automated deployment via
   Ansible, for example.

   If your settings changes aren't taking effect in ``config/app.yml`` and
   you've already cleared the cache and restarted php-fpm, you might want to
   double-check to make sure you don't have a file in
   ``apps/qubit/config/app.yml`` overriding the other configuration file. If
   you are using the :ref:`dev-env-vagrant` box for example, you will have
   this extra config file, since Artefactual uses Ansible to automate the
   build of the Vagrant box.

   .. image:: images/apps-qubit-config-app-yml.*
      :align: center
      :width: 90%
      :alt: An example of the app.yml file in apps/qubit/config

   
   There are also some settings in this file (such as the ``read_only`` setting) 
   that may be overwritten by environment variables in the PHP pool set up 
   during installation. For general information, see below, 
   :ref:`config-application-server`. For specific information on setting up
   read-only mode in AtoM, see: 

   * :ref:`read-only-mode`

.. _config-settings-yml:

apps/qubit/config/settings.yml
------------------------------

* Symfony and PHP settings - see the Symfony documentation for more general
  information: http://symfony.com/legacy/doc/reference/1_4/en/04-Settings
* For things like default_culture, default_timezone, etc
* Includes settings for error handling behavior as well - be careful
  changing these! We don't recommend it.

.. _config-factories-yml:

config/factories.yml
--------------------

* Another Symfony 1.x configuration file
* More details at: http://symfony.com/legacy/doc/reference/1_4/en/05-factories
* Useful for changing logging options, user authentication (LDAP), etc
* We don't recommend changing this file unless you know what you're doing!
* See: :ref:`maintenance-logging` for some ideas on how to work with these
  settings to change or improve logging in AtoM

.. _config-config-php:

config/config.php
-----------------

* Where basic configuration information for database access is stored, such
  as the database user, pass, and name
* We don't recommend changing this file unless you know what you're doing!

.. _config-sitemap-yml:

config/sitemap.yml
------------------

This configuration file is used in conjunction with the sitemap generation
command-line task - for more information, see: :ref:`cli-sitemap`.

This file contains the priorities (or weighting) for each
:term:`level of description` of archival descriptions included in the sitemap
the CLI task will generate. If you have added new levels of description to the
Levels of description :term:`taxonomy`, you can give them a priority here, or
adjust the default priorities included in the file (shown in the image below).

.. image:: images/config-sitemap-yml.*
   :align: center
   :width: 60%
   :alt: An image of the sitemap.yml file in the command-line


.. _config-application-server:

Application server
==================

Remember that nginx is just the HTTP frontend. Internally, each request is
forwarded to php-fpm. php-fpm is a pool of managed AtoM processes. The pool
has its own configuration file that defines some important global PHP settings
like timeouts, and environment variables that may also modify the way that
AtoM works as documented in accesstomemory.org.

The file of the pool is located at ``/etc/php/7.2/fpm/pool.d/atom.conf``. Edit
with ``nano``. Once saved, run: ``sudo systemctl restart php7.2-fpm``, and the
changes will apply.

.. SEEALSO::

   * :ref:`security-application`
   * :ref:`read-only-mode`