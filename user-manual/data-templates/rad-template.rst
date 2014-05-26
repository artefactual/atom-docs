.. _rad-template:

================================================================
Rules for Archival Description (RAD) data entry and CSV template
================================================================

On this page you will find:

* Link to downloadable CSV template using
  `Rules for Archival Description <http://www.cdncouncilarchives.ca/archdesrules.html>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using Rules for Archival
  Description in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-testing-import`


RAD CSV template
================

To download the Rules for Archival Description CSV template for AtoM 2.0,
please visit our wiki page (link to come).

Field descriptions
==================

RAD is maintained by the `Canadian Council of Archives
<http://www.cdncouncilarchives.ca>`_ and is available at
http://www.cdncouncilarchives.ca/archdesrules.html.

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the column in the CSV template
* **Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **EAD** refers to the field mapping to EAD
* **Notes** includes any other information needed for successful data entry or
  CSV import.

**Skip to**:

* :ref:`Title and statement of responsibility area <template-title>`
* :ref:`Edition area <template-edition>`
* :ref:`Class of material specific details area <template-class>`
* :ref:`Authority record fields <template-authority>`
* :ref:`Dates of creation area <template-dates>`
* :ref:`Physical description area <template-physical>`
* :ref:`Publisher's series area <template-publishers>`
* :ref:`Archival description area <template-description>`
* :ref:`Notes area <template-notes>`
* :ref:`Standard number area <template-standard-number>`
* :ref:`Access points <template-access>`
* :ref:`Control area <template-control>`
* :ref:`Rights area <template-rights>`
* :ref:`Administration area <template-admin>`

.. _template-title:

Title and statement of responsibility area
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/title-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Title and statement of
         responsibility area

   The data entry fields for Title proper, GMD, Parallel titles, Other title
   information, and Statement of responsibility

Title proper
------------

**Template field** Title proper

**CSV Column** title

**Rule** Enter the title proper, either transcribed or supplied (RAD 1.1B)

**EAD**

At a parent level:

.. code:: bash

   <archdesc level="[name of level]">
      <did>
         <unittitle encodinganalog="1.1B">

At a child level:

.. code:: bash

   <c level="[name of level]>
      <did>
         <unittitle encodinganalog="1.1B">

**Notes** The EAD tag ``<titleproper encodinganalog="title">``refers to the
title of the finding aid, not the archival description.

:ref:`Back to the top <rad-template>`

General material designation
----------------------------

**Template field** General material designation

**CSV Column** radGeneralMaterialDesignation

**Rule** Select the General Material Designation at the highest level of
description. If there are more than three, select "multiple media." (RAD 1.1C)

**EAD**

.. code:: bash

   <controlaccess>
      <genreform encodinganalog="1.1C">

**Notes** Although the RAD standard specifies set values for General Material
Designations, in AtoM these can be edited in the Material type
:term:`taxonomy` (see: :ref:`Add a new term <add-term>`).
If you try to import a CSV file using a different :term:`term` from the
taxonomy, the import will fail.

:ref:`Back to the top <rad-template>`

Parallel title
--------------

**Template field** Parallel title

**CSV Column** alternateTitle

**Rule** [W]hen applicable, transcribe parallel titles that appear in
conjunction with the formal title proper...(RAD 1.1D)

**EAD**

.. code:: bash

   <archdesc level="[name of level]" relatedencoding="RAD">
      <did>
         <unittitle type="parallel" encodinganalog="1.1D">

**Notes**

:ref:`Back to the top <rad-template>`

Other title information
-----------------------

**Template field** Other title information

**CSV Column** radOtherTitleInformation

**Rule** Transcribe other title information that appears in conjunction with
the formal title proper. (RAD 1.1E)

**EAD**

<unittitle type="otherInfo" encodinganalog="1.1E">

**Notes**

:ref:`Back to the top <rad-template>`

Title statements of responsibility
----------------------------------

**Template field** Title statements of responsibility

**CSV Column** radTitleStatementOfResponsibility

**Rule** "At the item level of description, transcribe explicit statements of
responsibility appearing in conjunction with the formal title proper in or on
the chief source of information..." (RAD 1.1F)

**EAD** <unittitle type="statRep">

**Notes**

:ref:`Back to the top <rad-template>`

.. figure:: images/title-notes.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Title notes area

   The data entry fields for Title notes. Multiple title notes can be added
   by clicking "Add new."

Title notes- Statements of responsibility
-----------------------------------------

**Template field** Title notes- Statements of responsibility

**CSV Column** radTitleStatementOfResponsibilityNote

**Rule** "Make notes on any statement(s) of
responsibility that appear outside the chief source of information or that appear on the
chief source, but not in conjunction with a formal title proper. Record statements of
responsibility that appear on the chief source of information for a file or series, if
applicable." (RAD 1.8B5)

**EAD** <odd type="titleStatRep">

**Notes**

:ref:`Back to the top <rad-template>`

Title notes- Attributions and conjectures
-----------------------------------------

**Template field** Title notes- Attributions and conjectures

**CSV Column** radTitleAttributionsAndConjectures

**Rule** "Make notes on authors to whom the unit being
described has been attributed, and cite sources, if appropriate." (RAD 1.8B6)

**EAD** <odd type="titleAttributions">

**Notes**

:ref:`Back to the top <rad-template>`

Title notes- Continuation of title
----------------------------------

**Template field** Title notes- Continuation of title

**CSV Column** radTitleContinues

**Rule** "Complete the transcription if the formal title proper and/or
other title information was abridged in the description." (RAD 1.8B4)

**EAD** <odd type="titleContinuation">

**Notes**

:ref:`Back to the top <rad-template>`

Title notes- Source of title proper
-----------------------------------

**Template field** Title notes- Source of title proper

**CSV Column** radTitleSourceOfTitleProper

**Rule** "Indicate the source of a title proper, when appropriate." (RAD
1.8B2)

**EAD** <odd type="titleSource">

**Notes**

:ref:`Back to the top <rad-template>`

Title notes- Variations in title
--------------------------------

**Template field** Title notes- Variations in title

**CSV Column** radTitleVariationsInTitle

**Rule** "Make notes on variant titles appearing outside the prescribed
source of information. Make notes on titles by which the unit being described has been
traditionally known other than the title proper." (RAD 1.8B1)

**EAD** <odd type="titleVariation">

**Notes**

:ref:`Back to the top <rad-template>`

Title notes- Parallel titles and other title information
--------------------------------------------------------

**Template field** Title notes- Parallel titles and other title information

**CSV Column** radTitleParallelTitles

**Rule** "Make notes on parallel titles and other title information not
recorded in the Title and statement of responsibility area if they are
considered to be important." (RAD 1.8B3)

**EAD** <odd type="titleParallel">

**Notes**

:ref:`Back to the top <rad-template>`

.. figure:: images/title-area-2.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Level of description, new
         child levels, Repository and Identifier.

   The data entry fields for Level of description, child levels, Repository
   and Identifier. Multiple child levels can be added by clicking "Add new."

Level of description
--------------------

**Template field** Level of description

**CSV Column** levelOfDescription

**Rule** Select a level of description from the drop-down menu. See RAD 1.0A for
rules and conventions on selecting levels of description.

**EAD** <archdesc level="[level of description]">

**Notes** An :term:`administrator` can edit the values in the Levels of
description :term:`taxonomy` (see: :ref:`Add a new term <add-term>`).
If you try to import a CSV file using a different :term:`term` from the
taxonomy, the import will fail.

:ref:`Back to the top <rad-template>`

Add new child levels
--------------------

**Template field** Identifier, Level, Title, Date

**CSV Column** See notes below

**Rule** *Indentifier* Enter an unambiguous code used to uniquely identify the
description. *Level* Select a level of description from the drop-down menu.
See RAD 1.0A for rules and conventions on selecting levels of description.
*Title* Enter the title proper, either transcribed or supplied (RAD 1.1B).

**EAD** N/A

**Notes** When entering descriptions manually, users can add new
:term:`child records <child record>` in this area while adding a parent record.
In CSV import, this can be achieved using the legacyID and parentID columns. See
:ref:`Dealing with hierarchical data in CSV <csv-legacy-id-mapping>`.

Repository
----------

**Template field** Repository

**CSV Column** repository

**Rule** Select the repository that has custody and
control of the archival material. The values in this field are drawn from the
Authorized form of name field in archival institution records. Search for an
existing name by typing the first few characters of the name. Alternatively,
type a new name to create and link to a new archival institution.

**EAD** <repository> <corpname>

**Notes**

:ref:`Back to the top <rad-template>`

Reference code
--------------

**Template field** Identifier

**CSV Column** identifier

**Rule** Enter an unambiguous code used to uniquely identify the description.

**EAD** <unitid>

**Notes** This field displays to non-logged in users as "Reference code."
While editing the record, the full reference code including any identifiers
:ref:`inherited <inherit-reference-code>` from higher levels will appear
below the Identifier field.


:ref:`Back to the top <rad-template>`

.. _template-edition:

Edition area
^^^^^^^^^^^^
.. figure:: images/edition-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Edition area.

   The data entry fields for the Edition area.

Edition statement
-----------------

**Template field** Edition statement

**CSV Column** radEdition

**Rule** "Transcribe the edition statement relating to the item being
described." (RAD 1.2B1) "If the item being described lacks an edition
statement but is known to contain significant changes from other editions,
supply a suitable brief statement in the language and script of the title
proper and enclose it in square brackets." (RAD 1.2B3)

**EAD** <edition>

**Notes**

:ref:`Back to the top <rad-template>`

Edition statement of responsibility
-----------------------------------

**Template field** Edition statement of responsibility

**CSV Column** radEditionStatementOfResponsibility

**Rule** "Transcribe a statement of responsibility relating to one or more
editions, but not to all editions, of the item being described following the
edition statement if there is one." (RAD 1.2.C1) "When describing the first
edition, give all statements of responsibility in the Title and statement of
responsibility area." (RAD 1.2C2)

**EAD** <unittitle type="statRep"> <edition>

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-class:

Class of materials specific details area
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/class-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Class of materials specific
         details area.

   The data entry fields for the Class of materials specific details area.


RAD: "1.3A. Preliminary rule: 1.3A1. Scope: For instructions regarding this
area, refer to the chapters dealing with the class(es) of material that use
it."


Statement of scale (cartographic)
---------------------------------

**Template field** Statement of scale (cartographic)

**CSV Column** radStatementOfScaleCartographic

**Rule** "Give the scale of the unit being described...as a representative
fraction (RF) expressed as a ratio (1: ). Precede the ratio by Scale. Give the
scale even if it is already recorded as part of the title proper or other
title information." (RAD 5.3B1)

**EAD** <materialspec type="cartographic">

**Notes**

:ref:`Back to the top <rad-template>`

Statement of projection (cartographic)
--------------------------------------

**Template field** Statement of projection (cartographic)

**CSV Column** radStatementOfProjection

**Rule** "Give the statement of projection if it is found on the prescribed
source(s) of information." (RAD 5.3C1)

**EAD** <materialspec type="projection">

**Notes**

:ref:`Back to the top <rad-template>`

Statement of coordinates (cartographic)
---------------------------------------

**Template field** Statement of coordinates (cartographic)

**CSV Column** radStatementOfCoordinates

**Rule** "At the fonds, series or file levels, record coordinates for the
maximum coverage provided by the materials in the unit, as long as they are
reasonably contiguous." (RAD 5.3D)

**EAD** <materialspec type="coordinates">

**Notes**

:ref:`Back to the top <rad-template>`

Statement of scale (architectural)
----------------------------------

**Template field** Statement of scale (architectural)

**CSV Column** radStatementOfScaleArchitectural

**Rule** "Give in English the scale in the units of measure found on the unit
being described. If there is no English equivalent for the name of the unit
of measure, give the name, within quotation marks, as found on the unit
being described." (RAD 6.3B)

**EAD** <materialspec type="architectural">

**Notes**

:ref:`Back to the top <rad-template>`

Issuing jurisdiction and denomination (philatelic)
--------------------------------------------------

**Template field** Issuing jurisdiction and denomination (philatelic)

**CSV Column** radIssuingJurisdiction

**Rule** "Give the name of the jurisdiction (e.g., government) responsible for
issuing the philatelic records." (RAD 12.3B1) "For all units possessing a
denomination (e.g., postage stamps, revenue stamps, postal stationery items),
give the denomination in a standardized format, recording the denomination
number in arabic numerals followed by the name of the currency unit. Include a
denomination statement even if the denomination is already recorded as part of
the title proper or other title information." (RAD 12.3C1)

**EAD** <materialspec type="philatelic">

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-authority:

Authority record fields
^^^^^^^^^^^^^^^^^^^^^^^

These fields are found in the CSV template but when entering descriptions
manually are found in the :term:`authority record`. However, the description can be
linked to the authority record while entering the data manually.

Creator
-------

**Template field** Creator

**CSV Column** creators

**Rule** Use the Actor name field to link an authority record to this
description. Search for an existing name in the authority records by typing
the first few characters of the name. Alternatively, type a new name to
create and link to a new authority record.

**EAD** <origination> <name>

**Notes** When entering the description manually, the Creator field is found
within the Dates of creation area, labeled as "Actor name."

:ref:`Back to the top <rad-template>`

Biographical history
--------------------

**Template field** Biographical history

**CSV Column** creatorHistories

**Rule** "Record in narrative form or as a chronology the main life events,
activities, achievements and/or roles of the entity being described. This may
include information on gender, nationality, family and religious or political
affiliations. Wherever possible, supply dates as an integral component of the
narrative description." (ISAAR 5.2.2)

See also RAD section 1.7B1.

**EAD** <bioghist> <note>

**Notes** When entering data manually, this field needs to be written in the
:term:`authority record`. If an authority record does not already exist, AtoM
will create one when a new creator is entered, above. The user can then
navigate to the authority record to enter the Biographical or Administrative
history (see: :ref:`Authority records <authority-records>`).

When importing descriptions by CSV, by default this column will
create a Biographical history in the :term:`authority record`, regardless of
whether the creator is a person, family, or organization. To specify the
entity type when importing creators, users would need to
:ref:`import authority records <csv-import-authority-records>`.

:ref:`Back to the top <rad-template>`

.. _template-dates:

Dates of creation area
^^^^^^^^^^^^^^^^^^^^^^

When entering data manually, the fields below are accessed by clicking "Add
new" in the dates of creation area.

.. figure:: images/event-entry.*
   :align: right
   :figwidth: 35%
   :width: 100%
   :alt: An image of the data entry fields for the Dates of Creation area

   The data entry fields for the Dates of Creation area

Entering an actor's name will automatically insert the actor's
biographical sketch or administrative history from the
:term:`authority record`.

When entering data manually, users can choose an event type from a
:term:`drop-down menu`. The event types can be edited by an
:term:`administrator` in the Event types :term:`taxonomy` (see:
:ref:`Add a new term <add-term>`). When importing descriptions via CSV, the
event type defaults to Creation.

Place
-----

**Template field** Place

**CSV Column** N/A

**Rule** "For an item, transcribe the place of publication, distribution,
etc., in the form and grammatical case in which it appears." (RAD 1.4C1).
Search for an existing term in the places taxonomy by typing the first few
characters of the term name. Alternatively, type a new term to create and
link to a new place term.

**EAD** N/A

**Notes** This field does not map to EAD due to its relation to a specific
event.

Date(s)
-------

**Template field** Date(s)

**CSV Column** creatorDates

**Rule** "Give the date(s) of creation of the unit being described either as a
single date, or range of dates (for inclusive dates and/or predominant dates).
Always give the inclusive dates. When providing predominant dates, specify
them as such, preceded by the word predominant..." (1.4B2). Record probable
and uncertain dates in square brackets, using the conventions described in RAD
1.4B5.

**EAD** <bioghist> <date type ="creation">

**Notes** This field will display the date as intended by the editor of the
archival description, in the language of the standard being used.

:ref:`Back to the top <rad-template>`

Dates of creation- Start
------------------------

**Template field** Dates of creation- Start

**CSV Column** creatorDatesStart

**Rule** Enter the start year. Do not use any qualifiers or typographical
symbols to express uncertainty. Acceptable date formats: YYYYMMDD,
YYYY-MM-DD, YYYY-MM, YYYY.

**EAD** <unitdate>

**Notes** This field only displays while editing the description. If AtoM is
able to interpret the start date from the Date(s) field, above, it will
autopopulate upon entering.

:ref:`Back to the top <rad-template>`

Dates of creation- End
----------------------

**Template field** Dates of creation- End

**CSV Column** creatorDatesEnd

**Rule** Enter the end year. Do not use any qualifiers or typographical symbols
to express uncertainty. Acceptable date formats: YYYYMMDD,
YYYY-MM-DD, YYYY-MM, YYYY.

**EAD** <unitdate>

**Notes** This field only displays while editing the description. If AtoM is
able to interpret the start date from the Date(s) field, above, it will
autopopulate upon entering.

:ref:`Back to the top <rad-template>`

Dates of creation- Note
-----------------------

**Template field** Dates of creation- Note

**CSV Column** creatorDatesNotes

**Rule** "Make notes on dates and any details pertaining to the dates of
creation, publication, or distribution, of the unit being described that are
not included in the Date(s) of creation, including publication, distribution,
etc., area and that are considered to be important. " (RAD 1.8B8) "Make notes
on the date(s) of accumulation or collection of the unit being described." RAD
1.8B8a)

**EAD** <event> <note type="eventNote">

**Notes** This appears while editing as "Event note."

:ref:`Back to the top <rad-template>`

.. _template-physical:

Physical description area
^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/physical-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Physical description area.

   The data entry fields for the Physical description area.


Physical description
--------------------

**Template field** Physical description

**CSV Column** extentAndMedium

**Rule** "At all levels record the extent of the unit being described by
giving the number of physical units in arabic numerals and the specific
material designation as instructed in subrule .5B in the chapter(s) dealing
with the broad class(es) of material to which the unit being described
belongs." (RAD 1.5B1) Include other physical details and dimensions as
specified in RAD 1.5C and 1.5D. Separate multiple entries in this field with a
carriage return (i.e. press the Enter key on your keyboard).

**EAD** <physdesc> <extent>

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-publishers:

Publisher's series area
^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/publishers-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Publisher's series area.

   The data entry fields for the Publisher's series area.

Title proper of publisher's series
----------------------------------

**Template field** Title proper of publisher's series

**CSV Column** radTitleProperOfPublishersSeries

**Rule** "At the item level of description, transcribe a title proper of the
publisher's series as instructed in 1.1B1." (RAD 1.6B)

**EAD** <bibseries> <title>

**Notes**

:ref:`Back to the top <rad-template>`

Parallel titles of publisher's series
-------------------------------------

**Template field** Parallel titles of publisher's series

**CSV Column** radParallelTitlesOfPublishersSeries

**Rule** "Transcribe parallel titles of a publisher's series as instructed in
1.1D." (RAD 1.6C1)

**EAD** <bibseries> <title type="parallel">

**Notes**

:ref:`Back to the top <rad-template>`

Other title information of publisher's series
---------------------------------------------

**Template field** Other title information of publisher's series

**CSV Column** radOtherTitleInformationOfPublishersSeries

**Rule** "Transcribe other title information of a publisher's series as
instructed in 1.1E and only if considered necessary for identifying the
publisher's series." (RAD 1.6D1)

**EAD** <bibseries> <title type="otherInfo">

**Notes**

:ref:`Back to the top <rad-template>`


Statement of responsibility relating to publisher's series
----------------------------------------------------------

**Template field** Statement of responsibility relating to publisher's series

**CSV Column** radStatementOfResponsibilityRelatingToPublishersSeries

**Rule** "Transcribe explicit statements of responsibility appearing in
conjunction with a formal title proper of a publisher's series as instructed
in 1.1F and only if considered necessary for identifying the publisher's
series." (RAD 1.6E1)

**EAD** <bibseries> <title type="statRep">

**Notes**

:ref:`Back to the top <rad-template>`

Numbering within publisher's series
-----------------------------------

**Template field** Numbering within publisher's series

**CSV Column** radNumberingWithinPublishersSeries

**Rule** "Give the numbering of the item within a publisher's series in the
terms given in the item." (RAD 1.6F1)

**EAD** <bibseries> <num>

**Notes**

:ref:`Back to the top <rad-template>`

Note on publisher's series
--------------------------

**Template field** Note on publisher's series

**CSV Column** radPublishersSeriesNote

**Rule** "Make notes on important details of publisher's series that are not
included in the Publisher's series area, including variant series titles,
incomplete series, and of numbers or letters that imply a series." (RAD
1.8B10)

**EAD** <odd type="bibSeries">

**Notes** This field maps to the same EAD field as the field in Notes area below,
Other notes- Publisher's Series. Both notes refer to RAD 1.8B10.

:ref:`Back to the top <rad-template>`

.. _template-description:

Archival description area
^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/archival-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Archival description area.

   The data entry fields for the Archival description area.

Custodial history
-----------------

**Template field** Custodial history

**CSV Column** archivalHistory

**Rule** "Give the history of the custody of the unit being described, i.e., the
successive transfers of ownership and custody or control of the material,
along with the dates thereof, insofar as it can be ascertained." (RAD 1.7C)

**EAD** <custodhist>

**Notes**

:ref:`Back to the top <rad-template>`

Scope and content
-----------------

**Template field** Scope and content

**CSV Column** scopeAndContent

**Rule** "At the fonds, series, and collection levels of description, and when
necessary at the file and the item levels of description, indicate the level
being described and give information about the scope and the internal
structure of or arrangement of the records, and about their contents." (RAD
1.7D)

"For the scope of the unit being described, give information about the
functions and/or kinds of activities generating the records, the period of
time, the subject matter, and the geographical area to which they pertain.
For the content of the unit being described, give information about its
internal structure by indicating its arrangement, organization, and/or
enumerating its next lowest level of description. Summarize the principal
documentary forms (e.g., reports, minutes, correspondence, drawings,
speeches)." (RAD 1.7D1)

**EAD** <scopecontent>

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-notes:

Notes area
^^^^^^^^^^

.. figure:: images/notes-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the notes area.

   The data entry fields for the Notes area. More notes fields continue below
   the screen shown.

Physical condition
------------------

**Template field** Physical condition

**CSV Column** physicalCharacteristics

**Rule** "Make notes on the physical condition of the unit being described if
that condition materially affects the clarity or legibility of the records."
(RAD 1.8B9a)

**EAD** <phystech>

**Notes**

:ref:`Back to the top <rad-template>`

Immediate source of acquisition
-------------------------------

**Template field** Immediate source of acquisition

**CSV Column** acquisition

**Rule** "Record the donor or source (i.e., the immediate prior custodian) from
whom the unit being described was acquired, and the date and method of
acquisition, as well as the source/donor's relationship to the material, if
any or all of this information is not confidential. If the source/donor is
unknown, record that information." (RAD 1.8B12)

**EAD**  <acqinfo>

**Notes**

:ref:`Back to the top <rad-template>`

Arrangement
-----------

**Template field** Arrangement

**CSV Column** arrangement

**Rule** "Make notes on the arrangement of the unit being described which
contribute significantly to its understanding but cannot be put in the Scope
and content (see 1.7D), e.g., about reorganisation(s) by the creator,
arrangement by the archivist, changes in the classification scheme, or
reconstitution of original order." (RAD 1.8B13)

**EAD** <arrangement>

**Notes**

:ref:`Back to the top <rad-template>`

Language of material
--------------------

**Template field** Language of material

**CSV Column** language

**Rule** "Record the language or languages of the unit being described, unless
they are noted elsewhere or are apparent from other elements of the
description." RAD (1.8.B14).

**EAD** <langmaterial> <language langcode>

**Notes** Use a three-letter language code from
`ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_

:ref:`Back to the top <rad-template>`

Script of material
------------------

**Template field** Script of material

**CSV Column** script

**Rule** "[N]ote any distinctive alphabets or symbol systems employed."
RAD (1.8.B14)

**EAD** <langmaterial> <language scriptcode>

**Notes** Use a four-letter script code from
`ISO 1924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_

:ref:`Back to the top <rad-template>`


Language and script note
------------------------

**Template field** Language and script note

**CSV Column** languageNote

**Rule** "Record the language or languages of the unit being described, unless
they are noted elsewhere or are apparent from other elements of the
description. Also note any distinctive alphabets or symbol systems employed."
RAD (1.8.B14).

**EAD** <langmaterial>

**Notes** Not intended to duplicate information from language or script, above.

:ref:`Back to the top <rad-template>`


Location of originals
---------------------

**Template field** Location of originals

**CSV Column** locationOfOriginals

**Rule** "If the unit being described is a reproduction and the location of the
original material is known, give that location. Give, in addition, any
identifying numbers that may help in locating the original material in the
cited location. If the originals are known to be no longer extant, give that
information." (RAD 1.8B15a)

**EAD** <originalsloc>

**Notes**

:ref:`Back to the top <rad-template>`


Availability of other formats
-----------------------------

**Template field** Availability of other formats

**CSV Column** locationOfCopies

**Rule** "If all or part of the unit being described is available (either in the
institution or elsewhere) in another format(s), e.g., if the text being
described is also available on microfilm; or if a film is also available on
videocassette, make a note indicating the other format(s) in which the unit
being described is available and its location, if that information is known.
If only a part of the unit being described is available in another
format(s), indicate which parts." (RAD 1.8B15b)

**EAD** <altformavail>

**Notes**

:ref:`Back to the top <rad-template>`


Restrictions on access
----------------------

**Template field** Restrictions on access

**CSV Column** accessConditions

**Rule** "Give information about any restrictions placed on access to the unit
(or parts of the unit) being described." (RAD 1.8B16a)

**EAD** <accessrestrict>

**Notes**

:ref:`Back to the top <rad-template>`

Terms governing use, reproduction, and publication
--------------------------------------------------

**Template field** Terms governing use, reproduction, and publication

**CSV Column** reproductionConditions

**Rule** "Give information on legal or donor restrictions that may affect use or
reproduction of the material." (RAD 1.8B16c)

**EAD** <userestrict>

**Notes**

:ref:`Back to the top <rad-template>`


Finding aids
------------

**Template field** Finding aids

**CSV Column** findingAids

**Rule** "Give information regarding the existence of any finding aids. Include
appropriate administrative and/or intellectual control tools over the
material in existence at the time the unit is described, such as card
catalogues, box lists, series lists, inventories, indexes, etc." (RAD
1.8B17)

**EAD** <otherfindaid>

**Notes**

:ref:`Back to the top <rad-template>`

Associated materials
--------------------

**Template field** Associated materials

**CSV Column** relatedUnitsOfDescription

**Rule** For associated material, "If records in another institution are
associated with the unit being described by virtue of the fact that they
share the same provenance, make a citation to the associated material at the
fonds, series or collection level, or for discrete items, indicating its
location if known." (RAD 1.8B18).

For related material, "Indicate groups of records having some significant
relationship by reason of shared responsibility or shared sphere of activity
in one or more units of material external to the unit being described." (RAD
1.8B20).

**EAD** <relatedmaterial>

**Notes**

:ref:`Back to the top <rad-template>`


Accruals
--------

**Template field** Accruals

**CSV Column** accruals

**Rule** "When the unit being described is not yet complete, e.g., an open fonds
or series, make a note explaining that further accruals are expected... If
no further accruals are expected, indicate that the unit is considered
closed." (RAD 1.8B19)

**EAD** <accruals>

**Notes**

:ref:`Back to the top <rad-template>`

.. figure:: images/notes-other.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the other notes fields.

   The data entry fields for Other notes. Multiple notes can be added by
   clicking "Add new"

Other notes- Accompanying material
----------------------------------

**Template field** Other notes- Accompanying material

**CSV Column** radNoteAccompanyingMaterial

**Rule** "Give details of accompanying material not mentioned
in the Physical description area (see 1.5E)." (RAD 1.8B9c)

**EAD** <odd type="material">

**Notes**

:ref:`Back to the top <rad-template>`



Other notes- Alpha-numeric designations
---------------------------------------

**Template field** Other notes- Alpha-numeric designations

**CSV Column** radNoteAlphaNumericDesignation

**Rule** "If desirable, make a note of any important
numbers borne by the unit being described other than publisher's series numbers (see
1.6F) or standard numbers (see 1.9)." (RAD 1.8 B11)

**EAD** <odd type="alphanumericDesignation">

**Notes**

:ref:`Back to the top <rad-template>`


Other notes- Conservation
-------------------------

**Template field** Other notes- Conservation

**CSV Column** radNoteConservation

**Rule** "If the unit being described has received any specific
conservation treatment, e.g., if repair work has been done on it, briefly indicate the
nature of the work." (RAD 1.8B9b)

**EAD** <odd type="conservation">

**Notes**

:ref:`Back to the top <rad-template>`


Other notes- Edition
--------------------

**Template field** Other notes- Edition

**CSV Column** radNoteEdition

**Rule** "Make notes relating to the edition being described or of the relationship
of the unit being described to other editions." (RAD 1.8B7)

**EAD** <odd type="edition">

**Notes**

:ref:`Back to the top <rad-template>`


Other notes- Physical description
---------------------------------

**Template field** Other notes- Physical description

**CSV Column** radNotePhysicalDescription

**Rule** "Make notes relating to the physical description of the unit
being described." (RAD 1.8B9)

**EAD** <odd type="physDesc">

**Notes**

:ref:`Back to the top <rad-template>`


Other notes- Publisher's series
-------------------------------

**Template field** Other notes- Publisher's series

**CSV Column** radPublishersSeriesNote

**Rule** "Make notes on important details of publisher's series that are not
included in the Publisher's series area, including variant series titles,
incomplete series, and of numbers or letters that imply a series." (RAD
1.8B10)

**EAD** <odd type="bibSeries">

**Notes** This column maps to the same EAD field as the column above,
Note on Publishers Series. Both notes refer to RAD 1.8B10.

:ref:`Back to the top <rad-template>`


Other notes- Rights
-------------------

**Template field** Other notes- Rights

**CSV Column** radNoteRights

**Rule** "Indicate the copyright status, literary rights, patents or any
other rights pertaining to the unit being described." (RAD 1.8B16b)

**EAD** <odd type="rights">

**Notes**

:ref:`Back to the top <rad-template>`


Other notes- General note
-------------------------

**Template field** Other notes- General note

**CSV Column** radNoteGeneral

**Rule** "Use this note to record any other descriptive information
considered important but not falling within the definitions of the other notes.
(RAD 1.8B21).

**EAD** <odd type="general">

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-standard-number:

Standard number area
^^^^^^^^^^^^^^^^^^^^

.. figure:: images/standard-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Standard number area.

   The data entry fields for the Standard number area.

Standard number
---------------

**Template field** Standard number

**CSV Column** radStandardNumber

**Rule** "Give the International Standard Book Number (ISBN), International
Standard Serial Number (ISSN), or any other internationally agreed standard
number for the item being described. Give such numbers with the agreed
abbreviation and with the standard spacing or hyphenation." (RAD 1.9B1)

**EAD** <unitid type="standard">

**Notes**

:ref:`Back to the top <rad-template>`

.. _template-access:

Access points
^^^^^^^^^^^^^

.. figure:: images/access-points.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for Access points.

   The data entry fields for Access points.

Subject access points
---------------------

**Template field** Subject access points

**CSV Column** subjectAccessPoints

**Rule** "Search for an existing term in the Subjects taxonomy by typing the
first few characters of the term. Alternatively, type a new term to create and
link to a new subject term."

**EAD** <subject>

**Notes** The values in this column will create :term:`terms <term>` in the
subjects :term:`taxonomy` where those do not already exist.

:ref:`Back to the top <rad-template>`


Place access points
-------------------

**Template field** Place access points

**CSV Column** placeAccessPoints

**Rule** "Search for an existing term in the Places taxonomy by typing the
first few characters of the term name. Alternatively, type a new term to
create and link to a new place term."

**EAD** <geogname>

**Notes** The values in this column will create :term:`terms <term>` in the
places :term:`taxonomy` where those do not already exist.

:ref:`Back to the top <rad-template>`


Name access points
------------------

**Template field** Name access points

**CSV Column** nameAccessPoints

**Rule** "Choose provenance, author and other non-subject access points from
the archival description, as appropriate. All access points must be apparent
from the archival description to which they relate." (RAD 21.0B) The values in
this field are drawn from the Authorized form of name field in authority
records. Search for an existing name by typing the first few characters of the
name. Alternatively, type a new name to create and link to a new authority
record.

**EAD** <name role="subject">

**Notes** The values in this column will create
:term:`authority records <authority record>` where those do not already exist.

:ref:`Back to the top <rad-template>`

.. _template-control:

Control area
^^^^^^^^^^^^

.. figure:: images/control-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields for the Control area.

   The data entry fields for the Control area. More fields continue below the
   screen shown.

For more information on the use of fields in the control area, see
:ref:`control area <control-area>`.


Description record identifier
-----------------------------

**Template field** Description record identifier

**CSV Column** descriptionIdentifier

**Rule** "Record a unique description identifier in accordance with local
and/or national conventions. If the description is to be used
internationally, record the code of the country in which the description was
created in accordance with the latest version of ISO 3166- Codes for the
representation of names of countries. Where the creator of the description is
an international organisation, give the organisational identifier in place of
the country code."

**EAD** <odd type="descriptionIdentifier">

**Notes**

:ref:`Back to the top <rad-template>`


Institution identifier
----------------------

**Template field** Institution identifier

**CSV Column** institutionIdentifier

**Rule** "Record the full, authorised form of name(s) of the agency(ies)
responsible for creating, modifying, or disseminating the description, or,
alternatively, record a code for the agency in accordance with the national
or international agency code standard."

**EAD** <odd type="institutionIdentifier">

**Notes**

:ref:`Back to the top <rad-template>`


Rules or conventions
--------------------

**Template field** Rules or conventions

**CSV Column** rules

**Rule** "Record the international, national, and/or local rules or
conventions followed in preparing the description."

**EAD** <descrules>

**Notes**

:ref:`Back to the top <rad-template>`


Status
------

**Template field** Status

**CSV Column** descriptionStatus

**Rule** "Record the current status of the description, indicating whether it
is a draft, finalized, and/or revised or deleted."

**EAD** <odd type="statusDescription">

**Notes** AtoM uses a :term:`taxonomy` to determine the value of this field.
If you try to import a CSV file using a different :term:`term` from the
taxonomy, the import will fail. The default terms are Final, Revised and
Draft, but can be edited through the
:ref:`Manage taxonomy screen <add-term-taxonomy>`.

:ref:`Back to the top <rad-template>`


Level of detail
---------------

**Template field** Level of detail

**CSV Column** levelOfDetail

**Rule** "Record whether the description consists of a minimal, partial, or
full level of detail in accordance with relevant international and/or
national guidelines and/or rules."

**EAD** <odd type="levelOfDetail">

**Notes** AtoM uses a :term:`taxonomy` to determine the value of this field.
If you try to import a CSV file using a different :term:`term` from the
taxonomy, the import will fail. The default terms are Full, Partial and
Minimal, but can be edited through the
:ref:`Manage taxonomy screen <add-term-taxonomy>`.

:ref:`Back to the top <rad-template>`


Dates of creation, revision and deletion
----------------------------------------

**Template field** Dates of creation, revision and deletion

**CSV Column** revisionHistory

**Rule** "Record the date(s) the entry was prepared and/or revised."

**EAD** <processinfo> <date>

**Notes** This is a free text field, allowing users to also write narrative
notes about the revision history of the description.

:ref:`Back to the top <rad-template>`


Language of description
-----------------------

**Template field** Language of description

**CSV Column** languageOfDescription

**Rule** "Indicate the language(s) used to create the description of the
archival material."

**EAD** <langusage><language langcode=>

**Notes**  Use a three-letter language code from
`ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_ .

:ref:`Back to the top <rad-template>`


Script of description
---------------------

**Template field** Script of description

**CSV Column** scriptOfDescription

**Rule** "Indicate the script(s) used to create the description of the
archival material."

**EAD** <langusage><language scriptcode=>

**Notes** Use a four-letter script code from
`ISO 1924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_

:ref:`Back to the top <rad-template>`


Sources
-------

**Template field** Sources

**CSV Column** sources

**Rule** "Record citations for any external sources used in the archival
description (such as the Scope and Content, Custodial History, or Notes
fields)."

**EAD** <note type="sourcesDescription">

**Notes** If there are sources to cite used used in a biographical
sketch or administrative history, record these in the sources field for the
:term:`authority record`.


:ref:`Back to the top <rad-template>`

.. _template-rights:

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
are separate from the RAD rights notes, above, and editing one area does not
effect the other. Rights records cannot be imported with descriptions via CSV.

For more information, see
:ref:`Add rights to an archival description <rights-archival-description>`.

.. _template-admin:

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

**Rule** N/A

**EAD** <odd type="publicationStatus">

**Notes** In the :ref:`Global Site Settings <global-settings>`, if the default
publication status is set to draft, all imported descriptions will be set to
draft and the EAD file will have the value "draft" in the
<odd type="publicationStatus"> tag.

:ref:`Back to the top <rad-template>`

Display standard
----------------

**Template field** Display standard

**CSV column** N/A

**Rule** N/A

**EAD** N/A

**Notes** This fields allows the user to choose a different display standard
from the :ref:`default template <default-templates>`
for the shown archival description only, with the option to also change the
display standard for all existing children of the description.


:ref:`Back to the top <rad-template>`

Appraisal
---------

**Template field** N/A

**CSV Column** Appraisal

**Rule** N/A

**EAD** <appraisal>

**Notes** There is no appraisal field in Rules for Archival Description and
therefore this field does not display in the AtoM RAD template. However,
contents of this column are contained in the EAD file and can be
exported/imported.

:ref:`Back to the top <rad-template>`

