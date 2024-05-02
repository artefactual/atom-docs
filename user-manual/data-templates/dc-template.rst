.. _dc-template:

==================================================
Dublin Core Metadata Element Set, Version 1.1 (DC)
==================================================

On this page you will find:

* Link to downloadable CSV template using
  `ISAD(G) General International Standard Archival Description <https://www.ica.org/resource/isadg-general-international-standard-archival-description-second-edition/>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using DC
  in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-import`
   * :ref:`import-xml`
   * :ref:`export-xml`
   * :ref:`cli-import-export`

.. _dc-and-csv:

Dublin Core and the ISAD CSV template
=====================================

At present, there is no DC-based CSV template for importing descriptions
into  AtoM. However, because AtoM was originally based on the
`ICA's <http://www.ica.org/>`_  ISAD(G) standard (see: :ref:`ISAD <isad-template>`),
the ISAD CSV template can be used for import, as all templates have been
crosswalked in AtoM where possible.

To test this, we recommend creating a full DC description in AtoM, and then
changing the display template to DC, to determine where field in DC map to
ISAD. For more information on changing the display template for a description,
see: :ref:`change-display-standard`. If desired, all templates in AtoM can be
changed at the  same time using the *Default template* setting available in
**Admin > Settings** - see :ref:`default-templates`.

The CSV mappings below will provide guidance on which ISAD CSV fields can be
used to import your DC-based descriptions into AtoM.

To download the ISAD(G) CSV template for AtoM, please visit our wiki page:

* https://wiki.accesstomemory.org/Resources/CSV_templates

Field descriptions
==================

AtoM implements unqualified
`Dublin Core Metadata Element Set, Version 1.1 <http://dublincore.org/documents/dces/>`_,
which is maintained by the `Dublin Core Metadata Initiative <http://dublincore.org>`__.

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the related column in the (ISAD) CSV
  template
* **DC Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **DC XML** refers to the field mapping to MODS XML for import/export
* **Notes** includes any other information needed for successful data entry or
  CSV import.

.. _dc-elements-area:

DC Elements area
================

.. figure:: images/dc-elements-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the DC elements.

   The data entry fields for the Dublin Core archival description edit template.

.. _dc-identifier:

Identifier
----------

**Template field**: Identifier

**CSV Column**: ``identifier``

**DC Rule**: In Dublin Core, an identifier is "an unambiguous reference to the
resource within a given context. Recommended best practice is to identify the
resource by means of a string conforming to a formal identification system."

**DC XML**

.. code-block:: xml

   <dc:identifier>

.. NOTE::

   An administrator can set the reference code to inherit from higher levels
   of description via **Admin > Settings** - see: :ref:`inherit-reference-code`
   for more information. However, since DC simple records are not designed for
   hierarchical information, engaging this setting will **not** change how the
   identifier is handled during export - only the identifier for the current
   :term:`level of description` will be exported.


.. _dc-title:

Title
-----

**Template field**: Title

**CSV column**: ``title``

**DC Rule**: "A name given to the resource. Typically, a Title will be a name
by which the resource is formally known."

**DC XML**:

.. code-block:: xml

   <dc:title>

.. TIP::

   AtoM will use the title of a :term:`description <archival description>` to
   generate a :term:`slug` used in the permanent URL for the resource. For more
   information, see: :ref:`slugs-in-atom`.

.. _dc-names-dates:

Names and dates
---------------

Name(s)
^^^^^^^

.. image:: images/dc-names-edit.*
   :align: center
   :width: 80%
   :alt: An image of the data entry fields in the DC name elements

**Template field**: "Name(s)" in the :term:`view page`; "Creator" in the
:term:`view page`

**CSV Columns**:

* ``creators`` - Creator name(s) - multiple names can be entered,
  and separated by the ``|`` pipe character.
* ``creationDatesType`` - creation event type. (creation, contribution, or publication)

**DC Rule**:

* *Creator:* "An entity primarily responsible for making the resource.
  Examples of a Creator include a person, an organization, or a service."
* *Contributor:* "An entity responsible for making contributions to the resource.
  Examples of a Contributor include a person, an organization, or a service."
* *Publisher:* "An entity responsible for making the resource available.
  Examples of a Publisher include a person, an organization, or a service."

**DC XML**:

* Creator: ``<dc:creator>``
* Contributor: ``<dc:contributor>``
* Publisher: ``<dc:publisher>``

**Notes**:

In the "Actor name" field enter the first few letters of the the actor's name.
A list of names will appear in the drop-down menu (generated from the names of
existing authority records). If the name does not appear in the menu, type the
name and a new :term:`authority record` will be created.

You can leave the "Actor name" field blank. Lower levels inherit creator
information from higher levels: use only if the creator is different at the
lower and higher levels. At the highest level of description, you should
always include the creator.

Select the type of event from the drop-down menu: creation, contribution or
publication. The value list is drawn from the event types :term:`taxonomy` and
can be edited by an :term:`administrator` or :term:`editor`. For more information,
see: :ref:`terms`.

Date(s)
^^^^^^^

.. image:: images/dc-dates-edit.*
   :align: center
   :width: 80%
   :alt: An image of the data entry fields in the DC dates elements

**Template field**: Date(s)

**CSV Columns**:

* ``creationDates`` - display date for creation events (what the public users
  will see in the :term:`view page`). 
* ``creationDatesStart`` - start date - ISO-formatted (YYYY-MM-DD). Not visible
  to public users. 
* ``creationDatesEnd`` - end date - ISO-formatted (YYYY-MM-DD). Not visible
  to public users.

.. NOTE::

   The CSV columns in earlier versions prior to 2.2 was named
   ``creatorDates``, ``creatorDatesStart``, and ``creatorDatesEnd`` - they
   have been updated to clarify the relation to the creation event - not to
   the dates of existence of the creator. However, we have added fallback
   code, so if the old names are used, the import will still succeed.

**DC Rule**: In Dublin Core 1.1, The date field corresponds to a "date
associated with an event in the life cycle of the resource. Typically, Date
will be associated with the creation or availability of the resource."

**DC XML**:

.. code-block:: xml

   <dc:date>

**Notes**:

* Enter the date range as you want it to appear in view mode in the Date field.

* If desired, add any additional text to qualify date range (e.g. "ca.
  1940-1980" or "[1940]-1980, predominant 1973-1980").

* If a date range is given, AtoM will try to parse the DC date field into the
  start/end event dates. It will only do so if both dates are present and
  separated by '|' or ' - '.

  .. TIP::

     These fields only display while editing the description. If AtoM is
     able to interpret the start and end date from the value entered into the
     Date field, it will autopopulate upon entering - but you can still edit the
     auto-populated values as needed.

* When editing the Start and End dates, do not use any qualifiers here
  (e.g. "ca.") or typographical symbols (e.g. "[194?]") to express uncertainty.
  If the start and end years are the same, enter data only in the Start field
  and leave the End field blank. These values should be ISO 8601 acceptable
  formats: YYYY, YYYY-MM, YYYY-MM-DD, or YYYYMMDD.

* Complete at lower levels of description even if you are leaving the creator
  name field blank (e.g. when describing a series, you do not need to repeat the
  creator name from the fonds description, but you do need to enter the date
  range of the series).

* Whereas Start and End fields are used internally for database searching and
  sorting purposes, the Date field is for display purposes. However, if you do
  not enter anything into the Date field, the Start and End fields will appear
  as a date range when the record is saved.

* You can add multiple dates as needed. Click the "Add new" hyperlink to add
  another date row.

.. _dc-description:

Description
-----------

**Template field**: Description

**CSV Column**: ``scopeAndContent``

**DC Rule**: "An account of the resource. Description may include but is not
limited to: an abstract, a table of contents, a graphical representation, or a
free-text account of the resource."

**DC XML**:

.. code-block:: xml

   <dc:description>

**Notes**: You can click and drag the bottom of the :term:`field` to expand it,
in case you are writing a long description and require more room.

.. TIP::

   This element will map to Scope and Content in equivalent archival standards
   such as :ref:`RAD <rad-template>`, :ref:`DACS <dacs-template>`, and
   :ref:`ISAD(G) <isad-template>`.

.. _dc-subject:

Subject
--------

**Template field**: Subject

**CSV Column**: ``subjectAccessPoints``

**DC Rule**: "The topic of the resource. Typically, the subject will be
represented using keywords, key phrases, or classification codes. Recommended
best practice is to use a controlled vocabulary. To describe the spatial or
temporal topic of the resource, use the Coverage element."

**DC XML**:

.. code-block:: xml

   <dc:subject>

**Notes**:

Click on the "Subject" field and enter the first few letters of the term.
If the subject term does not appear on the list, type it in and a new subject
term will be created.

.. IMPORTANT::

   If you are not careful, it is easy to accidentally create duplicate terms!
   To avoid duplication, matching terms **must** be selected from the
   auto-complete :term:`drop-down <drop-down menu>` - otherwise, even exact
   matches will create duplicates when the user presses enter.

You can add multiple subjects, as desired. As you exit the :term:`field`, AtoM
will automatically add a new field below. If you wish to remove an access point,
hover your cursor over the bullet point next to the term - it will transform into
an "**X**". You can click the **X** to remove the term.

.. SEEALSO::

   * :ref:`terms`
   * :ref:`add-term-fly`

.. _dc-type:

Type
----

**Template field**: Type

**CSV Column**: N/A

**DC Rule**: "The nature or genre of the resource. Recommended best practice
is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE].
To describe the file format, physical medium, or dimensions of the resource,
use the Format element." For more information on the Dublin Core type
taxonomy, see http://dublincore.org/documents/dcmi-type-vocabulary/.

**DC XML**:

.. code-block:: xml

   <dc:type>

**Notes**:

Select a value from the :term:`drop-down menu`. The values are drawn from the
"Dublin Core Types" :term:`taxonomy`. AtoM comes with the DCMI TYPE terms
prepopulated in the taxonomy. Users with the proper edit
:term:`permissions <access privilege>` can edit or delete :term:`terms <term>`,
or add new ones - however, to remain compliant, we recommend using the supplied
values.

You can add multiple values as needed - they will appear above the drop-down
menu as you select them. To remove a value, simply click on it - AtoM will remove
the term.

.. _dc-child-levels:

Child levels
------------

These two fields can be used to add lower levels to a collection level
description. Click "Add new" to create as many child levels as necessary.


**Identifier:** The unambiguous reference code used to uniquely identify the
child-level resource.

**Title:** The name given to the child-level resource.

See :ref:`dc-identifier` and :ref:`dc-title`, above, for more information on the
use of each field.

.. TIP::

   Dublin Core simple XML is not designed for hierarchical description. Exporting
   DC XML in AtoM from the :term:`parent record` (or top level of description,
   such as a collection with many items), will **not** include child descriptions
   in the DC XML generated as you would normally find in the EAD XML, for example.

   If you require hierarchical XML, consider using either the EAD XML, or flip
   the template to :ref:`MODS <mods-template>` and use the MODS XML export - in
   MODS, each record is exported individually, but the XML will contain links
   referencing parent and/or child descriptions. To change the display template,
   see: :ref:`change-display-standard`.

.. _dc-format:

Format
------

**Template field**: Format

**CSV Column**: ``extentAndMedium``

**DC Rule**: "The file format, physical medium, or dimensions of the resource.
Examples of dimensions include size and duration. Format may be used to
determine the software, hardware or other equipment needed to display or
operate the resource.Recommended best practice is to use a controlled
vocabulary such as the list of Internet Media Types [MIME]."

**DC XML**:

.. code-block:: xml

   <dc:format>

**Notes**: This field crosswalks from Extent and medium in the
:ref:`ISAD <isad-template>` template, Extent in the :ref:`DACS <dacs-template>`,
and Physical description in the :ref:`RAD <rad-template>` template. As such, 
while DCMI recommends the use of a controlled vocabulary for this metadata, 
AtoM's DC Format is a free-text field. 

.. _dc-source:

Source
------

**Template field**: Source

**CSV Column**: ``locationOfOriginals``

**DC Rule**: "A related resource from which the described resource is derived.
The described resource may be derived from the related resource in whole or in
part. Recommended best practice is to identify the related resource by means
of a string conforming to a formal identification system."

**DC XML**:

.. code-block:: xml

   <dc:source>

**Notes**: This field crosswalks from Existence and location of originals in the
:ref:`ISAD <isad-template>` and :ref:`DACS <dacs-template>` templates,
and Locations of originals in the :ref:`RAD <rad-template>` template.

.. _dc-language:

Language
--------

**Template field**: Language

**CSV Column**: ``language``

.. TIP::

   Use a two-letter language code from
   `ISO 639-1 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ when
   importing from CSV.

**DC Rule**: "A language of the resource. Recommended best practice is to use
a controlled vocabulary such as RFC 4646."

**DC XML**:

.. code-block:: xml

   <dc:language xsi:type="dcterms:ISO639-3">

**Notes**:

Click on the field and begin to enter the first few letters of the target
language. A :term:`drop-down menu` will appear with matching results from a
controlled list of ISO languages (pre-loaded in AtoM) as you type. When you see
the matching language in the drop-down, click on it - AtoM will add the selection
above the drop-down menu. You can do this as many times as you like to enter
multiple languages. To remove a selection, hover your cursor over the :term:`term`
- the bullet next to the language will change into an **X**. Click on the term
to remove it.

.. _dc-relation:

Relation (isLocatedAt)
----------------------

**Template field**: Relation (isLocatedAt)

**CSV Column**: ``repository``

**DC Rule**: N/A

**DC XML**:

.. code-block:: xml

   <dc:relation>

**Notes**:

This field is used for indicating which :term:`archival institution`
(i.e. :term:`repository`) holds the record(s) being described. Select an
archival institution only at the highest :term:`level of description`; leave this
field blank at the lower levels if they are all held by the same institution.

.. TIP::

   To improve the description workflow and to respect the convention in most
   archival standards not to repeat information at lower levels, AtoM will
   inherit the name of the :term:`repository` from the highest level of
   description, unless a different repository is explicitly added.

Click on the Relation (isLocatedAt) field and type the first few letters of
the archival institution that holds the archival material being described. The
names are drawn from pre-existing archival institution records. If the name of
the institution does not appear in this list, you can type it in and a new
archival institution record will be created.

.. IMPORTANT::

   If you are not careful, it is easy to accidentally create duplicate
   repositories! To avoid duplication, matching terms **must** be selected from
   the auto-complete :term:`drop-down <drop-down menu>` - otherwise, even exact
   matches will create duplicates when the user presses enter.

.. SEEALSO::

   * :ref:`archival-institutions`
   * :ref:`link-archival-institution`

.. _dc-coverage:

Coverage
--------

**Template field**: Coverage (spatial)

**CSV Column**: ``placeAccessPoints``

**DC Rule**: "The spatial or temporal topic of the resource, the spatial
applicability of the resource, or the jurisdiction under which the resource is
relevant."

**DC XML**:

.. code-block:: xml

   <dc:coverage>

**Notes**:

Click on the "Coverage (spatial)" field and type the first few letters of the
place. If the place term does not appear on the list, type it in and a new
place term will be created (note that this works only if you have taxonomy
edit permission).

.. TIP::

   This field is an auto-complete - as you type, AtoM will suggest matches with
   :term:`terms <term>` already in the related :term:`taxonomy`. If you do not
   explicitly pick a value from the :term:`drop-down menu` that appears, AtoM
   will create a new term in the taxonomy. **Warning**: this means if you are
   not careful, it is easy to accidentally create duplicate terms (e.g. by
   pressing enter instead of selecting the match from the drop-down).

.. SEEALSO::

   * :ref:`terms`
   * :ref:`add-term-fly`

Rights
------

**Template field**: Rights

**CSV Column**: ``accessConditions``

**DC Rule**: "Information about rights held in and over the resource.
Typically, rights information includes a statement about various property
rights associated with the resource, including intellectual property rights."

**DC XML**:

.. code-block:: xml

   <dc:rights>

**Notes**:

This field maps to "Conditions governing access" in the
:ref:`ISAD <isad-template>` and :ref:`DACS <dacs-template>` templates,
"Restrictions on access" in the :ref:`RAD <rad-template>` template, and "Access
condition" in the :ref:`MODS <mods-template>` template.

.. SEEALSO::

   * :ref:`rights`, especially :ref:`rights-digital-object` and
     :ref:`rights-archival-description`.

:ref:`Back to the top <dc-template>`

.. _dc-admin-area:

Administration area
===================

.. figure:: images/admin-area-dc.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Administration area.

   The data entry fields for the Administration area.

.. _dc-admin-displaystatus:

Display standard
----------------

**Template field**: Display standard

**CSV column**: N/A

**DC Rule**: N/A

**DC XML**: N/A

.. NOTE::

   This fields allows the user to choose a different display standard
   from the :ref:`default template <default-templates>`
   for the shown archival description only, with the option to also change the
   display standard for all existing children of the description. See:
   :ref:`change-display-standard`.

.. _dc-admin-pubstatus:

Publication status
------------------

**Template field** Publication status is available under the More tab located on the object view screen.

**CSV column** publicationsStatus

**RAD Rule** N/A

**EAD**

.. code-block:: xml

  <odd type="publicationStatus">
     <p>

.. note::

  The :term:`publication status` refers to the public visibility of a
  description for unauthenticated (e.g. not logged in) users. The default
  terms available are "Published" (i.e. visible to public users), and "Draft"
  (e.g. not visible to public users). See: :ref:`publish-archival-description`.

  In the :ref:`Global Site Settings <global-settings>`, if the default
  publication status is set to draft, all imported descriptions will be set to
  draft and the EAD file will have the value "draft" in the
  <odd type="publicationStatus"> tag.

:ref:`Back to the top <dc-template>`
