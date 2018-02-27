.. _maintenance-clear-cache:

===========
Clear cache
===========

Many problems can be resolved by clearing Symfony's cache.

Basically, you need to be able to run the symfony command line application,
which is located in the root directory of this project.

.. code-block:: bash

   php symfony cache:clear


You can also use the shorthand version of the command, like so: 

.. code-block:: bash

   php symfony cc

Note that, because AtoM is session based, clearing the web browser cache might
log you out of the application. Be sure you have saved any work you are doing
in the user interface saved before doing so.

.. IMPORTANT::

   There are also other caches to consider clearing! 

   PHP-FPM (a PHP extension that AtoM uses) can also cache some content - if you
   are clearing the application cache, you should also consider restarting
   PHP-FPM. See:

   * :ref:`troubleshooting-restart-php-fpm`   

   Memcached is also an external cache engine that can be used with AtoM - you
   should restart it as well. See:

   * :ref:`troubleshooting-restart-memcached`   

   Finally, don’t forget that **your web browser has its own cache** - in some
   cases, if you are not seeing changes take affect, you might want to try
   clearing your web browser cache. Note that, because AtoM is session based,
   clearing the web browser cache might log you out of the application. Be sure
   you have saved any work you are doing in the user interface before doing so.

.. SEEALSO::

   * :ref:`troubleshooting-clear-cache`
   * :ref:`maintenance-troubleshooting`
   * :ref:`maintenance-cli-tools`
   * :ref:`maintenance-populate-search-index`
