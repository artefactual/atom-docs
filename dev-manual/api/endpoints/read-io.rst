.. _api-read-io:

================================
Read information object endpoint
================================

**GET /api/informationobjects/<slug>**

This endpoint will obtain all :term:`information object` data available for a
particular :term:`archival description` in fields that map to the
:ref:`ISAD template <isad-template>`, including related PREMIS
:ref:`rights statements <rights>` and :term:`digital object` metadata

.. NOTE::

   If you are using another descriptive standard as your
   :ref:`default descriptive template <default-templates>`, it is possible that
   not all data will be available in the endpoints response for a particular
   resource. For example the :ref:`RAD template <rad-template>` contains many
   custom note fields that do not have equivalents in the ISAD template.

To be able to query the endpoint, you will need to know the :term:`slug` of
the information object (aka :term:`archival description`) you are trying to
read. Note that the slug is include in the :ref:`api-browse-io` response, so
you could use it to determine the slug of a particular description if needed.

.. _read-io-ex-req:

Example request
===============

.. code-block:: json

   GET /api/informationobjects/test-description HTTP/1.1
   Host: www.example.com

.. _read-io-ex-resp:

Example response
================

.. code-block:: json

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8

   {
     "reference_code": "CA REPO-ID IDENTIFIER (ISAD 3.1.1)",
     "title": "ISAD API Crosswalk (ISAD 3.1.2)",
     "publication_status": "Draft",
     "level_of_description": "Fonds",
     "extent_and_medium": "Extent and medium (ISAD 3.1.5)",
     "dates": [
       {
         "date": "January 1, 2015 - December 31, 2016",
         "start_date": "2015-01-01",
         "end_date": "2016-12-31",
         "type": "Creation"
       }
     ],
     "creators": [
       {
         "authotized_form_of_name": "Creator (ISAD 3.2.1)",
         "history": "Creator history (ISAD 3.2.2)"
       }
     ],
     "repository": "Artefactual Archives",
     "archival_history": "Archival history (ISAD 3.2.3)",
     "immediate_source_of_acquisition_or_transfer": "Immediate source of acquisition or transfer (ISAD 3.2.4)",
     "scope_and_content": "Scope and content (ISAD 3.3.1)",
     "appraisal_destruction_and_scheduling": "Appraisal, destruction and scheduling (ISAD 3.3.2)",
     "accruals": "Accruals (ISAD 3.3.3)",
     "system_of_arrangement": "System of arrangement (ISAD 3.3.4)",
     "conditions_governing_access": "Conditions governing access (ISAD, 3.4.1)",
     "conditions_governing_reproduction": "Conditions governing reproduction (ISAD 3.4.2)",
     "languages_of_material": [
       "English"
     ],
     "scripts_of_material": [
       "Latin"
     ],
     "language_and_script_notes": "Language and script notes (ISAD 3.4.3)",
     "physical_characteristics_and_technical_requirements": "Sources, Control Area.",
     "finding_aids": "Finding aids (ISAD 3.4.5)",
     "existence_and_location_of_originals": "Existence and location of originals (ISAD 3.5.1)",
     "existence_and_location_of_copies": "Existence and location of copies (ISAD 3.5.2)",
     "related_units_of_description": "Related unites of description (ISAD 3.5.3)",
     "publication_notes": [
       "Publication notes (ISAD 3.5.4)"
     ],
     "notes": [
       "General note (ISAD 3.6.1)"
     ],
     "alternative_identifiers": [
       {
         "label": "Alternate identifier label 1",
         "identifier": "ALT-ID1"
       },
       {
         "label": "Alternative identifer label 2",
         "identifier": "ALT-ID2"
       }
     ],
     "subject_access_points": [
       "Subject access point 1",
       "Subject access point 2"
     ],
     "place_access_points": [
       "Place access point 1",
       "Place access point 2"
     ],
     "name_access_points": [
       "Name access point 1",
       "Name access point 2"
     ],
     "description_identifier": "Description identifier (Control area)",
     "institution_identifier": "INSTITUTION-ID",
     "rules_and_or_conventions_used": "Rules or conventions (ISAD 3.7.2)",
     "status": "Draft",
     "level_of_detail": "Full",
     "Dates of creation revision deletion": "Dates of creation, revision and deletion.",
     "languages_of_description": [
       "English"
     ],
     "scripts_of_description": [
       "Latin"
     ],
     "archivists_notes": [
       "Archivist's notes (ISAD 3.7.1)"
     ],
     "rights": [
       {
         "basis": "Copyright",
         "start_date": "2016-01-01",
         "end_date": "2166-12-31",
         "documentation_identifier_type": "Documentation identifer type",
         "documentation_identifier_value": "Documentation identifier value",
         "documentation_identifier_role": "Documentation identifier role",
         "rights_holder": "Example rights holder name",
         "rights_note": "Rights note",
         "copyright_status": "Under copyright",
         "copyright_status_date": "2016-00-00",
         "copyright_jurisdiction": "Canada",
         "copyright_note": "Copyright note",
         "granted_rights": [
           {
             "act": "Display",
             "restriction": "Conditional",
             "start_date": "2016-01-01",
             "end_date": "2166-01-01",
             "notes": "Notes for Display right"
           }
         ]
       }
     ],
     "digital_object": {
       "filename": "sassy-bunny.jpg",
       "media_type": "Image",
       "mime_type": "image\/jpeg",
       "byte_size": "29458",
       "uploaded_at": "January 1, 2016 5:00 PM",
       "url": "http:\/\/www.example.com\/uploads\/r\/artefactual-archives\/f\/1\/d\/f1d57e030432177172e638fab2b995fb191b9861cdd9f7b424e3f3c759be0aa9\/sassy-bunny.jpg",
       "reference_url": "http:\/\/www.example.com\/uploads\/r\/artefactual-archives\/f\/1\/d\/f1d57e030432177172e638fab2b995fb191b9861cdd9f7b424e3f3c759be0aa9\/sassy-bunny_141.jpg",
       "thumbnail_url": "http:\/\/www.example.com\/uploads\/r\/artefactual-archives\/f\/1\/d\/f1d57e030432177172e638fab2b995fb191b9861cdd9f7b424e3f3c759be0aa9\/sassy-bunny_142.jpg"
     }
   }



.. _read-io-parameters:

Request parameters
==================

* ``sf_culture``: ISO 639-1 language code

See :ref:`api-intro-i18n` for more information on this parameter.

:ref:`Back to top <api-read-io>`
