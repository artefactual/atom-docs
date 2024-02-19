.. _entity-types:

============
Entity types
============

.. figure:: images/core-entity-types.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: Core entities in AtoM and their relationships

   Core entities in AtoM and their relationships



An :term:`entity` is an object about which an information system collects data.
AtoM's architecture includes a number of :term:`entity` types, but from a
user's point of view there are seven main types with which they will interact:

* :ref:`Accession record <entity-accession-record>`
* :ref:`Archival descriptions <entity-archival-description>`
* :ref:`Authority record <entity-authority-record>`
* :ref:`Archival institutions <entity-archival-institution>`
* :ref:`Functions <entity-function>`
* :ref:`Rights records <entity-rights-record>`
* :ref:`Terms <entity-term>`

.. seealso::

   * :ref:`Donors <donors>`
   * :ref:`Page types <page-types>`
   * :ref:`Navigation in AtoM <navigate>`
   * :ref:`Search <search-atom>`
   * :ref:`browse`


.. _entity-accession-record:

Accession record
================

:term:`Accession records <accession record>` provide administrative and
descriptive information that identifies the contents, provenance and
disposition of the materials transferred to the archival institution. The
accession record is designed to establish basic intellectual and physical
control over a new accession at the time it is received by the
:term:`archival institution`.

The accession record is not aimed at end-user description, but AtoM provides
the option to create an archival description from an accession record (details
:ref:`here <create-accession-description>`). The following archival
description fields inherit the data entered into the accession record:

* Title
* Name of creator
* Archival/custodial history
* Scope & content
* Physical condition

In AtoM the accession record includes data entry :term:`fields <field>` to
capture donor information (e.g., donor name and contact information) and
rights information (e.g., type of act, rights holder, dates and basis of
rights). Once created, Donor records and Rights can be managed separately.

**For information on creating and managing accession records, see:**
:ref:`accession-records`.

.. seealso::

   * :ref:`deaccessions`
   * :ref:`Add an accrual <add-accession-accrual>`
   * :ref:`donors`

.. _entity-archival-description:

Archival descriptions
=====================

Archival descriptions provide contextual information about archival materials
and are arranged into hierarchical levels (:term:`fonds`, series, files,
items, etc.). The default archival description edit template contains
:term:`data elements <data element>` based on the `ICA's
<http://www.ica.org/>`__ General International Standard Archival Description
(ISAD). Other edit templates are also available: Dublin Core,The US Library of
Congress' Metadata Object Descriptive Schema (MODS), the U.S. Describing
Archives: A Content Standard (DACS), and Canadian Rules for Archival
Description (RAD).

**For information on creating and managing archival descriptions, see:**
:ref:`archival-descriptions`.

**For data entry guidance using a particular edit template, see:**

* General International Standard Archival Description (:ref:`ISAD
  <isad-template>`)
* Rules for Archival description (:ref:`RAD <rad-template>`)
* Describing Archives: A Content Standard (:ref:`DACS <dacs-template>`)
* Dublin Core Metadata Element Set, Version 1.1 (:ref:`DC <dc-template>`)
* Metadata Object Description Schema (:ref:`MODS <mods-template>`)

.. _entity-authority-record:

Authority records
=================

Authority records provide descriptions of the actors (:term:`corporate bodies
<corporate body>`, persons, and families) that interact with archival
materials as :term:`creators <creator>`, custodians, subject :term:`access
points <access point>`, etc. The edit template is based on the `ICA's
<http://www.ica.org/>`__ International Standard Archival Authority Records
(Corporate bodies, Persons, Families) (ISAAR).

Authority records are linked to :term:`archival descriptions <archival
description>` in AtoM by :term:`events <event>` delimited by start/end dates.
Through :term:`events <event>`, one actor can have zero, one, or many
relationships to zero, one, or many :term:`archival units <archival unit>`;
and one :term:`archival unit` can have zero, one, or many relationships to
zero, one, or many actors. Event relationships link ISAAR authority files
(descriptions of actors) and ISAD records (descriptions of archival
materials).

**For information on creating and managing authority records, see:**
:ref:`authority-records`.

**For authority record data entry guidance, see:**

* International Standard Archival Authority Records (:ref:`ISAAR
  <isaar-template>`)

.. _entity-archival-institution:

Archival institutions
=====================

Archival institution records provide descriptions of :term:`repositories
<repository>` that preserve and provide access to archival materials. The edit
template is based on the `ICA's <http://www.ica.org/>`__ International
Standard for Describing Institutions with Archival Holdings (ISDIAH).

Archival institutions are actors that hold archival materials. As such, many
:term:`archival descriptions <archival description>` can be linked to an
archival institution as :term:`holdings`.

**For information on creating and managing archival institutions, see:**
:ref:`archival-institutions`.

**For archival institution data entry guidance, see:**

* International Standard for Describing Institutions with Archival Holdings
  (:ref:`ISDIAH <isdiah-template>`)

.. _entity-function:

Functions
=========

Functions provide a means of describing the activities of records
:term:`creators <creator>` and other actors linked to records creation and
maintenance. Analysis of the functions of :term:`corporate bodies <corporate
body>` is important as the basis for many record keeping activities. Functions
are recognised as generally being more stable than administrative structures,
which are often amalgamated or devolved when restructuring takes place.
Functions are therefore well suited to act as a basis for the appraisal,
:term:`arrangement`, classification and description of records, and as a tool
for the retrieval and analysis of records.

In AtoM the functions edit template is based on the `ICA's
<http://www.ica.org/>`__ International Standard for Describing Functions
(ISDF). Functions are linked to :term:`authority records <authority record>`
and to other functions.

**For information on creating and managing functions, see:**
:ref:`functions`.

**For function data entry guidance, see:**

* International Standard for Describing Functions (:ref:`ISDF
  <isdf-template>`)

.. _entity-rights-record:

Rights records
==============

Rights records provide rights related restrictions that can be linked to
:term:`accession records <accession record>`, :term:`archival descriptions
<archival description>` and :term:`digital objects <digital object>`. AtoM
Rights metadata elements use `PREMIS rights elements
<http://www.loc.gov/standards/premis/>`__. In AtoM restrictions can be based
on Copyright(s), License, Statute(s) and Policy. Rights are inherited in AtoM,
which means that rights added at a higher level (e.g., fonds level) are
inherited by the lower levels (e.g., item level). If you add rights to an
:term:`accession <accession record>`, all :term:`archival descriptions
<archival description>` created from that accession will inherit the same
rights. If you add rights to an :term:`archival description` at the
:term:`fonds` or :term:`collections <collection>` level, all lower levels (aka
:term:`child records <child record>`) such as the file or item-level will
inherit those rights.

**For information on creating and managing rights records, see:**
:ref:`rights`.

**For rights record data entry guidance, see:**

* Preservation Metadata: Implementation Strategies (:ref:`PREMIS
  <premis-template>`)

.. _entity-term:

Terms
=====

:term:`Terms <term>` provide :term:`controlled vocabularies <controlled
vocabulary>` used throughout the system (e.g. as :term:`access points <access
point>` or in :term:`drop-down <drop-down menu>` :term:`value lists <value
list>`). They are organized into separate :term:`taxonomies <taxonomy>`.
Within the edit templates, many of the terms that appear in the :term:`value
lists <value list>` are derived directly from the :term:`controlled
vocabularies <controlled vocabulary>` used in the standards upon which the
:term:`edit pages <edit page>` are based.

AtoM ships with a fixed number of taxonomies containing default values
(:term:`terms <term>`). Some terms are locked, i.e. cannot be edited or
deleted, because they are used by the application's underlying code. Most
terms, however, can be edited or deleted, and all :term:`taxonomies
<taxonomy>` can be assigned new terms in addition to any locked values. Two
of the most common taxonomies seen and used by public users are
:term:`subject` and :term:`place` terms, which can be added as :term:`access
points <access point>` to :term:`archival descriptions <archival
description>`.

**For information on creating and managing terms, see:**
:ref:`terms`.

.. seealso::

   * :ref:`term-name-vs-subject`

:ref:`Back to top <entity-types>`
