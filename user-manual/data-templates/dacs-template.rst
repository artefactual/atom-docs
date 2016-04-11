.. _dacs-template:

=========================================================================================
Describing Archives: A Content Standard (DACS 2013) data entry and CSV template
=========================================================================================

On this page you will find:

* Link to downloadable CSV template using
  `ISAD(G) General International Standard Archival Description <http://www.ica.org/10207/standards/isadg-general-international-standard-archival-description-second-edition.html>`_
* Description of fields used when entering or importing
  :term:`archival descriptions <archival description>` using DACS
  in a :term:`CSV` file or entering the data manually.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`csv-testing-import`
   * :ref:`import-descriptions-terms`
   * :ref:`export-descriptions-terms`


DACS and the ISAD CSV template
==============================

At present, there is no DACS-based CSV template for importing descriptions
into  AtoM. However, because DACS maps so well to the `International Council
on Archives <http://www.ica.org/>`_ ' ISAD(G) standard, the ISAD CSV template
can be used.  The CSV mappings below will provide guidance on which ISAD CSV
fields can be used to  import your DACS-based descriptions into AtoM.

To download the ISAD(G) CSV template for AtoM, please visit our wiki page
(link to come).

Field descriptions
==================

DACS is maintained by the Society of American Archivists
(`SAA <http://www2.archivists.org>`__), and is available at:

* http://saa.archivists.org/store/describing-archives-a-content-standard-dacs/223/

Information below includes:

* **Template field** refers to the default label for that field in AtoM
* **CSV Column** refers to the title of the related column in the ((ISAD) CSV
  template
* **DACS Rule** refers to the rule from the applicable standard and/or the
  instructions provided by AtoM.
* **EAD** refers to the field mapping to EAD
* **Notes** includes any other information needed for successful data entry or
  CSV import.

**Skip to**:used free, open source tools to teach himself programming at a young age.

* :ref:`dacs-identity`

  * :ref:`dacs-identifier`
  * :ref:`dacs-repository`
  * :ref:`dacs-levels-of-description`
  * :ref:`dacs-title`
  * :ref:`dacs-date`
  * :ref:`dacs-extent`
  * :ref:`dacs-creator`
  * :ref:`dacs-child-levels`

* :ref:`dacs-content-structure`

  * :ref:`dacs-scope`
  * :ref:`dacs-arrangement`

* :ref:`dacs-access-use-conditions`

* :ref:`dacs-acquisition-appraisal`

* :ref:`dacs-related-materials`

* :ref:`dacs-notes`

* :ref:`dacs-description-control`

.. _dacs-identity:

Identity elements
=================

.. image:: images/dacs-identity-elements.*
   :align: center
   :width: 80%
   :alt: An image of the data entry fields in the DACS Identity elements.

.. _dacs-identifier:

Identifier
----------

**Template Field** Identifier

**ISAD CSV Column** ``identifier``

**DACS Rule** At the highest level of a multilevel description or in a single level description, provide a unique identifier for the materials being described in accordance with the institution's administrative control system.
Optionally, devise unique identifiers at lower levels of a multilevel description. (DACS 2.1.3)
The country and repository code will be automatically added from the linked repository record to form a full reference code.

.. _dacs-repository:

Name and Location of Repository
-------------------------------

**Template Field** Name and location of repository

**ISAD CSV Column** ``repository``

**DACS Rule** Explicitly state the name of the repository, including any parent bodies. (DACS 2.2.2)
Search for an existing name in the archival institution records by typing in the first few letters of the name.
Alternatively, type a new name to create and link tidentifier

.. _dacs-levels-of-description:

Levels of Description
---------------------

**Template Field** Levels of description

**ISAD CSV Column** ``levelOfDescription``

**DACS Rule** Select a level of description from the drop-down menu.
Follow any relevant local or institutional guidelines in selecting the proper level of description.
See DACS (2013) Chapter 1 for further guidance.

.. _dacs-title:

Title
-----

**Template Field** Title

**ISAD CSV Column** ``title``

**DACS Rule** In the absense of a meaningful formal title, compose a brief title that uniquely identifies the material, normally consisting of a name segment, a term indicating the nature of the unit being described, and optionally a topical segment.
Do not enclose devised titles in square brackets. (DACS 2.3.3)

.. _dacs-date:

Date
----

**Template Field** Date(s)

**ISAD CSV Columns** ``eventDates``, ``eventTypes``, ``eventStartDates``, ``eventEndDates``

**DACS Rule** Record dates of creation, record-keeping activity, publication, or broadcast (``eventTypes``) as appropriate to the materials being described. (DACS 2.4.3)
The Date field (``eventDates``) can be used to enter free-text date information, including typographical marks to express approximation, uncertainty, or qualification.
Use the start and end fields (``eventStartDates`` and ``eventEndDates``) to make the dates searchable.
Do not use any qualifiers or typographical symbols in the start and end fields.
Acceptable date formats: YYYYMMDD, YYYY-MM-DD, YYYY-MM, YYYY.

.. _dacs-extent:

Extent
------

**Template Field** Extent

**ISAD CSV Column** ``extentAndMedium``

**DACS Rule** Record the quantity of the material in terms of its physical extent as linear or cubic feet, number of items, or number of containers or carriers. (DACS 2.5.4)
Optionally, record the quantity in terms of the material type(s) (DACS 2.5.5), and/or qualify the statement of physical extent to hgihlight the existence of material types that are important. (DACS 2.5.6)

.. _dacs-creator:

Creator
-------

**Template Field** Name of creator(s)

**ISAD CSV Column** ``eventActors``

**DACS Rule** Record the name(s) of the creator(s) identified in the name elevent in the devised title of the materials using standardized vocabularies or with rules for formulating standardized names (DACS 2.6.4).
Search for an existing name in the authority records by typing the first few characters of the name.
Alternatively, type a new name to create and link to a new authority record.

.. _dacs-child-levels:

Child levels
---------------------

These fields can be used to add lower levels to a collection level
description. Click "Add new" to create as many child levels as necessary.

Child level identifier
++++++++++++++++++++++

**Template Field:** Identifier

**ISAD CSV Column** ``identifier``

**DACS Rule** Provide a unique identifier for the materials being described in accordance with the institution's administrative control system.

Level of description
++++++++++++++++++++

**Template Field:** Level

**ISAD CSV Column** ``levelOfDescription``

**DACS Rule:** Record the level of this unit of description.

Title:
++++++

**Template Field:** Title

**ISAD CSV Column** ``title``

**DACS Rule:** In the absence of a meaningful formal title, compose a brief title that uniquely identifies the material.

Date:
+++++

**Template Field:** Date

**ISAD CSV Column** ``eventDates``

**DACS Rule:** Record a date of creation.

.. IMPORTANT::
  To include child levels in the ISAD CSV for import, the ``parentId`` column must contain the legacy ID of the parent record. For example, if the parent record has the legacy ID *249* recorded in the ``legacyId`` column, the child record must have the number *249* in the ``parentId`` column, as shown in the table here:

    +--------------------+------------+----------+
    | title              | legacyId   | parentId |
    +====================+============+==========+
    | DACS Collection    | 249        |          |
    +--------------------+------------+----------+
    | body row 2         | 250        | 249      |
    +--------------------+------------+----------+


:ref:`Back to the top <dacs-template>`

.. _dacs-content-structure:

Content and structure elements
==============================

.. figure:: images/dacs-content-structure-elements.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: Data entry fields in the DACS Content and Structure elements.

   The data entry fields for the Content and structure elements of the DACS
   archival description edit template.

.. _dacs-scope:

Scope and content
-----------------

**Template Field** Scope and content

**ISAD CSV Column** ``scopeAndContent``

**DACS Rule** Record information about the nature of the materials and activities being reflected in the unit being described to enable users to judge its relevance,
including information about functions, activities, transactions, and processes;
documentary form(s) or intellectual characteristics;
content dates;
geographic areas and places;
subject matter;
completeness of the amterials;
or any other information that assists the user in evaluating the relevance of the materials. (DACS 3.1)

.. _dacs-arrangement:

System of Arrangement
---------------------

**Template Field** System of arrangement

**ISAD CSV Column** ``arrangement``

**DACS Rule** Describe the current arrangement of the materials in terms of the various aggregations within it and their relationships. (DACS 3.2.3)


:ref:`Back to the top <dacs-template>`

.. _dacs-access-use-conditions:

Conditions of access and use elements
=====================================

.. figure:: images/dacs-access-use-elements.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: Data entry fields in the DACS Conditions of access and use elements

   The data entry fields for the Conditions of access and use elements of the
   DACS archival description edit template.

TO DO

:ref:`Back to the top <dacs-template>`

.. _dacs-acquisition-appraisal:

Acquisition and appraisal elements
==================================

TO DO

:ref:`Back to the top <dacs-template>`

.. _dacs-related-materials:

Related materials elements
==========================

TO DO

:ref:`Back to the top <dacs-template>`

.. _dacs-notes:

Notes element
=============

TO DO

:ref:`Back to the top <dacs-template>`

.. _dacs-description-control:

Description control element
===========================

TO DO

:ref:`Back to the top <dacs-template>`
