.. _debug-mode:

==========
Debug mode
==========

By default, AtoM runs in "production" mode. Production mode suppresses the
output of any PHP notices, warnings or error messages. Suppressing warnings is
usually desirable to avoid displaying cryptic and alarming messages to users
of the application, and for security reasons. However, in the case of a fatal
PHP error, suppressing warnings can result in a blank white page being
displayed in the client's browser. Suppressing warnings is also not desirable
when trying to solve the problem causing the error.

To diagnose AtoM application errors it is usually useful to run in Debug mode
(a.k.a. "Development mode"). Debug mode will display PHP error messages
(though the types of messages displayed is subject to your PHP error reporting
configuration setting), as well as displaying a debug toolbar.

There are two methods for enabling Debug mode for AtoM.

Using qubit_dev.php
-------------------

Using the "qubit_dev.php"
`front controller <http://en.wikipedia.org/wiki/Front_Controller_pattern>`_
for AtoM is the simplest way see debugging information, as it only involves a
simple change to the web address (URL) used to access the application. For
instance:

.. code:: bash

   http://www.example.com/atom/informationobject/browse

becomes

.. code:: bash

   http://www.example.com/atom/qubit_dev.php/informationobject/browse


.. important::

    Access to "qubit_dev.php" is limited to the server (localhost) IP address
    by default. This means that to access the 'qubit_dev.php' page you must be
    running a web-browser on the actual server that is hosting the AtoM
    application. If this is not the case you will see an error message:

    **You are not allowed to access this file. Check qubit_dev.php for more
    information.**

A :term:`developer` can edit the PHP configuration file (frequently located at
``/etc/php5/fpm/pool.d/atom.conf``) to add further IP addresses to the
``ATOM_DEBUG_IP`` variable - this is called by ``qubit_dev.php`` and checked
for allowed IP addresses. Doing so will allow you to access Debug mode from a
different IP address than that of the server.

.. image:: images/debug-ip.*
   :align: center
   :width: 85%
   :alt: an image of the ATOM_DEBUG_IP variable in the php configuration file

After making changes to the ``ATOM_DEBUG_IP`` variable in ``atom.conf``, you
will need to restart PHP-FPM.

For **Ubuntu 14.04**:

.. code:: bash

   sudo service php5-fpm restart

For **Ubuntu 16.04**:

.. code:: bash

   sudo systemctl restart php7.0-fpm
   
Editing the index.php file
--------------------------

The standard front controller for AtoM is the index.php file, which by
default is configured to suppress debugging messages. If you are running AtoM
on a remote server (i.e. not your workstation) accessing the 'qubit_dev.php'
front-controller may not be possible, and editing the index.php controller to
display debugging messages is another option.

Editing the index.php page requires using a text editor to modify the file on
the server. If you do not have access to your web server, or are not
comfortable editing files, please contact your system administrator.

1. Open the index.php file in your text editor of choice

2. Find the following line:

.. code:: bash

   $configuration = ProjectConfiguration::getApplicationConfiguration('qubit',
   'prod', false);

3. Update the "false" flag to "true"

.. code:: bash

   $configuration = ProjectConfiguration::getApplicationConfiguration('qubit',
   'prod', true);

4. Save the index.php file

5. Reload AtoM in your web browser

.. important::

   After recording any error messages, make sure to reverse the above steps
   to suppress error message display again. Displaying these error messages is a
   security concern because it can display information about your server
   configuration to the public.

:ref:`Back to the top <debug-mode>`.
