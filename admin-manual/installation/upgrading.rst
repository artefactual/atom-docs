.. _installation-upgrading:

=========
Upgrading
=========

This guide explains how to upgrade from an earlier AtoM release (including
ICA-AtoM versions 1.1 to 1.3.1 or newer) to |version|.

.. IMPORTANT::

   If you are on an earlier release of ICA-AtoM (older than 1.1), please
   upgrade to the latest ICA-AtoM release before following these instructions.
   Please see `Upgrading from ICA-AtoM 1.0.x <https://wiki.accesstomemory.org/Community/Community_resources/Documentation/Upgrading_from_ICA-AtoM_1.0.x>`_ on the AtoM wiki.

While we have tried to make this document usable by readers with a broad range
of technical knowledge, it may be too complex if you have no previous
experience with installing web applications or using the Linux command line.

Additionally, consider disabling your web site during the upgrade. Redirect
your users to a "Down for maintenance" page temporary using your web server
redirection capabilities, or you can put your site in read-only mode while
performing the upgrade.

.. _upgrading-requirements:

Check minimum requirements
==========================

Please refer to the :ref:`Minimum requirements <installation-requirements>`
page to make sure that your system meets all the requirements. This is
especially important if you are going to be upgrading from an older version
of ICA-AtoM (1.1 - 1.3.1 or later), as there will be some new dependencies
that we will install as part of the upgrade process.

.. _upgrading-release-notes:

Read the release notes
======================

This is the opportunity to find out what has been changed in the new release,
and if there are new features, enhancements and bug fixes that may be of
interest to you and your organization.

You can always find the full release notes on the AtoM wiki, here: 

* https://wiki.accesstomemory.org/Releases/Release_announcements

These often include additional details that can help you understand the
purpose of the release and how best to install it.

.. _upgrading-install-atom:

Make sure the dependencies are updated
======================================

Since the 2.5 version, AtoM uses Elasticsearch 5.x. If you're upgrading from an
earlier version, please make sure to upgrade your Elasticsearch installation.
You don't need to backup your index data as it will be recreated from the
database later in the upgrade.

You will also need to upgrade to Java 8 if the system is using a previous
version, as this is a requirement for Elasticsearch 5.x.

Since the 2.6 version, AtoM requires MySQL 8.0. Bellow we'll explain the steps
needed to move and upgrade the AtoM database to properly work with that version.

Install the latest version of AtoM
==================================

Follow the instructions available in our documentation on :ref:`installation`
- our most comprehensive installation notes are included in the
:ref:`Linux <installation-linux>` section, with additional information for
different operating systems and server configurations.

.. IMPORTANT::

   Remember to create a **new** database for this installation. When you run
   the web installer, it will erase your previous data if you are using the
   same database!

.. _upgrading-copy-data:

Copy your old data
==================

At this point, you should have an |version| functional installation using a
fresh database. Now we are going to copy the contents of the old uploads and
downloads directories, as well as the database:

1. `rsync <https://rsync.samba.org/>`__ is a robust directory sync solution
   that we can use to copy the contents of your old uploads directory to the
   new one, even when both directories are in the same machine. Using the
   command-line, enter the following command:

.. code-block:: bash

   $ rsync -av /var/www/icaatom_old/uploads/ /usr/share/nginx/atom/uploads/

Where ``icaatom_old`` is the name of your old installation. The path included
for the new installation in this example (``/usr/share/nginx/atom``) is the path
we recommend in our installation documentation.

Alternatively, you can just use `cp <https://en.wikipedia.org/wiki/Cp_%28Unix%29>`__:

.. code-block:: bash

   $ cp -r /var/www/icaatom_old/uploads/ /usr/share/nginx/atom/uploads/

We're going to want to do the same with the downloads directory as well - this is
where :ref:`reports <reports-printing>`, :ref:`cached xml <cache-xml-setting>`,
and downloads created by the job scheduler (such as
:ref:`clipboard exports <csv-export-clipboard>`) are kept.

.. code-block:: bash

   $ rsync -av /var/www/icaatom_old/downloads/ /usr/share/nginx/atom/downloads/

.. NOTE::

   You may choose to delete the contents of the ``jobs`` subdirectory after
   copying it over - this subdirectory in the downloads folder generally contains
   zip files of previous exports. As such, it is temporary data and does not need
   to be kept. We recommend leaving the ``jobs`` subdirectory itself in place,
   for future exports.

   If you want to delete the contents of this directory, you can use the
   following command:

   .. code-block:: bash

      rm -f /usr/share/nginx/atom/downloads/jobs/*

2. Dump the contents of your old database to a temporary file, change the
   database name if needed:

.. code-block:: bash

   $ mysqldump -u username -p atom > /tmp/atom_db.sql

3. If you're upgrading from 2.5.x or lower to 2.6.x or higher make sure your
   data is on `utf8mb3` or `utf8` (the default if you followed the installation
   documentation) and that you are using MySQL 8.0 as that's a requirement since
   AtoM 2.6. During the upgrade task, your data will be transformed to the
   `utf8mb4` charset and the `utf8mb4_0900_ai_ci` collation.

4. Re-create the database with the new charset and collation:

.. code-block:: bash

   $ mysql -u username -p -e "DROP DATABASE IF EXISTS atom;"
   $ mysql -u username -p -e "CREATE DATABASE atom CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"


5. Now, load the contents into the new database:

.. code-block:: bash

   $ mysql -u username -p atom < /tmp/atom_db.sql

.. _upgrading-run-upgrade-task:

Run the upgrade task
====================

This is perhaps the most critical step in the upgrade process. If you
encounter any errors, please consult our
`User Forum <https://groups.google.com/forum/#!forum/ica-atom-users>`__, or if
you don't find a solution, feel free to post a question there yourself. We will
also be trying to add to our `FAQ <https://wiki.accesstomemory.org/AtoM-FAQ>`__
as we receive feedback, to help users troubleshoot any upgrading issues
encountered.

First, change the current directory:

.. code-block:: bash

   $ cd /usr/share/nginx/atom

Now, run the upgrade-sql task:

.. NOTE::

   Depending on your database size this task may use a lot of memory, so we
   suggest running it without a memory limit.

.. code-block:: bash

   $ php -d memory_limit=-1 symfony tools:upgrade-sql

.. _upgrading-restore-configuration-changes:

Restore configuration changes
=============================

If you made any change to the old AtoM instace configuration files, like
setting a custom session timeout or a Google Analitycs API key, make sure to
bring those changes to the new instance if you want to keep them.

.. _upgrading-migrate-translations:

Migrate translations
====================

.. WARNING::

   At this time, we are troubleshooting challenges in translation migration
   process from older releases to |version|. Please see issue
   `#5505 <https://projects.artefactual.com/issues/5505>`__ for progress - we
   will update this documentation with instructions when the tranlsation
   migration process has been optimized and tested. Thank you in advance for
   your patience.

.. _upgrading-regen-digital-objects:

Regenerate the digital object reference and thumbnail images (optional)
=======================================================================

If you are upgrading from version 1.3.1 or earlier, you may want to regenerate
the :term:`digital object` :term:`reference <reference display copy>` and
:term:`thumbnail` images. The thumbnail size was smaller in 1.x, so those
images will often appear fuzzy in the redesigned digital object browse. A
directory naming convention has also been added to make the location of the
:term:`master digital object` more secure.

First, make sure you have not changed the directory (``/usr/share/nginx/atom``).

Now, run the regen-derivatives task:

.. code-block:: bash

   php symfony digitalobject:regen-derivatives

For more information on this task and its available options, see:
:ref:`cli-regenerate-derivatives`.

.. _upgrading-rebuild-index-cc:

Rebuild search index and clear cache
====================================

To make all these changes take effect, you will need to re-index the files
you've imported into your database, and clear the application cache.

First, rebuild the search index:

.. NOTE::

   Depending on your site content this task may use a lot of memory, so we
   suggest running it without memory limit.

.. code-block:: bash

   php -d memory_limit=-1 symfony search:populate

For more information and options on this task, see:
:ref:`maintenance-populate-search-index`.

Then, clear your `cache <http://symfony.com/legacy/doc/book/1_0/en/12-Caching>`__
to remove any out-of-date data from the application:

.. code-block:: bash

   $ php symfony cc

See :ref:`maintenance-clear-cache` for more detailed instructions.

.. _upgrading-restart-services:

Check the services configuration
================================

It's not usual, but sometimes we introduce changes in the related services
configuration, like PHP-FPM, MySQL or the AtoM worker, to improve the behaviour
and performance of the application. Check the installation documentation for
your operating system to find those changes.

Restart services
================

To ensure everything works correctly, you must restart your services after
upgrading, including PHP-FPM, Memcached (if you're using it as cache engine),
and the atom-workers managed by the job scheduler.

**To restart PHP-FPM**:

.. code-block:: bash

   sudo systemctl restart php7.4-fpm

**Optionally, to restart Memcached**:

.. code-block:: bash

   sudo systemctl restart memcached

**To restart the atom-workers**:

.. code-block:: bash

   sudo systemctl restart atom-worker  # Restarts the workers
   sudo systemctl status atom-worker   # Obtains current status

.. TIP::

   For further information on configuring the job scheduler, see:

   * :ref:`installation-asynchronous-jobs`


.. _upgrading-use-software:

Set site base URL
=================

One final step is to set your site's base URL. This URL is used in XML exports
to formulate absolute URLs referring to resources.

To set the site base URL:

.. |gears| image:: ../../images/gears.png
   :height: 18
   :width: 18

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select Settings.

2. Click on or scroll down to Site information. Enter your site's base URL
   into the site base URL field. If your domain is "townarchives.org", for
   example, your base URL would normally be "http://townarchives.org".

.. SEEALSO::

   * :ref:`Site information <site-information>`

.. _upgrading-custom-themes:

Upgrading with a custom theme plugin
====================================

If you have developed a custom theme plugin for your application (for more
information, see :ref:`customization-custom-theme`), you may need to perform
an additional step following an upgrade to ensure that all pages are styled
correctly.

Specifically, :ref:`job-details` may not appear properly styled in a custom
theme without an additional step. To ensure your Jobs pages properly inherit
the base Dominion theming, you will need to add a call to import the
``jobs.less`` CSS file to your theme plugin's ``main.less`` file. If you have
followed our recommendations for creating a theme plugin, then you should find
the ``main.less`` file for your plugin in
``plugins/yourThemePluginName/css/main.less``. Here is an example of where you
need to add a line in the ArchivesCanada theme plugin:

* https://github.com/artefactual/atom/blob/HEAD/plugins/arArchivesCanadaPlugin/css/main.less#L78

The line you will need to add is to import the base Jobs CSS, like so:

.. code-block:: bash

   @import "../../arDominionPlugin/css/less/jobs.less"

Additionally, if you intend to use AtoM's :ref:`privacy-notification` feature
with a custom theme, and you have customized the ``scaffolding.less`` file, you
may need to update it. Changes are identified `here <https://goo.gl/d6HVVf>`__.
If the theme has been customized, but the ``scaffolding.less`` file is being
referenced from the ``arDominionPlugin`` theme then no modifications are
required. You should also check if ``_header.php`` has been overridden in your
custom theme. If so, the change highlighted in
`this issue <https://github.com/artefactual/atom/commit/c65e84e809a5760c9814f8117a291bdb9a7491da#diff-e3a653026878cbc4745a5526934888d7R3>`__
needs to be added to your custom ``_header.php`` file.

Finally, if your custom theme includes modifications to the static page files
``homeSuccess.php`` and ``indexSuccess.php`` (for example, if your theme
includes a **custom homepage**), then you will also need to ensure that when
displaying the page content, ``render_value`` calls in these files are updated
to ``render_value_html``. 

Specifically, your modified files should be updated to match these lines: 

* Line 18 in `indexSuccess.php
  <https://github.com/artefactual/atom/blob/HEAD/apps/qubit/modules/staticpage/templates/indexSuccess.php#L18>`__
* Line 28 in `homeSuccess.php
  <https://github.com/artefactual/atom/blob/HEAD/apps/qubit/modules/staticpage/templates/homeSuccess.php#L28>`__

Recompiling after making modifications
--------------------------------------

After making any necessary updates to your custom theme, you should rebuild
the CSS for the custom themeplugin, using the ``make`` command. Here is an
example of rebuilding the CSS for the ArchivesCanada theme - you can swap in
the name of your plugin:

.. code-block:: bash

   make -C plugins/arArchivesCanadaPlugin

You will also want to clear the application cache, and restart PHP-FPM.

To clear the application cache:

.. code-block:: bash

   php symfony cc

For more information, see: :ref:`maintenance-clear-cache`.

To restart PHP-FPM:

.. code-block:: bash

   sudo systemctl restart php7.4-fpm

If you are using Memcached with AtoM, you may also want to restart it:

.. code-block:: bash

   sudo systemctl restart memcached

.. TIP::

   If you are still not seeing your changes take effect, remember to clear your
   web browser's cache as well!

Start using the software!
=========================

Congratulations! If you are reading this, it means that you have upgraded your
data successfully. Now please check that everything is working fine.

.. IMPORTANT::

   Before you put your site in production again, please take a look at your
   data and check that everything looks good and the data has imported
   correctly. We will continue to refine this documentation over time to make
   the upgrade process as smooth as possible, but we still think it is always
   important to double-check your work. Let us know if you encounter any
   problems!


:ref:`Back to top <installation-upgrading>`
