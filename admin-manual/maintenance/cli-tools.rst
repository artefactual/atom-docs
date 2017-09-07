.. _maintenance-cli-tools:

==================
Command line tools
==================

There are a number of command line tools that can help you troubleshoot
various AtoM problems.

See below for :ref:`common-atom-queries`.

.. SEEALSO::

   * :ref:`maintenance-populate-search-index`
   * :ref:`maintenance-clear-cache`
   * :ref:`digital-object-load-task`
   * :ref:`cli-import-export`
   * :ref:`maintenance-webserver`

   We also have a slides and videos of many of our command-line tasks. See:

   * https://www.slideshare.net/accesstomemory/atoms-command-line-tasks-an-introduction
   * https://www.youtube.com/playlist?list=PLZiwlG5eSMeyeETe15EsEBSu5htPLK-wm

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

If you'd like to quickly create a user for demonstration, diagnostic purposes,
you can use the following command:

   php symfony tools:add-superuser --demo

This will create a superuser with username "demo", email "demo@example.com",
and password "demo".

.. _cli-promote-user-admin:

Promote a user to an administrator
==================================

If you'd like to promote a user account in AtoM to have full
:term:`administrator` access privileges via the command-line, you can use the
following task. You will need to know the user name of the account.

.. code:: bash

   php symfony tools:promote-user-to-admin <username>

If the user doesn't exist you'll see the following error:

.. code:: bash

   Unknown user.

If the user is already an administrator:

.. code:: bash

   The given user is already an administrator.

If the operation succeeds:

.. code:: bash

   The user <username> is now an administrator.

.. SEEALSO::

   For more information on user permissions, user roles, and how to manage them,
   see:

   * :ref:`user-roles`
   * :ref:`manage-user-accounts`
   * :ref:`edit-user-permissions`

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-change-password:

Change a password
=================

If you need to change the password on a :term:`user account` in AtoM, you can
do so via the command-line.

.. code:: bash

   php symfony tools:reset-password [--activate] username [password]

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

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-delete-user:

Delete a user account from the command-line
===========================================

AtoM provides a method to delete a user account via the :term:`user interface`, 
but you can also delete a user directly from the command-line interface. To do 
so, you will need to know the username of the user you wish to delete. The 
basic syntax for the command is:

.. code-block:: bash

   php symfony tools:delete-user <username>

By typing ``php symfony help tools:delete-user`` into the console, we can see 
the help text and options associated with this task:

.. image:: images/cli-delete-user.*
   :align: center
   :width: 90%
   :alt: An image of the options available in the delete-user command

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the task.

The command, when run, will normally prompt you for comfirmation before 
proceeding. However, if you wish to skip the confirmation step, you can use the 
``--force`` or ``-f`` option. 

Additionally, if the user has added notes (e.g. General notes; RAD special
notes such as Accompanying material notes; Archivists' notes; etc.) to an
:term:`archival description`, then by default, the user ID of that user is
associated with the note in the database. Because of this, AtoM will not let you 
delete a user without first removing the user association from the notes, and 
the task will be aborted without delting the user account:

.. image:: images/cli-delete-user-notes.*
   :align: center
   :width: 90%
   :alt: An image of the options available in the delete-user command

To remove the user association with the notes so the task can proceed, you can use
the ``--update-notes`` (or ``-n`` for short) option. When this is used, any notes
associated with the user in the database will be updated so the user field is 
``NULL``, and the user account can now be deleted. Any notes created by the user 
will remain in the system, unaffected by the deletion. 

.. IMPORTANT::

   The task will not allow you to delete a user account if it is the **only** 
   :term:`administrator` account in the system. If you wish to do so, you can use
   the other available tasks to create a new user and/or promote an existing user
   to the administrator group. See: 

   * :ref:`cli-add-superuser`
   * :ref:`cli-promote-user-admin`

Here is an example of running the task with both options (force and update-notes) 
used together, where the user being deleted has a username of ``demo``: 

.. code-block:: bash

   php symfony tools:delete-user -f -n demo

.. SEEALSO::

   * :ref:`Delete a user account via the user interface <delete-user>`

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-regenerate-derivatives:

Regenerating derivatives
========================

If you are upgrading to AtoM 2 from ICA-AtoM, the :term:`digital object`
derivatives (i.e. the :term:`reference display copy` and the
:term:`thumbnail` generated by AtoM when a :term:`master digital object` is
uploaded) are set to be a different default size (i.e. they are larger in
AtoM) - consequently, after an upgrade, derivatives from ICA-AtoM may appear
blurry or pixellated. Alternatively, if you have changed the
:ref:`digital-object-derivatives` settings, you might want to regenerate your
derivatives so that the new setting is used for multi-page content such as PDF
derivatives.

As well, sometimes the ``digitalobject:load`` task used for importing digital
objects to existing :term:`descriptions  <archival description>` (see:
:ref:`digital-object-load-task`) won't generate the :term:`thumbnail` and
reference images properly for digital objects that were loaded (e.g. due to a
crash or absence of convert installed, etc. - see under requirements,
:ref:`other-dependencies`). In this case, you can regenerate
these thumbsnail/reference images using the following command:

.. code:: bash

   php symfony digitalobject:regen-derivatives

By typing ``php symfony help digitalobject:regen-derivatives`` into the
command-line, you can see the options available for this task:

.. image:: images/cli-regen-derivs.*
   :align: center
   :width: 90%
   :alt: An image of the options available in the regen-derivatives command

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the task.

The ``--index`` option is used to enable the rebuilding of the search index as
part of the regeneration task. When running this task via the command-line
interface, indexing is **disabled** by default to allow the task to progress
more quickly - generally, we recommend manually clearing the cache and
rebuilding the search index following the use of this task - to do so,
from AtoM's root directory, run:

.. code-block:: bash

   php symfony cc && php symfony search:populate

However, if you would like to re-index as the derivative regeneration progresses,
the ``--index`` option can be used to enable this. For more information on 
populating the search index, see: :ref:`maintenance-populate-search-index`. 

The ``--slug`` option can be used to target specific derivatives associated with
a description, using the description's :term:`slug` as criteria. Any
:term:`digital object` attached or linked to the description whose slug is
provided as criteria will have its derivatives regenerated. Example use:

.. code:: bash

   php symfony digitalobject:regen-derivatives --slug="the-jane-doe-fonds"

The ``--type`` option (or ``-d`` for derivative type) can be used if you only 
want to regenerate one type of digital object derivative - either the 
:term:`reference display copy` used on the :term:`view page` of related archival 
descriptions, or the :term:`thumbnail` used in search and browse results. Supported
parameters are: 

* reference
* thumbnail

So, for example, if you only wanted to regenerate your thumbnails, you could 
execute the command like so: 

.. code:: bash

   php symfony digitalobject:regen-derivatives --type="thumbnail" 

The ``--force`` or ``-f`` option can be used to skip the warning normally
delivered by the task when the command is entered. Because the task will delete
ALL previous derivatives - including those manually altered by editing the
:term:`thumbnail` or :term:`reference display copy` of a digital object via the
user interface (see: :ref:`edit-digital-object` for more information) - the task
will normally ask for confirmation when invoked:

.. image:: images/cli-regen-derivs-warning.*
   :align: center
   :width: 70%
   :alt: An image of the CLI warning when invoking the regen-derivatives command

However, experienced developers and system administrators can skip having to
manually confirm the procedure by using the ``--force`` (or ``-f`` for short)
option as part of the command.

The ``--only-externals`` (or ``-o`` for short) option can be used if you would
only like to attempt to regenerate the local derivatives for linked digital
objects - that is, those that have been linked via an external URI, rather than
by uploading a :term:`master digital object`. For more information on linking
digital objects, see: :ref:`link-digital-object`.

The ``--skip-to`` option is useful when the task is interrupted, such as when
an error is encountered mid-process that ends the task. As the task
progresses during normal execution, it will output information about the
current digital object filename it is working on. If the task interrupts
(for example, trying to fetch a large external digital object, the task might
time out), a system administrator can use this option to resume the task
where it interrupts. Example:

.. code-block:: bash

   $ php symfony digitalobject:regen-derivatives

   Regenerating derivatives for file1.jpg...
   Regenerating derivatives for file2.jpg...
   Regenerating derivatives for file3.jpg...

   <timeout error occurs>

   $ php symfony digitalobject:regen-derivatives --skip-to='file3.jpg'

   Regenerating derivatives for file3.jpg...
   <task continues where it left off>

The ``--json`` or ``-j`` option is for advanced users who would like to target
only a specific subset of digital objects for regeneration. With this option, a
user can supply the path to a JSON file that lists the internal
digital_object ID's associated with the digital objects targeted and stored in
AtoM's database. These digital_object ID's will first need to be determined
by crafting an SQL query designed to meet your specific criteria. Help crafting
these queries is not covered here (though you can see below,
:ref:`common-atom-queries`, for a BASIC introduction to SQL queries in AtoM) - in
general, we only recommend this task be used by experienced administators.

Once you have determined the IDs of the digital objects you would like to target
with the task, you can place them in square brackets in a JSON file, separated by
commas, like so:

.. code:: bash

   [372, 366, 423, 117]

*(etc)*

The criteria for the ``--json`` option then becomes the path to your JSON file:

.. code:: bash

   php symfony digitalobject:regen-derivatives --json="path/to/my.json"

.. WARNING::

   When running the ``regen-derivatives`` task, **all** of your current derivatives
   for the targeted digital objects will be deleted - meaning ALL of them if you
   provide no criteria such as a slug or a JSON file. They will be replaced
   with new derivatives after the task has finished running. If you have
   manually changed the :term:`thumbnail` or :term:`reference display copy`
   of a digital object via the user interface (see:
   :ref:`edit-digital-object`), these two will be replaced with digital
   object derivatives created from the :term:`master digital object`.

Finally, the ``--no-overwrite`` or ``-n`` option can be used if you only want to 
generate derivatives where they are currently missing. All existing derivatives 
will be left as-is in AtoM. When this option is used, no confirmation prompt is 
given: the task will begin generating missing derivatives as soon as you enter 
it in the console. 

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-re-index-pdf:

Re-indexing PDF text
====================

.. code:: bash

   php symfony digitalobject:extract-text

In rare situations you may want to to re-index all PDFs to make their text
searchable in AtoM without having to re-import them completely. This task
will go through each existing PDF imported into AtoM and re-index their
contents for searches.

For linked :term:`digital objects <digital object>` (e.g. PDFs that are linked
from a publicly accessible URI, instead of uploaded locally - see for example:
:ref:`link-digital-object`), this task will re-fetch a version of the external
PDF and store it in a temporary file, re-index the contents, and then purge the
local :term:`master <master digital object>` after the indexing is complete.

.. TIP::

      .. image:: images/app-yml-settings.*
         :align: right
         :width: 20%
         :alt: An image of the app.yml file in AtoM

   Large PDFs may cause 500 errors if you do not first adjust the download
   timeout limit. You can do this by changing the value in the ``app.yml`` file
   located in ``/config/app.yml``. The default timeout value in AtoM is 10s. You
   should also clear the cache after making changes to the ``app.yml`` file:

   .. code:: bash

      php symfony cc


.. _cli-rebuild-nested-set:

Rebuild the nested set
======================

AtoM generally uses a relational database to store its data (we recommend
MySQL). However, relational databases, which are comprised of flat tables,
are not particularly suited to handling hierarchical data. As developer
`Mike Hillyer <http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/>`__
notes, "Hierarchical data has a parent-child relationship that is not naturally
represented in a relational database table." One method of addressing this is
to employ a "Nested set model" (`Wikipedia <http://en.wikipedia.org/wiki/Nested_set_model>`__).
AtoM makes use of a nested set to manage hierarchical relationships, such as
between parent and child :term:`terms <term>` and
:term:`descriptions <archival description>`.

Sometimes, during operations that involve updates to large hierarchies, the
nested set can become corrupted - especially if the server times out during an
operation that reaches the execution limit settings. The following task will
rebuild all nested sets in AtoM:

.. code:: bash

   php symfony propel:build-nested-set

.. _cli-generate-slugs:

Generate slugs
==============

In some cases, AtoM may time out in the middle of an operation that involves
the creation of new records - for example, if a user attempts to import a
very large CSV file through the :term:`user interface` (rather than the
command-line - see: :ref:`csv-import`). In such cases, it is possible that
AtoM has died after creating an :term:`information object`, but before having
a chance to create a :term:`slug` for the record. This can cause unexpected
errors in the application - most notably, 500 errors when trying to access the
records missing slugs through the application interface.

If you want to generate slugs for records in AtoM without them, you can use
the following command:

.. code:: bash

   php symfony propel:generate-slugs

This task will work for the following entities:

* information objects (e.g. :term:`archival descriptions <archival description>`)
* actors (e.g. :term:`authority records <authority record>`)
* :term:`terms <term>`
* :term:`taxonomies <taxonomy>`
* physical objects (e.g. :term:`storage <physical storage>` locations, etc)
* :term:`events <event>` (e.g. creation events, etc - usually the relationship
  between actors and information objects)
* :term:`accession records <accession record>`
* :term:`deaccession records <deaccession record>`
* :term:`digital objects <digital object>`
* :term:`functions <function>`
* :term:`rights records <rights record>`
* :term:`static pages <static page>`
* relations (e.g. relations between objects - i.e. relating two descriptions,
  relating an information object to a digital object, relating an information
  object to a physical storage location, relating two actors, etc)

If an error has left other areas in AtoM without slugs (for example, a donor
record, etc), this task will **not** resolve the issue - you will likely have
to manually insert a slug into the database for that entity.

For information objects, the generate slugs task will respect the global
settings for the source from which description permalinks are created. These
settings can be controlled by an :term:`administrator` via the user interface
- for more information, see: :ref:`description-permalinks`.

Note that by default, existing slugs will **not** be replaced. If you want to
generate new slugs for existing objects, you will need to first delete the
existing slugs from the database. This can be useful for records in which a
random slug has been automatically assigned, because the default user data
used to generate the slug has not been provided (see
:ref:`below <slugs-in-atom>` for more information on how slugs are generated in
AtoM).

However, if you would like to replace **all** existing slugs with newly
generated slugs, you can use the ``--delete`` option, like so:

.. code:: bash

   php symfony propel:generate-slugs --delete

.. IMPORTANT::

   This will replace all custom slugs you may have created with the
   Rename module! For more information on the Rename module, see:
   :ref:`rename-title-slug`

Slugs can also be manually deleted via SQL queries. For further information on
deleting slugs from AtoM's database via SQL, see below in the section on
:ref:`common-atom-queries` - particularly, :ref:`sql-delete-slugs`.

.. SEEALSO::

   * :ref:`sql-truncate-slugs`

.. _slugs-in-atom:

Notes on slugs in AtoM
----------------------

A :term:`slug` is a word or sequence of words which make up the last part of a
URL in AtoM. It is the part of the URL that uniquely identifies the resource
and often is indicative of the name or title of the page (e.g.: in
*www.yourwebpage.com/about*, the slug is *about*). The slug is meant to
provide a unique, human-readable, permanent link to a resource.

In AtoM, all pages based on user data (such as :term:`archival descriptions
<archival description>`, :term:`archival institutions <archival institution>`,
:term:`authority records <authority record>`, :term:`terms <term>`, etc.) are
automatically assigned a slug based on the information entered into the
resource:

==================== =============================
Entity type          Slug derived from
==================== =============================
Archival description Title or Reference code
Authority record     Authorized form of name
Accession            Identifier (accession number)
Users, Groups        Automatically generated
Other entities       Name
==================== =============================

Generated slugs will only allow digits, letters, and dashes. Sequences of
unaccepted characters (e.g. accented or special characters, etc.) are replaced
with valid characters such as English alphabet equivalents or dashes.
This conforms to general practice around slug creation - for example,
it is "common practice to make the slug all lowercase, accented characters are
usually replaced by letters from the English alphabet, punctuation marks are
generally removed, and long page titles should also be truncated to keep the
final URL to a reasonable length"
(`Wikipedia <http://en.wikipedia.org/wiki/Clean_URL#Slug>`__). In AtoM, slugs
are truncated to a maximum of 250 characters.

If a slug is already in use, AtoM will append a dash and an incremental number
(a numeric suffix) to the new slug - for example, if the slug "*correspondence*"
is already in use, the next record with a title of "Correspondence" will
receive the slug "*correspondence-2*".

If a record is created without data in the :term:`field` from which the slug
is normally derived (e.g. an :term:`archival description` created without a
title), AtoM will assign it a randomly generated alpha-numeric slug. Once
assigned, slugs for archival descriptions can be changed through the
:term:`user interface`. Slugs for other entity types cannot be changed through
the user interface - either the record must be deleted and a new record created,
or you must manipulate the database directly.

.. TIP::

   Users can also edit the slug associated with an :term:`archival description`
   via the :term:`user interface`. For more information, see:

   * :ref:`rename-title-slug`

Finally, :term:`static pages <static page>`, or permanent links, include a
slug :term:`field` option, but only slugs for new static pages can be edited
by users; the slugs for the default :term:`Home page` and :term:`About page`
in AtoM **cannot** be edited. New static page slugs can either be customized
by users or automatically generated by AtoM if the field is left blank; AtoM
will automatically generate a slug that is based on the "Title" you have
indicated for the new static page. For more information on static pages in
AtoM, see: :ref:`manage-static-pages`.

.. NOTE::

   Slugs such as "search" and "browse" are reserved for use in AtoM by the
   Search and Browse modules - if you create a static page, or even a
   description, with the slug "search", it may interfere with your search
   results, redirecting to this new page instead of display your results! A
   simple workaround would be to iterate the slug (e.g. "search-1") or alter
   it in some meaningful way (e.g. for a static page with tips on searching,
   changing the slug to "search-help").

.. TIP::

   For developers interested in seeing the code where slugs are handled in
   AtoM, see ``/lib/model/QubitSlug.php``

.. _cli-normalize-taxonomy:

Taxonomy normalization
======================

A command-line tool will run through :term:`taxonomy` terms, consolidating
duplicate terms. If you've got two terms named "Vancouver" in the "Places"
taxonomy, for example, it will update term references to point to one of the
terms and will delete the others.

.. code:: bash

   php symfony taxonomy:normalize [--culture=<culture>] <taxonomy name>

**Task options**

.. image:: images/cli-taxonomy-normalize.*
   :align: center
   :width: 70%
   :alt: An image of the CLI options when invoking the taxonomy:normalize command

By entering ``php symfony help taxonomy:normalize`` into the command-line, you
see the options and descriptions available on this tool, as pictured above.

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

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

   php symfony tools:update-publication-status [--application[="..."]] [--env="..."] [--connection="..."] [-f|--force] [-i|--ignore-descendants] [-y|--no-confirm] [-r|--repo] publicationStatus slug

Notes on use
------------

AtoM requires two parameters to be able to execute the task: the publication
status you wish to use, and the :term:`slug` of a resource on which to perform
the task. For the publication status, you can use any term you have added to the
Publication status :term:`taxonomy` in AtoM - the default terms are Draft, and
Published. You **cannot** create a new publication status :term:`term` by using
this task - the term must already exist in AtoM, or the task will fail.

For more information on slugs in AtoM, see above, :ref:`slugs-in-atom`. Note that
even when updating all the descriptions associated with a :term:`archival institution` using
the ``--repository`` option described below, you **still must provide a slug**
as a parameter for the task to execute. It can be any slug when using the
``--repository`` option.

**Example use (no options)** - update a description with a slug of
"example-description" to published:

.. code:: bash

   php symfony tools:update-publication-status published example-description

**Task options:**

.. image:: images/cli-pub-status.*
   :align: center
   :width: 70%
   :alt: The CLI options when invoking the publication status command

By entering ``php symfony help tools:update-publication-status`` into the
command-line, you see the options available on this tool, as pictured above.

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

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

   php symfony tools:update-publication-status --force --repo="my-archival-institution" published my-description

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

AtoM will ask you for confirmation before you proceed giving you a count of
descriptions affected (e.g. the target description and its descendants):

.. image:: images/cli-delete-description.*
   :align: center
   :width: 70%
   :alt: The CLI warning when deleting a description

.. TIP::

   If you would like to proceed without having to confirm your actions, you
   can use the ``--no-confirmation`` option - or its shorthand, ``-B``, like
   so:

   .. code:: bash

      php symfony tools:delete-description -B <slug>

You can also delete all descriptions that are associated with a particular 
:term:`repository`, by using the ``--repository`` option, and supplying the 
:term:`slug` of the linked repository instead of the slug of a description. For
example, if your repository is called "Example Archives," with a slug in AtoM of
``example-archives``, then you could delete **all** :term:`archival description` 
records linked to this repository with the following command: 

.. code-block:: bash

   php symfony tools:delete-description --repository example-archives

:ref:`Back to top <maintenance-cli-tools>`

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

:ref:`Back to top <maintenance-cli-tools>`

.. _cache-xml-cli:

Generate and cache XML for all archival descriptions
====================================================

AtoM includes several options for exporting :term:`archival description`
metadata in XML format - for more information, see: :ref:`export-xml`.

Additionally, users can enable the OAI plugin to allow harvesters to collect
archival description metadata via the OAI-PMH protocol, in EAD 2002 or Dublin
Core XML - for more information, see: :ref:`oai-pmh`.

Normally, when exporting or exposing archival description metadata, the XML is
generated synchronously - that is, on request via the web browser. However,
many web browsers have a built-in timeout limit of approximately 1 minute, to
prevent long-running tasks and requests from exhausting system resources.
Because of this, attempts to export or harvest EAD 2002 XML for large
descriptive hierarchies can fail, as the browser times out before the document
can be fully generated and served to the end user.

To avoid this, AtoM includes a setting that allows users to pre-generate
XML exports via AtoM's job scheduler, and then cache them in the ``downloads``
directory. This way, when users attempt to download large XML files, they can
be served directly, instead of having to generate before the browser timeout
limit is reached. For more information, see: :ref:`cache-xml-setting`.

The XML generated will be cached in AtoM's ``downloads`` directory - 2
subdirectories named ``ead`` and ``dc`` will automatically be created, and the
XML will be stored by type in these two subdirectories.

.. image:: images/downloads-dir.*
   :align: center
   :width: 40%
   :alt: An image of the Downloads directory structure as seen in a file
         explorer

When users attempt to download XML from the :term:`view page` of an archival
description, AtoM will check if there is a cached copy of the requested XML
and if so, it will serve it. If there is no cached version available, then
AtoM will fall back to the default behavior of generating the XML on request.

In an OAI-PMH request, if a cached version of the EAD 2002 XML is available,
AtoM will serve it in response to ``oai_ead`` requests - if there is **not** a
cached version, then AtoM will return a "Metadata format unavailable" reponse.
In contrast, if no cached DC XML exists, the OAI Repository module will
generate DC XML on the fly to respond to the request.  For further information,
see: :ref:`oai-pmh`.

By default, cached XML files are generated for public users, meaning that
:term:`draft <draft record>` descriptions are **not** included in the XML.

When engaged, this setting will **not** retroactively generate and cache XML
for existing descriptions. Howeveer, this command-line task can be used to
generate and cache EAD 2002 and DC XML for all existing descriptions.

The basic syntax for the task is:

.. code-block:: bash

    php symfony cache:xml-representations

By running ``php symfony help cache:xml-representations`` we can see the
command-line's help output for the task:

.. image:: images/cli-cache-xml.*
   :align: center
   :width: 85%
   :alt: An image of the command-line's help text for the Cache XML task

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for Symfony to be
able to execute the task.

As the task progresses, the console will output the related ID of the current
:term:`information object`, followed by the number of the current information
object (aka :term:`archival description`) and the total count:

.. image:: images/cli-cache-xml-progress.*
   :align: center
   :width: 60%
   :alt: An example of the console's output when running the cache xml task

In some cases with very large hierarchies (for example, an
:term:`archival unit` with thousands or tens of thousands of descendants),
available system memory may be exhausted during this process, and the task may
crash before all XML can be generated. In that case, the ``--skip`` option can
be useful for restarting the task exactly where it left off.

The ``--skip`` option accepts as a parameter the number of information objects
to be skipped - so for example, if the task crashed while trying to generate
the XML for infomation object 2445 of 5528, then you could restart it on
information object 2445 again by skipping the first 2444, like so:

.. code-block:: bash

   php symfony cache:xml-representations --skip="2444"

.. NOTE::

   By default, cached XML files are generated for public users, meaning that
   :term:`draft <draft record>` descriptions are **not** included in the XML,
   and cached XML is not generated for any unpublished archival units.

The XML generated will be cached in AtoM's ``downloads`` directory - 2
subdirectories named ``ead`` and ``dc`` will automatically be created, and the
XML will be stored by type in these two subdirectories.

.. SEEALSO::

   * :ref:`cache-xml-setting`
   * :ref:`oai-pmh`
   * :ref:`export-xml`

:ref:`Back to top <maintenance-cli-tools>`


.. _cli-scrub-html:

Remove HTML content from archival description fields
====================================================

As of the 2.2 release, HTML added to atom's descriptive templates will be
automatically escaped for security purposes. This means that if you were
previously using HTML to style content added to an edit template, it may no
longer display correctly:

.. image:: images/escaped-content.*
   :align: center
   :width: 85%
   :alt: An image of how escaped HTML content will appear when saved in AtoM

To assist legacy users who have added HTML to records in AtoM, a command-line
task to strip the HTML from descriptions and other entities has been added. At
present, it will only remove HTML from the following :term:`entity` types:

* :term:`archival description`
* :term:`authority record`
* Notes (however, General notes are **not** affected currently)
* :term:`archival institution` (aka :term:`repository` records)
* :term:`rights record`

Other entities in AtoM (such as accessions, user and goup records, terms, etc.)
will not be affected.

.. IMPORTANT::

   There are also some fields in the information object (e.g.
   :term:`archival description`) that **do not** currently support this task -
   meaning HTML will **not** be removed from these fields by running this CLI
   task:

   * :ref:`RAD <rad-template>` title note (e.g. Source of title proper,
     Attributions and conjectures, etc)
   * General notes fields in any template

**To run the HTML scrub task:**

From the root directory of your AtoM installation, run the following command:

.. code-block:: bash

   php symfony i18n:remove-html-tags

The command-line interface will output information on how many fields within
each :term:`information object` were scrubbed, as well as a summary when the
task terminates:

.. image:: images/scrub-html-changes.*
   :align: center
   :width: 85%
   :alt: An image of the command-line output after executing the remove html
         tags task

The task will have the following effects on HTML elements:

* Links, including email ``mailto:`` links, will be replaced with AtoM's
  custom formatting for links - for more information, see:
  :ref:`add-custom-links`. This means that after being run, links will now
  appear in AtoM's view pages as they were intended to when the HTML was
  added.
* Styling elements, such as ``<em>``, ``<b>``, ``<strong>``, ``<i>``, etc.
  will be removed with no substitutions (the text they wrap will be
  preserved).
* List elements (``<li>``) will be replaced with an asterix and a space -
  AtoM's edit templates already include a helper that will transform asterixes
  used this way into bullets. So, ``<ul><li>This item</li></ul>`` will become
  ``* This item``
* Definition list elements such as ``<dd>``, ``<dt>``, etc (which were briefly
  used in earlier versions of AtoM to structure physical description EAD
  import data) will be removed (the text they wrap will be preserved).
* Paragraph tags (``<p>``) will be removed, and substituted with 2 line breaks
  to preserve spacing (i.e. ``/n/n``)
* HTML escape characters (for example, ``&quot;``, ``&amp;``, ``&lt;``) will
  will be replaced with the character they represent (e.g. ``"``, ``&``,
  ``<``)

.. image:: images/scrub-html-example.*
   :align: center
   :width: 85%
   :alt: An example of HTML in a form, before and after running the script

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-count-terms:

Export a list of terms linked to one or more descriptions from a taxonomy
=========================================================================

This task is useful when performing an administrative review of your AtoM
installation. If you have imported a large controlled vocabulary to one of
AtoM's taxonomies (such as :term:`subject`, :term:`place`, or genre access
point terms), you might want to be able to determine which terms are actually
in use (i.e. linked to descriptions) versus those which are currently not
linked to any descriptions.

This task, when run against a specific :term:`taxonomy`, will generate a CSV
with a list of terms that are linked to one or more archival descriptions
(information objects). The CSV includes a count of how many times a specific
term is used (e.g. a count of direct links to information objects - inherited
links from a hierarchy are *not* counted). It does not list terms that are in
the taxonomy but currently not used.

The CSV output for the task includes the following columns:

* **id**: the internal object ID of the term
* **parentId**: the object ID of the the parent to which the term is linked.

  * Even in a taxonomy that is not organized hierarchically, terms are linked
    to a root term object. If the terms are organized heirarchically, then the
    ``parentID`` value will be the objectID of the parent term.

* **taxonomy**: the ID of the taxonomy to which the terms belong. In AtoM,
  typically the Subjects taxonomy ID is 35; Places is 42, etc.
* **name**: the authorized/preferred form of name for the term in the
   current culture
* **sourceCulture**: the culture in which the term was created - generally a 2
  letter ISO language code value (e.g. en, fr, es, etc)
* **culture**: Generally the value of the default installation culture of your
  AtoM instance, returned as a 2 letter ISO language code value (e.g. en, fr,
  es, etc)
* **use_count**: a simple count of the number of times the term has been
  directly linked to an information object (archival description). Inherited
  relationships are not counted - e.g. in a hierarchy of
  ``Canada > Ontario > Toronto``, when Toronto is linked to an information
  object, Canada and Ontario do not also receive a count.

To see the help for the task:

.. code-block:: bash

   php symfony help csv:export-term-usage

.. image:: images/cli-count-terms-help.*
   :align: center
   :width: 85%
   :alt: The output of running the help options for the csv:export-term-usage
         task

You must specify a target destination for the export as a file path, including
the name of the csv, and ending in the ``.csv`` extension, for the command to
work as expected. See the examples below.

**Options**

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the export.

The ``--items-until-update`` option accepts a whole integer value, and will
indicate the progress of the task every n items by printing a dot in the
console.

you can use either the ``--taxonomy-name`` or the ``--taxonomy-id`` options to
tell the command which taxonomy terms you wish to count in the resulting CSV.
By default, the ``--taxonomy-name`` option expects the English name of the
target taxonomy; however, you can use the ``--taxonomy-name-culture`` option
to give the name of a taxonomy in another culture - this option expects a
2-letter ISO language code (e.g. "en", "fr", "es", etc) as its value.

The ``--taxonomy-id`` option expects as its value the internal ID of the
target taxonomy. Below is a list of some of the more commonly used taxonomies
in AtoM, and their IDs. This list is NOT comprehensive - to see the full list,
navigate to ``/lib/model/QubitTaxonomy.php``, or see a full list in AtoM's
code on GitHub :at-gh:`here <lib/model/QubitTaxonomy.php#L20>`.

=================================== ===
Taxonomy name                       ID
=================================== ===
 Places                             42
 Subjects                           35
 Genres                             78
 Levels of description              34
=================================== ===

**Examples**

Sample command to return terms currently used in the Subjects taxonomy, using
the ``taxonomy-name`` option:

.. code-block:: bash

   php symfony csv:export-term-usage --taxonomy-name="Subjects" /path/to/my-subjects.csv

The same command, but using the French name of the taxonomy:

.. code-block:: bash

   php symfony csv:export-term-usage --taxonomy-name-culture="fr" --taxonomy-name="Sujets" /path/to/mes-sujets.csv

An example of using the ``taxonomy-id`` option to specify the Places taxonomy:

.. code-block:: bash

   php symfony csv:export-term-usage --taxonomy-id="42" /path/to/my-places.csv

Here is the sample CSV output of a command run against the Places taxonomy in
an English installation:

.. image:: images/cli-count-terms-example.*
   :align: center
   :width: 85%
   :alt: A sample CSV output from the Places taxonomy

:ref:`Back to top <maintenance-cli-tools>`

.. _repository-lat-long:

Auto-populate repository latitude and longitude values
======================================================

AtoM includes the ability for users to add dynamic Google maps to the
:term:`view page` of a repository. To do so, a user must first have a Google
`API Key <https://developers.google.com/maps/documentation/javascript/get-api-key>`__,
and the Google Maps Javascript API key setting in **Admin > Settings** must be
populated - see:

* :ref:`maps-api-key`

Once the key is added, then any time a user adds valid latitude and longitude
values to the Contact area of an :term:`archival institution`, AtoM will add a
Dynamic Google map to the top of the repository's :term:`view page`. See:

* :ref:`add-map`

However, you can also attempt to automatically populate existing latitude and
longitude fields, based on previously entered Contact area address data (e.g.
street address, city, region, postal or zip code, country, etc).

To do so, run the following command:

.. code-block:: bash

   php symfony tools:repository-lat-lng

AtoM will begin reviewing all available :term:`repository` contact information,
and where possible, it will populate the latitude and longitude fields based
on the address data. If any issues are encountered (such as incorrect or
insufficient contact information for a lookup), the console will print an
error message and move on to the next repository for lookup.

.. image:: images/cli-latlong-output.*
   :align: center
   :width: 75%
   :alt: A sample output from the console as the lat-long task runs

By default, the task will **not** overwrite existing latitude and longitude
information. However, if you would like to replace existing data with updated
values based on the task's lookup, you can use the ``--overwrite`` option like
so:

.. code-block:: bash

   php symfony tools:repository-lat-lng --overwrite

You may want to clear the application cache and repopulate the search index
after. See:

* :ref:`maintenance-clear-cache`
* :ref:`maintenance-populate-search-index`

.. SEEALSO::

   * :ref:`digital-object-map`
   * :ref:`add-map`
   * :ref:`maps-api-key`

:ref:`Back to top <maintenance-cli-tools>`

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

If you are a developer or system administrator using this task for testing purposes,
there is also a ``--demo`` option available:

.. code:: bash

   php symfony tools:purge --demo

.. IMPORTANT::

   Using the ``--demo`` option with the purge task will have the following
   consequences:

   * The task will NOT ask for confirmation before purging all data (the warning is skipped)
   * It will repopulate the database with a default demo user

     * Username: demo
     * Email: demo@example.com
     * Pass: demo

   * It will add a site title to the installation - "Demo site".
   * It will **NOT** clear the application cache. We recommend clearing the
     cache and restarting all services after running this task - e.g.

   .. code-block:: bash

      php symfony cc
      sudo service php5-fpm restart
      sudo /etc/init.d/memcached restart

   See :ref:`manage-user-accounts` for information on how to edit or delete the
   demo user account via the :term:`user interface`. See: :ref:`site-information`
   for instructions on how to edit the site title via the user interface. See
   :ref:`maintenance-clear-cache` for more information on clearing the cache.

:ref:`Back to top <maintenance-cli-tools>`

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

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-sitemap:

Generate an XML sitemap for search engine optimization
======================================================

This task will allow a system administrator with to generate an XML sitemap of
your AtoM instance, to enhance search engine optimization. It uses the sitemap
protocol, as described on sitemaps.org. From the site's home page:

    *Sitemaps are an easy way for webmasters to inform search engines about
    pages on their sites that are available for crawling. In its simplest
    form, a Sitemap is an XML file that lists URLs for a site along with
    additional metadata about each URL (when it was last updated, how often
    it usually changes, and how important it is, relative to other URLs in
    the site) so that search engines can more intelligently crawl the site.*

    *Web crawlers usually discover pages from links within the site and from
    other sites. Sitemaps supplement this data to allow crawlers that support
    Sitemaps to pick up all URLs in the Sitemap and learn about those URLs
    using the associated metadata. Using the Sitemap protocol does not
    guarantee that web pages are included in search engines, but provides
    hints for web crawlers to do a better job of crawling your site.*

    source: http://www.sitemaps.org/

This XML sitemap can then be passed to search index providers such as Google,
for better indexing of your AtoM instance. Multiple sitemaps can be generated
by the task to account for Google's limits on size and/or number of nodes. If
the sitemap file has more than 50,000 nodes, it will automatically be broken
into multiple sitemaps.

More information:

* On the protocol: http://www.sitemaps.org/protocol.html
* Google support: https://support.google.com/webmasters/answer/183668?hl=en&ref_topic=6080646&rd=1

The task will draw the default weighting for each :term:`level of description`
used in :term:`archival descriptions <archival description>` from a
configuration file found in ``config/sitemap.yml``. Here are the default
weightings (or priorities) for each level included:

====================  ==============
Level of description  Default weight
====================  ==============
Collection             0.9
Fonds                  0.9
Subfonds               0.8
Series                 0.7
Subseries              0.6
File                   0.5
Item                   0.4
====================  ==============

If a user adds a custom level of description to the Level of description
:term:`taxonomy` (see: :ref:`terms`), or if you wish to change the default
priorities, you can edit the ``sitemap.yml`` file found in the config directory.
see: :ref:`config-sitemap-yml` for more information.

.. IMPORTANT::

   There is currently no way to add custom weights for other
   :term:`entities <entity>` in AtoM such as :term:`authority records
   <authority record>`, :term:`archival institutions <archival institution>`,
   :term:`functions <function>`, or :term:`static pages <static page>`, etc.

   The **default weighting** for new :term:`archival description` levels of
   description added, without a custom entry into the ``config/sitemap.yml``
   file is **0.9**.

   By default, authority records receive a weight of **0.5** and static pages
   a weight of **1.0**.

When the command is run, at least 2 files are generated - by default they are
added to the root AtoM directory (though a specific location can be specified
using the task's options - see below). A ``sitemap.xml`` file acts as a
pointer file when multiple sitemaps are produced (e.g. if there are more than
50,000 nodes, the task will automatically break this up into 2 or more XML
files, as per Google's recommendations). If only 1 sitemap file is produced,
this pointer will still be generated, but will not be needed and can be
discarded if desired. The other file (or files) is the actual sitemap for your
AtoM instance - by default it is compressed using
`Gzip <https://www.gnu.org/software/gzip/>`__, although again there is also an
option to disable this if desired.

**Using the sitemap generation command-line task:**

Example use:

.. code-block:: bash

   php symfony tools:sitemap

.. image:: images/cli-sitemap-help.*
   :align: center
   :width: 70%
   :alt: An image of the help page for the sitemap CLI tool

By typing ``php symfony help tools:sitemap`` into the command-line, you can
see the options available on the ``export:bulk`` command, as pictured above.

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the task.

the ``--output-directory`` (or ``-O`` for short) option is used to specify a
specific location for the sitemap XML files on output - by default, they are
added to AtoM's root directory.

The ``--base-url`` option can be used to specify a base URL for the AtoM
instance, used in the sitmap XML files generated. Note that AtoM will use the
value entered in the **Admin > Settings > Site information** page for the Base
URL by default, so if you've added the correct value there, you shouldn't need
this option. See: :ref:`site-information` for more on Base URLs.

The ``--indent`` is a boolean value - by default, the XML generated will be
indented and formatted to assist human readability (e.g. ``--indent=1``).
However, if desired, linebreaks and indentation can be removed, but adding
``--indent=0`` to the command

Also by default, the XML sitemap generated will be compressed using
`Gzip <https://www.gnu.org/software/gzip/>`__ - however, if desired, you can
prevent the compression by using the ``--no-compress`` option.

If an older sitemap already exists in the target directory when the task is
run, AtoM will ask you to confirm if you want the older versions to be
overwritten or not. If you don't want this interruption (e.g. if you are using
this task as part of an automated deployment, etc), you can skip the
confirmation step with ``--no-confirmation``, or ``-B`` for short.

Finally, if you would like the sitemap(s) to be submitted to Bing and Google
after generation, you can add the ``--ping`` option to the command.

.. SEEALSO::

   * :ref:`config-sitemap-yml`

:ref:`Back to top <maintenance-cli-tools>`

.. _cli-dip-upload:

Manually upload Archivematica DIP objects
=========================================

AtoM includes integration with the open source digital preservation system, 
`Archivematica <https://www.archivematica.org/>`__. Using Archivematica, you can 
generate Archival Information Packages (AIPs) for preservation, as well as 
Dissemination Information Packages (DIPs) for use in an access system such as 
AtoM. For more information, see: 

* :ref:`archivematica:intro`
* :ref:`archivematica:upload-atom`
* :ref:`archivematica:store-dip`
* :ref:`Archivematica configuration for AtoM DIP upload <archivematica:admin-dashboard-atom>`

While a workflow that will automatically upload DIPs from Archivematica to 
AtoM is supported (see the links above), there may be cases where an archivist 
chooses to store a DIP, and then wishes to upload it later without having to run 
it through the re-ingest process. In that case, a system administrator can use 
this task to manually attach DIP objects to existing archival descriptions in 
AtoM. 

To execute the task requires several things. First, the task expects to find 
DIP digital objects that have been modified by Archivematica in 2 key ways: 

1. The original object file has been converted to a derivative with a corresponding 
   file extension (e.g. ``.jpg``, ``.mp3``, etc)
2. A Unique Universal Identifier (UUID) as been pre-pended to the file name (for 
   example, ``815da5cf-f49f-41f5-aa5d-c40d9d4dec3c-MARBLES.jpg``)

Additionally, the object names **without** the UUID must be unique for the
upload to succeed. If you have a number of files with the same name, we
suggest appending an incrementing number (e.g. ``correspondence-01``,
``correspondence-02``, etc).

For AtoM to know where to upload the objects, you will also need to prepare a
simple :term:`CSV` file. The CSV can be named anything, but must have the
extension ``.csv`` for the upload to work. The CSV must include a ``filename``
column, which specifies the full name of each object. Additionally, include
**either** an ``identifier`` column (if your identifier values in AtoM are
unique) or, preferrably, a ``slug`` column, so AtoM knows the description to
which each object will be attached. 

.. image:: images/cli-dip-csv.*
   :align: center
   :width: 70%
   :alt: An image of a sample CSV accompanying a DIP objects import

.. IMPORTANT::

   Do not include both an identifier and a slug column in your CSV, or the 
   upload may fail. You must choose one or the other - the final CSV should only 
   have 2 columns. 

The CSV should be placed in the ``objects`` directory of the DIP, with the 
digital objects that will be imported. The basic syntax for the task is as 
follows:

.. code-block:: bash

   php symfony import:dip-object /path/to/my/dip

By running ``php symfony help import:dip-object`` we can see the help page and 
options included with the task: 

.. image:: images/cli-dip-import.*
   :align: center
   :width: 70%
   :alt: An image of the help page for the DIP object import CLI tool

As a parameter, the task requires a file path. The path should point to the 
top-level directory where you have added the DIP. 

The ``--application``, ``--env``, and ``connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for Symfony to be
able to execute the task.

The ``--undo-log-dir`` option can be used to log which information objects (aka 
descriptions) have digital objects added to them as a result of running the task. 
This log can be used, in event of an incomplete import, to either establish 
where the import stopped or to manually remove the imported digital objects. 
Undo logs contain two columns: the object ID of the :term:`information object` 
to which objects have beem imported, and the DIP directory from which the objects 
were imported. For more information on using the object ID, you might want to 
review the section below, :ref:`common-atom-queries`. 

Similarly, the ``--audit`` option can be used to verify that all objects 
specified in the CSV file were imported. If any are found to be missing, then the 
object's filename will be output in the console.  

:ref:`Back to top <maintenance-cli-tools>`

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

.. _sql-delete-slugs:

Delete slugs from AtoM
======================

In some cases, you may wish to replace the existing :term:`slugs <slug>` in AtoM -
particularly if they have been randomly generated because the user-supplied
data from which the slug is normally derived (e.g. the "Title" field for an
:term:`archival description`) was not entered when the record was created.
For more information on how slugs are generated by AtoM, see above,
:ref:`slugs-in-atom`. If you have since supplied the relevant information
(e.g. added a title to your archival description), you may want to generate a
new slug for it that is more meaningful.

In such a case, you will need to delete the slug in AtoM's database first -
after which you can run the command-line task to generate slugs for those
without them (see above, :ref:`cli-generate-slugs`). AtoM slugs are
conveniently stored in a table named "slug" - if you know the slug you'd like
to delete, you can use the following command to delete it from AtoM's
database (replacing *your-slug-here* with the slug you'd like to delete):

.. code:: bash

   DELETE FROM slug WHERE slug='your-slug-here';

.. IMPORTANT::

   **Remember**, you will run into problems if you don't replace the slug!
   You can use the generate-slug task to do so; see
   :ref:`cli-generate-slugs`, above. Remember as well: if you are trying to
   replace a randomnly generated slug, but you haven't filled in the data
   field from which the slug is normally derived prior to deleting the old
   slug (see :ref:`above <slugs-in-atom>` for more on how slugs are generated
   in AtoM), you will end up with another randomly generated slug!

If you wanted to delete all slugs associated with descriptions (e.g.
:term:`information objects <information object>`) and :term:`terms <term>`,
you could use the following example SQL query to delete them:

.. IMPORTANT::

   Make sure you back up your data before proceeding! See:
   :ref:`cli-backup-db`.

.. code:: bash

   DELETE
   FROM slug
   WHERE (object_id IN
         (SELECT id
          FROM term)
       OR object_id IN
         (SELECT id
          FROM information_object))
   AND object_id <> 1;

You can then use the generate-slugs task to generate new slugs:

.. code:: bash

   php symfony propel:generate-slugs

See :ref:`above <cli-generate-slugs>` for further documentation on this
command-line tool.

If you wanted to delete **all** slugs currently stored in AtoM, you could do
so with the following query:

.. code:: bash

   DELETE FROM slug;

.. WARNING::

   This is an extreme action, and it will delete **ALL** slugs, including
   custom slugs for your static pages - and may break your application. The
   :ref:`generate-slugs task <cli-generate-slugs>` will not replace fixtures
   slugs - e.g. those that come installed with AtoM, such as for settings
   pages, browse pages, menus, etc - or any static pages! We strongly recommend
   backing up your database before attempting this - see above,
   :ref:`cli-backup-db` - and we recommend using SQL queries to
   *selectively* delete slugs!

:ref:`Back to the top <maintenance-cli-tools>`
