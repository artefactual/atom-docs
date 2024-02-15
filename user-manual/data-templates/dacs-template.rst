.. _dacs-template:

===============================================================================
Describing Archives: A Content Standard (DACS 2013) data entry and CSV template
===============================================================================

On this page you will find:

* Link to downloadable CSV template using
  `ISAD(G) General International Standard Archival Description <http://www.ica.org/10207/standards/isadg-general-international-standard-archival-description-second-edition.html>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using DACS
  in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-import`
   * :ref:`import-xml`
   * :ref:`export-xml`
   * :ref:`cli-import-export`


DACS and the ISAD CSV template
==============================

At present, there is no DACS-based CSV template for importing descriptions
into  AtoM. However, because DACS maps so well to the `International Council
on Archives <http://www.ica.org/>`_ ' ISAD(G) standard, the ISAD CSV template
can be used.  The CSV mappings below will provide guidance on which ISAD CSV
fields can be used to  import your DACS-based descriptions into AtoM.

To download the ISAD(G) CSV template for AtoM, please visit our wiki page:

* https://wiki.accesstomemory.org/Resources/CSV_templates

Field descriptions
==================

DACS is maintained by the Society of American Archivists 
(`SAA <http://www2.archivists.org>`__), and the version used in AtoM is 
available at:

* https://files.archivists.org/pubs/DACS2E-2013_v0315.pdf

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the related column in the ((ISAD) CSV
  template
* **DACS Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **EAD** refers to the field mapping to EAD
* **Notes** includes any other information needed for successful data entry or
  CSV import.

**Skip to**:

* :ref:`dacs-identity`
* :ref:`dacs-content-structure`
* :ref:`dacs-access-use-conditions`
* :ref:`dacs-acquisition-appraisal`
* :ref:`dacs-related-materials`
* :ref:`dacs-notes`
* :ref:`dacs-description-control`
* :ref:`dacs-access-points`
* :ref:`dacs-administration`

.. _dacs-identity:

Identity elements
=================

.. image:: images/dacs-identity-elements.*
   :align: center
   :width: 80%
   :alt: An image of the data entry fields in the DACS Identity elements.

.. _dacs-identifier:

Identifier
----------

**Template Field** Identifier

**ISAD CSV Column** ``identifier``

**DACS Rule**: At the highest level of a multilevel description or in a single
level description, provide a unique identifier for the materials being
described in accordance with the institution's administrative control system.

Optionally, devise unique identifiers at lower levels of a multilevel
description. (DACS 2.1.3) The country and repository code will be
automatically added from the linked repository record to form a full reference
code.

**EAD**

.. code-block:: xml

   <did>
      <unitid encodinganalog="3.1.1">

.. _dacs-repository:

Name and Location of Repository
-------------------------------

**Template Field** Name and location of repository

**ISAD CSV Column** ``repository``

**DACS Rule**: Explicitly state the name of the repository, including any
parent bodies. (DACS 2.2.2) 

.. TIP:: 

   Search for an existing name in the archival institution records by typing
   in the first few letters of the name into AtoM's autocomplete field.
   Alternatively, type a new name to create a stub :term:`repository` record
   and link it to the current description on save. For more general
   information, see:

   * :ref:`link-archival-institution`

**EAD**

.. code-block:: xml

   <did>
      <repository>
         <corpname>

.. _dacs-levels-of-description:

Levels of Description
---------------------

**Template Field** Levels of description

**ISAD CSV Column** ``levelOfDescription``

**DACS Rule**: Select a level of description from the drop-down menu. Follow
any relevant local or institutional guidelines in selecting the proper level
of description. See DACS (2013) Chapter 1 for further guidance.

**EAD**

At the parent level:

.. code-block:: xml

   <archdesc level="[level of description]" relatedencoding="ISAD(G)v2">


At the child level:

.. code-block:: xml

   <archdesc level="collection" relatedencoding="ISAD(G)v2">
      <dsc type="combined">
          <c level="[level of description]">

.. _dacs-title:

Title
-----

**Template Field** Title

**ISAD CSV Column** ``title``

**DACS Rule**: In the absence of a meaningful formal title, compose a brief
title that uniquely identifies the material, normally consisting of a name
segment, a term indicating the nature of the unit being described, and
optionally a topical segment.

Do not enclose devised titles in square brackets. (DACS 2.3.3)

**EAD**

.. code-block:: xml

   <did>
      <unitid encodinganalog="3.1.2">

.. _dacs-date:

Date
----

**Template Field** Date(s)

**ISAD CSV Columns** ``eventDates``, ``eventTypes``, ``eventStartDates``, ``eventEndDates``

**DACS Rule** Record dates of creation, record-keeping activity, publication,
or broadcast (``eventTypes``) as appropriate to the materials being described.
(DACS 2.4.3)

**EAD**

.. code-block:: xml

   <did>
     <unitdate encodinganalog="3.1.3">

**Notes**

The Date field (``eventDates``) can be used to enter free-text date
information, including typographical marks to express approximation,
uncertainty, or qualification. 

Use the start and end fields (``eventStartDates`` and ``eventEndDates``) to 
make the dates searchable. Do not use any qualifiers or typographical symbols 
in the start and end fields. Acceptable date formats: YYYYMMDD, YYYY-MM-DD, 
YYYY-MM, YYYY.

For more on how the controlled start and end date fields are used in searching, 
see: 

* :ref:`date-range-search`

.. _dacs-extent:

Extent
------

**Template Field** Extent

**ISAD CSV Column** ``extentAndMedium``

**DACS Rule**: Record the quantity of the material in terms of its physical
extent as linear or cubic feet, number of items, or number of containers or
carriers. (DACS 2.5.4) Optionally, record the quantity in terms of the
material type(s) (DACS 2.5.5), and/or qualify the statement of physical extent
to highlight the existence of material types that are important. (DACS 2.5.6)

**EAD**

.. code-block:: xml

   <did>
      <physdesc encodinganalog="3.1.5">

.. _dacs-creator:

Creator
-------

**Template Field** Name of creator(s)

**ISAD CSV Column** ``eventActors``

**DACS Rule**: Record the name(s) of the creator(s) identified in the name
elevent in the devised title of the materials using standardized vocabularies
or with rules for formulating standardized names (DACS 2.6.4). Search for an
existing name in the authority records by typing the first few characters of
the name. Alternatively, type a new name to create and link to a new authority
record.

**EAD**

.. code-block:: xml

   <controlaccess>
      <name role="[role]" id="[authority record ID]">

.. _dacs-child-levels:

Child levels
---------------------

These fields can be used to add lower levels to a collection level
description. Click "Add new" to create as many child levels as necessary.

Child level identifier
++++++++++++++++++++++

**Template Field:** Identifier

**ISAD CSV Column** ``identifier``

**DACS Rule**: Provide a unique identifier for the materials being described
in accordance with the institution's administrative control system.

**EAD** See the EAD mappings in the related fields.

Level of description
++++++++++++++++++++

**Template Field:** Level

**ISAD CSV Column** ``levelOfDescription``

**DACS Rule**: Record the level of this unit of description.

**EAD** See the EAD mappings in the related fields.

Title
+++++

**Template Field:** Title

**ISAD CSV Column** ``title``

**DACS Rule**: In the absence of a meaningful formal title, compose a brief
title that uniquely identifies the material.

**EAD** See the EAD mappings in the related fields above.

Date
++++

**Template Field:** Date

**ISAD CSV Column** ``eventDates``

.. IMPORTANT::
  
  To include child levels in the ISAD CSV for import, the ``parentId`` column
  must contain the legacy ID of the parent record. For example, if the parent
  record has the legacy ID *249* recorded in the ``legacyId`` column, the
  child record must have the number *249* in the ``parentId`` column, as shown
  in the table here:

    +--------------------+------------+----------+
    | title              | legacyId   | parentId |
    +====================+============+==========+
    | DACS parent level  | 249        |          |
    +--------------------+------------+----------+
    | DACS child level   | 250        | 249      |
    +--------------------+------------+----------+

**DACS Rule:** Record a date of creation.

**EAD** See the EAD mappings in the related fields above.


:ref:`Back to the top <dacs-template>`

.. _dacs-content-structure:

Content and structure elements
==============================

.. figure:: images/dacs-content-structure-elements.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: Data entry fields in the DACS content and structure elements.

   The data entry fields for the content and structure elements of the DACS
   archival description edit template.

.. _dacs-scope:

Scope and content
-----------------

**Template Field** Scope and content

**ISAD CSV Column** ``scopeAndContent``

**DACS Rule**: Record information about the nature of the materials and
activities being reflected in the unit being described to enable users to
judge its relevance, including information about functions, activities,
transactions, and processes; documentary form(s) or intellectual
characteristics; content dates; geographic areas and places; subject matter;
completeness of the materials; or any other information that assists the user
in evaluating the relevance of the materials. (DACS 3.1)

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.3.1">
      <p>

.. _dacs-arrangement:

System of Arrangement
---------------------

**Template Field** System of arrangement

**ISAD CSV Column** ``arrangement``

**DACS Rule**: Describe the current arrangement of the materials in terms of
the various aggregations within it and their relationships. (DACS 3.2.3)

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.3.4">
      <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-access-use-conditions:

Conditions of access and use elements
=====================================

.. figure:: images/dacs-access-use-elements.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: Data entry fields in the DACS conditions of access and use elements

   The data entry fields for the conditions of access and use elements of the
   DACS archival description edit template.

.. _dacs-conditions-governing-access:

Conditions governing access
---------------------------

**Template Field** Conditions governing access

**ISAD CSV Column** ``accessConditions``

**DACS Rule**: Give information about any restrictions on access to the unit
being described (or parts thereof) as a result of the nature of the
information therein or statutory/contractual requirements. As appropriate,
specify the details of the restriction. If there are no restrictions, state
that fact. (DACS 4.1.5)

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.4.1">
      <p>

.. _dacs-physical-access:

Physical access
---------------

**Template Field** Physical access

**ISAD CSV Column** ``physicalCharacteristics``

**DACS Rule**: Provide information about the physical characteristics or
condition of the unit being described that limit access to it or restrict its
use. (DACS 4.2.5)

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.4.3">
      <p>

.. _dacs-technical-access:

Technical access
----------------

**Template Field** Technical access

**ISAD CSV Column** Not mapped to ISAD(G) CSV template

**DACS Rule**: Provide information about any special equipment required to
view or access the unit being described, if it is not clear from the Extent
element. (DACS 4.3.5)

**EAD** Not mapped to EAD.

.. _dacs-reproduction-use:

Conditions governing reproduction and use
-----------------------------------------

**Template Field** Conditions governing reproduction and use

**ISAD CSV Column** ``reproductionConditions``

**DACS Rule**: Give information about copyright status and any other
conditions governing the reproduction, publication, and further use (e.g.,
display, public screening, broadcast, etc.) of the unit being described after
access has been provided. (DACS 4.4.5)

**EAD**

.. code-block:: xml

   <scopecontent encodinganalog="3.4.2">
      <p>

.. _dacs-language:

Languages of the material
-------------------------

**Template Field** Languages of the material

**ISAD CSV Column** ``language``

.. NOTE::

   Use a two-letter language code from
   `ISO 639-1 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ when
   importing from CSV.

**DACS Rule**: Record the language(s) of the materials being described. (DACS 
4.5.2)

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">
         <language langcode="[ISO code]">

.. _dacs-script:

Scripts of the material
-----------------------

**Template Field** Scripts of the material

**ISAD CSV Column** ``script``

.. NOTE::

   Use a four-letter script code from
   `ISO 15924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_ when
   importing from CSV.

**DACS Rule**: Record the scripts(s) of the materials being described.

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">
         <language scriptcode="[ISO code]">

.. _dacs-language-script-notes:

Language and script notes
-------------------------

**Template Field** Language and script notes

**ISAD CSV Column** ``languageNotes``

**DACS Rule**: Record information about any distinctive alphabets, scripts,
symbol systems, or abbreviations employed (DACS 4.5.3). If there is no
language content, record “no linguistic content.” (DACS 4.5.4)

**EAD**

.. code-block:: xml

   <did>
      <langmaterial encodinganalog="3.4.3">

.. _dacs-finding-aids:

Finding aids
------------

**Template Field** Finding aids

**ISAD CSV Column** ``findingAids``

**DACS Rule**: Record information about any existing finding aids that provide
information relating to the context and contents of the unit being described
including any relevant information about its location or availability, and any
other information necessary to assist the user in evaluating its usefulness.
Include finding aids prepared by the creator (e.g., registers, indexes, etc.)
that are part of the unit being described. (DACS 4.6.2)

**EAD**

.. code-block:: xml

   <otherfindaid encodinganalog="3.4.5">
      <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-acquisition-appraisal:

Acquisition and appraisal elements
==================================

.. figure:: images/dacs-acquisition-appraisal-elements.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: Data entry fields in the DACS acquisition and appraisal elements

   The data entry fields for the acquisition and appraisal elements of the
   DACS archival description edit template.

.. _dacs-custodial-history:

Custodial history
-----------------

**Template Field** Custodial history

**ISAD CSV Column** ``archivalHistory``

**DACS Rule**:  Record the successive transfers of ownership, responsibility,
or custody or control of the unit being described from the time it left the
possession of the creator until its acquisition by the repository, along with
the dates thereof, insofar as this information can be ascertained and is
significant to the user’s understanding of the authenticity. (DACS 5.1.3)

**EAD**

.. code-block:: xml

   <custodhist encodinganalog="3.2.3">
      <p>

.. _dacs-source-acquisition-transfer:

Immediate source of acquisition or transfer
-------------------------------------------

**Template Field** Immediate source of acquisition or transfer

**ISAD CSV Column** ``acquisition``

**DACS Rule**: Record the source(s) from which the materials being described
were acquired, the date(s) of acquisition, and the method of acquisition, if
this information is not confidential. (DACS 5.2.3)

**EAD**

.. code-block:: xml

   <acqinfo encodinganalog="3.2.4">
      <p>

.. _dacs-appraisal-information:

Appraisal, destruction and scheduling information
-------------------------------------------------

**Template Field** Appraisal, destruction and scheduling information

**ISAD CSV Column** ``appraisal``

**DACS Rule**: Where the destruction or retention of archival materials has a
bearing on the interpretation and use of the unit being described, provide
information about the materials destroyed or retained and provide the
reason(s) for the appraisal decision(s), where known. (DACS 5.3.4)

**EAD**

.. code-block:: xml

   <appraisal encodinganalog="3.3.2">
      <p>

.. _dacs-accruals:

Accruals
--------

**Template Field** Accruals

**ISAD CSV Column** ``accruals``

**DACS Rule**: If known, indicate whether or not further accruals are
expected. When appropriate, indicate frequency and volume. (DACS 5.4.2)

**EAD**

.. code-block:: xml

   <accruals encodinganalog="3.3.3">
      <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-related-materials:

Related materials elements
==========================

.. figure:: images/dacs-related-materials-elements.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Related materials area.

   The data entry fields for the Related materials area.

.. _dacs-existence-originals:

Existence and location of originals
-----------------------------------

**Template Field** Existence and location of originals

**ISAD CSV Column** ``locationOfOriginals``

**DACS Rule**: If the materials being described are reproductions and the
originals are located elsewhere, give the location of the originals. (DACS
6.1.4) Record any identifying numbers that may help in locating the originals
in the cited location. (DACS 6.1.6)

**EAD**

.. code-block:: xml

   <originalsloc encodinganalog="3.5.1">
      <p>

.. _dacs-existence-copies:

Existence and location of copies
--------------------------------

**Template Field** Existence and location of copies

**ISAD CSV Column** ``locationOfCopies``

**DACS Rule**: If a copy of all or part of the material being described is
available, in addition to the originals, record information about the medium
and location of the copy, any identifying numbers, and any conditions on the
use or availability of the copy. If a copy of only a part of the unit being
described is available, indicate which part. If the materials being described
are available via remote access (electronically or otherwise), provide the
relevant information needed to access them. (DACS 6.2.3)

**EAD**

.. code-block:: xml

   <altformavail encodinganalog="3.5.2">
      <p>

.. _dacs-related-archival-materials:

Related archival materials
--------------------------

**Template Field** Related archival materials

**ISAD CSV Column** ``relatedUnitsOfDescription``

**DACS Rule**: If there are materials that have a direct and significant
connection to those being described by reason of closely shared responsibility
or sphere of activity, provide the title, location, and, optionally, the
reference number(s) of the related materials and their relationship with the
materials being described. (DACS 6.3.5)

**EAD**

.. code-block:: xml

   <relatedmaterial encodinganalog="3.5.3">
      <p>

.. _dacs-related-descriptions:

Related descriptions
--------------------

**Template Field** Related descriptions

**ISAD CSV Column** N/A

**DACS Rule**: N/A

**EAD** Not mapped to EAD.

**Notes**

To create a relationship between this :term:`archival description` and another 
description held in AtoM, begin typing the name of the related description and 
select it from the autocomplete :term:`drop-down menu` when it appears below. 
Multiple relationships can be created. For more information, see: 

* :ref:`link-related-descriptions`

.. _dacs-publication-notes:

Publication notes
-----------------

**Template Field** Publication notes

**ISAD CSV Column** ``publicationNote``

**DACS Rule**: Record a citation to, or information about, a publication that
is about or is based on the use, study, or analysis of the materials being
described. Provide sufficient information to indicate the relationship between
the publication and the unit being described. This includes annotated
editions. (DACS 6.4.4)

**EAD**

.. code-block:: xml

   <bibliography encodinganalog="3.5.4">
      <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-notes:

Notes elements
==============

.. figure:: images/dacs-notes-elements.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Notes area.

   The data entry fields for the Notes area.

.. _dacs-general-note:

General note(s)
---------------

**Template Field** General note(s)

**ISAD CSV Column** ``generalNote``

**DACS Rule**: Record, as needed, information not accommodated by any of the
defined elements of description. (DACS 7.1.2)

**EAD**

.. code-block:: xml

   <did>
      <note type="generalNote">
          <p>

.. _dacs-specialized-note:

Specialized note(s)
-------------------

**Template Field** Specialized note(s)

**ISAD CSV Column** N/A

**DACS Rule**: Select a note type from the drop-down menu and record, as
needed, specialized information not accommodated by any of the defined
elements of description, including Conservation (DACS 7.1.3), Citation (DACS
7.1.5), Alphanumeric designation (DACS 7.1.6), Variant title information (DACS
7.1.7), or Processing information (DACS 7.1.8).

**EAD**

Conservation note:

.. code-block:: xml

   <odd type="dacsConservation">
         <p>

Citation note:

.. code-block:: xml

  <odd type="dacsCitation">
        <p>

Alphanumeric designation note:

.. code-block:: xml

  <odd type="dacsAlphanumericDesignation">
        <p>

Variant title information note:

.. code-block:: xml

  <odd type="dacsVariantTitleInformation">
        <p>

Processing information note:

.. code-block:: xml

  <odd type="dacsProcessingInformation">
        <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-description-control:

Description control elements
============================

.. figure:: images/dacs-description-control-elements.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Description control area.

   The data entry fields for the Description control area.

.. _dacs-sources-used:

Sources used
------------

**Template Field** Sources used

**ISAD CSV Column** ``sources``

**DACS Rule**: Record relevant information about sources consulted in
establishing or revising the description. (DACS 8.1.3)

**EAD**

.. code-block:: xml

   <did>
      <note type="sourcesDescription">
          <p>

.. _dacs-rules-conventions:

Rules or conventions
--------------------

**Template Field** Rules or conventions

**ISAD CSV Column** ``rules``

**DACS Rule**: Record the international, national or local rules or
conventions followed in preparing the description. (DACS 8.1.4)

**EAD**

.. code-block:: xml

   <eadheader>
      <profiledesc>
         <descrules encodinganalog="3.7.2">

.. _dacs-archivist:

Archivist and date
------------------

**Template Field** Archivist and date

**ISAD CSV Column** ``archivistNote``

**DACS Rule**: Record the name(s) of the person(s) who created or revised the
description, as well as the creation or revision date. (DACS 8.1.5)

**EAD**

.. code-block:: xml

    <archdesc>
       <processinfo>
          <p>

:ref:`Back to the top <dacs-template>`

.. _dacs-access-points:

Access points
=============

.. figure:: images/dacs-access-points-elements.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Access points area.

   The data entry fields for the Access points area.

The DACS standard does not include rules about access points, but it does 
include general high-level guidance on their use and where relevant information
can be found when constructing controlled vocabulary terms (See pg xxiv in 
Describing Archives: A Content Standard, Second Edition). 

.. _dacs-subject-access-points:

Subject access points
---------------------

**Template Field** Subject access points

**ISAD CSV Column** ``subjectAccessPoints``

**DACS Rule**: The topical subject matter to which the records pertain is among 
the most important aspects of the archival materials. Terms suggesting topics 
that might be employed as access points may be found in the following areas of 
the descriptive record: 

* Title Element (2.3) 
* Scope and Content Element (3.1) 
* Administrative/Biographical History Element (2.7)

A variety of general and specialized subject thesauri, including the *Library of 
Congress Authorities*, may be employed as the source for standardized 
terminology.

**EAD**

.. code-block:: xml

   <controlaccess>
      <subject>

.. _dacs-place-access-points:

Place access points
-------------------

**Template Field** Place access points

**ISAD CSV Column** ``placeAccessPoints``

**DACS Rule**: The names of places and geographic features to which the records 
pertain may be important to researchers. Geographic place-names that should be 
considered for use as access points may be found in the following parts of the 
descriptive record: 

* Name of Creator(s) Element (2.6) 
* Title Element (2.3) 
* Scope and Content Element (3.1) 
* Administrative/Biographical History Element (2.7) 

**EAD**

.. code-block:: xml

   <controlaccess>
      <geogname>

.. _dacs-genre-access-points:

Genre access points
-------------------

**Template Field** Genre access points

**ISAD CSV Column** ``genreAccessPoints``

**DACS Rule**: Terms that indicate the documentary form(s) or intellectual
characteristics of the records being described (e.g., minutes, diaries,
reports, watercolors, or documentaries) provide the user with an indication of
the content of the materials based on an understanding of the common
properties of particular document types. For example, one can deduce the
contents of ledgers because they are a standard form of accounting record, one
that typically contains certain types of data. Documentary forms are most
often noted in the following areas of the descriptive record: 

* Title Element (2.3)
* Extent Element (2.5)
* Scope and Content Element (3.1)
 
The *Art & Architecture Thesaurus*, the *Library of Congress Authorities*, or
appropriate media-specific thesauri should be the first sources consulted for
terms denoting documentary forms and literary genres.


**EAD**

.. code-block:: xml

   <controlaccess>
      <genreform>

.. _dacs-name-access-points:

Name access points
------------------

**Template Field** Name access points (subjects)

**ISAD CSV Column** ``nameAccessPoints``

**DACS Rule**: The names of persons, families, and organizations that are
associated with a body of archival materials, either as the creator or the
subject of the records, constitute an important pathway by which researchers
discover relevant materials. Names that are rendered as nominal access points
can be found in several areas of the descriptive record:

* Name of Creator(s) Element (2.6) 
* Title Element (2.3) 
* Scope and Content Element (3.1) 
* Administrative/Biographical History Element (2.7) 
* Custodial History Element (5.1) 
* Immediate Source of Acquisition Element (5.2)

At a minimum, an access point should be made for every name included in the
Name of Creator(s) Element in a single-level description or at the highest
level in a multilevel description. Names found in other descriptive elements
may be utilized as access points in accordance with local or consortial
practice.

**EAD**

.. code-block:: xml

   <controlaccess>
      <name role="subject">

.. NOTE:: 

   The DACS standard also recommends access points related to occupations, as 
   well as functions and activities. In AtoM, this data can be captured on
   other :term:`entity` types, such as :term:`authority records <authority record>`
   (which allow the addition of Occupation access points) and :term:`function` 
   records. For more information, see: 

   * :ref:`authority-records`
   * :ref:`authority-access-points`
   * :ref:`functions`

:ref:`Back to the top <dacs-template>`

.. _dacs-administration:

Administration area
===================

.. figure:: images/admin-area-dacs.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the data entry fields for the Administration area.

   The data entry fields for the Administration area.

.. _dacs-admin-display:

Display standard
----------------

**Template field** Display standard

**CSV column** N/A

**DACS Rule** N/A

**EAD** N/A

.. NOTE::

   This fields allows the user to choose a different display standard
   from the :ref:`default template <default-templates>`
   for the shown archival description only, with the option to also change the
   display standard for all existing children of the description. See:
   :ref:`change-display-standard`.

.. _dacs-admin-pubstatus:

Publication status
------------------

**Template field** Publication status is available under the More tab located 
on the description :term:`view page`.

**CSV column** publicationsStatus

**DACS Rule** N/A

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

:ref:`Back to the top <dacs-template>`
