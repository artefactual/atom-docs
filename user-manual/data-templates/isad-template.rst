.. _isad-template:

=========================================================================================
General International Standard Archival Description (ISAD(G)) data entry and CSV template
=========================================================================================

On this page you will find:

* Link to downloadable CSV template using
  `ISAD(G) General International Standard Archival Description <http://www.ica.org/10207/standards/isadg-general-international-standard-archival-description-second-edition.html>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using ISAD(G)
  in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-testing-import`


ISAD CSV template
=================

To download the ISAD(G) CSV template for AtoM 2.0, please visit our wiki page
(link to come).

Field descriptions
==================

ISAD is maintained by the `International Council on Archives
<http://www.ica.org/>`_ and is available at
http://www.ica.org/10207/standards/isadg-general-international-standard-archival-description-second-edition.html.

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
^^^^^^^^^^^^^

.. figure:: images/isad-identity.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Identity area.

   The data entry fields for the Identity area using the ISAD(G) template,
   including Identifier, Title, Dates, Level of description, Add new child
   levels and extent and medium.

Reference code
--------------

**Template field** Identifier

**CSV Column** identifier

**ISAD Rule** Provide a specific local reference code, control number, or other
unique identifier. The country and repository code will be automatically
added from the linked repository record to form a full reference code. (ISAD
3.1.1)

**EAD**

.. code:: bash

   <archdesc level="[name of level]">
      <did>
         <unitid encodinganalog="3.1.1">

.. note::

   This field displays to non-logged in users as "Reference code."
   While editing the record, the full reference code including any identifiers
   :ref:`inherited <inherit-reference-code>` from higher levels will appear
   below the Identifier field.


:ref:`Back to the top <isad-template>`

Alternative identifier
----------------------

**Template field** Add alternative identifier(s) (link beneath identifier
field)

**CSV Column** Not currently available in AtoM CSV import

**ISAD Rule** N/A (see note below)

**EAD**

.. code:: bash

   <archdesc level="[name of level]">
      <did>
         <unitid type="alternative" label="[user entered value]">

.. note::

   The use of the alternative identifier fields is documented in full here:

   * :ref:`add-alternative-id`


:ref:`Back to the top <isad-template>`

.. _isad-title:

Title
-----

**Template field** Title

**CSV Column** title

**ISAD Rule** Provide either a formal title or a concise supplied title in
accordance with the rules of multilevel description and national
conventions. (ISAD 3.1.2)

**EAD**

At a parent level:

.. code:: bash

   <archdesc level="[name of level]">
      <did>
         <unittitle encodinganalog="3.1.2">

At a child level:

.. code:: bash

   <c level="[name of level]>
      <did>
         <unittitle encodinganalog="3.1.2">

.. note::

   The EAD tag ``<titleproper encodinganalog="title">`` refers to the
   title of the finding aid, not the archival description.

:ref:`Back to the top <isad-template>`

.. _isad-dates:

Date(s)
-------

**Template field** Date(s)

**CSV Column** creatorDates

**ISAD Rule** Identify and record the date(s) of the unit of description.
Identify the type of date given. Record as a single date or a range of dates
as appropriate." (ISAD 3.1.3) The Date Display field can be used to
enter free-text date information, including typographical marks to express
approximation, uncertainty, or qualification.

**EAD**

.. code:: bash

   <archdesc level="[name of level]">
      <did>
        <unitdate encodinganalog="3.1.3">

.. note::

   When entering data manually, users can choose an event type from a
   :term:`drop-down menu`. The event types in ISAD(G) are Creation and
   Accumulation. When importing descriptions via CSV, the event type defaults
   to Creation.

:ref:`Back to the top <isad-template>`

.. _isad-date-start:

Dates of creation- Start
------------------------

**Template field** Date(s)- Start

**CSV Column** creatorDatesStart

**ISAD Rule** Use the start and end dates to make the dates searchable. Do not
use any qualifiers or typographical symbols to express uncertainty. Acceptable
date formats: YYYYMMDD, YYYY-MM-DD, YYYY-MM, YYYY.

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <unitdate normal="[start]/[end]" encodinganalog="3.1.3">

.. note::

   This field only displays while editing the description. If AtoM is
   able to interpret the start date from the Date(s) field, above, it will
   autopopulate upon entering.

:ref:`Back to the top <isad-template>`

.. _isad-date-end:

Dates of creation- End
----------------------

**Template field** Date(s)- End

**CSV Column** creatorDatesEnd

**ISAD Rule** Use the start and end dates to make the dates searchable. Do not
use any qualifiers or typographical symbols to express uncertainty. Acceptable
date formats: YYYYMMDD, YYYY-MM-DD, YYYY-MM, YYYY.

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <unitdate normal="[start]/[end]" encodinganalog="3.1.3">

.. note::

   This field only displays while editing the description. If AtoM is
   able to interpret the start date from the Date(s) field, above, it will
   autopopulate upon entering.

:ref:`Back to the top <isad-template>`

.. _isad-lod:

Level of description
--------------------

**Template field** Level of description

**CSV Column** levelOfDescription

**ISAD Rule** Record the level of this unit of description. (ISAD 3.1.4)

**EAD**

At the parent level:

.. code:: bash

   <archdesc level="[level of description]" relatedencoding="ISAD(G)v2">


At the child level:

.. code:: bash

   <dsc type="combined>
      <c level="[name of level]">

.. note::

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

**EAD** N/A

.. note::

   This widget has been added to help improve workflows when creating new
   descriptions via the :term:`user interface`.  When entering descriptions
   manually, users can add new :term:`child records <child record>` in this area
   while creating a parent record.

   The *dates* field corresponds to a date of creation - if you would like a
   different kind of date, you will have to either navigate to the child
   description after saving the new :term:`parent record`, and change the date
   type, or simply ignore the date field in the widget, and add the correct
   date type manually to the child record after saving the new parent record.

   In CSV import, adding child records can be achieved using the *legacyID* and
   *parentID* columns. See :ref:`csv-legacy-id-mapping`.


Extent and medium
-----------------

**Template field** Extent and medium

**CSV Column** extentAndMedium

**ISAD Rule** "Record the extent of the unit of description by giving the number
of physical or logical units in arabic numerals and the unit of measurement.
Give the specific medium (media) of the unit of description. Separate
multiple extents with a linebreak. (ISAD 3.1.5)"

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <physdesc>
            <extent encodinganalog="3.1.5">


:ref:`Back to the top <isad-template>`

.. _template-isad-context:

Context area
^^^^^^^^^^^^

.. figure:: images/isad-context.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Context area.

   The data entry fields for the Context area using the ISAD(G) template,
   including Name of creator(s), Repository, Archival history and Immediate
   source of acquisition or transfer.


Name of creator(s)
------------------

**Template field** Name of creator(s)

**CSV Column** creators

**ISAD Rule** Record the name of the organization(s) or the individual(s)
responsible for the creation, accumulation and maintenance of the records in
the unit of description. Search for an existing name in the authority
records by typing the first few characters of the name. Alternatively, type
a new name to create and link to a new authority record. (ISAD 3.2.1)

**EAD**

.. code:: bash

   <archdesc>
      <bioghist>
         <chronlist>
            <chronitem>
               <eventgrp>
                  <event>
                     <origination encodinganalog="3.2.1">
                        <name>

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

:ref:`Back to the top <isad-template>`

Biographical or Administative history
-------------------------------------

**Template field** Biographical history/Administrative history

**CSV Column** creatorHistories

**ISAD Rule** "Record in narrative form or as a chronology the main life events,
activities, achievements and/or roles of the entity being described. This may
include information on gender, nationality, family and religious or political
affiliations. Wherever possible, supply dates as an integral component of the
narrative description." (ISAAR 5.2.2)

**EAD**

.. code:: bash

   <archdesc>
      <bioghist>
         <chronlist>
            <chronitem>
               <eventgrp>
                  <event>
                     <note>

.. note::

   When entering data manually, this field needs to be written in the
   :term:`authority record`. If an authority record does not already exist, AtoM
   will create one when a new creator is entered, above. The user can then
   navigate to the authority record to enter the Biographical or Administrative
   history (see: :ref:`Authority records <authority-records>`).

   When importing descriptions by CSV, by default this column will
   create a Biographical history in the :term:`authority record`, regardless of
   whether the creator is a person, family, or organization. To specify the
   entity type when importing creators, users would need to
   :ref:`import authority records <csv-import-authority-records>`.

:ref:`Back to the top <isad-template>`

Repository
----------

**Template field** Repository

**ISAD Rule** Record the name of the organization which has custody of the
archival material. Search for an existing name in the archival institution
records by typing the first few characters of the name. Alternatively, type
a new name to create and link to a new archival institution record.

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <repository>
           <corpname>

:ref:`Back to the top <isad-template>`

Archival history
----------------

**Template field** Archival history

**CSV Column** archivalHistory

**ISAD Rule** Record the successive transfers of ownership, responsibility
and/or custody of the unit of description and indicate those actions, such
as history of the arrangement, production of contemporary finding aids, re-
use of the records for other purposes or software migrations, that have
contributed to its present structure and arrangement. Give the dates of
these actions, insofar as they can be ascertained. If the archival history
is unknown, record that information. (ISAD 3.2.3)

**EAD**

.. code:: bash

   <archdesc>
      <custodhist encodinganalog="3.2.3">

:ref:`Back to the top <isad-template>`

Immediate source of acquisition or transfer
-------------------------------------------

**Template field** Immediate source of acquisition or transfer

**CSV Column** acquisition

**ISAD Rule** Record the source from which the unit of description was acquired
and the date and/or method of acquisition if any or all of this information
is not confidential. If the source is unknown, record that information.
Optionally, add accession numbers or codes. (ISAD 3.2.4)

**EAD**

.. code:: bash

   <archdesc>
      <acqinfo encodinganalog="3.2.4">

:ref:`Back to the top <isad-template>`


.. _template-isad-content:

Content and structure area
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/isad-content.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Content and structure area.

   The data entry fields for the Content and structure area using the ISAD(G)
   template, including Scope and content, Appraisal, destruction and
   scheduling, Accruals, and System of arrangement.

Scope and content
-----------------

**Template field** Scope and content

**CSV Column** scopeAndContent

**ISAD Rule** "Give a summary of the scope (such as, time periods, geography)
and content, (such as documentary forms, subject matter, administrative
processes) of the unit of description, appropriate to the level of
description. (ISAD 3.3.1)"

**EAD**

.. code:: bash

   <archdesc>
      <scopecontent encodinganalog="3.3.1">


:ref:`Back to the top <isad-template>`


Appraisal, destruction and scheduling
-------------------------------------

**Template field** Appraisal, destruction and scheduling

**CSV Column** appraisal

**ISAD Rule** Record appraisal, destruction and scheduling actions taken on or
planned for the unit of description, especially if they may affect the
interpretation of the material. (ISAD 3.3.2)

**EAD**

.. code:: bash

   <archdesc>
      <appraisal encodinganalog="3.3.2">

:ref:`Back to the top <isad-template>`


Accruals
--------

**Template field** Accruals

**CSV Column** accruals

**ISAD Rule** Indicate if accruals are expected. Where appropriate, give an
estimate of their quantity and frequency. (ISAD 3.3.3)

**EAD**

.. code:: bash

   <archdesc>
      <accruals encodinganalog="3.3.3">

:ref:`Back to the top <isad-template>`


System of arrangement
---------------------

**Template field** System of arrangement

**CSV Column** arrangement

**ISAD Rule** Specify the internal structure, order and/or the system of
classification of the unit of description. Note how these have been treated by
the archivist. For electronic records, record or reference information on
system design. (ISAD 3.3.4)

**EAD**

.. code:: bash

   <archdesc>
      <arrangement encodinganalog="3.3.4">

:ref:`Back to the top <isad-template>`


.. _template-isad-conditions:

Conditions of access and use area
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/isad-conditions.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Conditions of access and use
         area.

   The data entry fields for the Conditions of access and use area in the
   ISAD(G) template, including Conditions governing access, Conditions governing
   reproduction, Language of material, Script of material, Lanuage and script
   notes, Physical characteristics and technical requirements, and Finding
   aids.

Conditions governing access
---------------------------

**Template field** Conditions governing access

**CSV Column** accessConditions

**ISAD Rule** Specify the law or legal status, contract, regulation or policy
that affects access to the unit of description. Indicate the extent of the
period of closure and the date at which the material will open when
appropriate. (ISAD 3.4.1)

**EAD**

.. code:: bash

   <archdesc>
      <accessrestrict encodinganalog="3.4.1">

:ref:`Back to the top <isad-template>`


Conditions governing reproduction
---------------------------------

**Template field** Conditions governing reproduction

**CSV Column** reproductionConditions

**ISAD Rule** Give information about conditions, such as copyright, governing
the reproduction of the unit of description after access has been provided.
If the existence of such conditions is unknown, record this. If there are no
conditions, no statement is necessary. (ISAD 3.4.2)

**EAD**

.. code:: bash

   <archdesc>
      <userestrict encodinganalog="3.4.2">

:ref:`Back to the top <isad-template>`


Language of material
--------------------

**Template field** Language of material

**CSV Column** language

**ISAD Rule** Record the language(s) of the materials comprising the unit of
description. (ISAD 3.4.3)

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <langmaterial encodinganalog="3.4.3">
            <language langcode="___">

.. note::

   Use a three-letter language code from
   `ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ when
   importing from CSV.


:ref:`Back to the top <isad-template>`


Script of material
------------------

**Template field** Script of material

**CSV Column** script

**ISAD Rule** Record the script(s) of the materials comprising the unit of
description. (ISAD 3.4.3)

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <langmaterial encodinganalog="3.4.3">
            <language scriptcode="___">

.. note::

   Use a three-letter language code from
   `ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ when
   importing from CSV.

:ref:`Back to the top <isad-template>`


Language and script notes
-------------------------

**Template field** Language and script notes

**CSV Column** languageNote

**ISAD Rule** "Note any distinctive alphabets, scripts, symbol systems or
abbreviations employed (ISAD 3.4.3)"

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <langmaterial encodinganalog="3.4.3">

.. note::

   Not intended to duplicate information from language or script, above.

:ref:`Back to the top <isad-template>`


Physical characteristics and technical requirements
---------------------------------------------------

**Template field** Physical characteristics and technical requirements

**CSV Column** physicalCharacteristics

**ISAD Rule** Indicate any important physical conditions, such as preservation
requirements, that affect the use of the unit of description. Note any
software and/or hardware required to access the unit of description. (ISAD
3.4.4)

**EAD**

.. code:: bash

   <archdesc>
      <phystech encodinganalog="3.4.3">


:ref:`Back to the top <isad-template>`

Finding aids
------------

**Template field** Finding aids

**CSV Column** findingAids

**RAD Rule** Give information about any finding aids that the repository or
records creator may have that provide information relating to the context
and contents of the unit of description. If appropriate, include information
on where to obtain a copy. (ISAD 3.4.5)

**EAD**

.. code:: bash

   <archdesc>
      <otherfindaid encodinganalog="3.4.5">


:ref:`Back to the top <isad-template>`


.. _template-isad-allied:

Allied materials area
^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/isad-allied.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Allied materials area

   The data entry fields for the Allied materials area in the
   ISAD(G) template, including Existence and location of originals, Existence
   and location of copies, Related units of description, and Publication
   notes.

Existence and location of originals
-----------------------------------

**Template field** Existence and location of originals

**CSV Column** locationOfOriginals

**ISAD Rule** "If the original of the unit of description is available (either
in the institution or elsewhere) record its location, together with any
significant control numbers. If the originals no longer exist, or their
location is unknown, give that information. (ISAD 3.5.1)"

**EAD**

.. code:: bash

   <archdesc>
      <originalsloc encodinganalog="3.5.1">

:ref:`Back to the top <isad-template>`


Existence and location of copies
--------------------------------

**Template field** Existence and location of copies

**CSV Column** locationOfCopies

**ISAD Rule** "If the copy of the unit of description is available (either in
the institution or elsewhere) record its location, together with any
significant control numbers. (ISAD 3.5.2)"

**EAD**

.. code:: bash

   <archdesc>
      <altformavail encodinganalog="3.5.2">

:ref:`Back to the top <isad-template>`

Related units of description
----------------------------

**Template field** Related units of description

**CSV Column** relatedUnitsOfDescription

**ISAD Rule** "Record information about units of description in the same
repository or elsewhere that are related by provenance or other
association(s). Use appropriate introductory wording and explain the nature
of the relationship . If the related unit of description is a finding aid,
use the finding aids element of description (3.4.5) to make the reference to
it. (ISAD 3.5.3)"

**EAD**

.. code:: bash

   <archdesc>
      <relatedmaterial encodinganalog="3.5.3">

:ref:`Back to the top <isad-template>`


Publication notes
-----------------

**Template field** Publication notes

**CSV Column** publicationNote

**ISAD Rule** Record a citation to, and/or information about a publication
that is about or based on the use, study, or analysis of the unit of
description. Include references to published facsimiles or transcriptions.
(ISAD 3.5.4)"

**EAD**

.. code:: bash

   <archdesc>
      <bibliography encodinganalog="3.5.4">

:ref:`Back to the top <isad-template>`


.. _template-isad-notes:

Notes area
^^^^^^^^^^

.. figure:: images/isad-notes.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Notes area

   The data entry fields for the Notes area in the ISAD(G) template.

Notes
-----

**Template field** Notes

**CSV Column** generalNote

**ISAD Rule** Record specialized or other important information not
accommodated by any of the defined elements of description. (ISAD 3.6.1)"

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <note type="general note">

:ref:`Back to the top <isad-template>`


.. _template-isad-access:

Access points
^^^^^^^^^^^^^

.. figure:: images/isad-access.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Access points area

   The data entry fields for the Access points area in the ISAD(G) template,
   including Subject access points, Place access points, and Name access
   points (subjects).

Subject access points
---------------------

**Template field** Subject access points

**CSV Column** subjectAccessPoints

**ISAD Rule** N/A

**EAD**

.. code:: bash

   <archdesc>
      <controlaccess>
         <subject>

.. note::

   The values in this column/field will create
   :term:`terms <term>` in the subjects :term:`taxonomy` where those do not
   already exist.

:ref:`Back to the top <isad-template>`

Place access points
-------------------

**Template field** Place access points

**CSV Column** placeAccessPoints

**ISAD Rule** N/A

**EAD**

.. code:: bash

   <archdesc>
      <controlacccess>
         <geogname>

.. note::

   The values in this column/field will create :term:`terms <term>` in the
   places :term:`taxonomy` where those do not already exist.

:ref:`Back to the top <isad-template>`

Name access points (subjects)
-----------------------------

**Template field** Name access points

**CSV Column** nameAccessPoints

**ISAD Rule** N/A

**EAD**

**EAD**

If the entity type of the actor is not defined as either a person, family, or
corporate body:

.. code:: bash

   <archdesc>
      <controlaccess>
         <name role="subject">

For a personal name:

.. code:: bash

   <archdesc>
      <controlaccess>
         <persname role="subject">

For a family name:

.. code:: bash

   <archdesc>
      <controlaccess>
         <famname role="subject">

For a corporate body or organizational name:

.. code:: bash

   <archdesc>
      <controlaccess>
         <corpname role="subject">

.. note::

   The values in this column/field will create
   :term:`authority records <authority record>` where those do not already exist.

:ref:`Back to the top <isad-template>`


.. _template-isad-desc-control:

Description control area
^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/isad-control.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the Description control area

   The data entry fields for the Description control are in the ISAD(G) template,
   including Description identifier, Institution identidier, Rules or
   conventions, Status, Level of detail, Dates of creation, revision and
   deletion, Language(s), Script(s), Sources and Archivist's notes.

Description identifier
----------------------

**Template field** Description identifier

**CSV Column** descriptionIdentifier

**ISAD Rule** "Record a unique description identifier in accordance with local
and/or national conventions. If the description is to be used
internationally, record the code of the country in which the description was
created in accordance with the latest version of ISO 3166- Codes for the
representation of names of countries. Where the creator of the description is
an international organisation, give the organisational identifier in place of
the country code."

**EAD**

.. code:: bash

   <archdesc>
      <odd type="descriptionIdentifier">

:ref:`Back to the top <isad-template>`


Institution identifier
----------------------

**Template field** Institution identifier

**CSV Column** institutionIdentifier

**ISAD Rule** "Record the full, authorised form of name(s) of the agency(ies)
responsible for creating, modifying, or disseminating the description, or,
alternatively, record a code for the agency in accordance with the national
or international agency code standard."

**EAD**

.. code:: bash

   <archdesc>
      <odd type="institutionIdentifier">

:ref:`Back to the top <isad-template>`


Rules or conventions
--------------------

**Template field** Rules or conventions

**CSV Column** rules

**ISAD Rule** "Record the international, national and/or local rules or
conventions followed in preparing the description. (ISAD 3.7.2)"

**EAD**

.. code:: bash

   <eadheader>
      <profiledesc>
         <descrules encodinganalog="3.7.2">

:ref:`Back to the top <isad-template>`


Status
------

**Template field** Status

**CSV Column** descriptionStatus

**ISAD Rule** "Record the current status of the description, indicating whether it
is a draft, finalized, and/or revised or deleted."

**EAD**

.. code:: bash

   <archdesc>
      <odd type="statusDescription">

.. note::

   AtoM uses a :term:`taxonomy` to determine the value of this field.
   If you try to import a CSV file using a different :term:`term` from the
   taxonomy, the import will succeed, but a null value will be entered for
   Status (see `Bug 6758 <https://projects.artefactual.com/issues/6758>`_ . The
   default terms are Final, Revised and Draft, but can be edited through the
   :ref:`Manage taxonomy screen <add-term-taxonomy>`.

:ref:`Back to the top <isad-template>`


Level of detail
---------------

**Template field** Level of detail

**CSV Column** levelOfDetail

**ISAD Rule** "Record whether the description consists of a minimal, partial, or
full level of detail in accordance with relevant international and/or
national guidelines and/or rules."

**EAD**

.. code:: bash

   <archdesc>
      <odd type="levelOfDetail">

.. note::

   AtoM uses a :term:`taxonomy` to determine the value of this field.
   If you try to import a CSV file using a different :term:`term` from the
   taxonomy, the import will fail (see
   `Bug 6756 <https://projects.artefactual.com/issues/6756>`_. The default terms
   are Full, Partial and Minimal, but can be edited through the
   :ref:`Manage taxonomy screen <add-term-taxonomy>`.


:ref:`Back to the top <isad-template>`


Dates of creation, revision and deletion
----------------------------------------

**Template field** Dates of creation, revision and deletion

**CSV Column** revisionHistory

**ISAD Rule** "Record the date(s) the entry was prepared and/or revised."

**EAD**

.. code:: bash

   <archdesc>
      <processinfo>
         <date>

.. note::

   This is a free text field, allowing users to also write narrative
   notes about the revision history of the description.

:ref:`Back to the top <isad-template>`


Language of description
-----------------------

**Template field** Language of description

**CSV Column** languageOfDescription

**ISAD Rule** "Indicate the language(s) used to create the description of the
archival material."

**EAD**

.. code:: bash

   <eadheader>
      <profiledesc>
         <language>
            <language langcode="___">

.. note::

   In CSV import, use a three-letter language code from
   `ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ .
   When entering data manually, AtoM will offer an autocomplete drop-down
   list as you type, which will be generated as a three-letter language code
   in the EAD.

:ref:`Back to the top <isad-template>`


Script of description
---------------------

**Template field** Script of description

**CSV Column** scriptOfDescription

**ISAD Rule** "Indicate the script(s) used to create the description of the
archival material."

**EAD**

.. code:: bash

   <eadheader>
      <profiledesc>
         <language>
            <language scriptcode="____">

.. note::

   In CSV import, use a four-letter script code from
   `ISO 1924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_. When
   entering data manually, AtoM will offer an autocomplete drop-down
   list as you type, which will be generated as a four-letter script code
   in the EAD.

:ref:`Back to the top <isad-template>`


Sources
-------

**Template field** Sources

**CSV Column** sources

**ISAD Rule** "Record citations for any external sources used in the archival
description (such as the Scope and Content, Custodial History, or Notes
fields)."

**EAD**

.. code:: bash

   <archdesc>
      <did>
         <note type="sourcesDescription">

.. note::

   If there are sources to cite used used in a biographical
   sketch or administrative history, record these in the sources field for the
   :term:`authority record`.


:ref:`Back to the top <isad-template>`


Archivist's notes
-----------------

**Template field** Archivist's notes

**CSV Column** archivistNote

**ISAD Rule** Record notes on sources consulted in preparing the description
and who prepared it. (ISAD 3.7.1)

**EAD**

.. code:: bash

   <eadheader>
      <filedesc>
         <titlestmt>
            <author encodinganalog="creator">

:ref:`Back to the top <isad-template>`

.. _template-isad-rights:

Rights area
^^^^^^^^^^^

.. figure:: images/rights-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the rights area.

   The data entry area for the Rights area. Multiple rights records can be
   added by clicking "Add new."

This area of the description allows users to enter a :term:`rights record`
compliant with `PREMIS <http://www.loc.gov/standards/premis/>`_. These fields
are separate from the ISAD Conditions and access of use area, above, and editing
one area does not effect the other. Rights records cannot be imported with
descriptions via CSV.

For more information, see
:ref:`Add rights to an archival description <rights-archival-description>`.

:ref:`Back to the top <isad-template>`


.. _template-isad-administration:

Administration area
^^^^^^^^^^^^^^^^^^^

.. figure:: images/admin-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Administration area.

   The data entry fields for the Administration area.

Publication status
------------------

**Template field** Publication status

**CSV column** publicationsStatus

**RAD Rule** N/A

**EAD**

.. code:: bash

   <archdesc>
      <odd type="publicationStatus">

.. note::

   In the :ref:`Global Site Settings <global-settings>`, if the default
   publication status is set to draft, all imported descriptions will be set to
   draft and the EAD file will have the value "draft" in the
   <odd type="publicationStatus"> tag.

:ref:`Back to the top <isad-template>`

Display standard
----------------

**Template field** Display standard

**CSV column** N/A

**RAD Rule** N/A

**EAD** N/A

.. note::

   This fields allows the user to choose a different display standard
   from the :ref:`default template <default-templates>`
   for the shown archival description only, with the option to also change the
   display standard for all existing children of the description.


:ref:`Back to the top <isad-template>`
