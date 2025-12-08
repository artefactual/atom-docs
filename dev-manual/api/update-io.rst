.. _api-update-io:

==================================
Update information object endpoint
==================================

**PUT /api/informationobjects/<slug>**

This endpoint will allow updating an :term:`information object` for a
given slug.
The following fields are permitted in the body of the request for updates:

  - identifier
  - level_of_description_id
  - parent_id
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
  - published

.. _update-io-ex-req:

Example request
===============

.. code-block:: none

   curl -v -X PUT http://localhost:63001/api/informationobjects/test-description -H 'Content-Type: application/json' -H 'REST-API-Key: 3e136949f7b9b915' -d '{ "title": "New description title" }'

.. _update-io-ex-resp:

Example response
================

Example response is truncated and edited for readability.

.. code-block:: none

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8
   Transfer-Encoding: chunked
   Connection: keep-alive
   Cache-Control: private

   {"id":200430, "parent_id": 1}


:ref:`Back to top <api-update-io>`
