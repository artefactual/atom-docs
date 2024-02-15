.. _descriptive-standards:

=====================
Descriptive standards
=====================

.. figure:: images/ica-standards.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: AtoM is built around the ICA's descriptive standards

   AtoM is built around the ICA's descriptive standards

At its core, AtoM was originally designed to provide archivists with a
freely available, user-friendly access system that would facilitate
international standards adoption. Consequently, AtoM implements a number of
standards-based edit templates, which are based on the International Council
on Archives'(`ICA <http://www.ica.org/>`__) international descriptive
standards, including:

* General International Standard Archival Description (:ref:`ISAD
  <isad-template>`)
* International Standard Archival Authority Records (Corporate bodies,
  persons, and families) (:ref:`ISAAR-CPF <isaar-template>`)
* International Standard for Describing Institutions with Archival Holdings
  (:ref:`ISDIAH <isdiah-template>`)
* International Standard for Describing Functions (:ref:`ISDF
  <isdf-template>`)


While AtoM was originally designed around the `ICA's <http://www.ica.org/>`__
international descriptive standards (ISAD, ISAAR, ISDIAH and ISDF), it is
intended to be flexible enough to accommodate other practices based on other
(national or local) descriptive standards, including those intended for
libraries, museums, and art galleries.

.. _standards-support:

Support
=======

"Support" means that users of another standard should be able to use AtoM to
produce outputs that are compliant with that standard. This includes the
ability to enter data in :term:`fields <field>` that represent all of the
:term:`data elements <data element>` required by the standard, interact with
(view, edit, search) data in ways structured by and labelled according to the
terms of the standard, and output (print, export) data in formats compliant
with the standard.

.. _standards-design-principles:

Design principles
=================

To implement support for other standards:

* Map the data elements of the target standard to the related ICA standard and
  - via this "metadata crosswalk" - to the underlying database architecture in
  AtoM
* Use existing AtoM fields wherever the crosswalk establishes a direct
  correlation between elements in the ICA and target standards
* Create "custom fields" for all other elements in the target standard using
  AtoM's "property" database table (where "type" is the name of the element
  and "value" is the data itself)
* Create additional PHP methods for managing the data as required
* Add user interface templates (:term:`view <view page>` and :term:`edit <edit
  page>` pages) using page divisions and field labels based on the structure
  and terminology of the target standard

Adding support for another standard requires a :term:`developer` to work on
the underlying software code. Once support has been added, however, AtoM
provides an interface allowing :term:`administrators <administrator>` to
easily select their preferred standard and to switch between the various
standards.

.. _standards-other-standards:

Other (non-ICA) standards currently supported
=============================================

Users of other descriptive standards should be aware that this manual is
generally based on the ICA standards for its examples and screenshots.
Standard-specific sections are noted below.

.. _standards-rad:

Rules for Archival Description (RAD)
------------------------------------

.. image:: images/standards-rad.*
   :align: right
   :width: 15%
   :alt: The Canadian Rules for Archival Description

RAD is maintained by the `Canadian Council of Archives
<http://cdncouncilarchives.ca/>`__ and is available at
http://www.cdncouncilarchives.ca/archdesrules.html. RAD-specific sections of
this manual are available at: Rules for Archival Description (:ref:`RAD
<rad-template>`).

.. _standards-dacs:

Describing Archives: A Content Standard (DACS)
----------------------------------------------

.. image:: images/standards-dacs.*
   :align: right
   :width: 15%
   :alt: The U.S. Describing Archives: A Content Standard (DACS)

DACS is maintained by the `Society of American Archivists
<http://www2.archivists.org/>`__ and is available at
http://files.archivists.org/pubs/DACS2E-2013.pdf (**PDF**). DACS-specific sections
of this manual are available at: Describing Archives: A Content Standard
(:ref:`DACS <dacs-template>`)

.. _standards-dc:

Dublin Core Metadata Element Set, Version 1.1
----------------------------------------------

AtoM implements unqualified `Dublin Core Metadata Element Set, Version 1.1.
<http://dublincore.org/documents/dces/>`__. Dublin Core-specific sections of
this manual are available at Dublin Core (:ref:`DC <dc-template>`).

.. _standards-mods:

Metadata Object Description Schema (MODS)
-----------------------------------------

The MODS standard, maintained by the US Library of Congress `Network
Development and MARC Standards Office <http://www.loc.gov/marc/ndmso.html>`__,
is available at http://www.loc.gov/standards/mods/mods-outline.html. Currently
AtoM supports the Digital Library Federation second level of adoption for MODS
(see `DLF Aquifer MODS Guidelines Levels of Adoption <https://wiki.dlib.indian
a.edu/display/DLFAquifer/MODS+Guidelines+Levels+of+Adoption>`__). MODS-
specific sections of this manual are available at: Metadata Object Description
Schema (:ref:`MODS <mods-template>`).

