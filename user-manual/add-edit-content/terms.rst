.. _terms:

=====
Terms
=====

A term in AtoM is generally understood as a word or phrase making up part of
a :term:`controlled vocabulary`, which are grouped into :term:`taxonomies
<taxonomy>` for use throughout the application, as either :term:`value lists
<value list>`, or :term:`access points <access point>`. Generally, a taxonomy
is a system of classification, often (but not necessarily) organized
hierarchically; in AtoM taxonomies are groupings of controlled vocabulary
:term:`terms <term>`. Throughout AtoM, these controlled vocabularies are used
to generate the values that appear in :term:`drop-down menus <drop-down menu>`.
These drop-down menus provide value lists that restrict data entry in certain
:term:`fields <field>` to certain values (i.e. the controlled values in the
taxonomy). AtoM typically stores these values as term records in the database,
and assigns them to taxonomies - for example,  the "type of entity" field of an
:term:`authority record` can by default accept only one of the three values,
"corporate body," "person," or "family." Each of these values is a term assigned
to the *Actor entity types* taxonomy. All controlled vocabularies are managed
via taxonomies in AtoM, accessible to authorized users via the **Manage >
Taxonomies** menu.

AtoM ships with a fixed number of :term:`taxonomies <taxonomy>` containing
default values (:term:`terms <term>`). Some terms are locked, i.e. cannot be
edited or deleted, because they are used by the application's underlying code.
Most terms, however, can be edited or deleted, and all taxonomies can be
assigned new terms in addition to any locked values.

.. TIP::

   **An example of locked terms: Physical object type taxonomy**

   .. image:: images/object-type-terms.*
      :align: right
      :width: 20%
      :alt: Physical object taxonomy showing hierarchy

   The Physical object type taxonomy contains terms that are used by the
   Physical storage module in AtoM - for more information on working with
   physical storage, see: :ref:`physical-storage`. In the Physical object type
   taxonomy, a set of default terms is included by default at installation.
   While some of these terms can be edited or deleted by users, and new terms
   can be added, key parent terms (Artefact, Container, and Location) are
   locked terms, because they are used by AtoM's underlying code.

   The intended use is for "Containers" to include specific storage containers,
   such as box numbers, cabinet drawers, etc., and for "Locations" to include
   more general storage locations, such as "Cold storage," "Vault," etc.
   Storage types and uses can be customized to meet institutional
   practices, however in order to :ref:`link <link-physical-storage>` a custom
   storage container to a new or existing :term:`archival description` you
   must nest the storage container under "Container." Similarly, new locations
   can be created by users through the physical storage module's
   :term:`user interface`, and they will automatically be added a children of
   the locked term "Location."

   Other default terms (such as Box, Filing cabinet, Folder, etc) can be
   edited or delted by users - these are not locked terms, but are included by
   default for convenience. New terms can be added by users - see
   :ref:`add-term`, below, for more information.

Terms are also used throughout the application as
:term:`access points <access point>`, such as :term:`subject` and :term:`place`
access points added to :term:`archival descriptions <archival description>`.
The place and subject taxonomies are the two :term:`taxonomies <taxonomy>`
that users will likely interact with the most. AtoM's use of a taxonomy to
manage access points allows them to be organized hierarchically, with broader
terms, related terms, and narrower terms. This is of particular use for
:term:`place` access points, as all parent terms will appear on a record as a
:term:`breadcrumb trail` when a term is added as an access point - for
example, if the term "Vancouver" is added as a place access point to an
:term:`archival description`, and in the Places taxonomy "Vancouver" has the
broader (or parent) term of "British columbia", the access point will appear
on the related archival description as "**British columbia >> Vancouver**":

.. image:: images/place-access-points.*
   :align: center
   :width: 80%
   :alt: An example of place access points in AtoM

By allowing authorized :term:`administrators <administrator>` access to all
taxonomies, users have the ability to customize descriptive templates to meet
local or regional descriptive practices, or to remove controlled field terms
that are not in use within the institution. This ability to customize is one
of the strengths of AtoM as a freely available open-source software
application.

.. IMPORTANT::

   Users (even :term:`administrators <administrator>`) cannot add new
   :term:`taxonomies <taxonomy>`; the number and names of taxonomies are fixed
   and can only be altered by :term:`developers <developer>` working directly
   with the code.

**Below are instruction for using the Terms module in AtoM to:**

* :ref:`Add a new term <add-term>`
* :ref:`Manage hierarchical taxonomies <hierarchical-taxonomies>`
* :ref:`Edit an existing term <edit-term>`
* :ref:`Delete a term <delete-term>`

.. SEE ALSO:

   * :ref:`term-name-vs-subject`
   * :ref:`browse-places-subjects`
   * :ref:`The Manage menu <main-menu-manage>`
   * :ref:`term-data-entry`
   * :ref:`archival-descriptions`
   * :ref:`entity-types`
   * :ref:`exit-edit-mode`

.. _add-term:


Add a new term
==============

There are two main ways to add :term:`terms <term>` in AtoM, depending on what
type of term is being added. Adding a term via the Manage taxonomy screen
offers the most options for creating a :term:`controlled vocabulary` term,
as the entire term :term:`edit page` is available to the user for data entry.
However, if the term being created is a :term:`place` or :term:`subject`
:term:`access point`, users with sufficient
:term:`access privileges <access privilege>` can also create new place and
subject terms "on the fly" from the :term:`archival description` edit page
when adding them as access points to an archival description. See below for
assistance with:

* :ref:`Adding a new term from the Manage Taxonomy screen
  <add-term-taxonomy>`

  * :ref:`Term data entry (help with fields) <term-data-entry>`

* :ref:`Adding an access point "on the fly" from an archival description
  <add-term-fly>`

.. _add-term-taxonomy:

Add a new term from the Manage Taxonomy screen
----------------------------------------------

.. |manage| image:: images/edit-sign.png
   :height: 17
   :width: 17

1. In the :term:`main menu` located in the AtoM :term:`header bar`, click the
   |manage| :ref:`"Manage" <main-menu-manage>` menu and select "Taxonomies"
   from the :term:`drop-down menu`. AtoM will redirect you to a list of the
   the :term:`taxonomies <taxonomy>` available in AtoM.

.. image:: images/list-taxonomies.*
   :align: center
   :width: 80%
   :alt: The List taxonomy page in AtoM

2. Click on the :term:`taxonomy` you want to edit to expand it and view the
   :term:`terms <term>` associated with the taxonomy.

.. IMPORTANT::

   In general, if you are adding :term:`access points <access point>` for use
   in :term:`archival descriptions <archival description>`, you will be
   navigating to the **Places** or **Subjects** taxonomies - the other
   :term:`taxonomy` options listed manage the :term:`terms <term>` found in
   controlled fields throughout the templates in AtoM. Unless you are an
   advanced user with administrative permissions in your institution, we
   recommend that you do not add or edit other terms in the Taxonomies.

3. Click the :term:`Add new button` located in the :term:`button block` at the
   bottom of the page to add a new :term:`term` to the :term:`taxonomy`. This
   will open the :term:`edit page` for data entry.

.. image:: images/list-taxonomy-example.*
   :align: center
   :width: 80%
   :alt: An example of a Taxonomy list page - showing the Copyright status
         taxonomy

4. See the :ref:`Term data entry <term-data-entry>` section below for
   guidance in using specific :term:`fields <field>` in the Taxonomy
   :term:`edit page`.
5. You can quit the creation process at any by clicking the "Cancel" button
   in the :term:`button block` at the bottom of the page; no new :term:`term`
   will be created. Note that navigating away from the :term:`edit page`
   **without first saving your work** will also result in no new term being
   created.
6. When you are finished entering data, click the :term:`Create button` to save
   the new record. AtoM will redirect you to the new term's :term:`view page`,
   where you can review your work.

.. _term-data-entry:

Term data entry
^^^^^^^^^^^^^^^

The following gives a brief overview of the fields included in the Term
:term:`edit template <edit page>`, to assist users in adding data:

.. figure:: images/taxonomy-term.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: An example of a term from the Places taxonomy

   An example of a term from the Places taxonomy

* **Taxonomy**: This :term:`field` is completed automatically according to the
  :term:`taxonomy` to which the :term:`term` belongs.
* **Name**: Enter the name of the :term:`term` as you would like to see it
  appear in value lists in :term:`edit pages <edit page>` (e.g. as options in
  a :term:`drop-down menu`)and as labels in the :term:`view pages <view page>`.
* **Use for**: You can create one or more non-preferred :term:`terms <term>`
  using this :term:`field`. When users attempt to add the non-preferred term
  to a record, the preferred term will be added instead. Similarly, if users
  search on the non-preferred term, AtoM will automatically substitute the
  preferred term.
* **Code**: This field is under development. Currently, it allows
  :term:`administrators <administrator>` and :term:`editors <editor>` to add a
  static `Google Map <http://maps.google.com/>`__ to a term description, as a
  basic form of geo-referencing. As such, it is most useful for the Places
  taxonomy.  The field behaves similarly to the search bar on a Google Map,
  and will generate a static map image based on the term entered using
  Google's Static Map API. Terms entered can include addresses,
  latitude/longitude coordinates, and place names (such as cities,
  neighborhoods, etc.). Unlike Google Maps, a pin will not be added to the map
  to mark the selected location, and currently the user cannot specify the
  scale of the map generated or refine the result in any way other than
  re-entering new data into the Code field.
* **Scope note(s)**: Enter descriptive information about the term.
* **Source note(s)**: Enter the source of the term, if applicable. This can be
  textual (if the term comes from an external controlled vocabulary, taxonomy,
  or thesaurus, such as the Library of Congress Subject Headings, the Getty
  Art & Architecture Thesaurus, etc.) and/or it can be a URL.
* **Display note(s)**: Enter an alternate label for the term if applicable.

.. NOTE::

   In the current version of AtoM, the Display note(s) :term:`field` applies
   only to the :term:`events <event>` taxonomy. For example, for the term
   "distribution" the display note is "distributor".

.. TIP::

   For help working with the **Relationships area** in the taxonomy term edit
   page, see the section :ref:`below <hierarchical-taxonomies>` on Managing
   hierarchical taxonomies.

:ref:`Back to top <terms>`

.. _add-term-fly:

Add an access point "on the fly" from an archival description
-------------------------------------------------------------

The ISAD Glossary deines an :term:`access point` as a "name, term, keyword,
phrase or code that may be used to search, identify and locate an archival
description." In AtoM, :term:`name`, :term:`place`, and :term:`subject` access
points are a way of associating specific terms contained or referenced within
an information object (e.g. items within a file; a video; a picture) to its
:term:`archival description`, and creating searchable entry points for users.
They can be conceptualized as similar to "tags" and help contextualize
information objects while returning better search results. In AtoM, subject
and place access points are derived from taxonomies created and customized by
users. Like other taxonomies and AtoM, these can be preloaded by administrators
by importing SKOS XML files with predefined controlled vocabularies and
relationships (see: :ref:`Import/export <import-export>`, but they can also be
created on the fly by users.

Access points can be added by users with edit permissions on the fly (without
leaving an :term:`archival description`) from an archival description
:term:`edit page` by simply adding a new subject or place to the corresponding
field in the Access points area.

Any terms previously created and any access point taxonomies already imported
into AtoM will populate a the :term:`drop-down menu` when a user places the
cursor in the related access point :term:`field`, to ensure that
:term:`controlled vocabulary` terms are maintained, but multiple new terms can
also be added. However, if a hierarchical relationship is to be established
between terms (for example, nesting "Mount Pleasant" as a narrower term of
"Vancouver"), an :term:`administrator` or :term:`editor` will have to edit the
term through the taxonomies list (see below, :ref:`hierarchical-taxonomies`).

**To add an access point on the fly from an archival description:**

1. Navigate to the :term:`archival description` to which you would like to add
   a new :term:`place` or :term:`subject` access point. You can do this
   either by :ref:`searching <search-atom>` or :ref:`browsing <browse>` - for
   more information on navigation in AtoM, see :ref:`access-content`.
2. At the bottom of the archival description's :term:`view page`, you will see
   the :term:`button block` with several options (Edit, Delete, and Add new).
   Click the "Edit" button, or click on any of the information area
   :term:`headers <area header>`, to enter :term:`edit mode`.

.. figure:: images/button-block-description.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the button block on an archival description

   The button block available on an archival description

3. Navigate to the Access points :term:`information area` and beginning typing
   your :term:`place` or :term:`subject` access point into the relevant
   :term:`field`. Wait a moment and do not press enter immediately - the access
   point fields will auto-complete any matching terms in a :term:`drop-down
   menu`, allowing you to see if your access point already exists.

.. figure:: images/access-points-places.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of adding a place access point to an archival description

   When you begin typing in an access point field, the drop-down will provide
   matching suggestions - select from the list to use an existing term, or
   enter a new term. Be careful: if you type the full name of an existing
   term and press enter (instead of selecting from the list), you could
   accidentally create a duplicate term!

4. If a matching term *DOES* exist, select from the drop-down list and save
   the :term:`archival description` by using the "save" button in the
   :term:`button block` at the bottom of the :term:`edit page`.

.. IMPORTANT::

   If you are not careful, it is easy to accidentally create duplicate terms!
   To avoid duplication, matching terms **must** be selected from the
   auto-complete :term:`drop-down <drop-down menu>` - otherwise, even exact
   matches will create duplicates when the user presses enter.

5. If a matching term does *not* exist, press the Tab key to exit the field,
   or use your cursor. A new term will be created in the related
   :term:`taxonomy` (e.g. places or subjects) when the description is saved.
6. You can add multiple terms at a time - when you exit the :term:`field` with
   your cursor, AtoM will provide a new blank field. Repeat steps 4-5 as
   necessary. If you need to **edit** or **remove** a term you have just
   added, place your cursor to the left of the term - an **X** icon will
   appear in place of the bullet next to the term. You can click the **X** to
   remove the term.

.. figure:: images/remove-access-point.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of removing a subject access point

   Place your cursor to the left of a term to see the option to remove it -
   the bullet icon will change to an **X** icon. Click to remove the term.

7. At the bottom of the description's :term:`edit page`, click the "Save"
   button in the :term:`button block` when you are done editing. AtoM will
   reload the :term:`archival description` in :term:`view mode`, and your new
   access point(s) will appear in the Access points :term:`information area`
   as a blue hyperlink. You can now edit the term to add supplementary
   information if needed - instructions are provided :ref:`below
   <edit-term>`.

.. NOTE::

   If you wish to manage your new term by adding further data or organizing it
   hierarchically, you will need to access it in its relevant taxonomy by
   navigating to **Manage > Taxonomies** and locating the term in the
   relevant taxonomy - see: :ref:`edit-term` or :ref:`hierarchical-taxonomies`
   for more information.

:ref:`Back to top <terms>`

.. _term-name-vs-subject:

On Name vs. Subject Access Points
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Name :term:`access points <access point>` provide linked access to information
about actors (e.g. persons, families, or corporate bodies) associated with an
:term:`archival description` – either as :term:`creators <creator>`, or as
subjects, or via other types of relation (including contributor, publisher,
collector, distributor, etc.). The type of relationship of a name
:term:`access point` to an archival description can be managed via the ISAAR-CPF
:term:`authority record` template for that name (which the user is directed to
when clicking on the name access point in an archival description).

Unlike :term:`subject` or :term:`place` access points, which are managed via a
terms :term:`taxonomy`, Name access points are managed as authority records
in AtoM in two ways:

First, name (creator) access points are automatically derived from ISAAR
:term:`authority records <authority record>` in AtoM. Whenever a :term:`creator`
is added to an :term:`archival description`, the creator name is **also** added
as a name :term:`access point` in the Access points :term:`information area` of
the :term:`archival description`. Doing so conforms to the recommendations
found in :ref:`ISAAR-CPF <isaar-template>` 1.5 and 1.6, and 1.8:

    **1.5** *There are many reasons why separate capture and maintenance of
    this type of contextual information is a vital component of archival
    description. The practice enables the linking of descriptions of records
    creators and contextual information to descriptions of records from the
    same creator(s) that may be held by more than one repository and to
    descriptions of other resources such as library and museum materials
    that relate to the entity in question. Such links improve records
    management practices and facilitate research.*

    **1.6** *Where a number of repositories hold records from a given source
    they can more easily share or link contextual information about this
    source if it has been maintained in a standardized manner. Such
    standardization is of particular international benefit when the sharing
    or linking of contextual information is likely to cross national
    boundaries. The multinational character of past and present record
    keeping creates the incentive for international standardization which
    will support the exchange of contextual information. For example,
    processes such as colonialization, immigration and trade have
    contributed to the multinational character of recordkeeping.*

    **1.8** *Archival authority records are similar to library authority
    records in as much as both forms of authority record need to support the
    creation of standardized access points in descriptions. The name of the
    creator of the unit of description is one of the most important of such
    access points. Access points may rely on the use of qualifiers that are
    deemed essential to clarify the identity of the entity thus named, so
    that accurate distinctions may be made between different entities that
    have the same or very similar names.*

By generating a :term:`creator` name :term:`access point` from an
:term:`authority record`, AtoM thereby supports the linking of :term:`archival
descriptions <archival description>` related by creator by using a
standardized name (as access point) drawn from the authority record. Clicking
on a name access point in an archival description will bring a user to the
AtoM ISAAR-CPF Authority Record for the name. Name entity types can be defined
in the authority record as either a person, a family, or corporate body.

AtoM also allows users to add new :term:`name` access points on the fly, so
other important names can be associated with an :term:`archival description`.
When a user adds a name access point, a new :term:`authority record` for the
added entry is generated, and the :term:`access point` is automatically listed
with the qualification of "(subject)" next to the link, for added clarity
about the role of the named entity. Authorized users (e.g., authenticated
:term:`editors <editor>` or :term:`administrators <administrator>`, etc.) can
then add descriptive contextual information to the :term:`authority record`.
If an added name is the :term:`creator` of another :term:`fonds` or
:term:`collection` in AtoM, this relationship can be defined through the
authority record, just as relationships between other entities can be defined
as either hierarchical, temporal, associative, or family. Similarly, the
relationship to the linked archival description can be managed by defining the
Nature of relationship in the Relationships Area of the Authority record.

In contrast, :term:`subject` access points are managed via the
:term:`taxonomies <taxonomy>`, and are intended to add topical information
about events, objects, etc. covered in the materials of a fonds/collection,
allowing users to gain a sense of the topics covered therein, obtain better
search results, and easily view other
:term:`archival descriptions <archival description>` that contain materials on
the same subject. Clicking on a subject :term:`access point` will bring the
user to a search results page, displaying summary descriptive information about
descriptions that also contain the same subject access point. Authorized users
(ex: :term:`editors <editor>`, :term:`administrators <administrator>`) can add
subject access points on the fly straight from the archival description
:term:`edit page` (instructions :ref:`above <add-term-fly>`, and they can
provide descriptive summaries and manage hierarchical relationships of the
access point by navigating to **Manage > Taxonomies > Subjects**.

In summary, :term:`Name` access points support :ref:`ISAAR-CPF <isaar-template>`’s
requirements, and can be thought of as similar to the 245$c, 700, 710, 600,
and 610 fields in a library MARC record (depending on the type of relationship,
as defined in the :term:`authority record`). In contrast, :term:`Subject`
access points relate to topical information and general subject terms,
similar to the 650 field in a library MARC record.

**For information on working with authority records in AtoM, see:**

* :ref:`authority-records`

:ref:`Back to top <terms>`


.. _hierarchical-taxonomies:

Manage hierarchical taxonomies
==============================

.. figure:: images/terms-relationships-area.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: The edit fields available in the terms edit page Relationships area

   The edit fields available in the terms edit page Relationships area

In AtoM, the :term:`term` :term:`edit page` includes a special section (the
"Relationships" area) that allows users to create hierarchical thesauri in
accordance with ISO 2788. This section will outline how to use the
:term:`fields <field>` in this area to manage broader, related, and narrower
terms. All of the following instructions involve first navigating to the term
you would like to alter, and entering :term:`edit mode`:

1. In the :term:`main menu` located in the AtoM :term:`header bar`, click the
   |manage| :ref:`"Manage" <main-menu-manage>` menu and select "Taxonomies"
   from the :term:`drop-down menu`. AtoM will redirect you to a list of the
   the :term:`taxonomies <taxonomy>` available in AtoM.

.. image:: images/list-taxonomies.*
   :width: 80%
   :align: center
   :alt: An image of the list taxonomies page

2. Click on the :term:`taxonomy` you want to edit to expand it and view the
   :term:`terms <term>` associated with the taxonomy. You can use the
   dedicated search bar on the terms page to search for your term by name,
   or you can browse the terms listed in the taxonomy. When you have found
   the term you would like to edit, click on it to navigate to the term's
   :term:`view page`.

.. figure:: images/repository-types-taxonomy.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example taxonomy page - the Repository types taxonomy

   An example taxonomy page - the Repository types taxonomy

3. Click on the "Edit" button located in the :term:`button block` at the
   bottom of the term page to enter :term:`edit mode`. AtoM will redirect you
   to the term's :term:`edit page`.

**You are now ready work with term relationships in AtoM. You can:**

* :ref:`Add/edit a broader term <add-broader-term>`
* :ref:`Add/edit a narrower term <add-narrower-term>`
* :ref:`Add/edit a related term <add-related-term>`
* :ref:`Add/edit a converse term <add-converse-term>`

.. _add-broader-term:

Add/edit a broader term
-----------------------

To create a hierarchical parent/child relationship between terms, AtoM allows
you to add an existing record as a broader term, via an auto-complete
:term:`drop-down menu`.

.. IMPORTANT::

   You cannot create a new term by adding it to the Broader term field - to
   add a broader term, the term must already have been created in AtoM. To
   create new terms in AtoM, see :ref:`above <add-term>`. A term can **only
   have one broader term** - you cannot add multiple broader terms.

**To add or edit a broader term in AtoM**

.. figure:: images/terms-add-broad.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: An example of selecting a broad term within the Description Statuses
         taxonomy

   An example of selecting a broad term from the existing terms available
   within the Description Statuses taxonomy

1. In the Relationships area of the term's edit page, begin typing the name
   of the broader term into the "Broader term" :term:`field`.
2. As you type, atom will search available term records (those that are part
   of the same :term:`taxonomy`) and populate the field's :term:`drop-down menu`
   with matching terms.
3. When you see the term you would like to add as a broader (i.e. parent)
   term, click on it - it will be added to the field.
4. If you wish to **edit** or **remove** an existing broader term, place your
   cursor in the field and delete the existing term. The :term:`drop-down
   menu` will show the available terms that you can add - follow steps 1-3 to
   add the desired term. Leave the field blank if you do not wish to link the
   term to a broader term.
5. When you are finished, click the "Save" button in the :term:`button block`
   at the bottom of the term's :term:`edit page`. AtoM will redirect you to
   the term's :term:`view page`, where you can review your changes. You can
   click the "Edit" button in the button block to make further changes if
   needed.

.. _add-narrower-term:

Add/edit a narrower term
------------------------

.. figure:: images/terms-add-narrower.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: An example of adding new narrower terms to a place term

   An example of adding new narrower terms to a a place term. In this
   example, cities are being added as narrower terms to "Alberta" (A Canadian
   province) in the Places taxonomy

AtoM will allow you to add multiple *new* narrower terms (i.e. child terms) to a
term. This is intended to simplify the workflow for users who are building
complex hierarchical taxonomies on the fly - by beginning with the top-level
terms, users can generate new narrower terms from the edit screen of an
existing term, and then supplement the narrower term records later as
necessary.

.. IMPORTANT::

   You cannot add existing terms as narrower terms using this method -
   instead, navigate to the narrower term record and add the corresponding
   broader term to it, following the instructions listed :ref:`above
   <add-broader-term>`.

**To add new narrower terms on the fly from an existing term:**

1. In the Relationships area of the term's edit page, enter the name
   of the new narrower term into the "Add new narrower term" :term:`field`.
2. When you have entered the new term's name, press enter, or click your
   cursor out of the input field - AtoM will provide a new input field below
   so you can add further new narrower terms (i.e. child terms).
3. Continue adding narrower terms as desired. When you are finished, click the
   "Save" button in the :term:`button block` at the bottom of the term's
   :term:`edit page`.
4. AtoM will redirect you to the term's :term:`view page` so you can review
   your work. The new narrower terms will appear as hyperlinks - clicking on
   one will take you to the related narrower term's view page where, if you
   want, you can edit the narrower term to supplement it further (instructions
   :ref:`below <edit-term>`).

.. NOTE::

   You cannot remove a narrower term by entering :term:`edit mode` on the
   related broader term's record. To remove a hierarchical relationship
   between two records, navigate to the child term (e.g. the narrower term),
   enter :term:`edit mode`, and delete the value from the "Broader term"
   :term:`field` in the Relationships area. When you save the record, the two
   terms will no longer be hierarchically related.

.. _add-related-term:

Add/edit a related term
-----------------------

In AtoM, you can also create associative relationships between related terms.
A term can have multiple relationships. This can be a useful way of managing
complex hierarchies, and drawing users to other terms they may be interested
in viewing.

.. NOTE::

   You cannot create new terms on the fly by adding a new value to the
   related terms field - the related term must already exist. See :ref:`above
   <add-term>` for instructions on how to create a new term in AtoM.

**To add a related term to an existing term in AtoM:**

1. In the Relationships area of the term's edit page, begin typing the name
   of the related term into the "Related term" :term:`field`.
2. As you type, atom will search available term records (those that are part
   of the same :term:`taxonomy`) and populate the field's :term:`drop-down menu`
   with matching terms.

.. figure:: images/terms-add-related.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example of adding a related term to a place term

   An example of adding a related term to an existing term in the subjects
   taxonomy - "Buildings and structures" is being related to "Architecture"

3. When you see the term you would like to add as a related term, click on it
   - it will be added to the field. Remeber, you cannot create new terms from
   this field - they must already exist in AtoM to be added as related terms.
   For instructions on creating a new term, see :ref:`above <add-term>`.
4. Once you have selected the related :term:`term` from the
   :term:`drop-down menu`,  AtoM will provide a new input field below so you can
   add further related terms. Continue inputting related terms as needed.
5. If you need to **edit** or **remove** a related term you have just  added,
   place your cursor to the left of the term - an **X** icon will  appear in
   place of the bullet next to the term. You can click the **X** to
   remove the term.

.. figure:: images/remove-related-term.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of removing a related term

   Place your cursor to the left of a term to see the option to remove it -
   the bullet icon will change to an **X** icon. Click to remove the term.

6. When you are finished, click the "Save" button in the :term:`button block`
   at the bottom of the term's :term:`edit page`. AtoM will redirect you to
   the term's :term:`view page`, where you can review your changes. You can
   click the "Edit" button in the button block to make further changes if
   needed.

:ref:`Back to top <terms>`

.. _add-converse-term:

Add/edit a converse term
------------------------

In AtoM, terms with matching or related opposite terms (such as "parent of" and its
converse, "child of") used to describe relationships are known as **converse
terms**. If a term has no opposite but itself (for example, "sibling of"), it
can be marked as "self-reciprocal", meaning its converse term is itself. AtoM
includes a number of default relationship terms for use in the
:term:`authority record` Relationship dialogue (more information
:ref:`here <link-two-authority-records>`). These default terms have been given
converse or self-reciprocal relationships to support their use in the
:ref:`ISAAR <isaar-template>`-based authority record template, but the default
terms, and their relationships, can be edited users with the appropriate edit
permissions.

.. figure:: images/doe-smith.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: Example of converse terms

   An example of converse terms on two related authority records

.. IMPORTANT::

   Though the field is available in all term :term:`edit pages <edit page>`,
   the "Converse term" :term:`field` is currently only used in AtoM in the
   Actor Relation Type taxonomy. This taxonomy is used to supply terms to the
   Relationships dialogue, when two authority records are linked. For more
   information on creating relationships between authority records in AtoM,
   see: :ref:`link-two-authority-records`.

These default terms and their relationships to each other can be edited and
managed in the Actor Relation Type :term:`taxonomy`, and new terms can be added
as well. Below is an overview of the default terms included and their
relationships, and instructions on how to add new converse relationships.

Default Actor relation type terms in AtoM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

AtoM comes with several pre-loaded default terms in the Actor relation type
:term:`taxonomy`. The parent terms (*associative*, *hierarchical*, *family*, and
*temporal*) are all taken directly from the International Council on Archives'
:ref:`ISAAR-CPF standard <isaar-template>` - the international standard for
the creation of :term:`authority records <authority record>` upon which the
AtoM authority record edit template is based.

The child terms, nested under the 4 parent terms mentioned above, are taken
from some of the examples used in the ISAAR-CPF standard when describing
relationships. Here is a list of the default terms included in AtoM in this
taxonomy:

.. figure:: images/actor-relation-default-terms.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: default terms in the Actor relation type taxonomy

   The default terms included in the Actor relation type taxonomy

Some of these terms have a **converse** (e.g. opposite and reciprocal)
relationhip to other sibling terms. Others are **self-reciprocal** (e.g. they
act as their own converse term as well). For example:

* Under the *family* term:

  * *is the parent of* and *is the child of* are converse terms
  * *is the sibling of* is a self-reciprocal term

Below is an image outlining all the default relationships between terms in the
Actor relation type taxonomy:

.. figure:: images/actor-relation-default-term-relationships.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: default terms in Actor relation type and their relationship

   The default terms included in the Actor relation type taxonomy, and their
   relationships (as either converse to another sibling term, or self-reciprocal)

Add a new converse relationship
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**To create a new converse relationship between terms in AtoM:**

1. In the Relationships area of the term's edit page, begin typing the name
   of the related term into the "Converse term" :term:`field`.
2. As you type, atom will search available term records (those that are part
   of the same :term:`taxonomy`) and populate the field's :term:`drop-down menu`
   with matching terms.
3. When you see the term you would like to add as a related term, click on it
   - it will be added to the field.
4. You can also create a new converse term directly from the converse term
   :term:`field`. If the term you have entered in the converse term field does
   not yet exist, AtoM will create it when saving your edits.

.. image:: images/actor-relation-converse.*
   :align: center
   :width: 80%
   :alt: An image of a new converse term being created

5. If the term is **self-reciprocal**, simply check the checkbox next to the
   converse term field. AtoM will grey-out the field:

.. image:: images/actor-relation-self-reciprocal.*
   :align: center
   :width: 80%
   :alt: An image of the self-reciprocal checkbox in a Terms edit page

6. If you need to **edit** or **remove** a related term you have just  added,
   place your cursor back in the field, and make your changes directly.
7. When you are finished, click the "Save" button in the :term:`button block`
   at the bottom of the term's :term:`edit page`. AtoM will redirect you to
   the term's :term:`view page`, where you can review your changes. You can
   click the "Edit" button in the button block to make further changes if
   needed.

.. figure:: images/actor-relation-converse-view.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example of a converse term's view page

   An example of a converse term's view page

.. figure:: images/actor-relation-self-reciprocal-view.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example of a self-reciprocal term's view page

   An example of a self-reciprocal term's view page

:ref:`Back to top <terms>`

.. _edit-term:

Edit an existing term
=====================

In AtoM, an :term:`administrator` can edit terms in AtoM's taxonomies at any
time. This can be useful for customizing the values of a
:term:`controlled vocabulary` to match local descriptive standards, adding
supplemental information, managing relationships between terms, and more.

.. NOTE::

   AtoM ships with a fixed number of :term:`taxonomies <taxonomy>` containing
   default values (:term:`terms <term>`). Some terms are locked, i.e. cannot
   be edited or deleted, because they are used by the application's underlying
   code. Most terms, however, can be edited or deleted, and all taxonomies can
   be assigned new terms in addition to any locked values.

.. WARNING::

   AtoM's file and item list reports are hard-coded to use the "File" and "Item"
   level of description :term:`terms <term>` in the "Levels of description"
   :term:`taxonomy`. If you edit or remove these terms from the taxonomy, you may
   break the reports feature. For more information on file and item-level reports
   in AtoM, see: :ref:`reports-printing`.

**To edit an existing term in AtoM:**

1. In the :term:`main menu` located in the AtoM :term:`header bar`, click the
   |manage| :ref:`"Manage" <main-menu-manage>` menu and select "Taxonomies"
   from the :term:`drop-down menu`. AtoM will redirect you to a list of the
   the :term:`taxonomies <taxonomy>` available in AtoM.

.. image:: images/list-taxonomies.*
   :width: 80%
   :align: center
   :alt: An image of the list taxonomies page

2. Click on the :term:`taxonomy` you want to edit to expand it and view the
   :term:`terms <term>` associated with the taxonomy. You can use the
   dedicated search bar on the terms page to search for your term by name,
   or you can browse the terms listed in the taxonomy. When you have found
   the term you would like to edit, click on it to navigate to the term's
   :term:`view page`.

.. figure:: images/repository-types-taxonomy.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example taxonomy page - the Repository types taxonomy

   An example taxonomy page - the Repository types taxonomy

3. Click on the "Edit" button located in the :term:`button block` at the
   bottom of the term page to enter :term:`edit mode`. AtoM will redirect you
   to the term's :term:`edit page`.
4. See the :ref:`term-data-entry` section for guidance on working with
   particular fields in the :term:`term` edit template.
5. See the sections above for instructions on working with the fields in the
   Relationships area, for :ref:`broader terms <add-broader-term>`,
   :ref:`related terms <add-related-term>`, and
   :ref:`narrower terms <add-narrower-term>`.
6. Make changes to your record as needed. You can cancel the editing process at
   any time by clicking the "Cancel" button in the :term:`button block` at
   the bottom of the term :term:`edit page`; no changes will be saved, and
   you will be redirected to the term's :term:`view page`. Note that
   navigating away from the edit page **without first clicking Save** will
   also result in no changes to the term record being saved.
7. When you are finished with your edits, click the "Save" button in the
   :term:`button block` at the bottom of the page. AtoM will save your
   changes and redirect you to the term's :term:`view page` where you can
   review your work. You can repeat the process as needed by clicking "Edit"
   again.

.. _edit-subject-place-terms:

Subject and Place terms - an alternate workflow
-----------------------------------------------

The :term:`Subject` and :term:`Place` terms are often those most frequently
accessed by AtoM users, as they can be linked to archival descriptions as as
:term:`access points <access point>`, and are therefore visible to public
users. To simplify the workflow for authenticated users, the :term:`button block`
will be visible to logged-in users directly on the subject and place browse pages.
The following example demonstrates this for the subjects browse - however the
workflow will be the same for the places browse page.

1. Using the :term:`browse menu` located in the AtoM :term:`header bar`,
   navigate to **Browse > Subjects**. AtoM will redirect you to the Subjects
   browse page. For more information on the Browse menu, see: :ref:`browse-menu`.
   For general information on browsing in AtoM, see :ref:`browse`
2. The AtoM browse page includes a list of :term:`subjects <subject>` linked
   to :term:`archival descriptions <archival description>`. For more information
   on browsing subjects and places, see: :ref:`browse`. When logged in, users
   will see a :term:`button block` with an Add button directly on the subjects
   (or places) browse page.

.. figure:: images/browse-subjects-authenticated.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the button block in the Subjects browse page

3. You can also select a :term:`term` from the browse page. AtoM will redirect
   you to a page listing descriptions in which the chosen term has been added
   as an :term:`access point`. On the term page, the :term:`button block` will
   also be visible so users can directly edit or delete the term (or add new
   terms) without having to navigate to the Taxonomy via **Manage > Taxonomies**.

.. figure:: images/browse-subject-authenticated.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of the button block on a Subject term browse page

4. From here, you can follow steps 2-7 :ref:`above <edit-term>` as needed to
   edit your terms.

:ref:`Back to top <terms>`

.. _delete-term:

Delete a term
=============

In general, users can delete :term:`terms <term>` from
:term:`taxonomies <taxonomy>` via the user interface. Note that some terms are
locked, meaning that they cannot be deleted, because they are used by the
application's underlying code. For an example, please see the tip section at the
:ref:`top <terms>` of this page. Most terms, however, can be edited or deleted,
and all taxonomies can be assigned new terms in addition to any locked values.
To delete a term, a user must also have a user account with sufficient
:term:`access privileges <access privilege>` to access the relevant
:term:`taxonomy`. For more information on access privileges, see
:ref:`user-roles` and :ref:`edit-user-permissions`.

**To delete a term in AtoM:**

1. In the :term:`main menu` located in the AtoM :term:`header bar`, click the
   |manage| :ref:`"Manage" <main-menu-manage>` menu and select "Taxonomies"
   from the :term:`drop-down menu`. AtoM will redirect you to a list of the
   the :term:`taxonomies <taxonomy>` available in AtoM.

.. image:: images/list-taxonomies.*
   :width: 80%
   :align: center
   :alt: An image of the list taxonomies page

2. Click on the :term:`taxonomy` you want to edit to expand it and view the
   :term:`terms <term>` associated with the taxonomy. You can use the
   dedicated search bar on the terms page to search for your term by name,
   or you can browse the terms listed in the taxonomy. When you have found
   the term you would like to edit, click on it to navigate to the term's
   :term:`view page`.

.. figure:: images/repository-types-taxonomy.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example taxonomy page - the Repository types taxonomy

   An example taxonomy page - the Repository types taxonomy

3. At the bottom of the term :term:`view page`, click on the "Delete" button
   in the :term:`button block`. Remember, locked terms cannot be deleted.
4. You will be redirected to a page where AtoM asks you to confirm your
   delete request. If the term is used in any way in one or more archival
   descriptions, a count of related descriptions from which the term will be
   removed is supplied. Additionally, if the term has narrower (e.g. child)
   terms, these will also be deleted - AtoM will list all narrower terms that
   will also be deleted in the confirmation page, so you can review the
   consequences of your actions before proceeding.

.. figure:: images/delete-term-warning.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An example of the delete term confirmation page

   An example of the deletion confirmation page for a place term with many
   descendants (narrower terms) - in this case, the term "Canada" has 2753
   narrower terms that will also be deleted, and "Canada" is used as a place
   access point in 1 archival description.

5. You can cancel the delete request by clicking the "Cancel" button in the
   :term:`button block` at the bottom of the confirmation page. Note that
   navigating away to any other page without clicking the "Delete" button will
   also result in no terms being deleted.
6. If you are certain you would like to delete the :term:`term`, click the
   "Delete" button at the bottom of the confirmation page. AtoM will delete
   the term and return you to the related :term:`taxonomy` view page.

.. IMPORTANT::

   **Consequences of deleting a term:**

   * The term is removed from all related
     :term:`archival descriptions <archival description>`,
     :term:`authority records <authority record>`,
     :term:`archival institutions <archival institution>`, etc.
   * The related records are **not** deleted - e.g. if you delete a
     :term:`place` term used as an :term:`access point` on an
     :term:`archival description`, the place term will be removed from the
     related description, but th archival description itself will not be
     deleted
   * Any narrower terms (e.g. descendants, or child terms) that are nested
     under the term will also be deleted.


:ref:`Back to top <terms>`
