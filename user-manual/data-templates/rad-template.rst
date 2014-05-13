.. _rad-template:

=================================================
Rules for Archival Description (RAD) CSV template
=================================================

On this page you will find:

* Link to downloadable CSV template using
  `Rules for Archival Description <http://www.cdncouncilarchives.ca/archdesrules.html>`_
* Description of fields used when importing
  :term:`archival descriptions <archival description>` using Rules for Archival
  Description in a :term:`CSV` file.

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

* **Column** refers to the title of the column in the CSV template
* **AtoM field** refers to the default label for that field in AtoM
* **Rule** refers to the rule from the applicable standard
* **EAD** refers to the field mapping to EAD
* **Notes** includes any other information needed for a successful CSV
  import.

legacyId
--------

**Column** legacyId

**Notes** Used to map hierarchical relationships in AtoM. See
:ref:`LegacyID mapping <legacy-id-mapping-dealing-with-hierarchical-data-in-a-csv>`

:ref:`Back to the top <rad-template>`

parentId
--------

**Column** parentId

**Notes** Used to map hierarchical relationships in AtoM. See
:ref:`legacy-id-mapping-dealing-with-hierarchical-data-in-a-csv`

:ref:`Back to the top <rad-template>`

qubitParentSlug
---------------

**Column** qubitParentSlug

**Notes**

:ref:`Back to the top <rad-template>`

title
-----

**Column** title

**AtoM field** Title proper

**Rule** Enter the title proper, either transcribed or supplied (RAD 1.1B)

**EAD** <titleproper>

**Notes**

:ref:`Back to the top <rad-template>`

radGeneralMaterialDesignation
-----------------------------

**Column** radGeneralMaterialDesignation

**AtoM field** General material designation

**Rule** Select the General Material Designation at the highest level of
description If there are more than three, select "multiple media." (RAD 1.1C)

**EAD** <genreform>

**Notes**

:ref:`Back to the top <rad-template>`

alternateTitle
--------------

**Column** alternateTitle

**AtoM field** Parallel title

**Rule** [W]hen applicable, transcribe parallel titles that appear in
conjunction with the formal title proper...(RAD 1.1D)

**EAD** <unittitle type="parallel">

**Notes**

:ref:`Back to the top <rad-template>`

radOtherTitleInformation
------------------------

**Column** radOtherTitleInformation


**AtoM field** Other title information

**Rule** Transcribe other title information that appears in conjunction with
the formal title proper. (RAD 1.1E)

**EAD** <unittitle type="otherInfo">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleStatementOfResponsibility
---------------------------------

**Column** radTitleStatementOfResponsibility

**AtoM field** Title statements of responsibility

**Rule** "At the item level of description, transcribe explicit statements of
responsibility appearing in conjunction with the formal title proper in or on
the chief source of information..." (RAD 1.1F)

**EAD** <unittitle type="statRep">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleStatementOfResponsibilityNote
-------------------------------------

**Column** radTitleStatementOfResponsibilityNote

**AtoM field** Title notes- Statements of responsibility

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleStatRep">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleAttributionsAndConjectures
----------------------------------

**Column** radTitleAttributionsAndConjectures

**AtoM field** Title notes- Attributions and conjectures

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleAttributions">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleContinues
-----------------

**Column** radTitleContinues

**AtoM field** Title notes- Continuation of title

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleContinuation">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleSourceOfTitleProper
---------------------------

**Column** radTitleSourceOfTitleProper

**AtoM field** Title notes- Source of title proper

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleSource">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleVariationsInTitle
-------------------------

**Column** radTitleVariationsInTitle


**AtoM field** Title notes- Variations in title

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleVariation">

**Notes**

:ref:`Back to the top <rad-template>`

radTitleParallelTitles
----------------------

**Column** radTitleParallelTitles


**AtoM field** Title notes- Parallel titles and other title information

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with RAD 1.8B1 through 1.8B6.

**EAD** <odd type="titleParallel">

**Notes**

:ref:`Back to the top <rad-template>`

levelOfDescription
------------------

**Column** levelOfDescription

**AtoM field** Level of description

**Rule** Select a level of description from the drop-down menu. See RAD 1.0A for
rules and conventions on selecting levels of description.

**EAD** <archdesc level="[level of descriptio]">

**Notes**

:ref:`Back to the top <rad-template>`

repository
----------

**Column** repository

**AtoM field** Repository

**Rule** Select the repository that has custody and
control of the archival material. The values in this field are drawn from the
Authorized form of name field in archival institution records. Search for an
existing name by typing the first few characters of the name. Alternatively,
type a new name to create and link to a new archival institution.

**EAD** <repository> <corpname>

**Notes**

:ref:`Back to the top <rad-template>`

identifier
----------

**Column** identifier

**AtoM field** Reference code

**Rule** Enter an unambiguous code used to uniquely identify the description.

**EAD** <unitid>

**Notes**

:ref:`Back to the top <rad-template>`

radEdition
----------

**Column** radEdition

**AtoM field** Edition statement

**Rule** "Transcribe the edition statement relating to the item being
described." (RAD 1.2B1) "If the item being described lacks an edition
statement but is known to contain significant changes from other editions,
supply a suitable brief statement in the language and script of the title
proper and enclose it in square brackets." (RAD 1.2B3)

**EAD** <edition>

**Notes**

:ref:`Back to the top <rad-template>`

radEditionStatementOfResponsibility
-----------------------------------

**Column** radEditionStatementOfResponsibility

**AtoM field** Edition statement of responsibility

**Rule** "Transcribe a statement of responsibility relating to one or more
editions, but not to all editions, of the item being described following the
edition statement if there is one." (RAD 1.2.C1) "When describing the first
edition, give all statements of responsibility in the Title and statement of
responsibility area." (RAD 1.2C2)

**EAD** <unittitle type="statRep"> <edition>

**Notes**

:ref:`Back to the top <rad-template>`

radStatementOfScaleCartographic
-------------------------------

**Column** radStatementOfScaleCartographic

**AtoM field** Statement of scale (cartographic)

**Rule** "Give the scale of the unit being described...as a representative
fraction (RF) expressed as a ratio (1: ). Precede the ratio by Scale. Give the
scale even if it is already recorded as part of the title proper or other
title information." (RAD 5.3B1)

**EAD** <materialspec type="cartographic">

**Notes**

:ref:`Back to the top <rad-template>`

radStatementOfProjection
------------------------

**Column** radStatementOfProjection

**AtoM field** Statement of projection (cartographic)

**Rule** "Give the statement of projection if it is found on the prescribed
source(s) of information." (RAD 5.3C1)

**EAD** <materialspec type="projection">

**Notes**

:ref:`Back to the top <rad-template>`

radStatementOfCoordinates
-------------------------

**Column** radStatementOfCoordinates

**AtoM field** Statement of coordinates (cartographic)

**Rule** "At the fonds, series or file levels, record coordinates for the
maximum coverage provided by the materials in the unit, as long as they are
reasonably contiguous." (RAD 5.3D)

**EAD** <materialspec type="coordinates">

**Notes**

:ref:`Back to the top <rad-template>`

radStatementOfScaleArchitectural
--------------------------------

**Column** radStatementOfScaleArchitectural

**AtoM field** Statement of scale (architectural)

**Rule** "Give in English the scale in the units of measure found on the unit
being described. If there is no English equivalent for the name of the unit
of measure, give the name, within quotation marks, as found on the unit
being described." (RAD 6.3B)

**EAD** <materialspec type="architectural">

**Notes**

:ref:`Back to the top <rad-template>`

radIssuingJurisdiction
----------------------

**Column** radIssuingJurisdiction

**AtoM field** Issuing jurisdiction and denomination (philatelic)

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

creators
--------

**Column** creators

**AtoM field** Creator

**Rule** Use the Actor name field to link an authority record to this
description. Search for an existing name in the authority records by typing
the first few characters of the name. Alternatively, type a new name to
create and link to a new authority record.

**EAD** <origination> <name>

**Notes**

:ref:`Back to the top <rad-template>`

creatorHistories
----------------

**Column** creatorHistories

**AtoM field** Biographical history

**Rule** "Record in narrative form or as a chronology the main life events,
activities, achievements and/or roles of the entity being described. This may
include information on gender, nationality, family and religious or political
affiliations. Wherever possible, supply dates as an integral component of the
narrative description." (ISAAR 5.2.2)

**EAD** <bioghist> <note>

**Notes** By default this column will create a Biographical history in the
:term:`authority record`, regardless of whether the creator is a person,
family, or organization. To specify the entity type when importing creators,
users would need to
:ref:`import authority records <csv-import-authority-records>`.

:ref:`Back to the top <rad-template>`

creatorDates
------------

**Column** creatorDates

**AtoM field** Date(s)

**Rule** "Give the date(s) of creation of the unit being described either as a
single date, or range of dates (for inclusive dates and/or predominant dates).
Always give the inclusive dates. When providing predominant dates, specify
them as such, preceded by the word predominant..." (1.4B2). Record probable
and uncertain dates in square brackets, using the conventions described in RAD
1.4B5.

**EAD** <bioghist> <date type ="creation>

**Notes** This column refers to the dates of creation of the material, not
the active/living dates of the creator.

:ref:`Back to the top <rad-template>`

creatorDatesStart
-----------------

**Column** creatorDatesStart

**AtoM field** Dates of creation- Start

**Rule** Enter the start year. Do not use any qualifiers or typographical
symbols to express uncertainty.

**EAD** <unitdate>

**Notes** This field only displays while editing the description.

:ref:`Back to the top <rad-template>`

creatorDatesEnd
---------------

**Column** creatorDatesEnd

**AtoM field** Dates of creation- End

**Rule** Enter the end year. Do not use any qualifiers or typographical symbols
to express uncertainty. If the start and end years are the same, enter data
only in the "Date" field and leave the "End date" blank.

**EAD** <unitdate>

**Notes** This field only displays while editing the description.

:ref:`Back to the top <rad-template>`

creatorDateNotes
----------------

**Column** creatorDatesNotes

**AtoM field** Dates of creation- Note

**Rule** "Make notes on dates and any details pertaining to the dates of
creation, publication, or distribution, of the unit being described that are
not included in the Date(s) of creation, including publication, distribution,
etc., area and that are considered to be important. " (RAD 1.8B8) "Make notes
on the date(s) of accumulation or collection of the unit being described." RAD
1.8B8a)

**EAD** <event> <note type="eventNote">

**Notes**

:ref:`Back to the top <rad-template>`

extentAndMedium
---------------

**Column** extentAndMedium

**AtoM field** Physical description

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

radTitleProperOfPublishersSeries
--------------------------------

**Column** radTitleProperOfPublishersSeries

**AtoM field** Title proper of publisher's series

**Rule** "At the item level of description, transcribe a title proper of the
publisher's series as instructed in 1.1B1." (RAD 1.6B)

**EAD** <bibseries> <title>

**Notes**

:ref:`Back to the top <rad-template>`

radParallelTitlesOfPublishersSeries
-----------------------------------

**Column** radParallelTitlesOfPublishersSeries

**AtoM field** Parallel titles of publisher's series

**Rule** "Transcribe parallel titles of a publisher's series as instructed in
1.1D." (RAD 1.6C1)

**EAD** <bibseries> <title type="parallel">

**Notes**

:ref:`Back to the top <rad-template>`

radOtherTitleInformationOfPublishersSeries
------------------------------------------

**Column** radOtherTitleInformationOfPublishersSeries

**AtoM field** Other title information of publisher's series

**Rule** "Transcribe other title information of a publisher's series as
instructed in 1.1E and only if considered necessary for identifying the
publisher's series." (RAD 1.6D1)

**EAD** <bibseries> <title type="otherInfo">

**Notes**

:ref:`Back to the top <rad-template>`

radStatementOfResponsibilityRelatingToPublishersSeries
------------------------------------------------------

**Column** radStatementOfResponsibilityRelatingToPublishersSeries

**AtoM field** Statement of responsibility relating to publisher's series

**Rule** "Transcribe explicit statements of responsibility appearing in
conjunction with a formal title proper of a publisher's series as instructed
in 1.1F and only if considered necessary for identifying the publisher's
series." (RAD 1.6E1)

**EAD** <bibseries> <<title type="statRep">

**Notes**

:ref:`Back to the top <rad-template>`

radNumberingWithinPublishersSeries
----------------------------------

**Column** radNumberingWithinPublishersSeries

**AtoM field** Numbering within publisher's series

**Rule** "Give the numbering of the item within a publisher's series in the
terms given in the item." (RAD 1.6F1)

**EAD** <bibseries> <num>

**Notes**

:ref:`Back to the top <rad-template>`

radPublishersSeriesNote
-----------------------

**Column** radPublishersSeriesNote

**AtoM field** Note on publisher's series

**Rule** "Make notes on important details of publisher's series that are not
included in the Publisher's series area, including variant series titles,
incomplete series, and of numbers or letters that imply a series." (RAD
1.8B10)

**EAD** <odd type="bibSeries">

**Notes** This column maps to the same EAD field as the column below,
radNoteOnPublishersSeries. Both notes refer to RAD 1.8B10.

:ref:`Back to the top <rad-template>`

radNoteOnPublishersSeries
-------------------------

**Column** radNoteOnPublishersSeries

**AtoM field** Publisher's series

**Rule** Select a note type from the drop-down menu and enter note text in
accordance with the following sections in RAD: 1.5E (Accompanying material);
1.8 B11 (Alpha-numeric designations); 1.8B9b (Conservation); 1.8B7 (Edition);
1.8B9 (Physical Description); 1.8B16b (Rights); 1.8B21 (General note).

**EAD** <odd type="bibSeries">

**Notes** This column maps to the same EAD field as the column above,
radPublishersSeriesNote. Both notes refer to RAD 1.8B10.

:ref:`Back to the top <rad-template>`

archivalHistory
---------------

**Column** archivalHistory

**AtoM field** Custodial history

**Rule** "Give the history of the custody of the unit being described, i.e., the
successive transfers of ownership and custody or control of the material,
along with the dates thereof, insofar as it can be ascertained." (RAD 1.7C)

**EAD** <custodhist>

**Notes**

:ref:`Back to the top <rad-template>`

scopeAndContent
---------------

**Column** scopeAndContent

**AtoM field** Scope and content

**Rule** "At the fonds, series, and collection levels of description, and when
necessary at the file and the item levels of description, indicate the level
being described and give information about the scope and the internal
structure of or arrangement of the records, and about their contents." (RAD
1.7D) "For the scope of the unit being described, give information about the
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

physicalCharacteristics
-----------------------

**Column** physicalCharacteristics

**AtoM field** Physical condition

**Rule** "Make notes on the physical condition of the unit being described if
that condition materially affects the clarity or legibility of the records."
(RAD 1.8B9a)

**EAD** <phystech>

**Notes**

:ref:`Back to the top <rad-template>`

acquisition
-----------

**Column** acquisition

**AtoM field** Immediate source of acquisition

**Rule** "Record the donor or source (i.e., the immediate prior custodian) from
whom the unit being described was acquired, and the date and method of
acquisition, as well as the source/donor's relationship to the material, if
any or all of this information is not confidential. If the source/donor is
unknown, record that information." (RAD 1.8B12)

**EAD**  <acqinfo>

**Notes**

:ref:`Back to the top <rad-template>`

arrangement
-----------

**Column** arrangement

**AtoM field** Arrangement

**Rule** "Make notes on the arrangement of the unit being described which
contribute significantly to its understanding but cannot be put in the Scope
and content (see 1.7D), e.g., about reorganisation(s) by the creator,
arrangement by the archivist, changes in the classification scheme, or
reconstitution of original order." (RAD 1.8B13)

**EAD** <arrangement>

**Notes**

:ref:`Back to the top <rad-template>`

language
--------

**Column** language

**AtoM field** Language of material

**Rule** "Record the language or languages of the unit being described, unless
they are noted elsewhere or are apparent from other elements of the
description." RAD (1.8.B14).

**EAD** <langmaterial> <language langcode>

**Notes** Use a three-letter script code from
`ISO 639-2 <http://www.loc.gov/standards/iso639-2/php/code_list.php>`_

:ref:`Back to the top <rad-template>`

script
------

**Column** script

**AtoM field** Script of material

**Rule** "[N]ote any distinctive alphabets or symbol systems employed."
RAD (1.8.B14)

**EAD** <langmaterial> <language scriptcode>

**Notes** Use a four-letter script code from
`ISO 1924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_

:ref:`Back to the top <rad-template>`


languageNote
------------

**Column** languageNote

**AtoM field** Language and script note

**Rule** "Record the language or languages of the unit being described, unless
they are noted elsewhere or are apparent from other elements of the
description. Also note any distinctive alphabets or symbol systems employed."
RAD (1.8.B14).

**EAD** <langmaterial>

**Notes** Not intended to duplicate information from language or script, above.

:ref:`Back to the top <rad-template>`


locationOfOriginals
-------------------

**Column** locationOfOriginals

**AtoM field** Location of originals

**Rule** "If the unit being described is a reproduction and the location of the
original material is known, give that location. Give, in addition, any
identifying numbers that may help in locating the original material in the
cited location. If the originals are known to be no longer extant, give that
information." (RAD 1.8B15a)

**EAD** <originalsloc>

**Notes**

:ref:`Back to the top <rad-template>`


locationOfCopies
----------------

**Column** locationOfCopies

**AtoM field** Availability of other formats

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


accessConditions
----------------

**Column** accessConditions

**AtoM field** Restrictions on access

**Rule** "Give information about any restrictions placed on access to the unit
(or parts of the unit) being described." (RAD 1.8B16a)

**EAD** <accessrestrict>

**Notes**

:ref:`Back to the top <rad-template>`

reproductionConditions
----------------------

**Column** reproductionConditions

**AtoM field** Terms governing use, reproduction, and publication

**Rule** "Give information on legal or donor restrictions that may affect use or
reproduction of the material." (RAD 1.8B16c)

**EAD** <userestrict>

**Notes**

:ref:`Back to the top <rad-template>`


findingAids
-----------

**Column** findingAids

**AtoM field** Finding aids

**Rule** "Give information regarding the existence of any finding aids. Include
appropriate administrative and/or intellectual control tools over the
material in existence at the time the unit is described, such as card
catalogues, box lists, series lists, inventories, indexes, etc." (RAD
1.8B17)

**EAD** <otherfindaid>

**Notes**

:ref:`Back to the top <rad-template>`

relatedUnitsOfDescription
-------------------------

**Column** relatedUnitsOfDescription

**AtoM field** Associated materials

**Rule** For associated material, "If records in another institution are
associated with the unit being described by virtue of the fact that they
share the same provenance, make a citation to the associated material at the
fonds, series or collection level, or for discrete items, indicating its
location if known." (RAD 1.8B18). For related material, "Indicate groups of
records having some significant relationship by reason of shared
responsibility or shared sphere of activity in one or more units of material
external to the unit being described." (RAD 1.8B20)

**EAD** <relatedmaterial>

**Notes**

:ref:`Back to the top <rad-template>`


accruals
--------

**Column** accruals

**AtoM field** Accruals

**Rule** "When the unit being described is not yet complete, e.g., an open fonds
or series, make a note explaining that further accruals are expected... If
no further accruals are expected, indicate that the unit is considered
closed." (RAD 1.8B19)

**EAD** <accruals>

**Notes**

:ref:`Back to the top <rad-template>`



radNoteAccompanyingMaterial
---------------------------

**Column** radNoteAccompanyingMaterial

**AtoM field** Other notes- Accompanying material

**Rule** RAD: 1.5E (Accompanying material)

**EAD** <odd type="material">

**Notes**

:ref:`Back to the top <rad-template>`



radNoteAlphaNumericDesignation
------------------------------

**Column** radNoteAlphaNumericDesignation

**AtoM field** Other notes- Alpha-numeric designations

**Rule** 1.8 B11

**EAD** <odd type="alphanumericDesignation">

**Notes**

:ref:`Back to the top <rad-template>`


radNoteConservation
-------------------

**Column** radNoteConservation

**AtoM field** Other notes- Conservation

**Rule** 1.8B9b

**EAD** <odd type="conservation">

**Notes**

:ref:`Back to the top <rad-template>`


radNoteEdition
--------------

**Column** radNoteEdition

**AtoM field** Other notes- Edition

**Rule** 1.8B7

**EAD** <odd type="edition">

**Notes**

:ref:`Back to the top <rad-template>`


radNotePhysicalDescription
--------------------------

**Column** radNotePhysicalDescription

**AtoM field** Other notes- Physical description

**Rule** 1.8B9

**EAD** <odd type="physDesc">

**Notes**

:ref:`Back to the top <rad-template>`


radNotePublishersSeries
-----------------------

**Column** radNotePublishersSeries

**AtoM field** Other notes- Publisher's series

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


radNoteRights
-------------

**Column** radNoteRights

**AtoM field** Other notes- Rights

**Rule**  1.8B16b

**EAD** <odd type="rights">

**Notes**

:ref:`Back to the top <rad-template>`


radNoteGeneral
--------------

**Column** radNoteGeneral

**AtoM field** Other notes- General note

**Rule** 1.8B21

**EAD** <odd type="general">

**Notes**

:ref:`Back to the top <rad-template>`


radStandardNumber
-----------------

**Column** radStandardNumber

**AtoM field** Standard number

**Rule** "Give the International Standard Book Number (ISBN), International
Standard Serial Number (ISSN), or any other internationally agreed standard
number for the item being described. Give such numbers with the agreed
abbreviation and with the standard spacing or hyphenation." (RAD 1.9B1)

**EAD** <unitid type="standard">

**Notes**

:ref:`Back to the top <rad-template>`


subjectAccessPoints
-------------------

**Column** subjectAccessPoints

**AtoM field** Subject access points

**Rule**

**EAD** <subject>

**Notes** The values in this column will create :term:`terms <term>` in the
subjects :term:`taxonomy` where those do not already exist.

:ref:`Back to the top <rad-template>`


placeAccessPoints
-----------------

**Column** placeAccessPoints

**AtoM field** Place access points

**Rule**

**EAD** <geogname>

**Notes** The values in this column will create :term:`terms <term>` in the
places :term:`taxonomy` where those do not already exist.

:ref:`Back to the top <rad-template>`


nameAccessPoints
----------------

**Column** nameAccessPoints

**AtoM field** Name access points

**Rule** "Choose provenance, author and other non-subject access points from the
archival description, as appropriate. All access points must be apparent
from the archival description to which they relate." (RAD 21.0B)

**EAD** <name role="subject">

**Notes** The values in this column will create :term:`authority records
<authority record>` where those do not already exist.

:ref:`Back to the top <rad-template>`


descriptionIdentifier
---------------------

**Column** descriptionIdentifier

**AtoM field** Description record identifier

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


institutionIdentifier
---------------------

**Column** institutionIdentifier

**AtoM field** Institution identifier

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


rules
-----

**Column** rules

**AtoM field** Rules or conventions

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


descriptionStatus
-----------------

**Column** descriptionStatus

**AtoM field** Status

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


levelOfDetail
-------------

**Column** levelOfDetail

**AtoM field** Level of detail

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


revisionHistory
---------------

**Column** revisionHistory

**AtoM field** Dates of creation, revision and deletion

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


languageOfDescription
---------------------

**Column** languageOfDescription

**AtoM field** Language of description

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


scriptOfDescription
-------------------

**Column** scriptOfDescription

**AtoM field** Script of description

**Rule**

**EAD**

**Notes** Use a four-letter script code from
`ISO 1924 <http://www.unicode.org/iso15924/iso15924-codes.html>`_

:ref:`Back to the top <rad-template>`


sources
-------

**Column** sources

**AtoM field** Sources

**Rule**

**EAD**

**Notes**


:ref:`Back to the top <rad-template>`


publicationStatus
-----------------

**Column** publicationStatus

**AtoM field** Publication status

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


appraisal
---------

**Column** appraisal

**AtoM field**

**Rule**

**EAD**

**Notes** There is no appraisal field in Rules for Archival Description and
therefore this field does not display in the AtoM RAD template. However,
contents of this column are contained in the EAD file.

:ref:`Back to the top <rad-template>`


physicalObjectName
------------------

**Column** physicalObjectName

**AtoM field**

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


physicalObjectLocation
----------------------

**Column** physicalObjectLocation

**AtoM field**

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`


physicalObjectType
------------------

**Column** physicalObjectType

**AtoM field**

**Rule**

**EAD**

**Notes**


:ref:`Back to the top <rad-template>`

culture
-------

**Column** culture

**AtoM field**

**Rule**

**EAD**

**Notes**

:ref:`Back to the top <rad-template>`
