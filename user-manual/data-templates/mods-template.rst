.. _mods-template:

=========================================
Metadata Object Description Schema (MODS)
=========================================

On this page you will find:

* Link to downloadable CSV template using
  `ISAD(G) General International Standard Archival Description <http://www.ica.org/10207/standards/isadg-general-international-standard-archival-description-second-edition.html>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using MODS
  in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-testing-import`
   * :ref:`import-descriptions-terms`
   * :ref:`export-descriptions-terms`

.. _mods-and-csv:

MODS and the ISAD CSV template
==============================

At present, there is no MODS-based CSV template for importing descriptions
into  AtoM. However, because is based on the `International Council
on Archives <http://www.ica.org/>`_ ' ISAD(G) standard (see:
:ref:`ISAD <isad-template>`), the ISAD CSV template
can be used for import, as all templates have been crosswalked in AtoM where
possible.

To test this, we recommend creating a full MODS description in AtoM, and then
changing the display template to MODS, to determine where field in MODS map to
ISAD. For more information on changing the display template for a description,
see: :ref:`change-display-standard`. If desired, all templates in AtoM can be
changed at the  same time using the *Default template* setting available in
**Admin > Settings** - see :ref:`default-templates`.

The CSV mappings below will provide guidance on which ISAD CSV fields can be
used to import your MODS-based descriptions into AtoM.

To download the ISAD(G) CSV template for AtoM, please visit our `wiki page <https://wiki.accesstomemory.org/Resources/CSV_templates>`_.

Field descriptions
==================

The MODS standard, maintained by the US Library of Congress `Network
Development and MARC Standards Office <http://www.loc.gov/marc/ndmso.html>`__,
is available at:

* http://www.loc.gov/standards/mods/mods-outline.html.

Currently AtoM supports the Digital Library Federation second level of adoption
for MODS version 3.3 (see `DLF Aquifer MODS Guidelines Levels of Adoption
<https://wiki.dlib.indiana.edu/display/DLFAquifer/MODS+Guidelines+Levels+of+Adoption>`__).

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the related column in the ((ISAD) CSV
  template
* **MODS Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **MODS XML** refers to the field mapping to MODS XML for import/export
* **Notes** includes any other information needed for successful data entry or
  CSV import.

**Skip to**:

* :ref:`mods-elements-area`

.. _mods-elements-area:

MODS Elements area
==================

.. figure:: images/mods-elements-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the MODS template.

   The data entry fields for the MODS archival description edit template.

TO DO

:ref:`Back to the top <mods-template>`
