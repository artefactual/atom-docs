.. _api-browse-taxonomies:

==============================
Browse taxonomy terms endpoint
==============================

**GET /api/taxonomies/<id>**

This endpoint will obtain all the :term:`terms <term>` from a specified
:term:`taxonomy`, including the term name and notes. It is used in
`Archivematica <https://www.archivematica.org>`__ to get the Levels
of description taxonomy terms in the Hierarchical DIP upload.

.. SEEALSO::

   For more information on how AtoM defines taxonomies and terms, and how to
   manage them via the user interface, see: :ref:`terms`.

To make use of this endpoint, you will need to know the ID of the taxonomy
whose terms you wish to return. These IDs are not accessible via the AtoM user
interface - they are used internally.

Below is a list of some of the more commonly used taxonomies in AtoM, and
their IDs. This list is NOT comprehensive - to see the full list, navigate to
``/lib/model/QubitTaxonomy.php`` in your local application.

=================================== ===
Taxonomy name                       ID
=================================== ===
 Places                             42
 Subjects                           35
 Genres                             78
 Level of description               34
 Actor entity type (ISAAR)          32
 Thematic area (repository)         72
 Geographic subregion (repository)  73
 Media type                         46
 RAD title note type                52
 RAD other note type                51
 Material Type (RAD GMD)            50
 DACS note type                     74
 Rights act (PREMIS)                67
 Rights basis (PREMIS)              68
=================================== ===


Example request
===============

.. code-block:: none

   GET /api/taxonomies/34 HTTP/1.1
   Host: www.example.com

Example response
================

.. code-block:: none

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8

   [{
       "name": "Collection"
   }, {
       "name": "File"
   }, {
       "name": "Fonds"
   }, {
       "name": "Item"
   }, {
       "name": "Part"
   }, {
       "name": "Series"
   }, {
       "name": "sub-series"
   }, {
       "name": "sub-sub-series"
   }, {
       "name": "Subfonds"
   }, {
       "name": "Subseries"
   }, {
       "name": "subsubseries"
   }]

Request parameters
==================

* ``sf_culture``: ISO 639-1 language code

See :ref:`api-intro-i18n` for more information on this parameter.

:ref:`Back to top <api-browse-taxonomies>`
