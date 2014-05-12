.. _rad-template::

=================================================
Rules for Archival Description (RAD) CSV template
=================================================

On this page you will find:

* Downloadable CSV template using Rules for Archival Description.

* Description of fields used when importing :term:`archival descriptions
<archival description>` using `Rules for Archival Description
<http://www.cdncouncilarchives.ca/archdesrules.html>`_ in a :term:`CSV` file.

RAD CSV template
================

Field descriptions
==================

RAD is maintained by the `Canadian Council of Archives
<http://www.cdncouncilarchives.ca>`_ and is available at
http://www.cdncouncilarchives.ca/archdesrules.html.

In the table below:

* **Column** refers to the title of the column in the CSV template
* **AtoM field** refers to the default label for that field in AtoM
* **Rule** refers to the rule from the applicable standard
* **EAD** refers to the field mapping to :ref:`EAD <ead-export>`

====================================================== ========================================================== ==================================================================================================================================
Column                                                 AtoM field                                                 Rule
====================================================== ========================================================== ==================================================================================================================================
legacyId
parentId
qubitParentSlug
title                                                  Title proper                                               Enter the title proper, either transcribed or supplied (RAD 1.1B)
radGeneralMaterialDesignation                          General material designation                               Select the General Material Designation at the highest level of description
                                                                                                                  If there are more than three, select "multiple media." (RAD 1.1C)
alternateTitle                                         Parallel title                                             [W]hen applicable, transcribe parallel titles that appear in conjunction
                                                                                                                  with the formal title proper...(RAD 1.1D)
radOtherTitleInformation                               Other title information                                    Transcribe other title information that appears in conjunction with the formal
                                                                                                                  title proper. (RAD 1.1E)
radTitleStatementOfResponsibility                      Title statements of responsibility                         "At the item level of description, transcribe explicit statements of responsibility
                                                                                                                  appearing in conjunction with the formal title proper in or on the chief source of information..." (RAD 1.1F)
radTitleStatementOfResponsibilityNote                  Title notes- Statements of responsibility                  Select a note type from the drop-down menu and enter note text in accordance with RAD 1.8B1 through 1.8B6.
radTitleAttributionsAndConjectures                     Title notes- Attributions and conjectures
radTitleContinues                                      Title notes- Continuation of title
radTitleSourceOfTitleProper                            Title notes- Source of title proper
radTitleVariationsInTitle                              Title notes- Variations in title
radTitleParallelTitles                                 Title notes- Parallel titles and other title information
levelOfDescription                                     Level of description                                       Select a level of description from the drop-down menu. See RAD 1.0A for rules and conventions on selecting levels of description.
repository                                             Repository                                                 Select the repository that has custody and control of the archival material. The values in this field are drawn from the
                                                                                                                  Authorized form of name field in archival institution records. Search for an existing name by typing the first few characters of
                                                                                                                  the name. Alternatively, type a new name to create and link to a new archival institution.
identifier                                             Reference code                                             Enter an unambiguous code used to uniquely identify the description.
radEdition                                             Edition statement                                          "Transcribe the edition statement relating to the item being described." (RAD 1.2B1) "If the item being described lacks an
                                                                                                                  edition statement but is known to contain significant changes from other editions, supply a suitable brief statement in the
                                                                                                                  language and script of the title proper and enclose it in square brackets." (RAD 1.2B3)
radEditionStatementOfResponsibility                    Edition statement of responsibility                        "Transcribe a statement of responsibility relating to one or more editions, but not to all editions, of the item being described
                                                                                                                  following the edition statement if there is one." (RAD 1.2.C1) "When describing the first edition, give all statements of
                                                                                                                  responsibility in the Title and statement of responsibility area." (RAD 1.2C2)
radStatementOfScaleCartographic                        Statement of scale (cartographic)                          "Give the scale of the unit being described...as a representative fraction (RF) expressed as a ratio (1: ). Precede the ratio by
                                                                                                                  Scale. Give the scale even if it is already recorded as part of the title proper or other title information." (RAD 5.3B1)
radStatementOfProjection                               Statement of projection (cartographic)                     "Give the statement of projection if it is found on the prescribed source(s) of information." (RAD 5.3C1)
radStatementOfCoordinates                              Statement of coordinates (cartographic)                    "At the fonds, series or file levels, record coordinates for the maximum coverage provided by the materials in the unit, as long
                                                                                                                  as they are reasonably contiguous." (RAD 5.3D)
radStatementOfScaleArchitectural                       Statement of scale (architectural)                         "Give in English the scale in the units of measure found on the unit being described. If there is no English equivalent for the
                                                                                                                  name of the unit of measure, give the name, within quotation marks, as found on the unit being described." (RAD 6.3B)
radIssuingJurisdiction                                 Issuing jurisdiction and denomination (philatelic)         "Give the name of the jurisdiction (e.g., government) responsible for issuing the philatelic records." (RAD 12.3B1) "For all units
                                                                                                                  possessing a denomination (e.g., postage stamps, revenue stamps, postal stationery items), give the denomination in a standardized
                                                                                                                  format, recording the denomination number in arabic numerals followed by the name of the currency unit. Include a denomination
                                                                                                                  statement even if the denomination is already recorded as part of the title proper or other title information." (RAD 12.3C1)
creators                                               Creator                                                    Use the Actor name field to link an authority record to this description. Search for an existing name in the authority records by
                                                                                                                  typing the first few characters of the name. Alternatively, type a new name to create and link to a new authority record.
creatorHistories                                       Biographical history                                       "Record in narrative form or as a chronology the main life events, activities, achievements and/or roles of the entity being
                                                                                                                  described. This may include information on gender, nationality, family and religious or political affiliations. Wherever possible,
                                                                                                                  supply dates as an integral component of the narrative description." (ISAAR 5.2.2)
creatorDates                                           Date(s)                                                    "Give the date(s) of creation of the unit being described either as a single date, or range of dates (for inclusive dates and/or
                                                                                                                  predominant dates). Always give the inclusive dates. When providing predominant dates, specify them as such, preceded by the word
                                                                                                                  predominant..." (1.4B2). Record probable and uncertain dates in square brackets, using the conventions described in RAD 1.4B5.
creatorDatesStart                                      Dates of creation- Start                                   Enter the start year. Do not use any qualifiers or typographical symbols to express uncertainty.
creatorDatesEnd                                        Dates of creation- End                                     Enter the end year. Do not use any qualifiers or typographical symbols to express uncertainty. If the start and end years
                                                                                                                  are the same, enter data only in the "Date" field and leave the "End date" blank.
creatorDateNotes                                       Dates of creation- Note                                    "Make notes on dates and any details pertaining to the dates of creation, publication, or distribution, of the unit being described
                                                                                                                  that are not included in the Date(s) of creation, including publication, distribution, etc., area and that are considered to be
                                                                                                                  important. " (RAD 1.8B8) "Make notes on the date(s) of accumulation or collection of the unit being described." RAD 1.8B8a)
extentAndMedium                                        Physical description                                       "At all levels record the extent of the unit being described by giving the number of physical units in arabic numerals and the
                                                                                                                  specific material designation as instructed in subrule .5B in the chapter(s) dealing with the broad class(es) of material to which the
                                                                                                                  unit being described belongs." (RAD 1.5B1) Include other physical details and dimensions as specified in RAD 1.5C and 1.5D. Separate
                                                                                                                  multiple entries in this field with a carriage return (i.e. press the Enter key on your keyboard).
radTitleProperOfPublishersSeries                       Title proper of publisher's series                         "At the item level of description, transcribe a title proper of the publisher's series as instructed in 1.1B1." (RAD 1.6B)
radParallelTitlesOfPublishersSeries                    Parallel titles of publisher's series                      "Transcribe parallel titles of a publisher's series as instructed in 1.1D." (RAD 1.6C1)
radOtherTitleInformationOfPublishersSeries             Other title information of publisher's series              "Transcribe other title information of a publisher's series as instructed in 1.1E and only if considered necessary for identifying the
                                                                                                                  publisher's series." (RAD 1.6D1)
radStatementOfResponsibilityRelatingToPublishersSeries Statement of responsibility relating to publisher's series "Transcribe explicit statements of responsibility appearing in conjunction with a formal title proper of a publisher's series as
                                                                                                                  instructed in 1.1F and only if considered necessary for identifying the publisher's series." (RAD 1.6E1)
radNumberingWithinPublishersSeries                     Numbering within publisher's series                        "Give the numbering of the item within a publisher's series in the terms given in the item." (RAD 1.6F1)
radPublishersSeriesNote                                Note on publisher's series                                 "Make notes on important details of publisher's series that are not included in the Publisher's series area, including variant series
                                                                                                                  titles, incomplete series, and of numbers or letters that imply a series." (RAD 1.8B10)
radNoteOnPublishersSeries                              Publisher's series                                         Select a note type from the drop-down menu and enter note text in accordance with the following sections in RAD: 1.5E
                                                                                                                  (Accompanying material); 1.8 B11 (Alpha-numeric designations); 1.8B9b (Conservation); 1.8B7 (Edition); 1.8B9 (Physical Description);
                                                                                                                  1.8B16b (Rights); 1.8B21 (General note).
archivalHistory                                        Custodial history
scopeAndContent                                        Scope and content
physicalCharacteristics                                Physical condition
acquisition                                            Immediate source of acquisition
arrangement                                            Arrangement
language                                               Language of material
script                                                 Script of material
languageNote                                           Language and script note
locationOfOriginals                                    Location of originals
locationOfCopies                                       Availability of other formats
accessConditions                                       Restrictions on access
reproductionConditions                                 Terms governing use, reproduction, and publication
findingAids                                            Finding aids
relatedUnitsOfDescription                              Associated materials
accruals                                               Accruals
radNoteAccompanyingMaterial                            Other notes- Accompanying material
radNoteAlphaNumericDesignation                         Other notes- Alpha-numeric designations
radNoteConservation                                    Other notes- Conservation
radNoteEdition                                         Other notes- Edition
radNotePhysicalDescription                             Other notes- Physical description
radNotePublishersSeries                                Other notes- Publisher's series
radNoteRights                                          Other notes- Rights
radNoteGeneral                                         Other notes- General note
radStandardNumber                                      Standard number
subjectAccessPoints                                    Subject access points
placeAccessPoints                                      Place access points
nameAccessPoints                                       Name access points
descriptionIdentifier                                  Description record identifier
institutionIdentifier                                  Institution identifier
rules                                                  Rules or conventions
descriptionStatus                                      Status
levelOfDetail                                          Level of detail
revisionHistory                                        Dates of creation, revision and deletion
languageOfDescription                                  Language of description
scriptOfDescription                                    Script of description
sources                                                Example Fonds sources
publicationStatus                                      Publication status
appraisal
physicalObjectName
physicalObjectLocation
physicalObjectType
culture
====================================================== ========================================================== ==================================================================================================================================

:ref:`Back to the top <rad-template>`
