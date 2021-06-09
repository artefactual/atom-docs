.. _security-application:

===========
Application
===========

The behavior of PHP code often depends strongly on the values of many
`configuration settings <http://php.net/manual/en/ini.list.php>`_, including
fundamental changes to things like how errors are handled.

We defined some sane configuration defaults in our :ref:`installation instructions
<installation-linux>`. Namely, these settings are defined in the PHP pool
(:file:`/etc/php7.4/fpm/php-fpm.conf`) and they are prioritized over those
defined in :file:`/etc/php/7.4/fpm/php.ini`. Be aware that multiple configuration
files are read when PHP starts up, therefore it is a good practice to check the
final configuration state when you are deploying AtoM. You can use
`phpinfo() <https://www.php.net/manual/en/function.phpinfo.php>`__ for that 
purpose.

.. SEEALSO::

   * :ref:`execution-php-ini`

There are certain settings in PHP that could be tweaked as a security measure
but they may have unexpected results in AtoM. For example, you may be tempted to
disable ``allow_url_fopen`` but that would make impossible for AtoM to fetch
digital objects from remote resources. These settings only seem convenient for
hosting providers running untrusted code from their users or willing to limit
their abilities in runtime.

.. _read-only-mode:

Making AtoM read-only
=====================

In some cases, you may want to prevent users from being able to log into the
application via the :term:`user interface` - for example, if you are running a
separate AtoM instance as a read-only front end, while maintaining a
read/write site internally and using a replication script to copy data to the
public site periodically.

.. TIP::

   Artefactual maintains a public replication script that can be used to support
   a two-site deployment, as in the example above. For more information, see: 

   * https://github.com/artefactual-labs/atom-replication
   * https://www.slideshare.net/accesstomemory/2-sitereplication-with-atom

There are two places in AtoM where you can configure read-only mode - be sure
to check both locations.

.. TIP::

   Before you do, there is also a :term:`user interface` setting that can be
   set to hide the login button - you might want to enable this before disabling
   login. See: 

   :ref:`visible-elements-global`

The first is an environment variable defined in the PHP pool set up during
installation. The location of this file may vary depending on your PHP 
version and installation method, but typically for PHP 7.4, you can find this 
file at ``/etc/php/7.4/fpm/pool.d/atom.conf``.  

The file contains an environment variable called ``ATOM_READ_ONLY``. To put 
AtoM into read-only mode (so login is disabled), change this value to "on," like
so: 

.. code-block:: bash

   env[ATOM_READ_ONLY] = "on"

You will need to restart PHP-FPM after making this change. See: 

:ref:`troubleshooting-restart-php-fpm`

There is also a setting found in the :ref:`config-app-yml` configuration file. 
Change this value to: 

.. code-block:: bash

   read_only: true

Once again, you will need to restart PHP-FPM after editing tihs file. 

.. IMPORTANT::
   
   The environment variable located in the PHP pool takes precedence over this
   ``config/app.yml`` configuration file, so changing the setting here, but
   not also in the PHP pool **may not prevent login**. We recommend changing
   the value in both places.

AtoM security panel settings
============================

AtoM's :term:`user interface` also has some security settings that can be 
configured by an :term:`administrator`, such as the ability to require strong
passwords, or limiting login to a specific IP or range. For more information, 
see: 

* :ref:`Security panel <security-panel>`