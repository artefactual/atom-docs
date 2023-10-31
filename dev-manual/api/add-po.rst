.. _api-add-po:

================================
Add physical object endpoint
================================

**POST /api/physicalobjects**

This endpoint will allow adding a :term:`physical object`.

.. _add-po-ex-req:

Example request
===============

.. code-block:: none

   curl -v -X POST http://localhost:63001/api/physicalobjects -H 'Content-Type: application/json' -H 'REST-API-Key: 3e136949f7b9b915' -d '{ "name": "T-01", "location": "Example location", "type": "Shelf" }'

.. _add-po-ex-resp:

Example response
================

Example response is truncated and edited for readability.

.. code-block:: none

   HTTP/1.1 201 Created
   Content-Type: application/json; charset=utf-8
   Transfer-Encoding: chunked
   Connection: keep-alive
   Cache-Control: private

   {"slug":"t-01"}


:ref:`Back to top <api-add-po>`
