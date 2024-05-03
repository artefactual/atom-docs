.. _installation-execution-limits:

====================
PHP execution limits
====================

There are several PHP configuration settings that may be responsible for
prematurely halting a script. This is a frequent problem in many installations,
especially when handling large file uploads. In the PHP site there is also a
useful guide we recommend reading: `Common pitfalls
<https://secure.php.net/manual/features.file-upload.common-pitfalls.php>`_.

Some of these values are set during installation, in the PHP configuration
pool you set up here:

* :ref:`20.04 PHP-FPM Configuration <installation-ubuntu-serve-php-fpm>`

.. _execution-php-ini:

The php.ini file
================

Additionally, some of these execution limit settings are maintained in the
``php.ini`` file found on your server/computer. One thing to double-check is
that you are updating the correct ``php.ini`` file (it is possible there is
more than one - one for your browser settings, and one for the command-line,
for example), and the location of these files is not consistent, as it depends
on a number of other factors.

Here are a couple of links to help you locate the file(s) on your system - you
might want to double-check to see if there are other files as well:

* https://www.howtogeek.com/50853/find-the-php-ini-file-location-from-the-command-line/
* https://www.templatemonster.com/blog/where-is-php-ini/

**Locating your web config file**

The easiest way to locate your ``php.ini`` web config file is to create a simple
PHP file with a single line of code in it, and view the output.

1. Using a text editor, create a new file (name it however you want, e.g.
   ``test.php``), and make sure it ends with ``.php`` extension.

2. Put this single line of code in the file:

.. code-block:: php

   <?php phpinfo(); ?>

3. Save the file, and then place it on your AtoM server, in the root AtoM
   directory - if you have followed our recommended installation instructions, this
   is generally ``/usr/share/nginx/atom``.

4. Open the file via your web browser. For example, if you placed it into your
   root folder, run ``http://mywebsite.com/test.php``.

5. In the page displayed, find the "Loaded Configuration File" row for your
   ``php.ini`` file location.

.. IMPORTANT::

   Make sure to delete the phpinfo script above when it's not needed, as the
   information displayed could be used by malicious persons to compromise your
   website security.

**Locating your command-line config file**

Run the following command via the command-line interface:

.. code-block:: bash

   php -i | grep php.ini

The command-line will return the location of your PHP configuration file.

.. _execution-adjusting-limits:

Adjusting PHP script execution limits
=====================================

``max_execution_time``:
  This sets the maximum time in seconds a script is allowed to run before it is
  terminated by the parser. This helps prevent poorly written scripts from tying
  up the server. The default setting is 30.

  .. code-block:: ini

    max_execution_limit = 30

**More info**: https://www.php.net/manual/en/info.configuration.php#ini.max-execution-time

``memory_limit``:
  Limits the amount of memory a script may consume (in bytes [B], kilobytes
  [K], megabytes [M] or gigabytes [G]).

  .. code-block:: ini

    memory_limit = 128M

  Please note that this memory limit is not related to the amount of system
  memory (RAM) available, but is an artificial limit imposed by PHP to avoid
  run-away scripts from consuming all system resources. This implies that
  adjusting the PHP configuration should be done **before** deciding whether
  adding more RAM to your system may be beneficial. This limit is especially
  important if you are trying to process :term:`digital objects <digital
  object>` because it is needed to allocate enough memory to process both the
  input and the output digital object. See the following table:

  +------------+------------+
  | Size (MB)  | Megapixels |
  +============+============+
  | 100        | 13         |
  +------------+------------+
  | 128        | 18         |
  +------------+------------+
  | 256        | 35         |
  +------------+------------+
  | 512        | 70         |
  +------------+------------+

**More info**: https://www.php.net/manual/en/ini.core.php#ini.memory-limit

``post_max_size``:
  Sets max size of post data allowed. This setting also affects file upload.
  To upload large files, this value must be larger than ``upload_max_filesize``.
  Generally speaking, ``memory_limit`` should be larger than ``post_max_size``.
  When an integer is used without specifying the unit, the value is measured in
  bytes - shorthand (in bytes [B], kilobytes [K], megabytes [M] or gigabytes [G])
  may also be used to specify bigger values.

  .. code-block:: ini

     post_max_size = 72M

  **More info**: https://secure.php.net/manual/ini.core.php#ini.post-max-size


``upload_max_filesize``:
  The maximum size of an uploaded file. When an integer is used without
  specifying the unit, the value is measured in bytes - shorthand (in bytes
  [B], kilobytes [K], megabytes [M] or gigabytes [G]) may also be used to
  specify bigger values.

  .. code-block:: ini

     upload_max_filesize = 64M

  **More info**: https://secure.php.net/manual/ini.core.php#ini.upload-max-filesize

.. TIP::

   There are more variables that can be adjusted as needed. We recommend
   reviewing the following resources:

   * `Common pitfalls <https://secure.php.net/manual/features.file-upload.common-pitfalls.php>`__
   * https://secure.php.net/manual/ini.core.php#ini.sect.resource-limits
   * https://secure.php.net/manual/ini.core.php#ini.sect.file-uploads
   * https://secure.php.net/manual/info.configuration.php#info.configuration

.. _execution-after-changes:

After making configuration changes
==================================

If you do make changes to the PHP configuration pool and/or the ``php.ini``
default settings, you should restart PHP-FPM after, and clear your application
caches and restart Memcached (if you're using it as cache engine).

.. code-block:: bash

   sudo systemctl restart php7.4-fpm
   php symfony cc

**Optionally, to restart Memcached**:

.. code-block:: bash

   sudo systemctl restart memcached

 For more details on these commands, see:

 * :ref:`troubleshooting-restart-services`
 * :ref:`maintenance-clear-cache`

.. TIP::

   Learn more about AtoM command-line tasks and basic maintenance commands in
   the following slide deck:

   *  https://www.slideshare.net/accesstomemory/atoms-command-line-tasks-an-introduction

   New to using the UNIX command-line? If so, this slide deck will help you
   get started:

   * https://www.slideshare.net/accesstomemory/commandline-101

.. SEEALSO::

   * :ref:`maintenance-troubleshooting`
   * :ref:`maintenance-cli-tools`

:ref:`Back to top <installation-execution-limits>`
