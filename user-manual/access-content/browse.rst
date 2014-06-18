.. _browse:

======
Browse
======

The Browse menus in AtoM allow users to browse complete lists of
:term:`archival descriptions <archival description>`, as well as digital objects,
:term:`authority records <authority record>` (for people and organizations),
places, subjects and :term:`functions <function>`. In
:term:`multi-repository installations <multi-repository system>`, users can
also browse :term:`archival institutions <archival institution>`.

Most browse functions are available for all users, authenticated (logged-in)
or not. Browsing options available only to authenticated users, including
donors and :term:`accession records <accession record>`, are outlined below.

Browsing for all users
======================

From any page in AtoM in the default theme, the :term:`Dominion theme`, the
following browse options are available from the drop-down :term:`browse menu`
beside the :term:`search box` in the :term:`header bar`.

.. image:: images/search-box.*
   :align: left
   :alt: Search box with browse menu

The browse options listed below are in their default order, however,
adminstrative users can change the order, or remove browse options, through
the Admin-Menus menu (see: :ref:`Manage menus <manage-menus>`).

Browse archival descriptions
----------------------------

Click the Browse menu, then click on Archival descriptions.

.. image:: images/browse-archdesc.*
   :align: center
   :width: 80%
   :alt: View of browsing archival descriptions

This browse screen shows all :term:`archival descriptions <archival
description>` regardless of the :term:`level of description`. The automatic
sort is alphabetic by default for public users, but users can change the sort
to most recently updated, using the :ref:`sort button <recurring-sort-button>`
located at the top-right of the page above the results.

.. TIP::

   :term:`Administrators <administrator>` can change the default sort order
   on search/browse pages for both public and authenticated (i.e. logged in)
   users, in **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.

Users can narrow the results list using the available
:term:`facet filters <facet filter>` on the left-hand side of the screen. For
more information on using the facet filters in AtoM, see:
:ref:`recurring-facet-filters`; especially
:ref:`Using facet filters in AtoM <using-facet-filters>`.


At the top of the :term:`archival description` browse page's list of results,
the number of descriptions with :term:`digital objects <digital object>` is
available and the user can click to see only results with digital objects.

.. image:: images/browse-descriptions-pager.*
   :align: right
   :width: 30%
   :alt: Image of the pager provided on browse pages with more than 10
         results

By default, AtoM will display 10 results per page; if there are more than 10
descriptions, a pager will be provided at the bottom of the results.

.. TIP::

   :term:`Administrators <administrator>` can change the default number of
   results returned per page in **Admin > Settings > Global**. For more
   information, see: :ref:`results-page`.

Browse people, families and organizations
-----------------------------------------

In AtoM, people, families and organizations (also referred to as
:term:`corporate bodies <corporate body>`) are :term:`entities <entity>` which
are controlled by :term:`authority records <authority record>`.

Any of these entities can be browsed in the Browse menu. Click the Browse
menu, then click on People and organizations.

.. image:: images/browse-people-orgs.*
   :align: center
   :width: 80%
   :alt: View of browsing people and organizations

Users can narrow the results list using the available
:term:`facet filters <facet filter>` on the left-hand side of the screen,
which for :term:`authority records <authority record>` includes language and
entity type (Person, Family or Corporate body).

Browse archival institutions
----------------------------

In :term:`multi-repository installations <multi-repository system>` users can
browse a list of archival institutions represented in the database.

Click the Browse menu, then click Archival Institutions.

.. image:: images/browse-institutions.*
   :align: center
   :width: 80%
   :alt: View of browsing archival institutions

If the institution has uploaded a logo as part of their institution record,
the logo will be displayed in the browse display (see:
:ref:`Add/edit a logo to an existing archival institution <add-institution-logo>`.
If not, text will be displayed instead.

The automatic sort is alphabetic which can be changed by the user to Most
recent. Users can narrow the results list using the available
:term:`facet filters <facet filter>` on the left-hand side of the screen.
For more information on using the facet filters in AtoM, see:
:ref:`recurring-facet-filters`; especially
:ref:`Using facet filters in AtoM <using-facet-filters>`.


Browse subjects
---------------

Click the Browse menu, then click Subjects.

.. image:: images/browse-subjects.*
   :align: center
   :width: 80%
   :alt: View of browsing subjects

AtoM will display a list of all subjects used in
:term:`archival descriptions <archival description>` as well as the number
of descriptions the subject term appears in. By clicking on a subject term,
the user can see in a new browse screen the archival descriptions with that
subject term applied.

.. image:: images/browse-subjects-descriptions.*
   :align: center
   :width: 80%
   :alt: View of browsing list of archival descriptions by subject.

.. TIP::

   In this browse screen, AtoM will also display an alphabetical list of
   subjects in the left-hand side of the screen to allow for easy navigation
   between subjects.


Browse places
-------------

Click the Browse menu, then click Places.

.. image:: images/browse-places.*
   :align: center
   :width: 80%
   :alt: View of browsing places

AtoM will display a list of all places used in the place field in
:term:`archival descriptions <archival description>` as well as the number
of descriptions the place term appears in. By clicking on a place term,
the user can see in a new browse screen the archival descriptions with that
place term applied.

.. image:: images/browse-places-descriptions.*
   :align: center
   :width: 80%
   :alt: View of browsing list of archival descriptions by places.

.. TIP::

   In this browse screen, AtoM will also display an alphabetical list of
   places in the left-hand side of the screen to allow for easy navigation
   between places.

Browse digital objects
----------------------

Click the Browse menu, then click Digital Objects.

.. image:: images/browse-digital-objects.*
   :align: center
   :width: 80%
   :alt: View of browsing all digital objects.

AtoM will display all of the digital objects in the database. The layout will
change according to the screen size, as shown in the screenshot of the same
digital object browse as above, but in a smaller screen:

.. image:: images/browse-digital-smaller.*
   :align: center
   :width: 80%
   :alt: View of browsing all digital objects in a smaller screen size.

By default, AtoM will display 30 results per page; if there are more than 30
digital objects, a pager will be provided at the bottom of the results.

.. TIP::

   :term:`Administrators <administrator>` can change the default number of
   results returned per page in **Admin > Settings > Global**. For more
   information, see: :ref:`results-page`.

Users can filter the results by :term:`media type` by clicking the facet filter
buttons at the top of the search results.

.. image:: images/digital-object-browse-button.*
   :align: right
   :alt: Facet filter buttons when viewing digital objects browse results.

Browse functions
----------------

Click the Browse menu, then click Functions.

.. image:: images/browse-functions-all.*
   :align: center
   :width: 80%
   :alt: View of browsing all functions.

AtoM will display a list of the functions used in the database with the
function types.

.. TIP::

   :term:`Administrators <administrator>` can manage and edit the types of
   functions in **Manage > Taxonomies > ISDF Function Types.** See
   :ref:`Functions` and :ref:`Terms` for more information.

When a user clicks on a function, the record for that function will display,
including related functions and related resources.

.. image:: images/view-function.*
   :align: center
   :width: 80%
   :alt: Viewing a function record.

Browsing for authenticated users
================================

Authenticated (logged-in) users have access to browsing lists of donors and
accession records.

Browse accession records
------------------------

Click on Manage, then on Accessions.

.. image:: images/browse-accessions-all.*
   :align: center
   :width: 80%
   :alt: Browsing all accession records.

AtoM will display a list of all accessions by accession number as well as
when the :term:`accession record` was updated.

.. TIP::

   From this screen, users can also search accession records by name in
   the search box at the top of the results list. For more information on
   accession functionality, see :ref:`Accessions <accessions>`.

When an accession record is clicked, the full record is displayed.

Browse donors
-------------

Click on Manage, then on Donors.

.. image:: images/browse-donors-all.*
   :align: center
   :width: 80%
   :alt: Browsing all donor records.

AtoM will display a list of all donors by name as well as
when the donor record was updated.

.. TIP::

   From this screen, users can also search donors by name in
   the search box at the top of the results list. For more information on
   donor record functionality, see :ref:`Donors <donors>`.

When an donor record is clicked, the full record is displayed, including any
related :term:`accessions <accession record>` and resources.

Browse Rights holders
-------------

Click on Manage, then on Rights holders.

.. image:: images/browse-rightsholders-all.*
   :align: center
   :width: 80%
   :alt: Browsing all rights holders records.

AtoM will display a list of all rights holders by name as well as
when the rights holders record was updated.

.. TIP::

   From this screen, users can also search rights holders by name in
   the search box at the top of the results list. For more information on
   rights holders record functionality, see :ref:`Rights <rights>`.

When a rights holders record is clicked, the full record is displayed.

:ref:`Back to top <browse>`
