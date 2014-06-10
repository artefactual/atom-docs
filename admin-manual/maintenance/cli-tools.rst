.. _maintenance-cli-tools:

==================
Command line tools
==================

There are a number of command line tools that can help you troubleshoot
various AtoM problems.

See below for :ref:`common-atom-queries`.

.. _cli-get-version:

Find out what version of AtoM you're running
============================================

You can always find out what version of AtoM you have installed via the
:term:`user interface` by navigating to **Admin > Settings > Global** - the
application version is the first thing listed on the Settings page. See:
:ref:`application-version` for more information.

However, if you'd like to check the application version from the
command-line, you can run the following command from AtoM's root folder:

.. code:: bash

   php symfony tools:get-version

.. _cli-add-superuser:

Add a SuperUser (Admin) account
===============================

You can create a new :term:`administrator` account from the command-line
using the following command:

.. code:: bash

   php symfony tools:add-superuser --email="youremail@example.com" --password="MYSUPERPASSWORD" <username>

The username should not have any spaces in it.

.. _cli-change-password:

Change a password
=================

If you need to change the password on a :term:`user account` in AtoM, you can
do so via the command-line.

.. code:: bash

   php symfony tools:reset-passwordsymfony tools:reset-password [--activate] username [password]

The :term:`username` is a required value, while the password is optional - if
no password is entered, AtoM will generate an 8-character temporary password
to be used for the user account. AtoM will return the new password in the
command-line.

.. warning::

   We strongly recommend that these auto-generated passwords ONLY be used
   temporarily! They are not strong passwords - users should generate longer
   passwords that include special characters. For more information, see:

   * `Wikipedia - Password strength <http://en.wikipedia.org/wiki/Password_strength>`__
   * `Wikipedia - Password cracking <http://en.wikipedia.org/wiki/Password_cracking>`__

If the user account is currently marked inactive in the system (see
:ref:`mark-user-inactive` for more information), you can also use the option
``--activate`` to mark that account as active again.

.. seealso::

   You can also manage user passwords through the :term:`user interface`. For
   more information, see:

   * :ref:`change-password`
   * :ref:`edit-user`

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

   php symfony taxonomy:normalize --culture="fr" "Physical object type"

You might also run this command on English terms in the Places taxonomy like
so:

.. code:: bash

   php symfony taxonomy:normalize Places

.. _cli-update-publication-status:

Update the publication status of a description
==============================================

In AtoM, an :term:`archival description` can have :term:`publication status`
of either "Draft" or "Published". The publication status of a record, which
can be set to either :term:`draft <draft record>` or
:term:`published <published record>`, determines whether or not the associated
description is visible to unauthenticated (i.e., not logged in) users, such as
:term:`researchers <researcher>`. It can be changed via the
:term:`user interface` in the :term:`administration area` of a description's
:term:`edit page` by a user with edit permissions.
See :ref:`publish-archival-description` for instructions on changing this via
the user interface.

If you would like to change the publication status of a record via the
command-line, you can use the following command-line tool, run from the root
directory of AtoM. You will need to know the :term:`slug` of the description
whose publication status you wish to update:

.. code:: bash

   php symfony tools:update-publication-status [-f|--force] [-i|--ignore-descendants] [-y|--no-confirm] [-r|--repo] publicationStatusId slug

Notes on use
------------

To update a record to Draft or Published, you must supply a
publicationStatusID - that is, a fixed ID value in AtoM that represents
either Draft or Published. Entering the terms "draft" or "published" will not
work. Instead use the following values for the publicationStatusID:

================== ========
Publication status statusID
================== ========
Draft              159
Published          160
================== ========

**Example use (no options)** - update a description with a slug of
"example-description" to published:

.. code:: bash

   php symfony tools:update-publication-status 160 example-description

**Task options:**

In general and as in the user interface, if a parent description is updated,
it will also update the publication status of its children. In some rare
cases however, there may be legacy records in the system with a publication
status of NULL. The command-line option ``--force``, or ``-f`` for short, will
force the update of the target information object and all of its
:term:`children <child record>`, including legacy records that might have a
publication status of NULL. We recommend using this option any time you want
a publication status update to affect children as well.

The ``--ignore-descendents``, or ``-i``, option can be used to leave the
publication status of all :term:`children <child record>` unchanged. This is
useful if you have a mixture of publication statuses at lower levels - some
draft, and some published.

Normally when the command is run, AtoM will ask for a y/N confirmation before
proceeding. The ``--no-confirm`` or ``-y`` option was introduced so that
developers who are interested in using this task in a larger scripted action
can override the confirmation step.

If the ``--repo`` or ``-r`` option is used, AtoM will update the publication
status for **ALL** descriptions belonging to the associated
:term:`repository` (e.g. :term:`archival institution`). To use this option,
you must supply the :term:`slug` of the repository. An information object
slug must still be present for the task to execute, but it will be ignored,
and ALL descriptions belonging to the repository will be updated instead.

**Example use** - updating all the descriptions associated with "My archival
institution" (slug = "my-archival-institution") to published. Note I must
still provide a description slug ("my-description") for it to execute:

.. code:: bash

   php symfony tools:update-publication-status --force --repo="my-archival-institution" 160 my-description

.. WARNING::

   This task is NOT designed for scalability. If you are planning on updating
   the publication status of thousands of records, we recommend using SQL to
   do so instead. We have included instructions on how to do so below - see:

   * :ref:`sql-update-publication-status`
   * :ref:`sql-update-publication-status-repo`


.. _cli-delete-description:

Delete a description
====================

You can delete a description from the command-line if you know the
description's :term:`slug`. A slug is a word or sequence of words which make
up a part of a URL that  identifies a page in AtoM. It is the part of the URL
located at the end of the URL path and often is indicative of the name or
title of the page (e.g.: in  *www.youratom.com/this-description*, the slug
is *this-description*). When a new information object is created in AtoM,
the slug for that page is generated based on the title, with spaces,
stopwords, and special characters stripped out.

If you know the slug of a description you'd like to delete, use the following
command to delete it from the command-line:

.. code:: bash

   php symfony tools:delete-description <slug>

.. _cli-delete-drafts:

Delete all draft descriptions
=============================

If you want to remove all :term:`draft <draft record>` information object (e.g.
:term:`archival description`) records from AtoM, you can use the following
command-line tool to delete all records with a :term:`publication status` of
"Draft":

.. code:: bash

   php symfony tools:delete-drafts

The task will ask you to confirm the operation:

.. code:: bash

   >> delete-drafts Deleting all information objects marked as draft...
   Are you SURE you want to do this (y/n)?

Enter "y" if you are certain you would like to delete all draft records.

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

.. _cli-bulk-import-xml:

Bulk import of XML files
========================

While XML files can be imported individually via the :term:`user interface`
(see: :ref:`import-descriptions-terms`), it may be desireable to import multiple
XML files, or large files (typically larger than 1 MB) through the command line.

.. code:: bash

   php symfony import:bulk /NAME-OF-FOLDER

.. _common-atom-queries:

============================
Common AtoM database queries
============================

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


.. _sql-update-publication-status:

Update all draft archival descriptions to published
===================================================

Use this command to publish all draft descriptions in AtoM:

.. code:: bash

   UPDATE status SET status_id=160 WHERE type_id=158 AND object_id <> 1;


.. _sql-update-publication-status-repo:

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

   php symfony search:populate

.. _sql-truncate-slugs:

Truncate slugs to maximum character length
==========================================

This command will truncate all :term:`slugs <slug>` to a specified maximum
character length. In the example below, the character length is 245.

.. code:: bash

   UPDATE slug SET slug = LEFT(slug, 245) WHERE LENGTH(slug) > 245;

:ref:`Back to the top <maintenance-cli-tools>`
