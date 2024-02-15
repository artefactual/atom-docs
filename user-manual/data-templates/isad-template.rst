.. _isad-template:

=========================================================================================
General International Standard Archival Description (ISAD(G)) data entry and CSV template
=========================================================================================

On this page you will find:

* Link to downloadable CSV template using ISAD(G) General International
  Standard Archival Description
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using ISAD(G)
  in a :term:`CSV` file or entering the data manually.

.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`csv-import`
   * :ref:`import-xml`
   * :ref:`export-xml`
   * :ref:`cli-import-export`

ISAD CSV template
=================

To download the ISAD(G) CSV template for AtoM, please visit our `wiki page <https://wiki.accesstomemory.org/Resources/CSV_templates>`_.

Field descriptions
==================

ISAD is maintained by the `International Council on Archives
<http://www.ica.org/>`_ and is available at:

* http://www.ica.org/en/isadg-general-international-standard-archival-description-second-edition

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the column in the CSV template
* **ISAD Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **EAD** refers to the field mapping to EAD
* **Notes** includes any other information needed for successful data entry or
  CSV import.

**Skip to**:

* :ref:`Identity area <template-isad-identity>`
* :ref:`Context area <template-isad-context>`
* :ref:`Content and structure area <template-isad-content>`
* :ref:`Conditions of access and use area <template-isad-conditions>`
* :ref:`Allied materials area <template-isad-allied>`
* :ref:`Notes area <template-isad-notes>`
* :ref:`Access points <template-isad-access>`
* :ref:`Description control area <template-isad-desc-control>`
* :ref:`Rights area <template-isad-rights>`
* :ref:`Administration area <template-isad-administration>`


.. _template-isad-identity:

Identity area
=============

.. figure:: images/isad-identity.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Identity area.

   The data entry fields for the Identity area using the ISAD(G) template,
   including Identifier, Title, Dates, Level of description, Add new child
   levels and extent and medium.

Reference code
--------------

**Template field** Identifier

**CSV Column** ``identifier``

**ISAD Rule** Provide a specific local reference code, control number, or other unique identifier.
The country and repository code will be automatically added from the linked repository record to form a full reference code.
(ISAD 3.1.1)

**EAD**

.. code-block:: xml

   <did>
      <unitid encodinganalog="3.1.1">

.. NOTE::

   Depending on the "inherit reference code" settings in **Admin > Settings > Global**, this field can display to non-logged in users as "Reference code."
   While editing the record, the full reference code including any identifiers :ref:`inherited <inherit-reference-code>` from higher levels will appear below the Identifier field.


:ref:`Back to the top <isad-template>`

Alternative identifier
----------------------

**Template field** Add alternative identifier(s) (toggles open using link beneath identifier field)

**CSV Columns** ``alternativeIdentifiers`` and ``alternativeIdentifierLabels``

**ISAD Rule** N/A (see note below)

**EAD**

.. code-block:: xml

   <did>
      <unitid type="alternative" label="[user entered value]">

.. NOTE::

   The use of the alternative identifier fields is documented in full here:

   * :ref:`add-alternative-id`

   In the CSV templates, the columns can accept multiple values, separated by a
   pipe ``|`` character. The label values will be matched 1:1 with the
   identifiers.

:ref:`Back to the top <isad-template>`

.. _isad-title:

Title
-----

**Template field** Title

**CSV Column** ``title``

**ISAD Rule** Provide either a formal title or a concise supplied title in
accordance with the rules of multilevel description and national
conventions. (ISAD 3.1.2)

**EAD**

.. code-block:: xml

   <did>
      <unittitle encodinganalog="3.1.2">

.. NOTE::

   The EAD tag ``<titleproper encodinganalog="title">`` refers to the
   title of the finding aid, not the archival description.

:ref:`Back to the top <isad-template>`

.. _isad-dates:

Date(s)
-------

**Template field** Date(s)

**CSV Columns** ``eventDates``, ``eventTypes``, ``eventStartDates``, and ``eventEndDates``

**ISAD Rule** Identify and record the date(s) of the unit of description.
Identify the type of date given. Record as a single date or a range of dates
as appropriate." (ISAD 3.1.3) The Date Display field can be used to
enter free-text date information, including typographical marks to express
approximation, uncertainty, or qualification.

**EAD**

.. code-block:: xml

   <did>
     <unitdate encodinganalog="3.1.3">

.. NOTE::

   When entering data in the template, users can choose an event type from a
   :term:`drop-down menu`. The event types in ISAD(G) are Creation and
   Accumulation. When importing descriptions via CSV, use the ``eventTypes`` column.

   AtoM will also add a ``datechar`` attribute for different types of events.
   Here is an example for as accumulation event date in EAD XML:

   .. code-block:: xml

      <did>
        <unitdate id="[atom-generated-value]" datechar="accumulation" normal="[start date/end date]" encodinganalog="3.1.3">

.. NOTE::

  If multiple dates are being added, the content across all date fields must be
  written in the same order with the pipe character ``|`` used as a separator.
  For example, in a description with two dates where the first date is a creation event
  and the second date is an accumulation event, enter the following:

  +-------------------------+---------------------------+
  | eventDates              | eventTypes                |
  +=========================+===========================+
  | 2000-2001 | 1983-1984   | Creation | Accumulation   |
  +-------------------------+---------------------------+

.. NOTE::

   The CSV columns in 2.2 were titled ``creationDates`` and ``creationDatesType``.
   Prior to 2.2, there was one CSV column called ``creatorDates``.
   We have added fallback code so if the old name is used the import will still succeed.

:ref:`Back to the top <isad-template>`

.. _isad-lod:

Level of description
--------------------

**Template field** Level of description

**CSV Column** ``levelOfDescription``

**ISAD Rule** Record the level of this unit of description. (ISAD 3.1.4)

**EAD**

At the parent level:

.. code-block:: xml

   <archdesc level="[level of description]" relatedencoding="ISAD(G)v2">


At the child level:

.. code-block:: xml

   <dsc type="combined">
      <c level="[name of level]">

.. NOTE::

   An :term:`administrator` can edit the values in the Levels of
   description :term:`taxonomy` (see: :ref:`Add a new term <add-term>`). In
   CSV import, if a term is used that is not already in the taxonomy, it will
   be added to the Levels of description taxonomy.


:ref:`Back to the top <isad-template>`

.. _isad-add-child-widget:

Add new child levels
--------------------

.. image:: images/add-new-child-widget.*
   :align: center
   :width: 80%
   :alt: Add new child widget in ISAD

**Template field** Identifier, Level, Title, Date

**CSV Column** N/A - See notes below

**ISAD Rule** *Identifier*: Provide a specific local reference code, control
number, or other unique identifier.

*Level of description*: Record the level of this unit of description.

*Title*: Provide either a formal title or a concise supplied title in accordance
with the rules of multilevel description and national conventions.

*Date*: (Works similarly to the display date field for a date of creation; see
:ref:`above <isad-dates>` for more information.)

**EAD** See the EAD mappings in the related fields above.

.. NOTE::

   This widget has been added to help improve workflows when creating new
   descriptions via the :term:`user interface`. When entering descriptions
   through the form, users can add new :term:`child records <child record>` in
   this area while creating a parent record.

   The *dates* field corresponds to a date of creation - if you would like a
   different kind of date, you will have to either navigate to the child
   description after saving the new :term:`parent record`, and change the date
   type, or simply ignore the date field in the widget, and add the correct
   date type manually to the child record after saving the new parent record.

.. IMPORTANT::

   To include child levels in the ISAD CSV for import, the ``parentId`` column
   must contain the legacy ID of the parent record. For example, if the parent
   record has the legacy ID *249* recorded in the ``legacyId`` column, the child
   record must have the number *249* in the ``parentId`` column, as shown in
   the table here:

       +--------------------+------------+----------+
       | title              | legacyId   | parentId |
       +====================+============+==========+
       | ISAD Collection    | 249        |          |
       +--------------------+------------+----------+
       | ISAD child level   | 250        | 249      |
       +--------------------+------------+----------+

   Fill out subsequent fields following the same rules as described for parent
   records.

Extent and medium
-----------------

**Template field** Extent and medium

**CSV Column** ``extentAndMedium``

**ISAD Rule** "Record the extent of the unit of description by giving the number
of physical or logical units in Arabic numerals and the unit of measurement.
Give the specific medium (media) of the unit of description. Separate
multiple extents with a linebreak. (ISAD 3.1.5)"

**EAD**

.. code-block:: xml

   <did>
      <physdesc encodinganalog="3.1.5">

.. NOTE::

   AtoM will allow users to add additional EAD subelements to :term:`field` in
   the :term:`edit page` to accommodate all the possibilities in EAD for more
   granularity, such as ``<extent>``, ``<dimensions>``, ``<physfacet>``, and
   ``<genreform>``. In the :term:`view page` the EAD tags will be hidden, but
   preserved during export and re-import.

   .. image:: images/physdesc-ead-isad.*
      :align: center
      :width: 75%
      :alt: A comparison of the edit and view pages for physical description

:ref:`Back to the top <isad-template>`

.. _template-isad-context:

Context area
============

.. figure:: images/isad-context.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Context area.

   The data entry fields for the Context area using the ISAD(G) template,
   including Name of creator(s), Repository, Archival history and Immediate
   source of acquisition or transfer.


Name of creator(s)
------------------

**Template field** Name of creator(s)

**CSV Column** ``eventActors``

**ISAD Rule** Record the name of the organization(s) or the individual(s)
responsible for the creation, accumulation and maintenance of the records in
the unit of description. Search for an existing name in the authority
records by typing the first few characters of the name. Alternatively, type
a new name to create and link to a new authority record. (ISAD 3.2.1)

**EAD**

.. code-block:: xml

   <origination encodinganalog="3.2.1">
      <name>

.. NOTE::

   This is the default export EAD when an Entity type has not been set for the
   actor on the related :term:`authority record`. The final EAD element can be
   more precise if the user has entered an Entity type on the related
   :term:`authority record`. When the Entity type is set to **Person**, the EAD
   will export using ``<persname>`` instead of ``<name>``; when set to
   **Family**, the EAD will export using ``<famname>``  instead of ``<name>``;
   and when set to **Organization**, the EAD will export using ``<corpname>``
   instead of ``<name>``. The ``<name>`` element is the default when no
   entity type is set. For more information on authority records and the ISAAR
   standard upon which the authority record template is based, see:
   :ref:`authority-records` and :ref:`isaar-template`.

.. NOTE::

  If multiple creators are being added, the content in related fields must be
  written in the same order with the pipe character ``|`` as a separator. It is
  possible to use ``NULL`` to include an empty element in related fields. For
  example, in a description with two creators where the first creator does not
  have a biographical history but the second creator does, enter the following:

  +---------------------------+-------------------------------+
  | eventActors               | eventActorHistories           |
  +===========================+===============================+
  | Creator 1 | Creator 2     | NULL | Creator 2 bioghist     |
  +---------------------------+-------------------------------+

.. IMPORTANT::

  When linking a :term:`creator` to an :term:`archival description`,
  you should only link at the highest level of description. AtoM will
  automatically inherit the creator name at lower levels. This conforms to
  ISAD(G)'s Multilevel Description Rule 2.4, *Non-repetition of information*: "At
  the highest appropriate level, give information that is common to the component
  parts. Do not repeat information at a lower level of description that has
  already been given at a higher level." Linking a creator at all levels of
  description (instead of just at the parent level) in a large hierarchy can also
  impact performance.

:ref:`Back to the top <isad-template>`

Biographical or Administrative history
--------------------------------------

**Template field** N/A

**CSV Column** ``eventActorHistories``

**ISAD Rule** "Record in narrative form or as a chronology the main life events,
activities, achievements and/or roles of the entity being described. This may
include information on gender, nationality, family and religious or political
affiliations. Wherever possible, supply dates as an integral component of the
narrative description." (ISAAR 5.2.2)

**EAD**

.. code-block:: none

   <bioghist id=[md5 hash]>
      <note>
         <p>

.. NOTE::

   When entering data manually, this field is written in the
   :term:`authority record`. If an authority record does not already exist, AtoM
   will create one when a new creator is entered. The user can then
   navigate to the authority record to enter the Biographical or Administrative
   history (see: :ref:`Authority records <authority-records>`).

   When importing descriptions by CSV, by default this column will create a
   Biographical history in the :term:`authority record`, regardless of whether
   the creator is a person, family, or organization. To specify the entity type
   when importing creators, users would need to
   :ref:`import authority records <csv-import-authority-records>` or manually edit
   the authority record.

.. NOTE::

   When roundtripping descriptions from one AtoM instance to another, creator
   names in the ``<origination>`` element are matched 1:1 in order with
   administrative or biographical histories included in ``<bioghist>``. It is
   therefore important that if some creators do not have related histories, they
   appear in the EAD **after** those that do, so the 1:1 mapping can work as
   expected. If an extra ``<bioghist>`` element is included that does not have
   a corresponding creator name, a stub :term:`authority record` will be created
   to hold the ``<bioghist>`` data.

:ref:`Back to the top <isad-template>`

Repository
----------

**Template field** Repository

**CSV Column** ``repository``

**ISAD Rule** Record the name of the organization which has custody of the
archival material. Search for an existing name in the archival institution
records by typing the first few characters of the name. Alternatively, type
a new name to create and link to a new archival institution record.

**EAD**

.. code-block:: xml

   <did>
      <repository>
         <corpname>

.. NOTE::

   When an address is included in the related :term:`archival institution` (i.e.
   added to the Contact area of the linked repository record), the address will
   also appear in the EAD at the parent level. Because EAD does not include
   attributes for the ``<addressline>`` element, these will not roundtrip properly
   when exported from one AtoM instance and into another - all the information
   will appear in one field of the Contact area upon re-import. Below is an
   example of the EAD with an address included:

   .. code-block:: xml

     <repository>
        <corpname>Artefactual Archives</corpname>
        <address>
           <addressline>Suite 201 – 301 6th Street</addressline>
           <addressline>New Westminster</addressline>
           <addressline>British Columbia</addressline>
           <addressline>Canada</addressline>
           <addressline>Telephone: (604)527-2056</addressline>
           <addressline>Email: info@artefactual.com</addressline>
           <addressline>http://www.artefactual.com</addressline>
        </address>
     </repository>

.. IMPORTANT::

   When linking an :term:`archival institution` to an :term:`archival description`,
   you should only link at the highest level of description. AtoM will
   automatically inherit the repository name at lower levels. This conforms to
   ISAD(G)'s Multilevel Description Rule 2.4, *Non-repetition of information*: "At
   the highest appropriate level, give information that is common to the component
   parts. Do not repeat information at a lower level of description that has
   already been given at a higher level." Linking a repository at all levels of
   description (instead of just at the parent level) in a large hierarchy can also
   impact performance.

:ref:`Back to the top <isad-template>`

Archival history
----------------

**Template field** Archival history

**CSV Column** ``archivalHistory``

**ISAD Rule** Record the successive transfers of ownership, responsibility
and/or custody of the unit of description and indicate those actions, such
as history of the arrangement, production of contemporary finding aids, re-
use of the records for other purposes or software migrations, that have
contributed to its present structure and arrangement. Give the dates of
these actions, insofar as they can be ascertained. If the archival history
is unknown, record that information. (ISAD 3.2.3)

**EAD**

.. code-block:: xml

   <custodhist encodinganalog="3.2.3">
      <p>

:ref:`Back to the top <isad-template>`

Immediate source of acquisition or transfer
-------------------------------------------

**Template field** Immediate source of acquisition or transfer

**CSV Column** ``acquisition``

**ISAD Rule** Record the source from which the unit of description was acquired
and the date and/or method of acquisition if any or all of this information
is not confidential. If the source is unknown, record that information.
Optionally, add accession numbers or codes. (ISAD 3.2.4)

**EAD**

.. code-block:: xml

   <acqinfo encodinganalog="3.2.4">
      <p>

:ref:`Back to the top <isad-template>`


.. _template-isad-content:

Content and structure area
==========================

.. figure:: images/isad-content.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Content and structure area.

   The data entry fields for the Content and structure area using the ISAD(G)
   template, including Scope and content, Appraisal, destruction and
   scheduling, Accruals, and System of arrangement.

Scope and content
-----------------

**Template field** Scope and content

**CSV Column** ``scopeAndContent``

**ISAD Rule** "Give a summary of the scope (such as, time periods, geography)
and content, (such as documentary forms, subject matter, administrative
processes) of the unit of description, appropriate to the level of
description. (ISAD 3.3.1)"

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.3.1">
      <p>


:ref:`Back to the top <isad-template>`


Appraisal, destruction and scheduling
-------------------------------------

**Template field** Appraisal, destruction and scheduling

**CSV Column** ``appraisal``

**ISAD Rule** Record appraisal, destruction and scheduling actions taken on or
planned for the unit of description, especially if they may affect the
interpretation of the material. (ISAD 3.3.2)

**EAD**

.. code-block:: xml

   <appraisal encodinganalog="3.3.2">
      <p>

:ref:`Back to the top <isad-template>`


Accruals
--------

**Template field** Accruals

**CSV Column** ``accruals``

**ISAD Rule** Indicate if accruals are expected. Where appropriate, give an
estimate of their quantity and frequency. (ISAD 3.3.3)

**EAD**

.. code-block:: xml

   <accruals encodinganalog="3.3.3">
      <p>

:ref:`Back to the top <isad-template>`


System of arrangement
---------------------

**Template field** System of arrangement

**CSV Column** ``arrangement``

**ISAD Rule** Specify the internal structure, order and/or the system of
classification of the unit of description. Note how these have been treated by
the archivist. For electronic records, record or reference information on
system design. (ISAD 3.3.4)

**EAD**

.. code-block:: xml

   <arrangement encodinganalog="3.3.4">
      <p>

:ref:`Back to the top <isad-template>`


.. _template-isad-conditions:

Conditions of access and use area
=================================

.. figure:: images/isad-conditions.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Conditions of access and use
         area.

   The data entry fields for the Conditions of access and use area in the
   ISAD(G) template, including Conditions governing access, Conditions governing
   reproduction, Language of material, Script of material, Language and script
   notes, Physical characteristics and technical requirements, and Finding
   aids.

Conditions governing access
---------------------------

**Template field** Conditions governing access

**CSV Column** ``accessConditions``

**ISAD Rule** Specify the law or legal status, contract, regulation or policy
that affects access to the unit of description. Indicate the extent of the
period of closure and the date at which the material will open when
appropriate. (ISAD 3.4.1)

**EAD**

.. code-block:: xml

   <accessrestrict encodinganalog="3.4.1">
      <p>

.. SEEALSO::

   * :ref:`rights`, especially :ref:`rights-digital-object` and
     :ref:`rights-archival-description`.

:ref:`Back to the top <isad-template>`


Conditions governing reproduction
---------------------------------

**Template field** Conditions governing reproduction

**CSV Column** ``reproductionConditions``

**ISAD Rule** Give information about conditions, such as copyright, governing
the reproduction of the unit of description after access has been provided.
If the existence of such conditions is unknown, record this. If there are no
conditions, no statement is necessary. (ISAD 3.4.2)

**EAD**

.. code-block:: xml

   <userestrict encodinganalog="3.4.2">
      <p>

:ref:`Back to the top <isad-template>`


Language of material
--------------------

**Template field** Language of material

**CSV Column** ``language``

**ISAD Rule** Record the language(s) of the materials comprising the unit of
description. (ISAD 3.4.3)

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">
         <language langcode="[ISO code]">

.. NOTE::

   Use a two-letter language code from
   `ISO 639-1 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ when
   importing from CSV.


:ref:`Back to the top <isad-template>`


Script of material
------------------

**Template field** Script of material

**CSV Column** ``script``

**ISAD Rule** Record the script(s) of the materials comprising the unit of
description. (ISAD 3.4.3)

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">
         <language scriptcode="[ISO code]">

.. NOTE::

   Use a four-letter script code from
   `ISO 15924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_ when
   importing from CSV.

:ref:`Back to the top <isad-template>`


Language and script notes
-------------------------

**Template field** Language and script notes

**CSV Column** ``languageNote``

**ISAD Rule** "Note any distinctive alphabets, scripts, symbol systems or
abbreviations employed (ISAD 3.4.3)"

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">

.. NOTE::

   Not intended to duplicate information from language or script, above.

:ref:`Back to the top <isad-template>`


Physical characteristics and technical requirements
---------------------------------------------------

**Template field** Physical characteristics and technical requirements

**CSV Column** ``physicalCharacteristics``

**ISAD Rule** Indicate any important physical conditions, such as preservation
requirements, that affect the use of the unit of description. Note any
software and/or hardware required to access the unit of description. (ISAD
3.4.4)

**EAD**

.. code-block:: xml

   <phystech encodinganalog="3.4.3">
      <p>


:ref:`Back to the top <isad-template>`

Finding aids
------------

**Template field** Finding aids

**CSV Column** ``findingAids``

**RAD Rule** Give information about any finding aids that the repository or
records creator may have that provide information relating to the context
and contents of the unit of description. If appropriate, include information
on where to obtain a copy. (ISAD 3.4.5)

**EAD**

.. code-block:: xml

   <otherfindaid encodinganalog="3.4.5">
      <p>

.. SEEALSO::

   * :ref:`print-finding-aids`

:ref:`Back to the top <isad-template>`

.. _template-isad-allied:

Allied materials area
=====================

.. figure:: images/isad-allied.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Allied materials area

   The data entry fields for the Allied materials area in the
   ISAD(G) template, including Existence and location of originals, Existence
   and location of copies, Related units of description, and Publication
   notes.

Existence and location of originals
-----------------------------------

**Template field** Existence and location of originals

**CSV Column** ``locationOfOriginals``

**ISAD Rule** "If the original of the unit of description is available (either
in the institution or elsewhere) record its location, together with any
significant control numbers. If the originals no longer exist, or their
location is unknown, give that information. (ISAD 3.5.1)"

**EAD**

.. code-block:: xml

   <originalsloc encodinganalog="3.5.1">
      <p>

:ref:`Back to the top <isad-template>`


Existence and location of copies
--------------------------------

**Template field** Existence and location of copies

**CSV Column** ``locationOfCopies``

**ISAD Rule** "If the copy of the unit of description is available (either in
the institution or elsewhere) record its location, together with any
significant control numbers. (ISAD 3.5.2)"

**EAD**

.. code-block:: xml

   <altformavail encodinganalog="3.5.2">
      <p>

:ref:`Back to the top <isad-template>`

Related units of description
----------------------------

**Template field** Related units of description

**CSV Column** ``relatedUnitsOfDescription``

**ISAD Rule** "Record information about units of description in the same
repository or elsewhere that are related by provenance or other
association(s). Use appropriate introductory wording and explain the nature
of the relationship . If the related unit of description is a finding aid,
use the finding aids element of description (3.4.5) to make the reference to
it. (ISAD 3.5.3)"

**EAD**

.. code-block:: xml

   <relatedmaterial encodinganalog="3.5.3">
      <p>

.. SEEALSO::

   * :ref:`link-related-descriptions`

:ref:`Back to the top <isad-template>`


Publication notes
-----------------

**Template field** Publication notes

**CSV Column** ``publicationNote``

**ISAD Rule** Record a citation to, and/or information about a publication
that is about or based on the use, study, or analysis of the unit of
description. Include references to published facsimiles or transcriptions.
(ISAD 3.5.4)"

**EAD**

.. code-block:: xml

   <bibliography encodinganalog="3.5.4">
      <p>

:ref:`Back to the top <isad-template>`


.. _template-isad-notes:

Notes area
==========

.. figure:: images/isad-notes.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Notes area

   The data entry fields for the Notes area in the ISAD(G) template.

Notes
-----

**Template field** Notes

**CSV Column** ``generalNote``

**ISAD Rule** Record specialized or other important information not
accommodated by any of the defined elements of description. (ISAD 3.6.1)"

**EAD**

.. code-block:: xml

   <did>
      <note type="generalNote">
         <p>

:ref:`Back to the top <isad-template>`

.. _template-isad-access:

Access points
=============

.. figure:: images/isad-access.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Access points area

   The data entry fields for the Access points area in the ISAD(G) template,
   including Subject access points, Place access points, and Name access
   points (subjects).

.. SEEALSO::

   * :ref:`add-term-fly`

Subject access points
---------------------

**Template field** Subject access points

**CSV Column** ``subjectAccessPoints``

**ISAD Rule** N/A

**EAD**

.. code-block:: xml

   <controlaccess>
      <subject>

.. NOTE::

   This field is an auto-complete - as you type, AtoM will suggest matches with
   :term:`terms <term>` already in the related :term:`taxonomy`. If you do not
   explicitly pick a value from the :term:`drop-down menu` that appears, AtoM
   will create a new term in the taxonomy. **Warning**: this means if you are
   not careful, it is easy to accidentally create duplicate terms (e.g. by
   pressing enter instead of selecting the match from the drop-down).

.. NOTE::

  In the CSV template, this column can accept multiple values, separated by a
  pipe ``|`` character.

:ref:`Back to the top <isad-template>`

Place access points
-------------------

**Template field** Place access points

**CSV Column** ``placeAccessPoints``

**ISAD Rule** N/A

**EAD**

.. code-block:: xml

   <controlacccess>
      <geogname>

.. NOTE::

   This field is an auto-complete - as you type, AtoM will suggest matches with
   :term:`terms <term>` already in the related :term:`taxonomy`. If you do not
   explicitly pick a value from the :term:`drop-down menu` that appears, AtoM
   will create a new term in the taxonomy. **Warning**: this means if you are
   not careful, it is easy to accidentally create duplicate terms (e.g. by
   pressing enter instead of selecting the match from the drop-down).

.. NOTE::

 In the CSV template, this column can accept multiple values, separated by a
 pipe ``|`` character.

:ref:`Back to the top <isad-template>`

Name access points (subjects)
-----------------------------

**Template field** Name access points

**CSV Column** ``nameAccessPoints``

**ISAD Rule** N/A

**EAD**

If the entity type of the actor is not defined as either a person, family, or
corporate body:

.. code-block:: xml

   <controlaccess>
      <name role="subject">

.. NOTE::

   This is the default export EAD when an Entity type has not been set for the
   actor on the related :term:`authority record`. The final EAD element can be
   more precise, if the user has entered an Entity type on the related
   :term:`authority record`. When the Entity type is set to **Person**, the EAD
   will export using ``<persname>`` instead of  ``<name>``; when set to
   **Family**, the EAD will export using ``<famname>``  instead of ``<name>``;
   and when set to **Organization**, the EAD will export using ``<corpname>``
   instead of ``<name>``. The ``<name>`` element is the default when no
   entity type is set. For more information on authority records and the ISAAR
   standard upon which the authority record template is based, see:
   :ref:`authority-records` and :ref:`isaar-template`.

   This field is an auto-complete - the :term:`drop-down <drop-down menu>` will
   suggest existing authority records as you type. Values in this column/field
   that are entered instead of selected from the drop-down will create new
   :term:`authority records <authority record>`.

.. NOTE::

 In the CSV template, this column can accept multiple values, separated by a
 pipe ``|`` character.

:ref:`Back to the top <isad-template>`

Genre access points
-------------------

**Template field** Genre access points

**CSV Column** ``genreAccessPoints``

**ISAD Rule** N/A

**EAD**

.. code-block:: xml

   <controlaccess>
      <genreform>

.. NOTE::

   This field is an auto-complete - as you type, AtoM will suggest matches with
   :term:`terms <term>` already in the related :term:`taxonomy`. If you do not
   explicitly pick a value from the :term:`drop-down menu` that appears, AtoM
   will create a new term in the taxonomy. **Warning**: this means if you are
   not careful, it is easy to accidentally create duplicate terms (e.g. by
   pressing enter instead of selecting the match from the drop-down).

.. NOTE::

 In the CSV template, this column can accept multiple values, separated by a
 pipe ``|`` character.

:ref:`Back to the top <isad-template>`

.. _template-isad-desc-control:

Description control area
========================

.. figure:: images/isad-control.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields in the Description control area

   The data entry fields for the Description control are in the ISAD(G) template,
   including Description identifier, Institution identifier, Rules or
   conventions, Status, Level of detail, Dates of creation, revision and
   deletion, Language(s), Script(s), Sources and Archivist's notes.

Description identifier
----------------------

**Template field** Description identifier

**CSV Column** ``descriptionIdentifier``

**ISAD Rule** "Record a unique description identifier in accordance with local
and/or national conventions. If the description is to be used
internationally, record the code of the country in which the description was
created in accordance with the latest version of ISO 3166- Codes for the
representation of names of countries. Where the creator of the description is
an international organisation, give the organisational identifier in place of
the country code."

**EAD**

.. code-block:: xml

   <odd type="descriptionIdentifier">
      <p>

:ref:`Back to the top <isad-template>`


Institution identifier
----------------------

**Template field** Institution identifier

**CSV Column** ``institutionIdentifier``

**ISAD Rule** "Record the full, authorised form of name(s) of the agency(ies)
responsible for creating, modifying, or disseminating the description, or,
alternatively, record a code for the agency in accordance with the national
or international agency code standard."

**EAD**

.. code-block:: xml

   <odd type="institutionIdentifier">
      <p>

:ref:`Back to the top <isad-template>`


Rules or conventions
--------------------

**Template field** Rules or conventions

**CSV Column** ``rules``

**ISAD Rule** "Record the international, national and/or local rules or
conventions followed in preparing the description. (ISAD 3.7.2)"

**EAD**

.. code-block:: xml

   <eadheader>
      <profiledesc>
         <descrules encodinganalog="3.7.2">

:ref:`Back to the top <isad-template>`


Status
------

**Template field** Status

**CSV Column** ``descriptionStatus``

**ISAD Rule** "Record the current status of the description, indicating whether it
is a draft, finalized, and/or revised or deleted."

**EAD**

.. code-block:: xml

   <odd type="statusDescription">
      <p>

.. NOTE::

   AtoM uses a :term:`taxonomy` to determine the value of this field. The
   default terms are Final, Revised and Draft, but can be edited through the
   :ref:`Manage taxonomy screen <add-term-taxonomy>`.

:ref:`Back to the top <isad-template>`


Level of detail
---------------

**Template field** Level of detail

**CSV Column** ``levelOfDetail``

**ISAD Rule** "Record whether the description consists of a minimal, partial, or
full level of detail in accordance with relevant international and/or
national guidelines and/or rules."

**EAD**

.. code-block:: xml

   <archdesc>
      <odd type="levelOfDetail">

.. NOTE::

   AtoM uses a :term:`taxonomy` to determine the value of this field. The
   default terms are Full, Partial and Minimal, but can be edited through the
   :ref:`Manage taxonomy screen <add-term-taxonomy>`.


:ref:`Back to the top <isad-template>`


Dates of creation, revision and deletion
----------------------------------------

**Template field** Dates of creation, revision and deletion

**CSV Column** ``revisionHistory``

**ISAD Rule** "Record the date(s) the entry was prepared and/or revised."

**EAD**

.. code-block:: xml

   <processinfo>
      <p>
          <date>

.. NOTE::

   This is a free text field, allowing users to also write narrative
   notes about the revision history of the description.

:ref:`Back to the top <isad-template>`


Language of description
-----------------------

**Template field** Language of description

**CSV Column** ``languageOfDescription``

**ISAD Rule** "Indicate the language(s) used to create the description of the
archival material."

**EAD**

.. code-block:: xml

   <eadheader>
      <profiledesc>
         <langusage>
            <language langcode="[ISO code]">

.. NOTE::

   In CSV import, use a two-letter language code from
   `ISO 639-1 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ .
   When entering data manually, AtoM will offer an autocomplete drop-down
   list as you type, which will be generated as a three-letter language code
   in the EAD.

.. NOTE::

  In the CSV template, this column can accept multiple values, separated by a
  pipe ``|`` character.

:ref:`Back to the top <isad-template>`


Script of description
---------------------

**Template field** Script of description

**CSV Column** ``scriptOfDescription``

**ISAD Rule** "Indicate the script(s) used to create the description of the
archival material."

**EAD**

.. code-block:: xml

   <eadheader>
      <profiledesc>
         <langusage>
            <language scriptcode="[ISO code]">

.. NOTE::

   In CSV import, use a four-letter script code from
   `ISO 15924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_. When
   entering data manually, AtoM will offer an autocomplete drop-down
   list as you type, which will be generated as a four-letter script code
   in the EAD.

.. NOTE::

  In the CSV template, this column can accept multiple values, separated by a
  pipe ``|`` character.

:ref:`Back to the top <isad-template>`


Sources
-------

**Template field** Sources

**CSV Column** ``sources``

**ISAD Rule** "Record citations for any external sources used in the archival
description (such as the Scope and Content, Custodial History, or Notes
fields)."

**EAD**

.. code-block:: xml

   <did>
      <note type="sourcesDescription">

.. NOTE::

   If there are sources to cite used used in a biographical
   sketch or administrative history, record these in the sources field for the
   :term:`authority record`.

:ref:`Back to the top <isad-template>`

Archivist's notes
-----------------

**Template field** Archivist's notes

**CSV Column** ``archivistNote``

**ISAD Rule** Record notes on sources consulted in preparing the description
and who prepared it. (ISAD 3.7.1)

**EAD**

.. code-block:: xml

    <archdesc>
       <processinfo>
          <p>

:ref:`Back to the top <isad-template>`

.. _template-isad-rights:

Rights area
===========

This area of the description allows users to enter a :term:`rights record`
compliant with `PREMIS <http://www.loc.gov/standards/premis/>`_. These fields
are separate from the ISAD Conditions and access of use area, above, and editing
one area does not effect the other. Rights records cannot be imported with
descriptions via CSV. Rights are located under the More tab visible on the archival view page for logged in users.

At present, the PREMIS rights added to a record are only visible to authenticated
(i.e. logged in) users.

For more information, see :ref:`rights`, especially
:ref:`rights-archival-description`, and :ref:`premis-template`.

:ref:`Back to the top <isad-template>`


.. _template-isad-administration:

Administration area
===================

.. figure:: images/admin-area-isad.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Administration area.

   The data entry fields for the Administration area.

Display standard
----------------

**Template field** Display standard

**CSV column** N/A

**RAD Rule** N/A

**EAD** N/A

.. NOTE::

  This fields allows the user to choose a different display standard
  from the :ref:`default template <default-templates>`
  for the shown archival description only, with the option to also change the
  display standard for all existing children of the description. See:
  :ref:`change-display-standard`.

Publication status
------------------

**Template field** Publication status is available under the More tab located on the object view screen.

**CSV column** ``publicationsStatus``

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

:ref:`Back to the top <isad-template>`
