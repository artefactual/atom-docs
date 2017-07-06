.. _export-xml:

==========
Export XML
==========

AtoM provides an export functionality that can be used to export
:term:`archival descriptions <archival description>` and
:term:`authority records <authority record>` as XML data.

.. TIP::

   We have noticed that in some cases the Safari browser will only save as HTML.
   Try using Firefox, IE, or Chrome to "Save page as" XML.

.. TIP::

   In many browsers you can also save the XML file by right-clicking the link
   under export, and choosing "Save page as."

To exit the XML export file, click on your browser's back button.

The following file types can be exported:

* EAD (hierarchical archival descriptions and associated authority records,
  archival institution descriptions and taxonomy terms)
* Dublin Core XML, MODS XML (archival descriptions and associated taxonomy terms)
* EAC (authority records)


.. SEEALSO::

   * :ref:`cli-bulk-export`
   * :ref:`csv-export`
   * :ref:`import-export-skos`

EAD export
==========

In the :term:`archival description` :term:`view page`, select EAD 2002 XML
under Export. This will export the current archival description plus all its
:term:`child records <child record>` and associated
:term:`authority records <authority record>`,
:term:`archival institution` descriptions and :term:`taxonomy` terms.

.. image:: images/export-ead.*
   :align: center
   :width: 80%
   :alt: Export EAD file from archival description page.

.. IMPORTANT::

   The :ref:`inherit-reference-code` setting also determines how the
   ``<unitid>`` element in the EAD XML is populated. If the inheritance is
   turned on, then AtoM will populate all descendant records in the EAD XML
   with the full inherited reference code. If inheritance is turned off, AtoM
   will only add the identifier for that record in the ``<unitid>`` on export.
   This allows users exporting to a different source system that does not have
   a reference code inheritance setting to maintain a full reference code at
   all levels in the target system. **However, if you are exporting from one
   AtoM instance to another** (for example, from a local institution to a
   portal site), you might want to consider how this will impact your record
   display in the target system - if you have reference code inheritance
   turned on when you export, and the target AtoM instance *also* has the
   setting turned on, you may end up with duplication in the display!

Dublin Core XML export
======================

In the :term:`archival description` :term:`view page`, select Dublin Core 1.1 XML
under Export. This will export the current archival description plus all its
:term:`child records <child record>` and associated
:term:`authority records <authority record>`,
:term:`archival institution` descriptions and :term:`taxonomy` terms.

.. image:: images/export-dublin-core.*
   :align: center
   :width: 80%
   :alt: Export Dublin Core file from archival description page.

MODS XML export
===============

If the administrator has set the default :term:`archival description` template
to MODS, this will also appear as an export option. In the
:term:`archival description` :term:`view page`, select MODS 3.3 XML under Export.
This will export the current archival description plus all its
:term:`child records <child record>` and associated
:term:`authority records <authority record>`,
:term:`archival institution` descriptions and :term:`taxonomy` terms.

.. image:: images/export-mods.*
   :align: center
   :width: 80%
   :alt: Export MODS file from archival description page.

EAC export
==========

In an :term:`authority record` :term:`view page`, select EAC under Export.
This will export the authority record currently being viewed.

.. image:: images/export-eac.*
   :align: center
   :width: 80%
   :alt: Export EAC file from authority record page.

:ref:`Back to top <export-xml>`
