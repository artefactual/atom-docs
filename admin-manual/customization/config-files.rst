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

   nano config/apps.yml

You can save changes with ``CTRL+O + ENTER``, and exit with ``CTRL+X`` (you
will be asked to save if you haven't yet).

Important files:
================

.. _config-apps-yml:

config/apps.yml
---------------

This is the primary file where AtoM-specific settings that cannot be managed
via the :term:`user interface` are maintained. This file includes settings
such as:

* Global digital object upload limit (in gigabytes) - can be set to -1 for
  unlimited, or set to a specific limit in GBs.
* Timeout limit for fetching digital objects from external services (in
  seconds) - default value is 10s
* Which cache engine you want to use (can use Memcached for a distributed
  cache, for example) - default is sfAPCCache
* Set IP address where the gearman job server is found (for asynchronous
  jobs)
* Set a Google Maps API key (for use in the Archival institution template,
  to generate dynamic Google Maps)
* Set a Google Analytics API key, for basic installation-wide analytics via
  Google

.. image:: images/app-yml-settings.*
   :align: center
   :width: 70%
   :alt: An image of the apps.yml file in the command-line

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

.. IMPORTANT::

   If you change any of the files listed above, clear the cache and restart
   php5-fpm to apply the changes.

   .. code-block:: bash

      php symfony cc
      sudo php5-fpm restart

.. _config-application-server:

Application server
==================

Remember that nginx is just the HTTP frontend. Internally, each request is
forwarded to php5-fpm. php5-fpm is a pool of managed AtoM processes. The pool
has its own configuration file that defines some important global PHP settings
like timeouts, and environment variables that may also modify the way that
AtoM works as documented in accesstomemory.org.

The file of the pool is located at ``/etc/php5/fpm.d/pool.d/atom.conf``. Edit
with ``nano``. Once saved, run: ``sudo restart php5-fpm`` and the changes will
apply.
