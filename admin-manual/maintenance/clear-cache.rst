.. _maintenance-clear-cache:

===========
Clear cache
===========

Many problems can be resolved by clearing Symfony's cache.

Basically, you need to be able to run the symfony command line application,
which is located in the root directory of this project.

.. code-block:: bash

   php symfony cache:clear

Additionally, if :ref:`apc.stat <maintenance-tuning-apc-stat>` is not activated
in your PHP configuration, you'll also have to clear the opcode cache
by invoking ``apc_clear_cache('opcode')`` from a script or reloading PHP-FPM:

.. code-block:: bash

   sudo /etc/init.d/php5-fpm reload
