.. _maintenance-populate-search-index:

=====================
Populate search index
=====================

AtoM maintains an `Elasticsearch <http://www.elasticsearch.org/>`__ search
index to provide fast, full-text search results with
:term:`faceting <Facet filter>`.

Occasionaly it is necessary to repopulate the Elasticsearch index from the
primary database, especially after operations that affect many records, e.g.

* Importing data (CSV or EAD import)
* Moving a large series to a new :term:`parent record`
* Moving a :term:`Fonds` or :term:`Collection` to a different
  :term:`archival institution`
* Doing any bulk search and replace operation

Populating the search index requires running a symfony command line task,
which is located in the root directory of the application.

.. code-block:: bash

   php symfony search:populate
