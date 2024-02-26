.. _control-area:

============
Control area
============

.. image:: images/control-area.*
   :align: right
   :width: 60%
   :alt: Control area in an archival description

The control area is similar, with some variations, for
:ref:`archival descriptions <archival-descriptions>` (ISAD, DACS, and RAD
templates only), :ref:`authority records <authority-records>`,
:ref:`archival institutions <archival-institutions>` and
:ref:`functions <functions>`. It contains fields that uniquely identify the
description itself and records how, when, and by which archival institution the
description was created and maintained.

The following notes aim primarily to clarify AtoM procedures; for
guidelines on what information to record in particular fields, consult the
relevant content standard. Users may note that the AtoM
templates offer more fields than exist in the content standards, which
originated from an effort to harmonize the templates with all four standards.
The notes are organized by field, with links to the applicable section(s) of
the standards. Where there is a one-to-one correspondence between a data element
in the standard and an AtoM field, the note simply gives the standard rule
verbatim.

Description identifier
======================

"Record a unique description identifier in accordance with local and/or
national conventions. If the description is to be used internationally,
record the code of the country in which the description was created in
accordance with the latest version of ISO 3166, Codes for the representation
of names of countries. Where the creator of the description is an
international organisation, give the organisational identifier in place of
the country code." ISDIAH 5.6.1, ISAAR 5.4.1, ISDF 5.4.1

Institution identifier
======================

"Record the full authorised form of name(s) of the agency(ies) responsible for
creating, modifying or disseminating the description or, alternatively,
record a code for the agency in accordance with the national or international
agency code standard." ISDIAH 5.6.2, ISAAR 5.4.2, ISDF 5.4.2

.. image:: images/control-area-institution-id.*
   :align: center
   :width: 80%
   :alt: Institution identifier field in the Description control area

.. TIP::

   If you are using the reference-code inheritance option available in **Admin
   > Settings > Global** (learn more :ref:`here <inherit-reference-code>`),
   the Institution identifier you have entered on the
   :ref:`ISDIAH <isdiah-template>` :term:`archival institution` record will
   appear as part of your inherited reference code. If you are not using the
   reference code inheritance, this field offers users a way to record the
   related :term:`repository` identifier with an associated
   :term:`archival description`.

Rules or conventions
====================

"Record the international, national and/or local rules or conventions followed
in preparing the description." ISAD 3.7.2, DACS 8.1.4

.. image:: images/control-area-rules.*
   :align: center
   :width: 80%
   :alt: Rules or conventions field in the Description control area

"Record the names, and where useful the editions or publication dates, of the
conventions or rules applied. Specify separately which rules have been
applied for creating the Authorised form of name. Include reference to any
system(s) of dating used to identify dates in this description (e.g. ISO
8601)." ISDIAH 5.6.3, ISAAR 5.4.3

"Record the names and, when useful, the editions or publication dates of the
conventions or rules applied." ISDF 5.4.3

Status
======

"Record the current status of the description, indicating whether it is a
draft, finalized and/or revised...." ISDIAH 5.6.4; ISAAR 5.4.4, ISDF 5.4.4

.. image:: images/control-area-status.*
   :align: center
   :width: 80%
   :alt: Status field in the Description control area

AtoM has a :term:`drop-down menu` using values drawn from the description
statuses :term:`taxonomy`; by default in AtoM this drop-down is populated
with the following terms:

* Final
* Revised
* Draft

.. TIP::

   :term:`Administrators <administrator>` and :term:`editors <editor>` can
   customize the taxonomy to match institutional standards if desired, adding
   new terms, or changing/deleting the default terms. For more information, see:
   :ref:`terms`.


Level of detail
===============

"Record whether the description consists of a minimal, partial or full level
of detail in accordance with relevant international and/or national
guidelines and/or rules..." ISDIAH 5.6.5, ISAAR 5.4.5, ISDF 5.4.5

.. image:: images/control-area-detail.*
   :align: center
   :width: 80%
   :alt: Level of detail field in the Description control area

AtoM has a :term:`drop-down menu` using values drawn from the description
detail levels :term:`taxonomy`; by default in AtoM this drop-down is populated
with the following terms:

* Full
* Partial
* Minimal

.. TIP::

   :term:`Administrators <administrator>` and :term:`editors <editor>` can
   customize the taxonomy to match institutional standards if desired, adding
   new terms, or changing/deleting the default terms. For more information, see:
   :ref:`terms`.

Dates of creation, revision and deletion
========================================

"Record the date(s) the entry was prepared and/or revised..." (ISAD 3.7.3)

"Record the date the description was created and the dates of any revisions to
the description." ISDIAH 5.6.6, ISAAR 5.4.6, ISDF 5.4.6

.. image:: images/control-area-dates.*
   :align: center
   :width: 80%
   :alt: Dates of creation, revision, and deletion in the Control area

Language(s) and Script(s)
=========================

"Record the language(s) and/or script(s) of the description... ISDIAH 5.6.7,
"ISAAR 5.4.7, ISDF 5.4.7

.. image:: images/control-area-language-script.*
   :align: center
   :width: 80%
   :alt: Languages and scripts fields in the Control area

AtoM implements this data element as two separate
:term:`multi-value fields <multi-value field>`.  The
:term:`value lists <value list>` are based on the ISO standards and cannot be
edited.

Click on the desired field and begin to type the name of the language or script.
AtoM will auto-suggest as you type. When the correct name appears in the
field, click on it to add. There is no limit to the number of languages or
scripts you can add.

.. image:: images/control-area-language-select.*
   :align: center
   :width: 80%
   :alt: Using the language autocomplete field to select a language

.. image:: images/control-area-remove-language.*
   :align: right
   :width: 20%
   :alt: removing a language

To remove a language or script already added, hover your cursor over the
bullet next to the language/script. The bullet will change into an **X** - if
you click the **X**, the language or script will be removed.

To record a narrative note relating to either :term:`field`, use the
:ref:`Maintenance Notes <maintenance-notes>` area (this field is not
available in the :term:`archival description` edit templates).

.. IMPORTANT::

   These fields are intended to capture information about the language of the
   *description*, rather than the language of the *materials* themselves. For
   :term:`archival descriptions <archival description>`, there are already
   fields available in the :term:`edit page` to capture information about the
   language of the materials being described - in the
   :ref:`ISAD(G) template <isad-template>`, these fields are found in the
   *Conditions of access and use* :term:`information area`; in the
   :ref:`RAD template <rad-template>`, these fields are found in the *Notes*
   :term:`information area`; in the :ref:`DACS template <dacs-template>`,
   these are in the *Conditions of access and use elements*. For further
   information, see the section on :ref:`Data entry <data-entry>` for each
   specific edit template.

Sources
=======

"Record the sources consulted in establishing the description." ISDIAH 5.6.8,
ISAAR 5.4.8, ISDF 5.4.8

"Record relevant information about sources consulted in establishing or
revising the description." DACS 8.1.3. **Note** that this field is labelled
"Sources used" in the :ref:`DACS template <dacs-template>`.

.. image:: images/control-area-sources.*
   :align: center
   :width: 80%
   :alt: The sources field in the Control area

This is a text field; AtoM does not structure the data in any predetermined way.

.. _maintenance-notes:

Maintenance notes
=================

"Record notes pertinent to the creation and maintenance of the description.
For example, the names of persons responsible for creating and/or revising
the description may be recorded here." ISDIAH 5.6.9, ISAAR 5.4.9

"Record notes pertinent to the creation and maintenance of the description."
ISDF 5.4.9

.. image:: images/control-area-maintenance.*
   :align: center
   :width: 80%
   :alt: The Maintenance notes field in the Control area

This element appears in the templates for
:ref:`authority records <authority-records>`,
:ref:`archival institutions <archival-institutions>` and
:ref:`functions <functions>`. For
:term:`archival descriptions <archival description>` see Archivist's
notes, below.

This is a text field; AtoM does not structure the data in any predetermined way.

Archivist's notes
=================

"Record notes on sources consulted in preparing the description and who
prepared it." ISAD 3.7.1

"Record the name(s) of the person(s) who created or revised the description,
as well as the creation or revision date." DACS 8.1.5. **Note** that this
field is labelled "Archivist and date" in the
:ref:`DACS template <dacs-template>`.

.. image:: images/control-area-archivists-notes.*
   :align: center
   :width: 80%
   :alt: The Archivist's notes field in the Control area

This element appears only in the :ref:`ISAD(G) <isad-template>` and
:ref:`DACS <dacs-template>` :term:`archival description` templates. This is a
text field; AtoM does not structure the data in any predetermined way. There
is no limit to the number of notes you can add.

:ref:`Back to top <control-area>`
