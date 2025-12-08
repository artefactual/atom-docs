.. _api-delete-io:

==================================
Delete information object endpoint
==================================

**DELETE /api/informationobjects/<slug>**

This endpoint will allow deleting an :term:`information object` for a
given slug.

.. _delete-io-ex-req:

Example request
===============

.. code-block:: none

   curl -v -X DELETE http://localhost:63001/api/informationobjects/test-description -H 'Content-Type: application/json' -H 'REST-API-Key: 3e136949f7b9b915'

.. _delete-io-ex-resp:

Example response
================

Example response is truncated and edited for readability.

.. code-block:: none

   HTTP/1.1 204 No Content
   Content-Type: text/html; charset=utf-8
   Transfer-Encoding: chunked
   Connection: keep-alive
   Cache-Control: private


:ref:`Back to top <api-delete-io>`
