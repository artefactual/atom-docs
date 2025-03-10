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

3. Update the "prod" environment to "dev" and "false" flag to "true"

.. code:: bash

   $configuration = ProjectConfiguration::getApplicationConfiguration('qubit',
   'dev', true);

4. Save the index.php file

5. Reload AtoM in your web browser

.. important::

   After recording any error messages, make sure to reverse the above steps
   to suppress error message display again. Displaying these error messages is a
   security concern because it can display information about your server
   configuration to the public.

:ref:`Back to the top <debug-mode>`.
