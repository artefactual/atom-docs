.. _api-create-io:

==================================
Create information object endpoint
==================================

**POST /api/informationobjects/**

This endpoint will allow creating an :term:`information object`.

The following fields can be in the body of the request for the information
object to be created:

  - identifier
  - level_of_description_id
  - title
  - description
  - format
  - source
  - rights
  - names
  - dates
  - notes
  - types
  - level_of_description

In addition, it can also accept a ``parent_id`` or a ``parent_slug`` field to
add the new information object as a child of an existing one.

The newly created information object uses the default publication status
in the settings, unless the user for the given API key does not have the
permissions to publish in which case the publication status will be set
to draft.

.. _create-io-ex-req:

Example request
===============

.. code-block:: none

   curl -v -X POST http://localhost:63001/api/informationobjects -H 'Content-Type: application/json' -H 'REST-API-Key: 3e136949f7b9b915' -d '{"parent_slug": "example-fonds","title": "Test API Fonds","identifier": "I1","description": "Example description","level_of_description": "Item"}'

.. _create-io-ex-resp:

Example response
================

Example response is truncated and edited for readability.

.. code-block:: none

   HTTP/1.1 201 Created
   Content-Type: application/json; charset=utf-8
   Transfer-Encoding: chunked
   Connection: keep-alive
   Cache-Control: private

   {"id": 2004281, "slug": "test-api-fonds", "parent_id": 2004230}


:ref:`Back to top <api-create-io>`
