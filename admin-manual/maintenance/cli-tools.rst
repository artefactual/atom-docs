.. _maintenance-cli-tools:

==================
Command line tools
==================

There are a number of command line tools that can help you troubleshoot
various AtoM problems.

See below for :ref:`common-atom-queries`.

.. _cli-add-superuser:

Add a SuperUser (Admin) account
===============================

You can create a new :term:`administrator` account from the command-line
using the following command:

.. code:: bash

   php symfony tools:add-superuser --email="youremail@example.com"
   --password="MYSUPERPASSWORD" <username>

The username should not have any spaces in it.

.. _cli-normalize-taxonomy:

Taxonomy normalization
======================

A command-line tool will run through :term:`taxonomy` terms, consolidating
duplicate terms. If you've got two terms named "Vancouver" in the "Places"
taxonomy, for example, it will update term references to point to one of the
terms and will delete the others.

.. code:: bash

   php symfony taxonomy:normalize [--culture=<culture>] <taxonomy name>

The ``--culture`` option on this command-line tool is optional - the default
value, if none is entered is *en* (English). The value you
enter for <culture> should be the default culture of the terms you wish to
normalize - in most cases this will be the default culture you set up when
installing AtoM (though depending on your imports and multi-lingual use of the
application, this may not always be true) The value, if needed, should be
entered using two-letter ISO  639-1 language code values - for example,
"en" for English; "fr" for French,  "it" for Italian, etc.
See `Wikipedia <http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`__ for a
full list of ISO 639-1 language codes.

The taxonomy name value should be entered as it is seen in the :term:`user
interface` in **Manage > Taxonomies**. This value is case sensitive. If the
taxonomy name has spaces (i.e. if it is more than one word), you will want to
use quotation marks.

Below is an example of running this command on French terms in the Physical
object type taxonomy:

.. code:: bash

   php symfony taxonomy:normalize --culture="fr" --taxonomy-name="Physical
   object type"

You might also run this command on English terms in the Places taxonomy like
so:

.. code:: bash

   php symfony taxonomy:normalize Places

.. _cli-purge-data:

Purging all data
================

If you're working with an AtoM installation and want to, for whatever reason,
purge all data you can do this with a command-line tool:

.. code:: bash

   php symfony tools:purge

.. warning::

   This will delete ALL DATA in your AtoM instance! Be sure this is what you
   want to do before you proceed. You may want to back up your database first
   - see :ref:`below <cli-backup-db>`

The tool will prompt you for the title and description of your site as well as
for details needed to create a new admin user. If a ``.gitconfig`` file is present
in your home directory purge will use your name and email, from that file, to
provide default values.

.. _cli-backup-db:

Backing up the database
=======================

.. seealso::

   :ref:`maintenance-data-backup`

To back up a MySQL database, use the following command:

.. code:: bash

   mysqldump -u myusername -p mydbname > ./mybackupfile.sql

Be sure to use your username / password / database name. To restore
the database as it was during the dump command, you can suck it back in with
this command:


.. code:: bash

   mysql -u myusername -p mydbname < ./mybackupfile.sql

The database is now restored to the point when you dumped it.


User management
===============

If you've accidentally deleted your superuser (systems administrator) account
you can create a new superuser account in the command-line:

.. code:: bash

   ./symfony tools:add-superuser <username>


If you've forgotten any user account's password you can set a new password
with a command-line tool:

.. code:: bash

  ./symfony tools:reset-password <username> <password>


Bulk import of XML files
========================

While XML files can be imported individually via the
`user interface <https://www.accesstomemory.org/en/docs/2.0/user-manual/import-export/import-descriptions-terms>`_
it may be desireable to import multiple XML files, or large files
(typically larger than 1 MB) through the command line.

.. code:: bash

   ./symfony import:bulk /NAME-OF-FOLDER


.. _common-atom-queries:

Common AtoM database queries
----------------------------

Occasionally manually modifying the AtoM database is required, such as when
data gets corrupted from timeouts or other bugs. Here we will include a few
useful queries based on common actions users wish to perform on their
databases, which are not accommodated from the user interface. For all of
these, you will need to execute them from inside MySQL, using the username
and password you created during installation.

Assuming your username and pass are both set to "root", here is an example of
what you would type into the command-line:

.. code:: bash

   $ mysql -u root -p root

Once you've accessed the database, you can run SQL queries to manually modify
the AtoM database.

.. important::

   We strongly recommend that you back-up all of your data prior to
   manipulating the database! If possible, you should test the outcome on a
   cloned development instance of AtoM, rather than performing these actions
   on a production site without testing them in advance.


Update all draft archival descriptions to published
===================================================

Use this command to publish all draft descriptions in AtoM:

.. code:: bash

   UPDATE status SET status_id=160 WHERE type_id=158 AND object_id <> 1;


Update all draft archival descriptions from a particular repository to published
================================================================================

First, retrieve the id of the repository from the slug. In this example, the
repository is at http://myatomsite.com/atom/index.php/my-test-repo

.. code:: bash

   SELECT object_id FROM slug WHERE slug='my-test-repo';

Assuming in this example the id returned is 123, you would then execute the
following query to perform the publication status updates:

.. code:: bash

   UPDATE status
     SET status_id=160
     WHERE type_id=158 AND status_id=159
     AND object_id IN (
       SELECT id FROM information_object
       WHERE repository_id=123
     );

Don't forget to rebuild the search index!

.. code:: bash

   $ php symfony search:populate


Truncate slugs to maximum character length
==========================================

This command will truncate all :term:`slugs <slug>` to a specified maximum
character length. In the example below, the character length is 245.

.. code:: bash

   UPDATE slug SET slug = LEFT(slug, 245) WHERE LENGTH(slug) > 245;

:ref:`Back to the top <maintenance-cli-tools>`
