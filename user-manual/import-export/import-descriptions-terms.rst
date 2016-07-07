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

.. _import-xml:

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

.. _ead-actors-import:

On Authority records and EAD imports
------------------------------------

AtoM tries to support the reusability of actor information through the
maintenance of :term:`authority records <authority record>` that can be linked
to :term:`archival descriptions <archival description>` and other entities. This,
and the rationale for this, is outlined in greater detail in the following
sections:

* :ref:`authority-bioghist-access`
* :ref:`term-name-vs-subject`

This also affects how actor names are handled during an EAD XML import. Some of
the key behaviors are outlined below:

**Creating new actor records on import**

* AtoM looks for creator names in the ``<origination>`` EAD element, and
  :term:`access point` names (used as subjects) in ``<controlaccess>`` during an
  EAD import.
* Similarly, any Administrative / biographical history data in an archival
  description `EAD <http://www.loc.gov/ead/>`__ import (i.e. data contained in
  the ``<bioghist>`` EAD element) will be mapped to the "History"
  :term:`field` (ISAAR-CPF 5.2.2) in the related :term:`authority record`,
  (generated from the data contained in the ``<origination>`` element of the EAD)
  and then is presented in AtoM in any related descriptions where the entity
  is listed as a creator.
* Where multiple creator names and histories are included in an import,
  ``<origination>`` and ``<bioghist>`` elements are matched 1:1 in the  order they
  appear in the EAD.
* If a ``<bioghist>`` element is included in an EAD import, but no creator
  name is included, AtoM will still automatically generate a stub
  :term:`authority record` and map the ``<bioghist>`` data to the "History"
  :term:`field` (ISAAR-CPF 5.2.2) - the authority record will be left
  untitled, until the user manually adds the appropriate :term:`name` to the
  authority record. Similarly, if there are more ``<bioghist>`` elements
  included in an import than  creator names included in ``<origination>``
  elements, the final biographical/administrative history will be mapped to an
  untitled authority record.

**Attempting to match to existing authority records**

* AtoM will attempt to find matches for current authority records. However, to
  avoid collisions, or situations in which multiple imports overwrite the same
  authority record in a :term:`multi-repository system`, the approach is
  conservative - for a match to be made and a link to an existing record added
  instead of a new record being created, there must be an *exact* match on the
  authorized form of name.
* If there is no exact match, then AtoM will create a new actor record. Since
  AtoM does not currently have the capacity to suspend the import and ask the
  user whether to update an existing authority record or ignore it and create
  a new one, this method was chosen as the least destructive. However, this
  means that administrative or biographical histories CANNOT be updated via an
  import.
* This also means that **users should be careful to double check authority
  linking behaviors in AtoM following an import**, and manually perform any
  desired adjustments where needed.

.. SEEALSO::

   * :ref:`csv-actors-import`

.. _import-skos:

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
