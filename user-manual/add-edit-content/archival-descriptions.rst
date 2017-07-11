.. _archival-descriptions:

=====================
Archival Descriptions
=====================

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

Archival descriptions are one of the core :ref:`entity-types` in AtoM and
provide users with invaluable contextual infomation about the resources held
by an :term:`archival institution`.

In AtoM, an archival description is a body of information about an archival
record or records. The descriptions provide contextual information about the
archival materials and are arranged into hierarchical levels (:term:`fonds`,
series, files, items, and variations of these in accordance with institutional
standards).

Archival desription is *also* an activity, however - generally accompanied by
the process of archival arrangemenent, it is the outcome of a process to gain
intellectual control over a resource or collection of resources and provide
end users (such as :term:`researchers <researcher>`) with a means of
conceptualizing the organization of these resources and navigating to the
specific content in which they are interested, as well as a sense of what is
contained, how it got there, and what role it serves in the larger
accumulation of materials. Archival description is therefore intended to
facilitate the identification, management, and understanding of archival
materials.

The International Council on Archives (`ICA <http://www.ica.org/>`__) defines
an archival description as *"The creation of an accurate representation of a
unit of description and its component parts, if any, by capturing, analyzing,
organizing and recording information that serves to identify, manage, locate
and explain archival materials and the context and records systems which
produced it. This term also describes the products of the process"* (ISAD
glossary).

Archival description is somewhat similar to the process of bibliographic
description, and some standards, such as the Canadian Rules for Archival
Description (RAD), are derived from bibliographic standards. Daniel Pitti,
one of the original creators of the Encoded Archival Description XML-based
metadata exchange standard (`EAD <http://www.loc.gov/ead/>`__), points out that
one of the key differences, however, is in the hierarchical nature of
archival description:

    *The distinction between what and for whom libraries and archives remember
    accounts form the major differences in archival and bibliographic
    description. A bibliographic description, such as that found in a MARC
    record, represents an individual published item, and thus is item-level.
    There is a one-to-one correspondence between the description and the item.
    The description is based on, and is derived from, the physical item.
    Archival description represents a fonds, a complex body of materials,
    frequently in more than one form or medium, sharing a common provenance.
    The description involves a complex hierarchical and progressive analysis.
    It begins by describing the whole, then proceeds to identify and describe
    sub-components of the whole, and sub-components of sub-components, and so
    on. Frequently, but by no means always, the description terminates with a
    description of individual items. The description emphasizes the
    intellectual structure and content of the material, rather than their
    physical characteristics.* (`Pitti, 1999
    <http://www.dlib.org/dlib/november99/11pitti.html>`__)

Archival description is often preceded by the creation of an :ref:`accession
record <accession-records>`, and much of the information generated during the
accessions process can be re-used to create archival descriptions. As new
:term:`accruals <accrual>` are added, the archival description is updated to
reflect these changes.

.. TIP::

   AtoM can generate an :term:`archival description` from an existing
   :term:`accession record` - see :ref:`Create an archival description from an
   accession record <create-accession-description>` for more information.

.. image:: images/arch-desc.*
   :align: center
   :width: 80%
   :alt: Example of an archival description in AtoM

**Below are instructions for using the Archival description module in AtoM
to:**

* :ref:`Add a new archival description <add-archival-description>`

  * :ref:`Add a new child description <add-child-archival-description>`

* :ref:`Edit an existing archival description <edit-archival-description>`

  * :ref:`Publish an archival description <publish-archival-description>`

* :ref:`Duplicate an existing archival description
  <duplicate-archival-description>`
* :ref:`link-related-descriptions`
* :ref:`change-display-standard`
* :ref:`add-alternative-id`
* :ref:`rename-title-slug`
* :ref:`Move an archival description <move-archival-description>`
* :ref:`Delete an archival description <delete-archival-description>`

AtoM also includes standards-based templates for describing resources. Please
see the sections below for more specific instructions on the use of
:term:`fields  <field>` within each template:

* General International Standard Archival Description:
  :ref:`ISAD(G) <isad-template>`
* Describing Archives: A Content Standard (U.S.A): :ref:`DACS <dacs-template>`
* Dublin Core Metadata Element Set, Version 1.1: :ref:`Dublin Core <dc-template>`
* Metadata Object Description Schema: :ref:`MODS <mods-template>`
* Rules for Archival Description (Canada): :ref:`RAD <rad-template>`

.. seealso::

   * :ref:`add-term-fly`
   * :ref:`browse-hierarchy`
   * :ref:`Physical storage <link-physical-storage>`
   * :ref:`Upload digital objects <upload-digital-object>`
   * :ref:`Create an archival description from an accession record
     <create-accession-description>`
   * :ref:`Link an accession record to an archival description
     <link-accession-description>`
   * :ref:`add-custom-links`
   * :ref:`link-function-description`
   * :ref:`link-authority-to-description`
   * :ref:`upload-digital-object`
   * :ref:`rights-archival-description`
   * :ref:`import-xml`
   * :ref:`export-xml`
   * :ref:`csv-import`


.. _add-archival-description:

Add a new archival description
==============================

This section contains instructions on how to Add a new top level archival
description (also known as a :term:`parent record`), and how to add a new
child description (or :term:`child record`) via two different methods

.. _add-top-level-description:

Add a new top level description
-------------------------------

A new :term:`archival description` can be added at any time, from anywhere in
the application, via the :term:`main menu` available to authenticated (i.e.
logged in) AtoM users with the appropriate privileges (such as
:term:`contributors <contributor>`, :term:`editors <editor>`, and
:term:`administrators <administrator>`). For more information on User roles
and types of users in AtoM see: :ref:`User roles <user-roles>`.

.. NOTE::

   You must be logged in to be able to create a new :term:`archival
   description` in AtoM. See: :ref:`Log in <log-in>`.

**To create a new archival description:**

1. In the :term:`main menu` located in the :term:`header bar`, click the
   |plus| ":ref:`Add <main-menu-add>`" menu and select "Archival description"
   from the :term:`drop-down menu`.

.. image:: images/add-description.*
   :align: center
   :width: 30%
   :alt: An image of the Add menu in AtoM

2. AtoM takes you to a blank :term:`edit page` for data entry.

.. NOTE::

   The :term:`edit page` that appears will depend on the :ref:`default template
   <default-templates>` set in the application. When first installed, the
   default template in AtoM is the :ref:`ISAD(G) <isad-template>` (General
   International Standard for Archival Description) template. Administrators
   can change the default template to any of the other 4 supported standards
   (:ref:`RAD <rad-template>`, :ref:`DACS <dacs-template>`, :ref:`Dublin Core
   <dc-template>`, or :ref:`MODS <mods-template>` via **Admin >
   Settings > Default template**. For more information, see: :ref:`settings`.

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.

.. image:: images/description-collapsed.*
   :align: center
   :width: 85%
   :alt: An archival description with all information areas closed

4. Note that new lower :term:`levels of description <level of description>`
   (i.e. :term:`children <child record>`) can be created on the fly without
   leaving the top-level or :term:`parent <parent record>` description you are
   currently creating. For more information, see below, :ref:`Add a new child
   description <method-1-child-description>`.

.. image:: images/description-add-children.*
   :align: center
   :width: 85%
   :alt: An image of the add new children feature in an edit template

5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any data already entered will not be saved,
   and no new record will be created. Note that simply navigating away from
   the page by any other means, **without first clicking "Create"** will also
   result in no new record being created.
6. To save the new record, click the :term:`"Create" button <create button>`
   located in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 85%
   :alt: An image of the create button on a new archival description

.. NOTE::

   The default status of a newly created :term:`archival description` is
   DRAFT. :term:`Draft records <draft record>` are not visible to
   unauthenticated (i.e. not logged in) users such as :term:`researchers
   <researcher>`. Under the :term:`Administration area` of the archival
   description, users with publication privileges (see: :ref:`User roles
   <user-roles>`) can select :term:`PUBLISHED <published record>` as the new
   status of the archival description, making it available for read access to
   the public.

.. TIP::

   :term:`Administrators <administrator>` can also change the default
   publication status of new records throughout the application via **Admin >
   Settings > Global > Default publication status**. For more information,
   see: :doc:`Settings <../administer/settings>`.

:ref:`Back to top <archival-descriptions>`


.. _add-child-archival-description:

Add a new child description
---------------------------

A :term:`child descriptions <child record>` is an archival description that is
part of a larger hierarchy, often a :term:`fonds` or :term:`collection`. A
child record refers to a description of the :term:`archival unit` that is one
:term:`level of description` lower than the current unit - for example, if a
series belongs to a :term:`fonds`, the series is the child record of the
fonds. AtoM helps users understand the context of the materials by depicting
the current record's position in the :term:`treeview`, which can also be used
for navigation  (see: :doc:`Context menu <../access-content/context-menu>`)

There are two ways to add a new :term:`child description <child record>` in
AtoM - **Method 1** allows a user to add a new child record "on the fly" while
creating a top-level description (or :term:`parent record`), but these records
should be considered stubs or placeholders until they can be returned to and
supplemented with further description. **Method 2** explains how to create a
full child description at any time.

.. _method-1-child-description:

Method 1: "On the fly"
^^^^^^^^^^^^^^^^^^^^^^

AtoM includes a data entry element in the first :term:`information area` of
the :term:`archival description` :term:`edit page` that allows users to
generate lower :term:`levels of description <level of description>` to a
:term:`parent record` without leaving the current :term:`edit page`.

This area is located in:

* The **Identity** :term:`area <information area>` of the :ref:`ISAD(G)
  <isad-template>`  and :ref:`DACS <dacs-template>` templates
* The **Statement of responsibility** :term:`area <information area>` of the
  :ref:`RAD <rad-template>` template
* The **Elements** :term:`area <information area>` of the :ref:`Dublin Core
  <dc-template>`  and :ref:`MODS <mods-template>` templates

Note that this method is not meant to replace more granular description - it
allows a user to create a sort of skeleton structure to the whole of the
description (such as a :term:`fonds` or :term:`collection`), which can
improve supplement an archival :term:`arrangement` workflow - the :term:`child
<child record>` descriptions can then be supplemented later.

.. image:: images/description-add-children.*
   :align: center
   :width: 85%
   :alt: An image of the add new children feature in an edit template

:term:`Fields <field>` provided for creating lower levels of description "on
the fly" via the :term:`parent description's <parent record>` :term:`edit page`
include:

* Identifier (i.e., reference number)
* Level (of description)
* Title

.. TIP::

   You can add as many levels as needed at one time; for example, to add
   multiple series to a :term:`fonds` or :term:`collection`, fill in the fields
   under the "Add new child levels" and add as many lower levels as desired.
   When the record is saved, you will be able to see the new :term:`child
   records <child record>` in the :term:`context menu`.

.. _method-2-child-description:

Method 2: Adding a full child description
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Full :term:`child descriptions <child record>` can be added to an
:term:`archival description` at any time (by users with sufficient :ref:`edit
privileges <edit-user-permissions>`) by navigating to the description to which
you would like to add a child (the :term:`parent description <parent record>`).

First, navigate to the :term:`parent archival description <parent record>` to
which you wish to add a child description. You can do this by
:ref:`browsing <browse>` or :ref:`searching <search-atom>` for the
:term:`archival description` - see :ref:`Access content <access-content>`
for more information on navigation in AtoM.

.. NOTE::

   You must be logged in to be able to create a new :term:`archival
   description` in AtoM. See: :ref:`Log in <log-in>`.

1. In the :term:`view page` of the parent :term:`archival description`, scoll
   to the bottom of the record to the :term:`button block` and click the "Add
   new" button.

.. image:: images/button-block-description.*
   :align: center
   :width: 85%
   :alt: An image of the button block on an archival description view page

2. You will be redirected to a new :term:`archival description` :term:`edit page`.
   On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.

.. image:: images/description-collapsed.*
   :align: center
   :width: 85%
   :alt: An archival description with all information areas closed

.. IMPORTANT::

   It is important to note that after clicking on the "Add new" record button,
   the edit archival description template will appear, but no reference is
   made to the :term:`parent <parent record>` archival description. When you
   save your record, however, you will be able to see the relationship
   expressed in the :term:`treeview`, located in the :term:`context menu`
   on the left-hand side of the :term:`view page`.

3. Enter appropriate information into the template for the lower-level
   description, and remember to select the :term:`level of description`.
4. Note that you can add further :term:`children <child record>` to this lower
   level of description as you work, via The :ref:`"On the fly"
   <method-1-child-description>` method described above.

.. image:: images/description-add-children.*
   :align: center
   :width: 85%
   :alt: An image of the add new children feature in an edit template

5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any data already entered will not be saved,
   and no new child record will be created. Note that simply navigating away
   from the page by any other means, **without first clicking "Create"** will
   also result in no new record being created.
6. To save the new child record, click the :term:`"Create" button <create
   button>` located in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 85%
   :alt: An image of the create button on a new archival description

After clicking "Save" you will be redirected to the :term:`view page` for the
new child description. You can see the relationship to the parent record
expressed in the :ref:` context menu <context-menu>`. For more information on
the Context menu and the treeview in AtoM, see: :ref:`context-menu`, and
specifically, :ref:`context-menu-treeview`. See also: :ref:`treeview-search`.

:ref:`Back to top <archival-descriptions>`

.. _edit-archival-description:

Edit an existing archival description
=====================================

An authenticated (i.e. logged in) user with edit privileges can edit or update
an :term:`archival description` at any time. For more information on edit
privileges and user roles see: :ref:`User roles <user-roles>`. For information
on logging in, see: :ref:`Log in <log-in>`.

**To edit an existing archival description:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking the
   :term:`"Edit" button <Edit button>` in the :term:`button block`, or by
   clicking on one of the :term:`information area` headings; this takes you
   to the record's :term:`edit page`.
3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it. If
   you've clicked on an an :term:`area header` directly, the edit page will
   load with that area open.

.. image:: images/description-collapsed.*
   :align: center
   :width: 85%
   :alt: An archival description with all information areas closed

4. Add and/or revise data as required.
5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no changes being saved to the
   archival description.
6. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 85%
   :alt: An image of the button block

You will be redirected to the :term:`view page` for the edited
:term:`archival description`, where you can review your work.


.. _publish-archival-description:

Publish an archival description
-------------------------------

All new and imported :term:`archival descriptions <archival description>` in
AtoM are automatically saved as :term:`draft records <draft record>`. This
means that users who are not authenticated (i.e. logged in) cannot view these
records.

.. NOTE::

   Administrators can change the default publication status, via **Admin >
   Settings**. For more information, see: :ref:`Settings <settings>`.

Publication status can also be inherited from the highest :term:`level of
description`, meaning that changes to the publication status of the
:term:`parent record` can be made to affect the publication status of all
:term:`child records <child record>`. For example, when a :term:`fonds`
description is changed from draft to published and the option to update
descendants is also selected, all lower levels within the fonds (series,
files, items, etc.) will be automatically changed as well. Note that it is
still possible to only change the publication status of the current level, if
the "Update descendants" option is not selected.

.. WARNING::

   It is possible to break the full-width :term:`treeview` in AtoM by
   publishing child descriptions of a draft parent. For example, publishing
   all items within a series, and then making the parent series record draft
   again (but not the children). In this case, the fullwidth treeview will not
   load. The sidebar treeview will still load, displaying the draft parent
   node (e.g. the series) in the tree - public users will get a "Permission
   denied" message if trying to access the draft record. **It is up to you as
   a user to ensure you are not making contradictory publication status
   updates that will break the treeview**. For more information on the
   treeview in AtoM, see: :ref:`context-menu-treeview` and
   :ref:`treeview-type`.

Changing a record's status to published allows unauthenticated (i.e. not
logged in) users such as :term:`researchers <researcher>` the ability to see
the record, i.e. read access is granted to the public. Draft records are not
viewable by unauthenticated users (i.e. those not logged in).

To avoid timeouts via the web browser for large publication status requests,
updates to descendants are performed asynchronously in the background via
AtoM's job scheduler. For example, when a user publishes a draft :term:`fonds`
and selects the "Update descendants" checkbox as well (so all lower-level
records in the fonds will be published as well), the fonds-level record will
be immediately updated, while the job scheduler will begin the task of
updating the descendants in the background. In this case, a notification will
appear at the top of the archival description :term:`view page` when the user
is redirected to it after submitting the update request, with a link to the
Jobs page, where more information about the status of the job can be seen. In
most cases this will be very rapid, but for exceptionally large requests it
is possible for a user to navigate to a descendant record (e.g. an item in the
fonds) before the update job has been completed. If you're unsure if your
publication status update job has executed properly or not, be sure to check
the jobs page. For more information on the Jobs page in AtoM, see:
:ref:`manage-jobs`.

.. NOTE::

   For AtoM 2.2 and earlier users - the "Update publication status" options
   have moved out of the description edit page! You can now find this option
   in the "More" button menu, in the :term:`button block` at the bottom of an
   archival description :term:`view page` for authenticated users. Further
   details are included in the steps below.

.. TIP::

   An :term:`administrator` can turn on a setting in the Global settings page
   that will notify authenticated (i.e. logged in) users of the number of
   draft records in AtoM when they log in. For more information, see:

   * :ref:`drafts-notification`

.. _publish-description-permissions:

Notes on publication status and publish permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

An :term:`administrator` can set whether or not groups and/or users have
publish :term:`permissions <access privilege>` via the User and Group settings
- see :ref:`manage-user-accounts` and :ref:`edit-user-permissions` for more
information. This means that a user may have the ability to edit a record, but
without publication permissions, the record may revert from a published status
to a draft one on save. The following points describe the expected behavior
for publication status updates based on user permissions:

* When new records are created, they default to the global publication status
  setting. In a new installation, this setting is set to Draft, but an
  administrator can change this via **Admin > Settings > Global** - see:
  :ref:`default-publication-status`
* If the default pub status is set to "Published", but a new record is created
  by a user **WITHOUT** publication permissions (e.g. a
  :ref:`contributor <user-contributor>`), the record will default to Draft
  when it is saved.
* When new records are created, or a published record is
  :ref:`duplicated <duplicate-archival-description>`, the new records will use
  the default publication status - unless the setting is set to published, and
  the user **doesn't** have publish permissions. In this case, the new
  record(s) will have a draft publication status
* The above is also true for new child records created via the "Add new child
  records" widget
* If a record is published, and a user **WITH** publish permissions edits the
  record, then on save, it will maintain the same publication status it had at
  the time of editing (e.g. in this case, published)
* If a record is published, and a user **WITHOUT** publish permissions edits
  the record, the published record will revert to draft on save, and a
  notification will appear, informing the user of this change with the
  following text:

  *Your edits to this description have been saved and the description has
  reverted to Draft status. Please ask a user with sufficient permissions to
  publish the description again to make it publicly visible.*

To publish an existing archival description
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Navigate to the record you wish to publish. For more information on
   navigation in AtoM, see: :ref:`Access content <access-content>`
2. Scroll to the :term:`button block` at the bottom of the archival
   description's :term:`view page`, and click on the "More" button. A menu
   will appear - select the "Update publication status" option.

.. image:: images/pubstatus-link.*
   :align: center
   :width: 85%
   :alt: An image of the More button in the button block of an archival
         description view page

3. AtoM will redirect you to a publication status configuration page. Using
   the :term:`drop-down menu` provided, select the desired publication status
   - published, or draft.

.. image:: images/pubstatus-config.*
   :align: center
   :width: 85%
   :alt: An image of the publication status configuration page

4. If you would like all lower-level records (descendants) to be updated as
   well, check the "Update descendants" box beneath the drop-down menu. Note
   that this option will not appear if there are no lower-level records.
5. You can cancel your actions at any time, and return to the archival
   description :term:`view page` by clicking the "Cancel" button in the
   :term:`button block` at the bottom of the page. Note that navigating away
   from the page has the same effect - the publication status will **not** be
   updated unless the Save button is clicked.
6. To save your changes, and update the publication status of your
   description(s), click the "Update" button in the :term:`button block` at
   the bottom of the publication status configuration page.
7. AtoM will redirect you back to the archival description :term:`view page`.
   The current description will now be updated to the desired publication
   status (e.g. published, if it was previously draft). If you have also
   checked the box to update descendants, a notification will appear at the
   top of the page, with a link to the :ref:`Jobs page <manage-jobs>`.

.. image:: images/pubstatus-msg.*
   :align: center
   :width: 85%
   :alt: An image of a notification on an updated description's view page

The archival description, and any lower :term:`levels of description <level of
description>` associated with it, will now be published - public users who are
not logged will now be granted read access to view (but not edit) the
record(s). The record(s) will also be discoverable to public users via
:ref:`browse` or :ref:`Search <search-atom>`.

For updates to descendants, you can use the link in the notification message
to navigate directly to the Jobs page - The Jobs page will include the name of
the parent description whose descendants are being updated, a link (the blue
arrow in the Job status column) back to the parent description, and
information on the current job status (Running, Completed, or Failed).

.. image:: images/pubstatus-job.*
   :align: center
   :width: 85%
   :alt: An image of the Jobs page showing completed publication status update jobs

For more information on using the Jobs page, see: :ref:`manage-jobs`.

.. SEEALSO::

   * :ref:`drafts-notification`

:ref:`Back to top <archival-descriptions>`


.. _duplicate-archival-description:

Duplicate an existing archival description
==========================================

To simplify the description workflow when working with many similar
descriptions (such as, in some cases, many items in a :term:`collection`),
AtoM includes the ability to generate a duplicate record from an existing
:term:`archival description`, and then edit it to make necessary changes.
This can allow a user to avoid unnecessarily repeating data entry.

.. note::

   When duplicating a parent record, lower (child) levels of description will
   NOT be duplicated.

**To duplicate an existing archival description:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. At the bottom of the archival description, click the "Duplicate" button
   located in the :term:`button block`.

.. image:: images/button-block-description.*
   :align: center
   :width: 85%
   :alt: An image of the button block on an archival description view page

3. You will be redirected to a new screen with an :term:`edit page` of an
   :term:`archival description` open.
4. The new edit page provides a warning at the top to indicate that it is a
   duplicated record.

.. image:: images/description-duplicate-warning.*
   :align: center
   :width: 85%
   :alt: An image of a duplicated archival description

5. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it.
   You will note that these will be populated with the exact same data found
   in the original :term:`archival description` - you can now make any edits
   or revisions necessary.
6. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; no new record will be created. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Create"** will also result in no new record being created.
7. To save the duplicate as a new record, click the "Save" button located in
   the :term:`button block` at the bottom of the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 85%
   :alt: An image of the button block

.. IMPORTANT::

   If you are duplicating a :term:`child <child record>` of a :term:`parent
   record` (such as a series, file, or item), the duplicate description will
   automatically be created as a :term:`child <child record>` of the same
   parent :term:`archival description`. If you duplicate a top or
   :term:`parent <parent record>` :term:`level of description`, the new
   record will also be a top-level description with no parent.

   Records can be moved in AtoM as well - see below,
   :ref:`Move an archival description <move-archival-description>`


:ref:`Back to top <archival-descriptions>`

.. _link-related-descriptions:

Link related archival descriptions in AtoM to each other
========================================================

Many AtoM descriptive templates include a free text field, derived from the
related content standards (for more information, see:
:ref:`descriptive-standards` and :ref:`data-entry`) that will allow users to
describe allied or related materials:

+------------------+----------+------------------+------------------------------+
| Content standard | Rule no. | AtoM field label | Information area             |
+==================+==========+==================+==============================+
| ISAD             | 3.5.3    | Related units of | Allied materials area        |
|                  |          | description      |                              |
+------------------+----------+------------------+------------------------------+
| DACS             | 6.3      | Related archival | Related materials elements   |
|                  |          | materials        |                              |
+------------------+----------+------------------+------------------------------+
| RAD              | 1.8B20   | Associated       | Notes area                   |
|                  |          | materials        |                              |
+------------------+----------+------------------+------------------------------+

However, as of AtoM 2.1, a new auto-complete :term:`field` has been added to
the :term:`edit page` of each of the above standards, that will allow users to
link an :term:`archival description` to another related description held in
AtoM. This linking is reciprocal - once it is added on one description, a link
back to the first resource will also appear on the related description.
Linking is managed via an auto-complete field: users begin to type the
identifier or title of a resource, and as they type, the auto-complete
:term:`drop-down <drop-down menu>` will display matching results.

In each standards template, the linking field appears just below the free-text
fields listed in the table above. It is labelled as "Related descriptions" in
the :ref:`ISAD <isad-template>` and :ref:`DACS <dacs-template>` templates, and
as "Related materials" in the :ref:`RAD <rad-template>` template.

.. figure:: images/related-description-field.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of related description field in the ISAD template

   In this example, the "Related description" linking field is shown below the
   ISAD 3.5.3 Related units of description field in the ISAD template.

**To link an archival description to another description in AtoM:**

1. First, navigate to the :term:`archival description` where you wish to add a
   link. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`access-content` for more information on navigation in AtoM.

2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-description.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an archival description view page

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`area header` to expand it and make changes. Use the table above to
   determine which information area will have the related descriptions field,
   based on which descriptive template (ISAD, RAD, DACS) you are using. For
   more information on working with content standards and descriptive
   templates in AtoM, see:

   * :ref:`descriptive-standards`
   * :ref:`change-display-standard`
   * :ref:`data-entry`
   * :ref:`default-templates`

.. image:: images/description-collapsed.*
   :align: center
   :width: 80%
   :alt: An archival description with all information areas closed

4. In the Related descriptions :term:`field`, begin typing either the
   identifier, full reference code, or title of the
   :term:`archival description` to which you would like to create a link. As
   you type, the field's :term:`drop-down menu` will provide auto-complete
   matching results. When you see the description to which you would like to
   create a link, click on it in the drop-down menu.

.. image:: images/add-related-description.*
   :align: center
   :width: 80%
   :alt: Using the related descriptions field to find another description

5. You can repeat this process to add multiple links to different descriptions
   at the same time.

.. image:: images/add-second-related-description.*
   :align: center
   :width: 80%
   :alt: Using the related descriptions field to find a second description

6. To **remove** a linked description, place your cursor over the bullet next
   to the linked description - it will change into an **X**. Click the **X**
   to remove the link to the related description.

.. image:: images/remove-related-description.*
   :align: center
   :width: 80%
   :alt: Removing a related description link

7. When you are finished adding or editing your related descriptions, click
   "Save" in the :term:`button block` at the bottom of the :term:`edit page`.
   Alternately, if you click "Cancel" or navigate away from the page without
   saving, none of your changes will be saved.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block

8. Upon saving, AtoM will redirect you to the :term:`view page` for your
   :term:`archival description`. You will be able to see a link to the related
   description in the relevant :term:`information area` of your display
   template.

.. image:: images/related-description-view.*
   :align: center
   :width: 80%
   :alt: A related description link as seen in the view page

9. Similarly, AtoM will automatically add a reciprocal link back to the
   original description on the view and edit pages of the related resource.
   You can edit or remove the link by entering :term:`edit mode` on either
   description, and following instructions to remove a link in Step 6, above.

.. image:: images/related-description-reciprocal.*
   :align: center
   :width: 80%
   :alt: A related description link as seen in the view page

:ref:`Back to top <archival-descriptions>`

.. _change-display-standard:

Change the display standard
===========================

AtoM's :term:`archival description` edit templates are based on known standards
used within the cultural heritage community. For more information on
standards used in AtoM, see: :ref:`descriptive-standards`.

You can change the :term:`display standard` for an individual archival
description in the adminstration area while editing an archival description.
This allows you to choose a different description template per archival
description than the template you have chosen in your AtoM
:ref:`settings <default-templates>`. This includes at different levels of the
same :term:`archival unit` - so for example, if you have an image collection,
you could create a :term:`fonds`-level description using the
:ref:`ISAD <isad-template>` template, and then display all of the item-level
image descriptions using the :ref:`Dublin core <dc-template>` template.

You can also choose to have the newly selected display standard be inherited
by all :term:`child records <child record>` (for example, all the file-level
children beneath a series) if desired, or you can simply change the current
description. Instructions are included below.

**To change the display template of a description in AtoM:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-description.*
   :align: center
   :width: 85%
   :alt: An image of the button block on an archival description view page

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on the
   :term:`Administration area` heading to expand it and make changes.

.. image:: images/description-collapsed.*
   :align: center
   :width: 85%
   :alt: An archival description with all information areas closed

4. In the :term:`Administration area`, click the :term:`drop-down menu`
   labelled "Display standard". You will see a list of all display standards
   for archival descriptions available in AtoM. For more information on standards
   available in AtoM, see: :ref:`descriptive-standards`. For specific
   information on each standard, see: :ref:`data-entry`.

.. image:: images/change-display.*
   :align: center
   :width: 80%
   :alt: Option to change the display standard while editing an archival
         description

5. If you are currently using the default display template (see:
   :ref:`settings <default-templates>`), the field will be blank until you
   select a different template. Select the display standard you would like to
   use from the :term:`drop-down menu`.
6. If you would like all lower levels of description (e.g.
   :term:`child records <child record>`) to adopt the new display standard as
   well, click on the check-box below the template drop-down.
7. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; no new record will be created. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Create"** will also result in no new record being created.
8. To save the record and display it with the new standards template, click
   the "Save" button located in the :term:`button block` at the bottom of
   the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 85%
   :alt: An image of the button block

:ref:`Back to top <archival-descriptions>`

.. _add-alternative-id:

Add alternative identifiers to an archival description
======================================================

As of AtoM 2.1, users can now add alternative identifiers to descriptions
using the :ref:`ISAD(G) <isad-template>`, :ref:`RAD <rad-template>`, or
:ref:`DACS <dacs-template>` standards-based description templates. This can be
useful for keeping track of legacy identifiers or other relevant alphanumeric
strings associated with the identification of your records, such as a bar
code. To learn more about the description standards templates available in
AtoM, see the following:

* :ref:`descriptive-standards`
* :ref:`change-display-standard`
* :ref:`data-entry`
* :ref:`default-templates`

**To add an alternative identifer to your archival description:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-description.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an archival description view page

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on the
   :term:`Administration area` heading to expand it and make changes.

.. image:: images/description-collapsed.*
   :align: center
   :width: 80%
   :alt: An archival description with all information areas closed

4. You will a link to reveal the Alternative identifiers field below the
   Identifier field, whose location depends on which display standard you are
   using (ISAD, RAD, or DACS). In general, it will be found in the first
   :term:`information area` of the description template.

+------------------+------------------------------+
| Content standard | Information area             |
+==================+==============================+
| ISAD             | Identity area                |
+------------------+------------------------------+
| RAD              | Title and statement of       |
|                  | responsibility area          |
+------------------+------------------------------+
| DACS             | Identity elements            |
+------------------+------------------------------+

.. figure:: images/alt-id-link.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the alternative identifier field in ISAD

   In this example, the link to reveal the Alternative identifier fields is
   found under the Identifier :term:`fields <field>` in the Identity
   :term:`information area` of the ISAD(G) template.

5. Click on the link to reveal the Alternative identifier fields below. Users
   can add a custom label (to describe the purpose or origin of the
   alternative identifier), and a value.

.. image:: images/alt-id-fields.*
   :align: center
   :width: 80%
   :alt: Fields revealed when the alternative identifier link is clicked

6. You can add multiple alternative identifiers at the same time, and you can
   return in :term:`edit mode` at any point in the future to edit, remove, or
   add new identifiers. To **add** another row, click the "Add new" link
   beneath the fields. To **remove** an alternative identifier, click the
   **X** to the right of the field row.

.. image:: images/alt-id-multiple.*
   :align: center
   :width: 80%
   :alt: Adding multiple alternative identifiers

7. When you are done adding, editing, or removing your alternative
   identifiers, click "Save" in the :term:`button block` located at the bottom
   of the :term:`edit page`. If you click "Cancel" or navigate away from the
   page without clicking "Save," you changes will not be saved.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block

8. AtoM will redirect you to the :term:`view page` for your
   :term:`archival description`. The alternative identifiers will be displayed
   with their custom labels in the Notes :term:`area <information area>` of
   your descriptive template.

.. image:: images/alt-id-view-page.*
   :align: center
   :width: 80%
   :alt: Alternative IDs as displayed in the view page of a description

:ref:`Back to top <archival-descriptions>`

.. _rename-title-slug:

Rename the title or slug of an archival description
===================================================

When archival descriptions are created, a permalink (also known as a
:term:`slug`) is generated as well, to be used in the URL associated with the
description - the slug is the unique part of that URL. In AtoM, the slug of an
:term:`archival description` is generated automatically, from either the title
of the description, or from the inherited :term:`reference code` of the
description - an :term:`administrator` can determine which is used globally
based on a setting available in **Admin > Settings > Global**. For more
information, see: :ref:`description-permalinks`.

However, users with the appropriate :term:`permissions <access privilege>` can
edit the slug, the title of the description, or even the filename of an
associated uploaded :term:`digital object` after the description is saved, by
using the "Rename" module.

When editing a slug in AtoM, it is important to understand how they are
generated, and why your slug may be saved differently than the value you
input. Slugs in AtoM are sanitized to remove spaces, special characters (such
as ! @ # $ % & etc), stopwords (such as "a," "an," "the," etc), and
capitalization. They are also truncated to a maximum of 250 characters. Since
they are used as permalinks, they must also be unique within the system - so
AtoM will automatically append a dash and an incrementing number to the end of
non-unique slugs. More information on slugs in AtoM can be found here:
:ref:`slugs-in-atom`. Whenever the Rename module alters the slug you enter
based on the above parameters, a notification indicating this will be shown.

Note that the title of a description can always be edited within the
:term:`edit page` of the description itself - for more information, see above,
:ref:`edit-archival-description`. The ability to edit the title of the
description in the Rename module has been included for convenience - when the
title of archival description is edited in the Rename module, **and** the
checkbox for editing the slug is also selected, then the slug will be
automatically updated to match the title.

.. TIP::

   If you ever update the slug accidentally when editing the title, don't
   worry! You can simply uncheck the update slug box to the right of the field
   - AtoM will disable the slug edit field, and when saved, the slug will be
   unchanged from the original. You can also always re-open the Rename module
   and edit the slug or title again as needed. Further details are included
   below.

Although it can be done in the same module, specific instructions on editing
the filename of a linked digital object will be covered on the
:ref:`upload-digital-object` page - for more information, see:
:ref:`rename-digital-object`.

**To update the title or slug of an archival description:**

1. Navigate to the :term:`archival description` whose title or :term:`slug`
   you wish to edit. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`Access content <access-content>` for more information on navigation
   in AtoM.
2. Scroll down to the :term:`button block` at the bottom of the page, and
   click on the "More" button - a menu will open with further options. Click
   on "Rename" to open the Rename module.

.. image:: images/rename-button.*
   :align: center
   :width: 80%
   :alt: An image of the More button menu opened on an archival description

3. AtoM will redirect you to the Rename module page. You will see at least 2
   :term:`fields <field>` - one for the title of the description, and one for
   the slug. If there is a digital object linked to the description, you will
   also see a third field to edit the :term:`digital object` filename.

.. image:: images/rename-page.*
   :align: center
   :width: 80%
   :alt: An image of the Rename module's available fields

.. SEEALSO::

   For more information on editing the :term:`digital object` filename with
   the rename module, see: :ref:`rename-digital-object`.

4. To the right of the edit fields, there is a checkbox corresponding to each
   field. By default, the title and slug checkboxes will be checked - this
   means that they are enabled for editing. You can uncheck these fields at
   any time to disable them - doing so will undo any changes made and prevent
   the field from updating when the "Update" button is clicked.

5. Place your cursor in the :term:`field` whose value you would like to edit,
   and make changes as necessary. For reference, the original value before
   your changes is displayed below each field. **Remember** to uncheck any
   fields you don't wish to edit - this will disable them.

.. image:: images/rename-slug-not-title.*
   :align: center
   :width: 80%
   :alt: An image of editing the slug value in the Rename module

.. IMPORTANT::

   If you are editing the title of a description, and the "Update slug"
   checkbox is checked, then **the slug will be automatically updated based on
   the new title you enter**! The updated slug will be visible in the slug's
   edit field after you move your cursor out of the title field. You can still
   make changes to the slug after it is automatically updated. Also, if you do
   not want to save the changes made to the slug, you can uncheck the "Update
   slug" box at any time during the edit process - AtoM will disable the edit
   field, and the original slug will be preserved when your changes are saved.

   .. image:: images/rename-title-not-slug.*
      :align: center
      :width: 90%
      :alt: An image of editing the title value in the Rename module

6. When editing the :term:`slug` of a description, if you enter a slug value
   that is already in use in AtoM, a notification pop-up will appear when you
   move your cursor out of the slug edit field, and AtoM will automatically
   append an incremental number to the slug to make it unique. You can still
   edit this value as desired to find a unique slug.

.. image:: images/rename-slug-in-use.*
   :align: center
   :width: 80%
   :alt: An image of the "slug in use" notification pop-up

.. TIP::

   To make sure you see the notification pop-up before saving your record, we
   recommend actively moving the cursor out of the slug field after making an
   edit, instead of directly clicking on the "Update" button while your cursor
   is still in the slug edit field.

7. When you are satisfied with your changes, click the "Update" button in the
   :term:`button block` at the bottom of the Rename module's edit page. If you
   wish to cancel all changes and return to the :term:`archival description`,
   click the "Cancel" button.

8. After submitting your changes by clicking the "Update" button, AtoM will
   redirect you to the archival description's :term:`view page`. A yellow
   notification banner will appear at the top of the page acknowledging your
   edits. If the value you have entered for the slug has been changed by AtoM
   (e.g. sanitized to remove special characters, spaces, or capital letters,
   or incremented to make the slug uniqe), the message will mention this so
   you can review the slug in your browser's address bar.

.. image:: images/rename-slug-warning-banner.*
   :align: center
   :width: 80%
   :alt: An image of the notification banner after changes are saved

9. You can repeat these steps as needed until you are satisfied with the
   outcome. Note that links to the description from other entities (e.g.
   a linked :term:`archival institution`, :term:`authority record`, etc) will
   be preserved even when the title or slug are changed.

.. NOTE::

   AtoM does **not** automatically add redirects from the old URL to the new
   one after a slug is updated - this allows previous slugs to be re-used if
   they are available. However, this means that if you have added links to a
   specific description on an external website, they may break after changing
   the slug.

:ref:`Back to top <archival-descriptions>`

.. _move-archival-description:

Move an archival description
============================

Occasionally a user will need to move an archival description from one level
of description to another, from one :term:`fonds` or :term:`collection`
(or other top-level description) to another, or simply to change the
sort order within a number of records that share the same :term:`level of
description` (sometimes called siblings). There are two methods of moving
:term:`archival descriptions <archival description>` - the first method
allows only for changing the sort order in the :term:`treeview` found in the
:term:`context menu`, while the second method, more robust, allows for a
record to be moved broadly throughout the application, even allowing a lower
level of description to be moved so that it becomes a new :term:`parent
description <parent record>`.

.. _change-sort-order:

Method 1: Change sort order
---------------------------

This method **only** applies when there are multiple :term:`children
<child record>` with the same :term:`level of description` beneath a
:term:`parent description <parent record>` - i.e. "siblings". It will
change the sort order as displayed in the :term:`treeview` found in the
:term:`context menu` of the related descriptions. Users can drag-and-drop
children within the same level, for example moving series 02 above series 01
or moving items around within the same file. This is useful for users managing
the intellectual :term:`arrangement` of an :term:`archival unit`.

.. IMPORTANT::

   To be able to change the sort order, an :term:`administrator` **must**
   change the "Sort treeview" settings (located in **Admin > Settings >
   Global > Sort treeview**) to "Manual". Otherwise the drag and drop
   capabilities of the :term:`treeview` are disabled. For more information,
   see :ref:`Settings <settings>`.

**To change the sort order of sibling descriptions in the treeview:**

1. Navigate to the :term:`child description <child record>` whose sort order
   you wish to change. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`Access content <access-content>` for more information on navigation
   in AtoM.
2. In the :term:`treeview` (depending on your settings located either on the left-
   hand side or above the record's :term:`view page`), the current record being
   displayed in the :term:`view page` will be highlighted by a dark grey bar.
   For more information on the treeview, see: :ref:`context-menu-treeview`.
3. In the :term:`treeview`, hover your cursor over the sibling record you wish
   to move - it can be any record on the same :term:`level of description` as
   the one currently being viewed.
4. If the "Sort treeview" setting has been set to "Manual" by an
   :term:`administrator` in **Admin > Settings > Global > Sort treeview**,
   then you will see three horizontal lines or bars appear on the right-hand
   side of the record-title you are hovering over in the treeview. This means
   the item can be dragged and dropped to a new sort order.
5. Click on the record in the treeview and hold, and then drag it to the new
   position you would like it to have in the treeview. Remember, you can move
   it to another position within the same :term:`level of description`, but
   the record will **not be moved** if you attempt to drag it from a lower to a
   higher level (e.g., from an item level to a file level, from a file level
   to a series or fonds level, etc.)
6. The record in the treeview will drop into its new location. No changes will
   occur on the :term:`view page` of the current record, though the sort order
   has been changed within the collection. You can repeat these steps as many
   times as are necessary to achieve the sort order you wish.

.. NOTE::

   Changing the sort order of a description with associated lower levels of
   description (i.e. :term:`children <child record>`) will also move the
   description's children. For example, if File 03, which has 10 item-level
   children, is dragged above File 01 to change the sort order, all of File
   03's children will also be moved, and will stay associated with File 03.


.. _move-different-level:

Method 2: Move a description to a different level
-------------------------------------------------

An authenticated (i.e. logged in) user with the proper permissions (see:
:ref:`User roles <user-roles>` and :ref:`edit-user-permissions`)
can also move a description from one level to another, or even from one
:term:`fonds` or :term:`collection` (or other top-level description), by
using the "Move" button located in the :term:`button block` of an
:term:`archival description's <archival description>` :term:`view page`. A
lower level of description can also be moved so that it becomes a new
:term:`parent <parent record>` description.

.. IMPORTANT::

   Moving any description using this method also moves all :term:`child-level
   descriptions <child record>` of the description being moved. For example,
   if you move a series that has file-level descriptions attached, all the
   file-level descriptions will be moved along with the series.

   If you wanted to move a description **without** moving all of its
   children, you could 1) Create a duplicate of the description 2) Move the
   duplicate record to its new position, and then 3) Edit the original
   description (with the children). See above,  :ref:`Duplicate an existing
   archival description <duplicate-archival-description>`.


**To move an archival description:**

1. Navigate to the :term:`child description <child record>` that you wish to
   move. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`Access content <access-content>` for more information on navigation
   in AtoM.
2. At the bottom of the description's :term:`view page`, press the "Move"
   button, located in the :term:`button block`.

.. image:: images/button-block-description.*
   :align: center
   :width: 85%
   :alt: An image of the button block on an archival description view page

3. You will be redirected to the Move page, which lists all top-level (i.e.
   :term:`parent <parent record>`) descriptions, and provides a search bar.
4. To find your move location more quickly ou can use the Move search bar to
   bring up results in the Move browse results listed below. For example, if
   you don't know the name of a series record but you do know the name of the
   :term:`fonds` or :term:`collection`, you could search for the top-level
   description and then use the Move browser (below) to navigate to the
   correct level of description.

.. image:: images/move-description.*
   :align: center
   :width: 85%
   :alt: An image of the move page

5. The blue hyperlinks allow Users to drill down into the hierarchy of the
   :term:`archival description` selected.  Clicking on a top-level description
   in the Move page will display the description's lower levels of description
   - for example, clicking on a :term:`fonds` would reveal the series or sous-
   fonds below it, and clicking on the series would then reveal the files
   below it. To orient yourself, a :term:`breadcrumb trail` will appear above
   the list of potential archival descriptions, indicating where in the
   :term:`archival unit's <archival unit>` you are currently located -
   this is intented to help Users understand if they are moving the record to
   a sous-fonds, series, sub-series, or a file.

.. image:: images/move-breadcrumb.*
   :align: center
   :width: 85%
   :alt: An image of the breadcrumb trail on a move page

6. If there are no more lower-level descriptions beneath the current level you
   are exploring in the move browser, then the move browser will be empty, as
   you can no longer drill down any lower in the hierarchy.

.. image:: images/move-no-lower.*
   :align: center
   :width: 85%
   :alt: An image of the move browser, showing a lowest level of description

7. When you have reached the right level where you want to move the record,
   the new :term:`parent description<parent record>` should be the last
   breadcrumb in the :term:`breadcrumb trail`, while the new siblings will be
   listed as hyperlinks below. Click "Move here" in the :term:`button block`
   to move the record.

.. image:: images/button-block-move.*
   :align: center
   :width: 75%
   :alt: An image of the button block on a move page

8. To make a child-level description a top-level description (e.g. to turn a
   series into a :term:`fonds`), click "Move here" **without** selecting one
   of the blue links.
9. You will be redirected to the moved record's :term:`view page`. If you look
   at the :term:`treeview` located in the :term:`context menu` on the left-
   hand side of the description's view page, you will see that your
   description has been moved to a new location.


:ref:`Back to top <archival-descriptions>`

.. _delete-archival-description:

Delete an archival description
==============================

An authenticated (i.e. logged in) user with the proper permissions (see:
:ref:`User roles <user-roles>` and :ref:`edit-user-permissions`)
can delete an :term:`archival description` at any time, by navigating to the
description and using the :term:`Delete button` located in the
:term:`button block`.

.. IMPORTANT::

   **Consequences of deleting an archival description in AtoM:**

   * If the record has lower-level descriptions registered to it, **all the
     lower-level records are also deleted** - i.e. if you delete a series, any
     sub-series, files, or items that belong to the series will also be
     deleted
   * Any date :term:`events <event>` (i.e. date(s) of creation, of
     publication, of contribution, etc.) associated with the description are
     deleted
   * The :term:`authority record` of the associated :term`creator` is **not**
     deleted
   * The :term:`archival institution` record of the associated
     :term:`repository` is **not** deleted

**To delete an archival description:**

1. Navigate to the :term:`archival description` that you would like to
   permanently delete. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`Access content  <access-content>` for more information on navigation
   in AtoM.
2. Scroll to the bottom of the description's :term:`view page`, and click the
   :term:`Delete button` located in the :term:`button block`.

.. image:: images/button-block-description.*
   :align: center
   :width: 85%
   :alt: An image of the button block on an archival description view page

3. AtoM will provide a warning and prompts you to confirm that you really wish
   to delete the description. If :term:`child descriptions <child record>`
   will be deleted as well,the warning will list them. If you are sure you
   want to delete the record and all of its descendants/children, click
   "Delete".

.. image:: images/description-delete-warning.*
   :align: center
   :width: 85%
   :alt: An image of a description delete warning

.. WARNING::

   Deleting a description is a permanent operation that cannot be undone, and
   the associated data will be removed from AtoM's database. Be sure that you
   want to delete a record before confirming the operation.

4. AtoM deletes the record and returns you to the :term:`parent record` of the
   deleted description or to the browse page if the deleted record was a top-
   level description.

:ref:`Back to top <archival-descriptions>`
