.. _import-descriptions-terms:

=============================
Import descriptions and terms
=============================

This page describes how to import
:term:`archival descriptions <archival description>`, :term:`terms <term>` and
:term:`archival institutions <archival institution>`. The following file types
can be imported:

* EAD (hierarchical archival descriptions and associated authority records,
  archival institution descriptions and taxonomy terms)
* Dublin Core XML, MODS XML (archival descriptions and associated taxonomy terms)
* EAC (authority records)
* :term:`SKOS` (hierarchical taxonomies)

To import using a CSV file, please see the :ref:`CSV import page <csv-import>`.

Import XML file
===============

1. Click on the import menu menu, then click on XML.

.. image:: images/import-menu.*
   :align: center
   :width: 20%
   :alt: The import menu

2. Click on Browse, and navigate to an XML file saved to your computer. Click
   Open, then click Import.

.. TIP::

   If you prefer that AtoM does not index the terms on import, click the tick
   box beside "Do not index imported items."

3. If the file is successfully uploaded, the page will show the elapsed time.
   If there are errors in the file, the page will display a message describing
   the errors. After a successful import, AtoM will display a link to the
   imported description or term.

.. image:: images/import-completed.*
   :align: center
   :width: 80%
   :alt: Screen showing completed import.

.. WARNING::

   There is a known bug in AtoM 2.0.1 which will cause the following error to
   display after importing some EAD files. Do not panic! Your description has
   been imported in spite of the errors. Click on View Archival Description to
   double check if you wish.

.. image:: images/import-error.*
   :align: center
   :width: 80%
   :alt: Screen showing completed import with errors.

Import SKOS file
================

1. Click on the import menu, then click on XML.

2. Click on the link to the SKOS import page.

.. image:: images/import-menu-skos.*
   :align: center
   :width: 80%
   :alt: Import menu showing link to SKOS import page.

3. Click on Browse, and navigate to an XML file saved to your computer. Click
   Open.

4. Type in the name of the :term:`Taxonomy` you are importing into (e.g.
   Places, Subjects, etc).

.. TIP::

   AtoM currently defaults to "Places" in the taxonomy field. Users can
   replace this with the name of any taxonomy by typing it into the field.

5. Click Import. AtoM will display the number of terms imported to the
   taxonomy and the time elapsed. Users can click to view the taxonomy, or
   return to import more terms to the same taxonomy. If there are errors in
   the import, AtoM will display the errors.

.. image:: images/skos-completed.*
   :align: center
   :width: 80%
   :alt: Screen showing completed SKOS import.

:ref:`Back to top <import-descriptions-terms>`
