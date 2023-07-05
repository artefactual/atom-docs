.. _maintenance-data-backup:

===========
Data backup
===========

A data backup plan and schedule is critical for disaster recovery (e.g. hard
drive failure, data corruption). Make sure to backup all important data on a
regular basis. We also recommend backing up your data before making any
changes to AtoM or the underlying database, such as a software upgrade, etc.

.. SEEALSO::

   * :ref:`installation-upgrading`
   * :ref:`maintenance-troubleshooting`
   * :ref:`common-atom-queries`
   * :ref:`maintenance-cli-tools`

Database backup - overview of options
=====================================

.. _MySQL CLI tool: http://dev.mysql.com/doc/refman/8.0/en/mysql.html
.. _phpMyAdmin: https://www.phpmyadmin.net/
.. _MySQL Workbench: https://www.mysql.com/products/workbench/

We recommend reviewing the overview linked below provided by Wordpress
for backing up AtoM data, as both applications use MySQL:

* `Backing up your database <https://wordpress.org/support/article/backing-up-your-database/>`_
* `Restoring from a backup <https://wordpress.org/support/article/backing-up-your-database/#restoring-from-a-backup>`_

You can follow these instructions using either the `MySQL CLI tool`_, 
`phpMyAdmin`_, or `MySQL Workbench`_. 

For more detailed instructions on using the `MySQL CLI tool`_ to back
up AtoM's database, see: 

* :ref:`cli-access-mysql`
* :ref:`cli-backup-db`

.. SEEALSO:: 

   * :ref:`installation-upgrading`

.. _backup-uploads-downloads:

Uploads and Downloads
=====================

AtoM stores user uploads and downloads in two directories found just below
the root AtoM installation directory. 

**Uploads**

The ``uploads`` directory is used to store :term:`digital objects <digital object>`.

The uploads directory typically has one main subdirectory called ``r``. Inside 
this, the next subdirectories are based on the authorized form of name of 
:term:`repository` records in the AtoM instance. If users have themed the 
repositories, then a repository directory will contain a ``conf`` subdirectory, 
in which you'll find uploaded banners and logos. 

Lower subdirectories after this are used to house 
:term:`digital objects <digital object>`. For each uploaded or linked object, 
AtoM will add a SHA-256 hash of the object and then, to avoid collisions and 
aid in retrieval, it will create a specific set of subdirectories based on this 
hash - 3 subdirectories named after the first 3 characters in the hash, followed 
by a final nested subdirectory named after the remaining hash characters. 

.. NOTE:: 

   Older versions of AtoM used only 2 initial subdirectories before creating
   a final subdirectory with the remaining hash characters. 

The resulting structure looks like so when viewed in a file explorer: 

.. image:: images/uploads-directory.*
   :align: center
   :width: 70%
   :alt: An image of the uploads directory's organization

If your database includes :term:`digital objects <digital object>`, you will 
want backup the files in ``/uploads`` on a regular basis. 

An example of creating a zipped tarball of your uploads directory: 

.. code:: bash

   cd /usr/share/nginx/atom
   tar cvf uploads.tar uploads/
   gzip uploads.tar

**Downloads**

AtoM's ``downloads`` directory is where :ref:`reports <reports-printing>`, 
:ref:`cached xml <cache-xml-setting>`, generated and uploaded 
:ref:`finding aids <print-finding-aids>` and downloads created by the 
:ref:`job scheduler <maintenance-asynchronous-jobs>` (such as
:ref:`clipboard exports <csv-export-clipboard>`) are kept:

.. image:: images/downloads-directory.*
   :align: center
   :width: 70%
   :alt: An image of the downloads directory's organization

While previous exports might be considered transitory data not worth keeping, 
you may want to back up the rest of the contents of this directory. 

.. TIP::

   You may choose to delete the contents of the ``jobs`` subdirectory before 
   backing up the ``downloads`` directory - this subdirectory generally contains
   zip files of previous exports. As such, it is temporary data and may not need
   to be kept. We recommend leaving the ``jobs`` subdirectory itself in place,
   for future exports.

   If you want to delete the contents of this directory, you can use the
   following command:

   .. code-block:: bash

      rm -f /usr/share/nginx/atom/downloads/jobs/*

   Alternatively, AtoM has a command-line task that can help remove 
   unnecessary temporary data, including the content of the ``jobs`` 
   subdirectory. For more information, see: 

   * :ref:`tools-expire`

An example of creating a zipped tarball of your downloads directory: 

.. code:: bash

   cd /usr/share/nginx/atom
   tar cvf downloads.tar downloads/
   gzip downloads.tar

Translations backup
===================

Each public AtoM release includes new :term:`user interface` translations 
supplied by the global AtoM translation community. However, users with 
sufficient :term:`permissions <access privilege>` can also add local 
user interface translations directly via AtoM's user inteface. For more 
information, see: 

* :ref:`translate-interface`

If you are actively translating the application interface, you will also need
to backup the translation files in the ``/apps/qubit/i18n`` directory.

.. WARNING::

   At this time, we are troubleshooting challenges in the translation migration
   process from older releases to |version|. Please see issue
   `#5505 <https://projects.artefactual.com/issues/5505>`__ for progress - we
   will update this documentation with instructions when the tranlsation
   migration process has been optimized and tested. Thank you in advance for
   your patience.

:ref:`Back to the top <maintenance-data-backup>`
