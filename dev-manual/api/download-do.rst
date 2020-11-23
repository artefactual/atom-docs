.. _api-download-do:

================================
Download digital object endpoint
================================

**GET /api/informationobjects/<slug>/digitalobject**

This endpoint will stream the content of the master :term:`digital object`
associated with the :term:`archival description` whose slug is provided.

.. NOTE::

   This endpoint supports streaming locally stored online
   :term:`digital objects <digital object>`, as well as
   external digital objects linked via a public URI. It is not possible to
   stream offline digital objects with this endpoint.

To be able to query the endpoint, you will need to know the :term:`slug` of
the information object (aka :term:`archival description`) whose digital object
you wish to download. Note that the slug is included in the
:ref:`api-browse-io` response, so you could use it to determine the slug of a
particular description if needed.

.. _download-do-ex-req:

Example request
===============

.. code-block:: none

   curl -v -H "REST-API-Key: api-key" "https://www.example.com/api/informationobjects/test-description/digitalobject" --output sample_file.pdf

.. _download-do-ex-resp:

Example response
================

Example response is truncated and edited for readability.

.. code-block:: none

   HTTP/1.1 200 OK
   Content-Type: application/pdf
   Content-Length: 339503
   Content-Description: File Transfer
   Content-Transfer-Encoding: binary
   Content-Disposition: attachment; filename=sample_file.pdf
   Cache-Control: public, must-revalidate
   Pragma: public

   (file bitstream)


:ref:`Back to top <api-download-do>`
