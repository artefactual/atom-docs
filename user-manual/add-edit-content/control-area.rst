.. _control-area:

============
Control area
============

The control area is similar for
:ref:`archival descriptions <archival-descriptions>` (ISAD and RAD templates
only), :ref:`authority records <authority-records>`,
:ref:`archival institutions <archival-institutions>` and
:ref:`functions <functions>`. It contains fields that uniquely identify the
description itself and records how, when, and by which archival institution the
description was created and maintained.

The following notes aim primarily to clarify AtoM procedures; for
guidelines on what information to record in particular fields, consult ISAD,
ISAAR, or ISDIAH or ISDF as the content standard. Users may note that the AtoM
templates offer more fields than exist in the content standards, which
originated from an effort to harmonize the templates with all four standards.
The notes are organized by field, with links to the applicable section(s) of
the standards. Where there is a one-to-one correspondence between a data element
in the standard and an AtoM field, the note simply gives the standard rule
verbatim.

.. image:: images/control-area.*
   :align: right
   :width: 60%
   :alt: Control area in an archival description


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

Rules or conventions
====================

"Record the international, national and/or local rules or conventions followed
in preparing the description." ISAD 3.7.2

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

AtoM has a :term:`drop-down menu` using values drawn from the description
statuses :term:`taxonomy`; :term:`administrators <administrator>` and
 :term:`editors <editor>` can customize the taxonomy to match institutional
 standards if desired.

Level of detail
===============

"Record whether the description consists of a minimal, partial or full level
of detail in accordance with relevant international and/or national
guidelines and/or rules..." ISDIAH 5.6.5, ISAAR 5.4.5, ISDF 5.4.5

AtoM has a :term:`drop-down menu` using values drawn from the description
detail levels :term:`taxonomy`; :term:`administrators <administrator>`
and :term:`editors <editor>` can customize the taxonomy to match institutional
standards if desired.

Dates of creation, revision and deletion
========================================

"Record the date(s) the entry was prepared and/or revised..." (ISAD 3.7.3)

"Record the date the description was created and the dates of any revisions to
the description." ISDIAH 5.6.6, ISAAR 5.4.6, ISDF 5.4.6

Language(s) and Script(s)
=========================

"Record the language(s) and/or script(s) of the description... ISDIAH 5.6.7,
"ISAAR 5.4.7, ISDF 5.4.7

AtoM implements this data element as two separate
:term:`multi-value fields <multi-value field>`.  The
:term:`value lists <value list>` are based on the ISO standards and cannot be
edited.

Click on the desired field and begin to type the name of the language or script.
AtoM will auto-suggest as you type. When the correct name appears in the
field, click on it to add. There is no limit to the number of languages or
scripts you can add.

To record a narrative note relating to either :term:`field`, use the
:ref:`Maintenance Notes <maintenance-notes>` area.

Sources
=======

"Record the sources consulted in establishing the description." ISDIAH 5.6.8,
ISAAR 5.4.8, ISDF 5.4.8

This is a text field; AtoM does not structure the data in any predetermined way.

.. _maintenance-notes:

Maintenance notes
=================

"Record notes pertinent to the creation and maintenance of the description.
For example, the names of persons responsible for creating and/or revising
the description may be recorded here." ISDIAH 5.6.9, ISAAR 5.4.9

"Record notes pertinent to the creation and maintenance of the description."
ISDF 5.4.9

This element appears in the templates for
:ref:`authority records <authority-records>`,
:ref:`archival institutions <archival-institutions>` and
:ref:`functions <functions>`.
For :term:`archival descriptions <archival-description>` see Archivist's
notes, below.

This is a text field; AtoM does not structure the data in any predetermined way.

Archivist's notes
=================

"Record notes on sources consulted in preparing the description and who
prepared it." ISAD 3.7.1

This element appears in the  :term:`archival description` template. This is a
text field; AtoM does not structure the data in any predetermined way. There
is no limit to the number of notes you can add.

:ref:`Back to top <control-area>`
