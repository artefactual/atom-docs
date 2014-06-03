.. _maintenance-data-backup:

===========
Data backup
===========

A data backup plan and schedule is critical for disaster recovery (e.g. hard
drive failure, data corruption). Make sure to backup all important data on a
regular basis. We also recommend backing up your data before making any
changes to AtoM or the underlying database, such as a software upgrade, etc.

On this page you will also find information on
:ref:`server migration <server-migration>`.

Database backup
===============

We recommend following the instructions linked below provided by Wordpress
for backing up AtoM data:

* `Backing up your database <http://codex.wordpress.org/Backing_Up_Your_Database>`_
* `Restoring from a backup <http://codex.wordpress.org/Backing_Up_Your_Database#Restoring_From_a_Backup>`_

You can follow these instructions using either the `mysql command line tool
<http://dev.mysql.com/doc/refman/5.0/en/mysql.html>`_ or `phpMyAdmin
<http://www.phpmyadmin.net/home_page/index.php>`_ .


Digital Objects backup
======================

If your database includes digital objects, you will also need to backup the
files in ``/uploads`` on a regular basis. See instructions in Server
migration, below.

Translations backup
===================

If you are actively translating the application interface, you will also need
to backup the translation files in the ``/apps/qubit/i18n`` directory.

.. _server-migration:

Server migration
----------------

When migrating your AtoM database from server to server, you'll need to copy
over a number of types of data.

MySQL database
==============

Make a dump of your Qubit database using ``mysqldump``:

.. code:: bash

   mysqldump -u <MySQL username> -p<MySQL password> -c <database name>


Search index data
=================

Create an archive of your search index data:

.. code:: bash

   cd /path/to/qubit
   cd data
   tar cvf search_data.tar index/
   gzip search_data.tar


Digital objects
===============

If you've imported digital objects into AtoM, you'll have to create an backup
of those as well.

.. code:: bash

   cd /path/to/qubit
   tar cvf uploads.tar uploads/
   gzip uploads.tar


:ref:`Back to the top <maintenance-data-backup>`
