.. _maintenance-logging:

=======
Logging
=======

The `Symfony framework <http://symfony.com/legacy>`__ used in AtoM includes a
number of logging options which can be customized based on :term:`developer`
or system administrator needs.

By default, two log files are included in the ``/log/`` directory of AtoM
(see where on `Github <https://github.com/artefactual/atom/tree/2.x/log>`__).
If you look in this directory, you should see two files: ``qubit_cli.log``
and ``qubit_dev.log``. You can view the contents of these log files like so:

.. code:: bash

   less log/qubit_cli.log

A :term:`developer` or system administrator can customize the output of these
logs, depending on what information is needed. In Symfony, the output to these
logs is controlled by the settings in the ``factories.yml`` file found at
``/apps/qubit/config/factories.yml`` (view example on Github   `here <https://
github.com/artefactual/atom/blob/2.x/apps/qubit/config/factories.yml>`__).
Factories in Symfony are "core objects needed by the framework during the life
of any request. They are configured in the ``factories.yml`` configuration
file." The ``factories.yml`` file, like several other configuration files in
Symfony, is `environment-aware <http://symfony.com/legacy/doc/reference/1_4/en/03-Configuration-Files-Principles#chapter_03_environment_awareness>`__
- "their interpretation depends on the current symfony environment. These
files have different sections that define the configuration should vary for
each environment."

.. TIP::

   For more information on the factories.yml file in Symfony, see:
   http://symfony.com/legacy/doc/reference/1_4/en/05-Factories

The ``factories.yml`` file in AtoM has 4 main environmentally-aware
"factories" configurations defined:  ``prod`` (for production - i.e.
``index.php`` in the application), ``test``  (which is not used by AtoM),
``dev`` (for development and debugging - i.e. ``qubit_dev.php``, when the site
is in :ref:`debug-mode`), and ``all``, which are  the default settings
inherited by the other factories, unless they are more explicitly defined
within each and overrriden. According to Symfony:

    When symfony needs a value from a configuration file, it merges the
    configuration found in the current environment section with the ``all``
    configuration. The special ``all`` section describes the default
    configuration for all environments. If the environment section is not
    defined, symfony falls back to the ``all`` configuration.

**Example - the debug factories settings:**

Here are the default settings for the ``debug`` factory in ``factories.yml``:

.. code:: bash

   dev:
    mailer:
      param:
        delivery_strategy: none

    storage:
      class: QubitSessionStorage
      param:
        session_name: symfony

    logger:
      class: sfAggregateLogger
      param:
        level: debug
        loggers:
          sf_file_debug:
            class: sfFileLogger
            param:
              level: warning
              file: %SF_LOG_DIR%/%SF_APP%_%SF_ENVIRONMENT%.log

Note the ``logger`` settings parameter nested under the ``dev`` factory -
these can be altered to change the logging behavior when in :ref:`debug-mode`.

The ``class`` parameter has several configuration options -
``sfAggregateLogger`` (the default configuration, which can aggregate logging
information from multiple sources), ``sfFileLogger`` (single source logging
information), and ``sfNoLogger`` (which will turn off logging - this is the
default setting for ``prod``, to keep the site performant). According to
Symfony, "If you don't use the ``sfAggregateLogger``, don't forget to specify
a null value for the loggers parameter." You can look at the parameter
settings on ``prod`` for an example.

The ``level`` option defines the level of the logger. There are 8 possible values
(ordered here from highest priority to lowest):

* EMERG: System is unusable
* ALERT: Immediate action required
* CRIT: Critical conditions
* ERR: Error conditions
* WARNING: Warning conditions
* NOTICE: Normal, but significant
* INFO: Informational
* DEBUG: Debug-level messaging

The lower the level of the setting, the more events will be adding to the
log. So if you set ``level`` to EMERG, you will only receive log messages
about critical failures in which the system is rendered unusable. If you set
``level`` to WARNING, you will receive WARNING, ERR, CRIT, ALERT, and
EMERG-level messages. Setting ``level`` to DEBUG will log all events.

.. TIP::

   See the following in the Symfony documentation for more information on
   Logging: http://symfony.com/legacy/doc/gentle-introduction/1_4/en/16-Application-Management-Tools#chapter_16_logging

.. seealso::

   * :ref:`maintenance-logging`

Example 1: Add a cli factory for increased logging
--------------------------------------------------

You can also add new factories to the ``factories.yml`` file, to create custom
logging profiles. For example, let's create a new ``cli`` factory, that will
define how we log information to ``qubit_cli.log``. Add the following to the
``factories.yml`` file:

.. code:: bash

   cli:
    mailer:
      param:
        delivery_strategy: none

    storage:
      class: QubitSessionStorage
      param:
        session_name: symfony

    logger:
      class: sfFileLogger
      param:
        level: info
        loggers:
          sf_file_debug:
            class: sfFileLogger
            param:
              level: info
              file: %SF_LOG_DIR%/qubit_cli.log

After you save your changes to the ``factories.yml`` file, you will need to
clear the application cache:

.. code:: bash

   php symfony cc

You may want to clear your browser's cache as well. Now all events with a
level of INFO or higher will be logged in ``log/qubit_cli.log``.

These log files can grow quickly! Depending on your logging settings and your
site traffic, Symfony warns that "these files have the strange habit of growing
by several megabytes in a few days." You can use the following command to
erase your logs:

.. code:: bash

   php symfony log:clear

The Symfony documentation also has suggestions on rotating your logs, for
better performance:

    For both better performance and security, you probably want to store symfony
    logs in several small files instead of one single large file. The ideal
    storage strategy for log files is to back up and empty the main log file
    regularly, but to keep only a limited number of backups. You can enable such a
    log rotation with a period of 7 days and a history (number of backups) of 10,
    as shown in Listing 16-7. You would work with one active log file plus ten
    backup files containing seven days' worth of history each. Whenever the next
    period of seven days ends, the current active log file goes into backup, and
    the oldest backup is erased.

.. code:: bash

   php symfony log:rotate frontend prod --period=7 --history=10

The backup log files are stored in the logs/history/ directory and suffixed with
the date they were saved.

Example 2: Enable high-level logging on production
--------------------------------------------------

You might want to log high-level errors from your production environment, to
be able to troubleshoot problems encountered. Logging can impact the
performance of your site, so you wouldn't want to set your production
environment to log at DEBUG level - but there may be situations where you
want to log WARNING and higher messages to your log.

Below is an example of how you could configure the ``prod`` factory in
``factories.yml`` to log WARNING and higher-level messages in
``qubit_cli.log``. First, let's look at the default settings for ``prod``:

.. code:: bash

   prod:
    logger:
      class: sfNoLogger
      param:
        level: err
        loggers: ~

    storage:
      class: QubitSessionStorage
      param:
        session_name: symfony

By default, the ``class`` option in the ``logger`` parameter is set to
*sfNoLogger* for production - that is, nothing is being logged by default.
Below is an example of how you might change these parameters to log
high-level errors and warnings in the ``qubit_cli.log`` file:

.. code:: bash

   cli:
    logger:
      class: sfFileLogger
      param:
        level: warning
        loggers:
          sf_file_debug:
            class: sfFileLogger
            param:
              level: warning
              file: %SF_LOG_DIR%/qubit_cli.log

    storage:
      class: QubitSessionStorage
      param:
        session_name: symfony

Remember to :ref:`clear the cache <maintenance-clear-cache>`, and clear your
browser cache, after saving your changes to the ``factories.yml`` file. See
also the notes above about clearing and rotating logs.

===============
Web server logs
===============

You might also want to access the error logs from your web server during
debugging. If you are using `Nginx <http://wiki.nginx.org/Main>`__ (our
recommended web server; see our Linux installation instructions for
:ref:`linux-dependency-nginx`), and have followed our Linux install instructions
(:ref:`here <installation-linux>`), you can view the Nginx error log by typing
the following command from your root AtoM directory:

.. code:: bash

   sudo tail -f /var/log/nginx/error.log

If you are using `Apache <http://httpd.apache.org/>`__, or another webserver,
you may have to search online for information on how to access the error log -
it also will depend on the  particular configuration of your installation. For
most Apache web server installs, the following should work:

.. code:: bash

   sudo tail -f /var/log/apache2/error.log
