.. _api-create-io:

==================================
Create information object endpoint
==================================

**POST /api/informationobjects/**

This endpoint will allow creating an :term:`information object`.

The fields used in the body of the request for the information object
correspond to the header fields used in ISAD CSV imports, see :ref:`csv-import`.

Field parameters
================

Parent information object
-------------------------

``parent_slug`` OR ``parent_id`` - slug or id of the parent information object
to add the new information object as a child of an existing one. If neither is
provided, the new information object will be created under the root.

Free text fields
----------------

Short Text fields:
``title``
``identifier``
``alternativeIds``
``descriptionIdentifier``
``institutionResponsibleIdentifier``
``dates``

Long Text fields:
``level_of_description``
``scopeAndContent``
``extentAndMedium``
``locationOfOriginals``
``locationOfCopies``
``accessConditions``
``archivalHistory``
``acquisition``
``revisionHistory``
``arrangement``
``accruals``
``sources``
``appraisal``
``reproductionConditions``
``relatedUnitsOfDescription``
``languageNote``
``publicationNote``
``generalNote``
``archivistNote``
``rules``
``physicalCharacteristics``

.. code-block:: json

   "title": "Example Title"

Digital objects
---------------

The following fields can be used to link or upload a :term:`digital object` and
attach it to the new :term:`information object` being created.

In AtoM, a 1:1 relationship is maintained between information objects and
digital objects - meaning that for every :term:`archival description`, you can
only attach one :term:`digital object`.

``digitalObjectURI`` - URL to an external digital object

.. code-block:: json

   "digitalObjectURI": "https://www.example.com/myfile.pdf"

``digitalObjectPath`` - File system path to a local file to be imported as a
digital object

.. code-block:: json

   "digitalObjectPath": "/path/to/myfile.jpg"

Publication and description status
-----------------------------------

``publicationStatus`` - Set publication status: ``draft`` or ``published`` [case-insensitive]

By default, new information objects are created with a publication status of
``draft``. Setting the value to ``published`` will make the information object
publicly visible immediately upon creation.

.. code-block:: json

   "publicationStatus": "published"

``descriptionStatusId`` - Set description status: ``final``, ``draft`` or ``revised`` [case-insensitive]

.. code-block:: json

   "descriptionStatusId": "final"

``descriptionDetailId`` - Set description detail level: ``full``, ``minimal`` or
``partial``

.. code-block:: json

   "descriptionDetailId": "full"

Language and script fields
---------------------------

``language`` - Two-letter ISO 639-1 language code(s), pipe-separated for multiple
values

``languageOfDescription`` - Two-letter ISO 639-1 language code(s), for the
description itself, pipe-separated for multiple values

See Wikipedia for a full list of `ISO 639-1`_ language codes, and see
the following link for a full list of AtoM supported languages and corresponding
culture codes:

* https://bit.ly/AtoM-langs

``script`` - Four-letter ISO 15924 script code(s), pipe-separated for multiple
values

``scriptOfDescription`` - Four-letter ISO 15924 script code(s), for the
description itself, pipe-separated for multiple values

See `Unicode`_ for a full list of ISO 15924 script codes.

.. code-block:: json

    "languageOfDescription": "en|fr"
    "language": "en|fr"
    "scriptOfDescription": "Arab|Latn"
    "script": "Arab|Latn"

Name access points
------------------

``nameAccessPoints`` - Link actor as name access points

Required fields:
  - ``type_id`` - Event type term ID OR ``type`` - Event type name: ``corporate``,  ``family``, ``person``
  - ``actor_id`` - Existing actor ID OR ``authorized_form_of_name`` - Name to create new actor

.. code-block:: json

   "nameAccessPoints": {
     "type": "person",
     "authorized_form_of_name": "John Smith"
   }

   "nameAccessPoints": {
     "type_id": 230,
     "actor_id": 456
   }

Access points
-------------

``placeAccessPoints`` - Array of place terms to link
``genreAccessPoints`` - Array of genre terms to link
``subjectAccessPoints`` - Array of subject terms to link

Each array item can include:
  - ``id`` - ID of existing term
  - ``name`` - Name of place/genre/subject (will create new term if not found)

.. code-block:: json

   "placeAccessPoints": [
     {"name": "Vancouver"},
     {"id": 234}
   ]

    "genreAccessPoints":[
        {"name": "Photographs"},
        {"id": 412}
    ]

    "subjectAccessPoints":[
        {"name": "Archiving"},
        {"id": 35}
    ]

Dates
-----

``dates`` - Array of date information

Each date object can include:
  - ``start_date`` - Start date (optional)
  - ``end_date`` - End date (optional)
  - ``date`` - Display date (optional)
  - ``type`` - Date type: ``creation`` (default) or ``accumulation`` [case-insensitive]

.. code-block:: json

   "dates": [
     {
       "start_date": "2020-01-01",
       "end_date": "2020-12-31",
       "date": "2020",
       "type": "creation"
     }
   ]

Actor
-----

``actor`` - Link an actor with an event relationship

Can include:
  - ``id`` - Existing actor ID OR ``authorized_form_of_name`` - Actor name (will create new actor if not found)
  - ``history`` - Actor history (optional)
  - ``event_type_id`` - Event type term ID (optional, defaults to creation)

.. code-block:: json

   "actor": {
     "authorized_form_of_name": "Jane Doe",
     "history": "Photographer active 1990-2020",
     "event_type_id": 111
   }

   "actor": {
     "id": 456
   }

Repository
----------

``repository`` - Link to a repository

Must include one of:
  - ``slug`` - Slug of existing repository OR ``id`` - ID of existing repository
  - ``name`` - Name for new repository [will always create a new repository]

.. code-block:: json

   "repository": {
     "slug": "example-archives"
   }

   "repository": {
     "id": 279
   }

   "repository": {
     "name": "New Repository"
   }

Accession numbers
-----------------

``accessionNumber`` - Single accession number or array of accession numbers to link

.. code-block:: json

   "accessionNumber": "2024-001"

   "accessionNumber": ["2024-001", "2024-002"]

Alternative identifiers
-----------------------

``alternativeIds`` - Object of alternative identifier key-value pairs, where the
key is the alternative identifier and the value is the label

.. code-block:: json

   "alternativeIds": {
     "XYZ789": "Legacy identifier"
   }

Level of description
--------------------

``level_of_description_id`` - Term ID for level of description or 
``level_of_description`` - Level of description name (will be matched against
existing terms)

.. code-block:: json

   "level_of_description": "Item"

   "level_of_description_id": 123

.. _create-io-ex-req:

Example request
===============

.. code-block:: bash

   curl -v -X POST http://localhost:63001/api/informationobjects \
     -H 'Content-Type: application/json' \
     -H 'REST-API-Key: 3e136949f7b9b915' \
     -d '{
       "parent_slug": "example-fonds",
       "title": "Test API Fonds",
       "identifier": "I1",
       "scopeAndContent": "Example description",
       "level_of_description": "Item",
       "dates": [
         {
           "start_date": "2024-01-01",
           "end_date": "2024-12-31",
           "type": "creation"
         }
       ],
       "subjectAccessPoints": [
         {"name": "History"}
       ]
     }'

.. _create-io-ex-resp:

Example response
================

.. code-block:: bash

   HTTP/1.1 201 Created
   Content-Type: application/json; charset=utf-8
   Transfer-Encoding: chunked
   Connection: keep-alive
   Cache-Control: private

   {
     "id": 2004281,
     "slug": "test-api-fonds",
     "parent_id": 2004230
   }

:ref:`Back to top <api-create-io>`