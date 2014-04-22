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
:ref:` Add/edit a logo to an existing archival institution <add-edit-a-logo-to-an-existing-archival-institution>`.
If not, text will be displayed instead.

The automatic sort is alphabetic which can be changed by the user to Most
recent. Users can narrow the results list using the available :term:`facet
filters <facet filter>` on the left-hand side of the screen. For more
information on using the facet filters in AtoM, see: :ref:`recurring-facet-
filters`; especially :ref:`Using facet filters in AtoM <using-facet-filters>`.


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

Browse digital objects
----------------------

Browse functions
----------------

Browsing for authenticated users
================================

Authenticated (logged-in) users have access to browsing lists of donors and
accession records:

Browse accession records
------------------------

Browse donors
-------------




:ref:`Back to top <browse>`
