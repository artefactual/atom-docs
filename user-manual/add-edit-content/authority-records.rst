.. _authority-records:

=================
Authority records
=================

Authority records are one of the core :ref:`entity-types` in AtoM and provide
users with a means to control the representation of information about actors -
:term:`corporate bodies <corporate body>`, persons, or families - who interact
with archival materials, typically as :term:`creators <creator>`. Typically,
authority records contain information about the authorized form of name and
other forms of name by which the actor is known, dates of existence, relevant
administrative or biographical history details, and other contextual
information; additionally, roles in :term:`events <event>` and relationships
with archival materials are also captured and expressed.

The International Council on Archives (`ICA <http://www.ica.org/>`__) defines
an authority record as "*The authorized form of name combined with other
information elements that identify and describe the named entity and may also
point to other related authority records.*" Maintaining contextual
information about records :term:`creators <creator>` and other actors is
essential to archival practice, and helps establish the provenance and
authenticity of the related records. Additionally, archival authority records,
like library authority records, can be used to control the creation and use of
:term:`access points <access point>`, thereby improving access for
:term:`researchers <researcher>` and other members of the public. By
maintaining authority records separately from :term:`archival descriptions
<archival description>`, complex relationships of creation and contribution
can be expressed, even between materials held by different :term:`archival
institutions <archival institution>` or in different kinds of
:term:`repositories <repository>` such as libraries and museums. By using a
recognized international standard to control the creation of authority
records, :term:`archival institutions <archival institution>` have the
opportunity to share authority records. As the `ICA <http://www.ica.org/>`__
notes,

      "*Such standardization is of particular international benefit when the
      sharing or linking of contextual information is likely to cross national
      boundaries. The multinational character of past and present record
      keeping creates the incentive for international standardization which
      will support the exchange of contextual information. For example,
      processes such as colonialization, immigration and trade have
      contributed to the multinational character of recordkeeping.*" (ISAAR
      Introduction)

In AtoM, the :term:`data elements <data element>` used to describe
authority records are based on the `ICA's <http://www.ica.org/>`__
*International Standard Archival Authority Record for Corporate Bodies,
Persons and Families*, or :ref:`ISAAR(CPF) <isaar-template>`.

.. image:: images/authority-record-example.*
   :align: center
   :width: 75%
   :alt: An image of an Authority record in AtoM

.. _authority-bioghist-access:

AtoM, Authority records, Biographical histories, and Access points
=======================================================================

In AtoM, authority records are maintained separately from archival
descriptions, but can be :ref:`linked <link-authority-to-description>` to them
by adding persons, families, or :term:`corporate bodies <corporate body>` as
:term:`creators <creator>` or as name :term:`access points <access point>`.
To take advantage of this capability, and to enforce greater standards
compliance, AtoM's standards-based archival description templates for
:ref:`ISAG(G) <isad-template>`, :ref:`RAD <rad-template>`, and
:ref:`DACS <dacs-template>`, there is no :term:`field` provided for an
administrative or biographical history, despite the fact that
such a field exists in all three related standards.

This is not because the data cannot be added - rather it is because as a
database, AtoM provides a method of  pulling the related administrative or
biographical history from the :term:`authority record`, directly into the
linked description. Here's why:

ISAD(G) defines 3.2.2 Administrative / Biographical history in the following way:

    **Purpose:** *To provide an administrative history of, or biographical details
    on, the creator (or creators) of the unit of description to place the
    material in context and make it better understood.*
    **Rules:** *Record concisely any significant information on the origin,
    progress, development and work of the organization (or organizations) or
    on the life and work of the individual (or individuals) responsible for
    the creation of the unit of description.*

The entry in ISAD 3.2.2 goes on to indicate that the
:ref:`ISAAR(CPF) <isaar-template>` standard (for :term:`authority record`
creation) be consulted for specific informational elements that may be
included. As such, the 3.2.2 :term:`field` is not intended to include
information that is particular to either the :term:`archival description`,or
the :term:`fonds`, or its internal management - instead, it should **only**
contain general historic information that is included in the description
to provide greater context. Separate maintenance of authority records is also
discussed at 1.5, 1.6, and 1.8 of the ISAAR-CPF standard.

The Canadian Rules for Archival Description (:ref:`RAD <rad-template>`) is even
more explicit, noting in a footnote that:

    *If the institution maintains a separate file containing authority records
    for persons, families and corporate bodies, etc., the biographical
    information or administrative history may be kept as part of the record
    for that person, family, or corporate body and, therefore, does not have
    to be given in the description of the material. This enables the same
    authority record and the biographical information or administrative
    history that it contains, to be used for other descriptions and used in
    finding aids and products, e.g., when the name is associated with a
    subject index entry, or the same person, family or corporate body occurs
    in other descriptions.* (footnote 25, 1-52)

This echoes the conclusions of the United States archival standard,
Describing Archives: A Content Standard (:ref:`DACS <dacs-template>`):

    *Information about the corporate body, person, or family that created,
    assembled, accumulated, and/or maintained and used the materials being
    described may be described in one of two ways: 1. Incorporated into the
    description using biographical/historical notes. 2. Held in a separate
    system of authority files that are linked to the archival descriptions and
    displayed together.*

In light of this, and in an effort to provide greater re-usability of
:term:`authority records <authority record>` (and hence more authority control
overall) in the application, AtoM behaves in several specific ways:

* Whenever a new :term:`name` is added to a description (either as a
  :term:`creator`, or as a name :term:`access point`), a new stub
  :term:`authority record` is automatically generated for that person, family,
  or :term:`corporate body`, which can then be supplemented by navigating to the
  authority record itself. The new authority record is linked to the
  :term:`archival description`, and the new name will now appear in the
  autocomplete :term:`drop-downs <drop-down menu>` when a user starts typing
  to add any other creator names or name access points in subsequent
  descriptions.
* When a :term:`creator` name is added to an :term:`archival description`, the
  biographical/administrative history for that creator will appear at the level
  of description where the name has been added, but will not repeat at lower
  levels. The creator name **will** be inherited by lower levels however, unless
  a different name is explicitly added at a lower level. By inheriting the name,
  AtoM supports the recommended practice of not repeating information
  unnecessarily at lower levels of description.
* If a user navigates to the related :term:`creator's <creator>`
  :term:`authority record` and edits it, adding data to the "History"
  :term:`field` (ISAAR-CPF 5.2.2), that data will appear in the related
  :term:`archival description` as the administrative or biographical history.
  If the authority record's entity type is set to "Person" or "Family",
  the history will display as a Biographical history in the related description
  under the creator name; if the entity type is set "Corporate body," it will
  appear as an Administrative history.
* Similarly, any Administrative / biographical history data in an archival
  description `EAD <http://www.loc.gov/ead/>`__ import (i.e. data contained in
  the ``<bioghist>`` EAD element) will be mapped to the "History"
  :term:`field` (ISAAR-CPF 5.2.2) in the related :term:`authority record`,
  (generated from the data contained in the ``<origination>`` element of the EAD)
  and then is presented in AtoM in any related descriptions where the entity
  is listed as a creator.
* Where multiple creator names and histories are included in an import,
  ``<origination>`` and ``<bioghist>`` elements are matched 1:1 in the  order they
  appear in the EAD.
* If a ``<bioghist>`` element is included in an EAD import, but no creator
  name is included, AtoM will still automatically generate a stub
  :term:`authority record` and map the ``<bioghist>`` data to the "History"
  :term:`field` (ISAAR-CPF 5.2.2) - the authority record will be left
  untitled, until the user manually adds the appropriate :term:`name` to the
  authority record. Similarly, if there are more ``<bioghist>`` elements
  included in an import than creator names included in ``<origination>``
  elements, the final biographical/administrative history will be mapped to an
  untitled authority record.

.. SEEALSO::

   * :ref:`term-name-vs-subject`
   * :ref:`ead-actors-import`
   * :ref:`csv-actors-import`


**Below are instructions for using the AtoM Authority records module to:**

* :ref:`Create a new authority record <create-authority-record>`
* :ref:`Edit an existing authority record <edit-authority-record>`
* :ref:`authority-access-points`
* :ref:`link-authority-to-description`
* :ref:`link-repo-actor`
* :ref:`link-two-authority-records`
* :ref:`link-authority-record-function`
* :ref:`delete-authority-record`

.. TIP::

   For more information on using the specific :term:`fields <field>` within
   the Authority record template, see: :ref:`ISAAR template <isaar-template>`

.. SEEALSO::

   * :ref:`add-term-fly`
   * :ref:`formatting`
   * :ref:`entity-types`
   * :ref:`Exit edit mode <exit-edit-mode>`
   * :ref:`term-name-vs-subject`
   * :ref:`import-actor-xml`
   * :ref:`csv-import-authority-records-gui`


.. _create-authority-record:

Create a new authority record
=============================

The `ICA's <http://www.ica.org/>`__ model of authority record use and
maintenance means that separate records are created for all actors (persons,
families, and :term:`corporate bodies <corporate body>`), which can then be
linked to related :term:`archival descriptions <archival description>`. In AtoM
this process has been automated wherever possible to simplify the workflow -
consequently, a new :term:`authority record` is automatically created any time
a new name (such as a :term:`creator` name or a name :term:`access point`) is
associated with a description. This means that there are several different
ways to create new authority records:

* :ref:`From the main menu <add-authority-main>`
* :ref:`From a related archival description <add-authority-description>`
* :ref:`From an authority record view page <add-authority-view-page>`

.. NOTE::

   To create new authority records, you must be logged in to AtoM with a
   :term:`user account` with sufficient edit permissions to create authority
   records, such as an :term:`administrator`, :term:`editor`, or
   :term:`contributor`. For more information on types of users and edit
   permissions, see :ref:`User roles <user-roles>`

.. _add-authority-main:

Add a new authority record from the main menu
---------------------------------------------

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

1. In the :term:`main menu` located in the :term:`header bar`, click the
   |plus|:ref:`"Add" <main-menu-add>` and select "Authority record".
   Alternatively, navigate to an authority record view page and click the
   :term:`"Add new" button <add new button>` in the :term:`button block`. AtoM
   takes you to a blank edit page for data entry.

.. image:: images/add-authority-record.*
   :align: center
   :width: 30%
   :alt: An image of the Add menu's options

2. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it.

.. image:: images/new-authority-record.*
   :align: center
   :width: 80%
   :alt: An image of a new authority record

3. Enter data as required. The authority record edit template is based on the
   `ICA's <http://www.ica.org/>`__ *International Standard Archival Authority
   Record for Corporate Bodies, Persons and Families*
   (`ISAAR <https://www.ica.org/isaar-cpf-international-standard-archival-authority-record-corporate-bodies-persons-and-families-2nd>`__).
   For more information on the use of particular fields in the ISAAR authority
   record edit template, see: :ref:`ISAAR(CPF) <isaar-template>`.
4. You can quit the creation process at any time by clicking the "Cancel"
   button in the :term:`button block`; any data already entered will not be
   saved, and no new record will be created. Note that simply navigating away
   from the page by any other means, **without first clicking "Create"** will
   also result in no new record being created.
5. To save the new record, click the :term:`"Create" button <create button>`
   located in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 75%
   :alt: An image of the create button on a new authority record

Once the new :term:`authority record` is saved, you will be redirected to the
record's :term:`view page`, where you can review your work. Clicking "Edit"
in the :term:`button block` at the bottom of the record will re-open the
authority record in :term:`edit mode`.

.. IMPORTANT::

   Currently, there is no "Draft" publication status for an :term:`authority
   record` in AtoM. This means that as soon as you create an authority record,
   it will be visible to public users (i.e. unauthenticated users who are not
   logged in). Unauthenticated users will not have access to the
   :term:`button block`, and cannot edit the record.

.. _add-authority-description:

Add a new authority record from a related archival description
--------------------------------------------------------------

In AtoM, whenever a new name is added to an archival description (generally,
either as a :term:`creator` or as a subject by adding a name :term:`access
point`), an authority record is automatically created for the new name. AtoM
:term:`creator` names and name :term:`access points  <access point>` are added
via a :term:`value list` that appears in a :term:`drop-down menu` - as you type
data into the :term:`field`, the value list will narrow its options to present
related suggestions. If an authority record already exists, you can select the
name from the values and a link will be created. If no authority record
already exists, however, new names can be added "on the fly" in these fields:

* :ref:`Creator names <authority-record-creator-names>`
* :ref:`Name access points <authority-record-name-access>`

.. TIP::

   When you are finished creating or editing your :term:`archival
   description`, the new names will appear in the archival description as
   hyperlinks to the new :term:`authority records <authority record>`. The
   authority records generated this way ("on the fly") are merely stub records
   or placeholders - after reviewing your archival description, you should
   follow the hyperlink to the authority record, where you can edit it to
   supplement the contents, such as indicating if it is a person, family, or
   :term:`corporate body`, and adding dates of existence, history, etc. For
   more information on working with the ISAAR-CPF Authority record template
   :term:`fields <field>`, see: :ref:`ISAAR-CPF <isaar-template>`. For more
   information on editing an authority record, see below, :ref:`Edit an
   existing authority record <edit-authority-record>`.


.. _authority-record-creator-names:

Adding Creator names
^^^^^^^^^^^^^^^^^^^^

Whenever a new :term:`creator` name is added to an archival description, a
new :term:`authority record` for that name will be generated when the
:term:`archival description` is saved. Because each edit template uses
different labels for the field to add a new creator, template specific
instructions have been included below.

.. TIP::

   **Creators added will inherit to lower-levels of description.** In an effort
   simplify the description workflow, lower-levels of description in AtoM will
   automatically inherit the :term:`creator` name(s) added at higher levels. So
   for example, if you add a creator to a :term:`fonds`-level description, you
   do not need to add the same name to all of the series, files, and items below -
   the name will automatically appear in the :term:`view page` of the lower-level
   descriptions, unless a different creator name is explicitly added in the
   :term:`edit page`. This behavior conforms with the principles outlined in
   :ref:`ISAD <isad-template>` 2.4, which states: "*At the hightest appropriate
   level, give information that is common to the component parts. Do not repeat
   information at a lower level of description that has already been given at a
   higher level.*"

.. IMPORTANT::

   The creator name :term:`fields <field>` in AtoM are auto-complete fields -
   as you type AtoM will look for matches in the existing
   :term:`authority records <authority record>`. If you type a name quickly
   and press enter or move away from the field, AtoM will create a **new**
   authority record instead of linking to an existing one, even if you have
   entered the name identically to an existing one. If you are intending to
   link to an existing authority record instead of creating a new one, be sure
   that you wait for the autocomplete and select the matching record from the
   :term:`drop-down menu`! For more information on linking to an existing
   authority record, see below: :ref:`link-authority-to-description`

**ISAD(G) edit template**

* In the "Context :term:`area <information area>`" of the :ref:`ISAD(G)
  template <isad-template>`, enter a new name in the :term:`field` named "Name
  of creator(s)."
* The name will be saved as a new :term:`authority record` when you save the
  :term:`archival description`.

.. image:: images/add-creator-isad.*
   :align: center
   :width: 75%
   :alt: An image of adding a new creator in the ISAD template

**Rules for Archival Description (RAD) edit template**

* In the "Dates of creation" :term:`information area` of the :ref:`RAD
  template <rad-template>`, click the "Add new" button that appears under the
  heading, "Add new name and/or date(s)."
* A dialog will appear with several fields, including "Actor name," "Event
  type," "Date," etc.
* Enter a new name in the "Actor name" field of the pop-up dialog, and then
  click "Submit". The name will be saved as a new :term:`authority record`
  when you save the :term:`archival description`.

.. image:: images/add-creator-rad.*
   :align: center
   :width: 60%
   :alt: An image of adding a new creator in the RAD template

**Describing Archives: A Content Standard (DACS) edit template**

* In the "Identity elements" :term:`information area` of the :ref:`DACS
  template <dacs-template>`, navigate to the "Name of creator(s)" section, and
  enter a new name. The name will be saved as a new :term:`authority record`
  when you save the :term:`archival description`.

.. image:: images/add-creator-dacs.*
   :align: center
   :width: 75%
   :alt: An image of adding a new creator in the DACS template

**Dublin Core Version 1.1 (DC) edit template**

* In the :ref:`Dublin Core template <dc-template>`, there is only one main
  :term:`information area`, in which a section called "Name(s)" appears, close
  to the top of the record's :term:`edit page`.
* Navigate to the "Name(s)" section, and under the :term:`field` labelled
  "Actor name," enter a new  name.
* The name will be saved as a new :term:`authority record` when you save the
  :term:`archival description`.

.. image:: images/add-creator-dc.*
   :align: center
   :width: 75%
   :alt: An image of adding a new creator in the DC template

**Metadata Object Description Schema (MODS) edit template**

* In the :ref:`MODS template <mods-template>`, there is only one main
  :term:`information area`, in which a section called "Names and origin info"
  appears, close to the top of the record's :term:`edit page`.

.. image:: images/add-creator-mods1.*
   :align: center
   :width: 75%
   :alt: An image of adding a new creator in the MODS template

* Navigate to the "Names" and origin info section, and click the "Add new"
  button that appears under the heading, "Add new name and/or date(s)."

.. image:: images/add-creator-mods.*
   :align: center
   :width: 60%
   :alt: An image of adding a new creator in the MODS template

* Enter a new name in the "Actor name" field of the pop-up dialog, and then
  click "Submit". The name will be saved as a new :term:`authority record`
  when you save the :term:`archival description`.

.. _authority-record-name-access:

Adding Name access points
^^^^^^^^^^^^^^^^^^^^^^^^^

The :ref:`ISAD(G) <isad-template>`, :ref:`RAD <rad-template>`, and :ref:`DACS
<dacs-template>` content standards support the inclusion of name
:term:`accesss points <access point>` in :term:`archival descriptions
<archival description>`; consequently, an "Access points" :term:`information
area` with a :term:`field` for name :term:`access points <access point>` has
been included on these templates.

This field can be used to create an :term:`authority record` for a person,
family, or :term:`corporate body` who is the subject of an archival
description, but not its :term:`creator`. Type a new name into a Name
:term:`access point` :term:`field`. When you save the :term:`archival
description` record, AtoM creates a new :term:`authority record` for the
name.

.. image:: images/add-authority-fly.*
   :align: center
   :width: 85%
   :alt: An image of creating a new authority record on the fly

.. seealso::

   * :ref:`term-name-vs-subject`

.. _add-authority-view-page:

Add a new authority record from an authority record view page
-------------------------------------------------------------

A new :term:`authority record` can also be added to AtoM from the :term:`view
page` of any other authority record via the "Add new" button in the
:term:`button block`. To do so:

1. Navigate to an existing :term:`authority record` in AtoM. You can do this
   by :ref:`browsing <browse>` or by :ref:`searching <search-atom>` for a
   specific :term:`authority record` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. At the bottom of the authority record's :term:`view page`, you will see the
   :term:`button block` with several options (Edit, Delete, and Add new).
   Click "Add new".

.. image:: images/authority-add-from.*
   :align: center
   :width: 85%
   :alt: An image of the Add new button on an existing authority record

3. Enter data as required. The authority record edit template is based on the
   `ICA's <http://www.ica.org/>`__ *International Standard Archival Authority
   Record for Corporate Bodies, Persons and Families*
   (`ISAAR <https://www.ica.org/isaar-cpf-international-standard-archival-authority-record-corporate-bodies-persons-and-families-2nd>`__).
   For more information on the use of particular fields in the ISAAR authority
   record edit template, see: :ref:`ISAAR(CPF) <isaar-template>`.
4. You can quit the creation process at any time by clicking the "Cancel"
   button in the :term:`button block`; any data already entered will not be
   saved, and no new record will be created. Note that simply navigating away
   from the page by any other means, **without first clicking "Create"** will
   also result in no new record being created.
5. To save the new record, click the :term:`"Create" button <create button>`
   located in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 75%
   :alt: An image of the create button on a new authority record

Once the new :term:`authority record` is saved, you will be redirected to the
record's :term:`view page`, where you can review your work. Clicking "Edit"
in the :term:`button block` at the bottom of the record will re-open the
authority record in :term:`edit mode`.

.. SEEALSO::

   * :ref:`authority-access-points`

:ref:`Back to top <authority-records>`

.. _edit-authority-record:

Edit an existing authority record
=================================

1. First, navigate to an existing :term:`authority record` in AtoM. You can do
   this by :ref:`browsing <browse>` or by :ref:`searching <search-atom>` for a
   specific :term:`authority record` - see :ref:`access-content` for more
   information on navigation in AtoM. See :ref:`ISAAR-CPF <isaar-template>`
   for more information on specific fields in the authority record edit
   template.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it
4. Add and/or revise data as required.
5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no changes being saved to the
   authority record.
6. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when editing an authority record

You will be redirected to the :term:`view page` for the edited
:term:`authority record`, where you can review your work.

.. TIP::

   Did you know that you can also use a CSV import to update your authority
   records? See:

   * :ref:`csv-update-actors`

:ref:`Back to top <authority-records>`

.. _authority-access-points:

Add access points to your authority record
==========================================

The International Council on Archives' :ref:`ISAD(G) <isad-template>` standard
defines an :term:`access point` as a "*name, term, keyword, phrase or code that
may be used to search, identify and locate an archival description.*" Access
points help users not only understand contextual information, but discover further
related content. In AtoM, you can now apply access points to an
:term:`authority record` as well.

In AtoM, access points are controlled value :term:`terms <term>` maintained in a
:term:`taxonomy`, which can be used to aid in discovery. With the 2.5 release,
AtoM supports three types of access points for authority records - Occupations,
Places, and Subjects. By default in a new installation, the related taxonomy is
empty, but as users add access point data to authority records, they are
preserved as terms in the Actor occupation, Places, and Subjects taxonomies, so
they can be managed and reused. For more information on working with terms and
taxonomies in AtoM, see: :ref:`terms`.

Each of the three access points includes an autocomplete field linked to the
relevant taxonomy. The Actor occupations entry also includes a free-text note
field, where you can add further context specific to the person, family, or
corporate body described in the related :term:`authority record`.

Once access points have been added to your authority records, they
will show up as a :term:`facet <facet filter>` on the authority record browse
page. The following example shows the occupation taxonomy:

.. image:: images/occupations-facet.*
   :align: center
   :width: 75%
   :alt: An image of the authority record browse page, with the Occupations facet
         visible in the left-hand context menu.

.. SEEALSO::

   * :ref:`browse-authority-records`
   * :ref:`Search for authority records <dedicated-search-authority>`


**To add access points to your authority record:**

1. First, navigate to an existing :term:`authority record` in AtoM. You can do
   this by :ref:`browsing <browse>` or by :ref:`searching <search-atom>` for a
   specific :term:`authority record` - see :ref:`access-content` for more
   information on navigation in AtoM. See :ref:`ISAAR-CPF <isaar-template>`
   for more information on specific fields in the authority record edit
   template.

.. TIP::

   You can always add access points to new authority records as you create them
   as well - for more information on creating authority records, see above:

   * :ref:`add-authority-main`

   Steps 4-7 of these instructions will provide further specific guidance on
   using the access point fields.

2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it
4. Navigate to the Access points :term:`area <information area>`, near the
   bottom of the :term:`edit page`. If it is not already expanded to display
   the available fields, you can click on the "Access points" :term:`area header`
   to expand it.

.. image:: images/access-points-edit-empty.*
   :align: center
   :width: 75%
   :alt: An image of the Access points area in an Authority record

5. Add data as required to each :term:`access point` for "Occupation", "Place",
   and "Subject". Each :term:`field` is an auto-complete field, linked to the
   relevant :term:`taxonomy`. If you have previously added terms to the
   taxonomies, then as you type, matches will appear below - click on a matching
   term that appears in the :term:`drop-down menu` to select it. Alternatively,
   you can create a new access point simply by entering it into the field - on
   save, the access point will be saved as a :term:`term` in the relevant
   taxonomy so you can reuse it in the future. The image below shows examples
   for the Occupation access point.

.. image:: images/occupations-autocomplete.*
   :align: center
   :width: 75%
   :alt: An image of the terms drop-down beneath the Occupations field as a user
         types

.. IMPORTANT::

   If you are not careful, it is easy to accidentally create duplicate terms!
   To avoid duplication, matching terms **must** be selected from the
   auto-complete :term:`drop-down <drop-down menu>` - otherwise, even exact
   matches will create duplicates when the user presses enter.

6. The "Note" :term:`field` available for Occupation access points is a
   free-text field where you can add further contextual information specific to
   the current person, organization, or family being described. This note data
   is **not** stored in the Actor occupations taxonomy - it is only associated
   with the current :term:`authority record`.

.. image:: images/occupations-autocomplete.*
   :align: center
   :width: 75%
   :alt: An image of the Note field in the Occupations access point

7. You can add multiple access points at once, as needed. To add an additional
   :term:`access point`, click the "Add new" link beneath the access point fields.
   AtoM will add a new row of fields, and you can continue your data entry as
   needed. If you decide you wish to remove one or more of the access points,
   click the **X** to the right of the Note field, and AtoM will delete the row.

.. NOTE::

   If you have added a new access point and saved your record, then re-entering
   :term:`edit mode` and deleting the access point  will **only** remove it from
   the :term:`authority record` - it will **not** delete the term from the Actor
   occupations taxonomy. If you wish to delete the term from AtoM completely,
   you will need to do so via **Manage > Terms**. For more information, see:

   * :ref:`Delete a term <delete-term>`

8. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block` at the bottom of the page; any changes made
   will not be saved. Note that simply navigating away from the page by any
   other means, **without first clicking "Save"** will also result in no
   changes being saved to the authority record.
9. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when editing an authority record

You will be redirected to the :term:`view page` for the edited
:term:`authority record`, where you can review your work.

.. SEEALSO::

   * :ref:`terms`
   * :ref:`edit-authority-record`
   * :ref:`add-authority-main`
   * :ref:`browse-authority-records`

:ref:`Back to top <authority-records>`

.. _link-authority-to-description:

Link an existing authority record to an archival description
============================================================

Links between existing authority records and existing archival descriptions
can be added at any time by an authenticated (i.e. logged in) user with
sufficient edit permissions. For more information on types of users and edit
permissions, see :ref:`User roles <user-roles>`. There are two main ways to
create a link between an authority record and an archival description:

* :ref:`From the archival description <authority-link-from-description>`
* :ref:`From the authority record <authority-link-from-authority>`

.. _authority-link-from-description:

From the archival description
-----------------------------

.. NOTE::

   If you are linking an authority record as a :term:`creator`, contributor,
   or other role other than as a name access point, the exact instructions
   will be particular to which standards-based description template you are
   using (e.g. ISAD, RAD, DACS, Dublin Core, MODS). Specific details on the
   location of the relevant field in each template have been included in the
   section above - when you reach step 3, see:
   :ref:`authority-record-creator-names` for further guidance if necessary.

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
   :alt: An image of the button block on an archival description

3. To create a link to an authority record for a **creator**, follow the steps
   above for :ref:`adding a new creator <authority-record-creator-names>` -
   however, instead of entering a new name, begin typing the name of the
   authority record to which you would like to create a link. The name
   :term:`field` is an auto-complete - as you type, matching results will
   load in a :term:`drop-down menu` below the field. When you see the
   authority record you would like to link, click on it to select it.

.. figure:: images/add-creator-isad.*
   :align: center
   :figwidth: 85%
   :width: 100%
   :alt: An image of linking an authority record in ISAD

   This image shows an example of linking an authority record as a creator in
   the ISAD(G) template. For template specific instructions, see the section
   above, :ref:`authority-record-creator-names`

.. IMPORTANT::

   This method makes use of  an `auto-complete <https://en.wikipedia.org/wiki
   /Auto-complete>`__ field to find the related :term:`authority record` as
   you begin to type its name/title. **Be sure** to pick the record from the
   :term:`drop-down <drop-down menu>` when it appears - if you type the full
   name and press enter, a new :term:`authority record` will be generated
   instead of a link being created to an existing one!

4. To create a link to an authority record as a **name access point**, scroll
   down to the "Access points" :term:`information area` and in the Name access
   points field, begin typing the name of the authority record to which you
   would like to create a link. The name :term:`field` is an auto-complete -
   as you type, matching results will load in a :term:`drop-down menu` below
   the field. When you see the authority record you would like to link, click
   on it to select it.

.. image:: images/link-authority-record.*
   :align: center
   :width: 85%
   :alt: An image of linking an authority record

.. IMPORTANT::

   This method makes use of  an `auto-complete <https://en.wikipedia.org/wiki
   /Auto-complete>`__ field to find the related :term:`authority record` as
   you begin to type its name/title. **Be sure** to pick the record from the
   :term:`drop-down <drop-down menu>` when it appears - if you type the full
   name and press enter, a new :term:`authority record` will be generated
   instead of a link being created to an existing one!

5. To create links to multiple authority records, you can repeat this process
   as needed - both the creator fields, and the name access point fields in
   AtoM will allow for multiple entries.

6. When you are done editing the record, save the
   :term:`archival description` by scrolling down and pressing "Save" in the
   :term:`button block`.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when editing an archival description

7. The :term:`archival description` will reload in :term:`view mode`. You
   should be able to see the creator name as a hyperlink on the archival
   description. Follow the link to ensure you have linked to the proper
   :term:`authority record`. The linked archival description will also appear
   in the "Relationships" :term:`information area` of the :term:`authority
   record`.

.. TIP::

   **Creators added will inherit to lower-levels of description.** In an effort
   simplify the description workflow, lower-levels of description in AtoM will
   automatically inherit the :term:`creator` name(s) added at higher levels. So
   for example, if you add a creator to a :term:`fonds`-level description, you
   do not need to add the same name to all of the series, files, and items below -
   the name will automatically appear in the :term:`view page` of the lower-level
   descriptions, unless a different creator name is explicitly added in the
   :term:`edit page`. This behavior conforms with the principles outlined in
   :ref:`ISAD <isad-template>` 2.4, which states: "*At the hightest appropriate
   level, give information that is common to the component parts. Do not repeat
   information at a lower level of description that has already been given at a
   higher level.*"

.. _authority-link-from-authority:

From the authority record
-------------------------

1. First, navigate to the :term:`authority record` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. In the "Relationships" :term:`information area` of the authority record's
   :term:`edit page`, click the "Add new" button under "Related resources".

.. image:: images/authority-add-relation-description.*
   :align: center
   :width: 85%
   :alt: An image of the Relationships area in an authority record

4. AtoM will open a pop-up dialog where you can select the related
   :term:`archival description` and define the nature and time frame of the
   relationship.
5. The first :term:`field` in the pop-up dialog, "Title of the related
   resource," is an `auto-complete <https://en.wikipedia.org/wiki /Auto-
   complete>`__ field: as you type, matching results will load in a :term
   :`drop-down menu` below the field. When you see the
   :term:`archival description` you would like to link, click on it to select
   it.

.. image:: images/authority-relation-dialog-description.*
   :align: center
   :width: 55%
   :alt: An image of the Relationships dialog in AtoM

6. Add additional details in the subsequent fields to qualify the
   relationship: the "Nature of relationship" field is a :term:`drop-down
   menu` whose values are pulled from the Event types :term:`taxonomy` (see
   :ref:`terms` for more information on working  with taxonomies); start, end,
   and display dates can be added as well. When you are finished, click "Submit".
7. The related :term:`archival description` will now appear in the Related
   resources table of the Relationships area. Click the pencil icon to re-open
   the pop-up dialog and edit the relationship, or click the **X** icon to
   remove the relationship link. You can also repeat this process to add
   multiple links by clicking the "Add new" button below the Related
   resources again - AtoM will open a new pop-up dialog. Repeat steps 3-7 as
   needed. If more descriptions have been linked than the global 
   :ref:`results per page <results-page>` setting (which defaults to 10 in new 
   installations), AtoM will add a pager - you can click "Show more" button 
   below the list of linked descriptions to load the next set

.. image:: images/actor-event-pager.*
   :align: center
   :width: 75%
   :alt: An image of the "Show more" button when linking many descriptions to an 
         authority record

8. When you are finished, click "Save" in the :term:`button block` at the bottom
   of the authority record's :term:`edit page` to save your changes and exit
   :term:`edit mode`.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when editing an archival description

9. AtoM will reload the :term:`authority record` in :term:`view mode`.
   The relationship link will appear in the :term:`context menu` on the
   left-hand side of the page. You can click on the related description's title
   to navigate to the related :term:`archival description`.

.. TIP::

   **Creators added will inherit to lower-levels of description.** In an effort
   simplify the description workflow, lower-levels of description in AtoM will
   automatically inherit the :term:`creator` name(s) added at higher levels. So
   for example, if you add a creator to a :term:`fonds`-level description, you
   do not need to add the same name to all of the series, files, and items below -
   the name will automatically appear in the :term:`view page` of the lower-level
   descriptions, unless a different creator name is explicitly added in the
   :term:`edit page`. This behavior conforms with the principles outlined in
   :ref:`ISAD <isad-template>` 2.4, which states: "*At the hightest appropriate
   level, give information that is common to the component parts. Do not repeat
   information at a lower level of description that has already been given at a
   higher level.*"

:ref:`Back to top <authority-records>`

.. _link-repo-actor:

Link an authority record to a repository as its maintainer
==========================================================

In a :term:`multi-repository system`, it is possible to have two authority
records for two different individuals with same name. It is also possible to
have one authority record created and maintained by a single institution, but
used as a name :term:`access point` or even as the :term:`creator` by many
other institutions in their descriptions.

To clarify who is responsible for maintaining an authority record and to
improve actor matching during imports, AtoM includes the ability to link an
authority record to an :term:`archival institution` as its maintainer.

When a link is created between an authority record and a repository, it will
additionally appear as a :term:`facet filter` on the authority record browse
page, and in the list of maintained authority records visible on the archival
institution's browse page:

.. figure:: images/maintained-auth-list.*
   :align: center
   :figwidth: 30%
   :width: 100%
   :alt: An image of list of maintained authority records on an archival
         institution's view page

.. figure:: images/maintained-facet.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: An image of the "Maintained by" facet on the authority record browse
         page

For more information on how linking a repository to an authority record can
improve import matching, see:

* :ref:`csv-actor-matching`
* :ref:`csv-update-actors`
* :ref:`actor-xml-matching`
* :ref:`delete-replace-actor-xml`

.. SEEALSO::

   * :ref:`browse-maintained-actors`
   * :ref:`recurring-facet-filters`
   * :ref:`csv-actors-import`
   * :ref:`archival-institutions`
   * :ref:`browse`

**To link an authority record to an archival institution**

1. First, navigate to the :term:`authority record` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. In the Control :term:`information area`, place your cursor in the field
   labelled "Maintaining repository":

.. image:: images/maintaining-repo.*
   :align: center
   :width: 90%
   :alt: An image of the Maintaining repository field

4. The field is an auto-complete :term:`drop-down menu` - it will show the
   first 10 repository records in the drop-down menu by default. You can also
   begin typing the name of a repository to find it - as you begin to type,
   AtoM will update the auto-complete results to show repository records that
   match. Select the matching repository to which you want to link your
   authority record from the drop-down list.
5. When you are finished, scroll down to the :term:`button block` at the
   bottom of the :term:`edit page` and click the "Save" button. AtoM will
   reload the page in :term:`view mode` so you can review your work. The
   related repository will be displayed as a hyperlink in the Control area of
   your authority record.

:ref:`Back to top <authority-records>`

.. _link-two-authority-records:

Create a relationship between two authority records
===================================================

1. First, navigate to the :term:`authority record` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. In the "Relationships" :term:`information area` of the authority record's
   :term:`edit page`, click the "Add new" button under "Related  corporate
   bodies, persons, or families".

.. image:: images/authority-add-relation-authority.*
   :align: center
   :width: 85%
   :alt: An image of the Relationships area in an authority record

4. AtoM will open a pop-up dialog where you can select the related
   :term:`authority record` and define the nature and time frame of the
   relationship.
5. The first :term:`field` in the pop-up dialog, "Title of the related
   resource," is an `auto-complete <https://en.wikipedia.org/wiki /Auto-
   complete>`__ field: as you type, matching results will load in a
   :term:`drop-down menu` below the field. When you see the
   :term:`authority record` you would like to link, click on it to select
   it.

.. image:: images/relationship-dialogue.*
   :align: center
   :width: 55%
   :alt: An image of the Relationships dialog in an authority record

.. NOTE::

   You cannot create a new authority record from this dialog by entering a
   new name. If the second authority record does not exist yet, follow the
   steps above to :ref:`create a new authority record <create-authority-record>`
   and then follow these steps from the new record to create the
   relationship.

6. The "Type of relationship" field is pre-populated with default terms,
   pictured in the image below. These terms can be edited and managed in the
   Actor Relation Type :term:`taxonomy`, and new terms can be added as well.
   For more information on managing terms, see: :ref:`terms`; see specifically
   :ref:`add-converse-term`.

.. image:: images/relationship-type-defaults.*
   :align: center
   :width: 85%
   :alt: An image of the Relationship type default terms

7. Add additional details in the subsequent fields to qualify the
   relationship. When you are finished, click "Submit".

.. image:: images/donor-dialog-submit.*
   :align: center
   :width: 65%
   :alt: An image of the submit button in the Relationships dialog

8. The related :term:`authority record` will now appear in the *Related
   corporate bodies, persons, or families* table of the Relationships area.
   Click the pencil icon to re-open the pop-up dialog and edit the
   relationship, or click the **X** icon to remove the relationship link. You
   can also repeat this process to add multiple links by clicking the "Add
   new" button below the *Related corporate bodies, persons, or families*
   again - AtoM will open a new pop-up dialog. Repeat steps 3-6 as needed.

.. image:: images/relationships-area-edit.*
   :align: center
   :width: 75%
   :alt: An image of the relationships area in the edit template

.. NOTE::

   The amount of related authorities shown by default in the *Related corporate 
   bodies, persons, or families* table is determined by the global 
   :ref:`results per page <results-page>` setting, which defaults to 10 in new 
   installations unless adjusted by an :term:`administrator`. If more 
   relationships have been added than the global results per page value, AtoM 
   will display a "Show more" button beneath the table - click it to load the 
   next set of relationships. 

9. When you are finished, click "Save" in the :term:`button block` at the bottom
   of the authority record's :term:`edit page` to save your changes and exit
   :term:`edit mode`.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when in Edit mode

10. AtoM will reload the :term:`authority record` in :term:`view mode`.
    relationship is expressed in the "Relationships" :term:`information area`
    of the authority record's :term:`view page`, and the related record's name
    will appear as a hyperlink.

.. image:: images/relationships-area-view.*
   :align: center
   :width: 75%
   :alt: An image of the relationships area in the view template

11. Additionally, :term:`converse <converse term>` information will also be
    added to the related authority record.

.. image:: images/relationships-area-view-related.*
   :align: center
   :width: 75%
   :alt: An image of the relationships area in the view template

.. TIP::

   Relationship types with opposites (such as *parent of* and *child of*) are
   known in AtoM as **converse** terms. AtoM includes a number of default
   relationship terms for use in the Relationship dialogue. These terms and
   their relationships to each other can be edited and managed in the
   Actor Relation Type :term:`taxonomy`, and new terms can be added as well.
   For more information on managing terms, see: :ref:`terms`; see specifically
   :ref:`add-converse-term`.

:ref:`Back to top <authority-records>`

.. _link-authority-record-function:

Create a relationship between an authority record and a function
================================================================

AtoM can also create a linked relationship between a :term:`function` and an
:term:`authority record`. A function is a type of entity that describes
activities linked to records creation, maintenance and use. For more
information on working with Functions in AtoM, see: :doc:`Functions
<../add-edit-content/functions>`. Below are the steps to create a
relationship between an existing authority record and an existing function:

1. Navigate to the :term:`function` you would like to relate to an
   :term:`authority record`. You can do this by going to the Browse page for
   functions (**Browse > Functions**) and then either browsing through the
   list, or using the dedicated Functions search bar on the Browse functions
   page to find the related function. Click on the related function to
   navigate to its :term:`view page`. For more information on browsing and
   searching in AtoM, see: :ref:`Browse <browse>` or
   :ref:`Search <search-atom>`.

.. image:: images/browse-functions.*
   :align: center
   :width: 40%
   :alt: An image of the Browse menu

2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.

.. image:: images/button-block-function.*
   :align: center
   :width: 75%
   :alt: An image of the button block on a function record

3. In the "Relationships" :term:`information area` of the function's
   :term:`edit page`, click the "Add new" button under "Related  authority
   records".
4. AtoM will open a pop-up dialog where you can select the related
   :term:`authority record` and define the nature and time frame of the
   relationship.
5. The first :term:`field` in the pop-up dialog, "Title of the related
   resource," is an `auto-complete <https://en.wikipedia.org/wiki /Auto-
   complete>`__ field: as you type, matching results will load in a :term
   :`drop-down menu` below the field. When you see the
   :term:`authority record` you would like to link, click on it to select
   it.

.. image:: images/function-relationship-dialogue.*
   :align: center
   :width: 65%
   :alt: An image of the Functions relationship dialog

.. NOTE::

   You cannot create a new authority record from this dialog by entering a
   new name. If the related authority record does not exist yet, follow the
   steps above to :ref:`create a new authority record
   <create-authority-record>` and then follow these steps from the beginning
   to create the relationship.

6. Add additional details in the subsequent fields to qualify the
   relationship. When you are finished, click "Submit".

.. image:: images/donor-dialog-submit.*
   :align: center
   :width: 65%
   :alt: An image of the submit button in the Functions relationship dialog

7. The related :term:`authority record` will now appear in the *Related
   authority records* table of the Relationships area. Click the pencil icon
   to re-open the pop-up dialog and edit the relationship, or click the **X**
   icon to remove the relationship link. You can also repeat this process to
   add multiple links by clicking the "Add new" button below the *Related
   authority records* again - AtoM will open a new pop-up dialog. Repeat steps
   3-6 as needed.

.. image:: images/function-relationship-populated.*
   :align: center
   :width: 85%
   :alt: An image of the Relationships area in a function record

8. When you are finished, click "Save" in the :term:`button block` at the
   bottom of the function's :term:`edit page` to save your changes and exit
   :term:`edit mode`.

.. image:: images/button-block-save.*
   :align: center
   :width: 75%
   :alt: An image of the button block when in Edit mode

9. AtoM will reload the :term:`function` in :term:`view mode`.
   :ref:`Back to top <authority-records>`. The relationship is expressed in
   the "Relationships" :term:`information area` of the function's
   :term:`view page`, and the related record's name will appear as a
   hyperlink. If you follow the hyperlink, you will see that the related
   function now appears in the "Relationships" area of the linked authority
   record.

.. _delete-authority-record:

Delete an authority record
==========================

1. Navigate to the :term:`authority record` you wish to edit. You can do this
   by :ref:`browsing <browse>` or :ref:`searching <search-atom>` for the
   :term:`authority record` - see :ref:`access-content` for more information on
   navigation in AtoM.
2. Click the :term:`Delete button` in the :term:`button block`.

.. image:: images/button-block-authority.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an authority record

3. AtoM prompts you to confirm the delete request: click "Delete" to proceed
   (or you can click "Cancel" to return to the authority record's
   :term:`view page`).

.. image:: images/delete-authority-warning.*
   :align: center
   :width: 75%
   :alt: An image of the warning when Delete is selected on an authority

4. AtoM deletes the record and opens the :term:`authority record` browse
   results page.

.. IMPORTANT::

   **Consequences of deleting an authority record:**

   * AtoM uses authority records as the basis for its :term:`archival
     institution` :ref:`ISDIAH <isdiah-template>` template - that is, an
     archival institution record is a special kind of authority record. IF the
     authority record being deleted is also registered as an :term:`archival
     institution`, the archival institution record is ALSO deleted.
   * Any creation :term:`events <event>` linked to the :term:`authority
     record` are disassociated from the related :term:`archival description`,
     but the :term:`archival description` itself is NOT deleted.
   * Similarly, if a :term:`function` is linked to an :term:`authority record`
     and the authority record is deleted, the relationship is disassociated,
     but the related :term:`function` is NOT deleted.


:ref:`Back to top <authority-records>`
