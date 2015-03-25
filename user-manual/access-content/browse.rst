.. _browse:

======
Browse
======

.. |edit| image:: images/edit-sign.png
   :height: 18
   :width: 18

.. |desc| image:: images/descriptions-icon.png
   :height: 24
   :width: 24

.. |authicon| image:: images/authority-icon.png
   :height: 24
   :width: 24

.. |repoicon| image:: images/repo-icon.png
   :height: 24

.. |placeicon| image:: images/places-icon.png
   :height: 24
   :width: 24

.. |subjecticon| image:: images/subjects-icon.png
   :height: 24
   :width: 24

.. |functicon| image:: images/functions-icon.png
   :height: 24
   :width: 24

.. |digicon| image:: images/digi-object-icon.png
   :height: 24
   :width: 24

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

|desc| Browse archival descriptions
-----------------------------------

Click the Browse menu, then click on Archival descriptions.

.. image:: images/browse-archdesc.*
   :align: center
   :width: 80%
   :alt: View of browsing archival descriptions

This browse screen shows all :term:`archival descriptions <archival
description>` regardless of the :term:`level of description`. The automatic
sort is alphabetic by default for public users, but users can change the sort
to most recently updated, or by reference code, using the
:ref:`sort button <recurring-sort-button>` located at the top-right of the
page above the results.

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

|authicon| Browse people, families and organizations
----------------------------------------------------

In AtoM, people, families and organizations (also referred to as
:term:`corporate bodies <corporate body>`) are :term:`entities <entity>` which
are controlled by :term:`authority records <authority record>`.

Any of these entities can be browsed in the Browse menu. Click the Browse
menu, then click on People and organizations.

.. image:: images/browse-people-orgs.*
   :align: center
   :width: 80%
   :alt: View of browsing people and organizations

The automatic sort is alphabetic for unauthenticated (e.g. not logged in)
users, which can be changed by the user to Most recent or identifier via the
:ref:`recurring-sort-button` at the top right of the page.

.. TIP::

   :term:`Administrators <administrator>` can change the default sort order
   on search/browse pages for both public and authenticated (i.e. logged in)
   users, in **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.

Users can narrow the results list using the available
:term:`facet filters <facet filter>` on the left-hand side of the screen,
which for :term:`authority records <authority record>` includes language and
entity type (Person, Family or Corporate body).

The authority record browse page also includes a dedicated search box - for
more information on searching for authority records in AtoM, see:
:ref:`Authority record search <dedicated-search-authority>`. For general
information on working with authority records, see: :ref:`authority-records`.

|repoicon| Browse archival institutions
---------------------------------------

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

The automatic sort is alphabetic for unauthenticated (e.g. not logged in)
users, which can be changed by the user to Most recent or identifier via the
:ref:`recurring-sort-button` at the top right of the page.

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

The archival institution browse page also includes a
:term:`dedicated search box`. For more information on searching for archival
institutions in AtoM, see: :ref:`Archival institution search
<dedicated-search-institutions>`. For general information on working with
:term:`archival institution` records, see: :ref:`archival-institutions`.

.. _browse-subjects-places:

|subjecticon| Browse subjects and places |placeicon|
----------------------------------------------------

Subjects and Places are two different kinds of :term:`terms <term>`, which are
managed via :term:`taxonomies <taxonomy>`. Subjects and Places, however, can also
be used as :term:`access points <access point>` associated with
:term:`archival descriptions <archival description>`, and public users can
browse terms and view :term:`published <published record>` descriptions
associated with those terms as access points.

To do so, click the :term:`Browse menu`, then click either Subjects or Places.
The following images and instructions will use examples from the Place browse
page - however, the page types are exactly the same for the Subjects browse.
Once clicked, a user will be redirected to a browse page.

.. image:: images/browse-places-2.*
   :align: center
   :width: 80%
   :alt: View of browsing places (annotated)

The above image, from the Places browse page, has been annotated with with an
orange and white number corresponding to each of the major features of the Places
browse page. Each is described below.

1. A dedicated search box for :term:`terms <term>` has been included on the
   browse page. The :term:`drop-down menu` on the left side of the dedicated
   search box can be used to limit the search to the authorized form of name, the
   'use for' label(s) (e.g. the alternate, non-preferred forms of name), or both.
   For more information, see: :ref:`dedicated-search-terms`.
2. The :term:`sort button` will allow users to sort the place or subject terms
   either alphabetically by title, or by most recently updated (e.g. added or
   edited). For more information, see: :ref:`recurring-sort-button`. An
   :term:`administrator` can also configure application-wide defaults for public
   and authenticated users via **Admin > Settings** - for more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.
3. The number of descriptions associated with a particular term as an
   :term:`access point` is listed in the "Results" column.
4. If alternate, non-preferred names have been added to the term's "Use for"
   :term:`field`, they will be displayed under the authorized form of name.
5. If a term listed in the browse page has :term:`children <child record>` (e.g.
   terms nested beneath it, to which it is the parent), a count of the direct
   children will be included in parentheses after the authorized form of name.
6. A :term:`treeview` is provided for browsing terms in the context of their
   hierarchical relationships. When first arriving on the browse page, top-level
   terms are displayed in the treeview. If a term has
   :term:`children <child record>`, a caret (triangle icon) will appear next to
   the term - click the caret to view lower-level child terms. For more
   information on using the treeview in AtoM, see: :ref:`context-menu-treeview`
   and :ref:`context-menu-terms-treeview`.

A count of total terms is provided at the top of the browse page. Terms appearing
in the first column of the browse page's table are hyperlinks - click on a term
to see further information about the term and related descriptions. AtoM will
redirect you to a new browse page, described below.

.. image:: images/browse-place-term2.*
   :align: center
   :width: 80%
   :alt: View of browsing a place term (annotated)

1. A :term:`breadcrumb trail` is included to indicate the hierarchical
   relationships associated with a term - e.g. if it is the
   :term:`child <child record>` of any other broader terms. Each breadcrumb is a
   hyperlink - a user can click one to navigate to the broader term's browse page.
   For more information on breadcrumbs in AtoM, see:
   :ref:`recurring-breadcrumb-trail`.
2. If the term description has been translated into other languages, a language
   :term:`drop-down <drop-down menu>` will appear at the top of the term
   description. Opening the drop-down and selecting another language will flip
   the AtoM :term:`user interface` to the selected culture and display any
   translated fields. For more information on multilingual use and design in
   AtoM, see: :ref:`translate`.
3. Additional contextual information is included in the :term:`context menu`.
   For more detailed information on the elements of the context menu in this page,
   see the :ref:`context-menu-terms` entry on the Context menu page.
4. A :term:`treeview` for navigating hierarchically organized terms is included in
   the left-hand context menu. Details on its features and uses are described
   here: :ref:`Terms treeview <context-menu-terms-treeview>`.
5. Information about the current term is displayed in the top portion of the
   page's main column. This information is stored with the term in its taxonomy,
   and can be edited by authenticated (i.e. logged in) users with edit rights. For
   more information on the fields available and their uses, see:
   :ref:`term-data-entry`.
6. Below the :term:`treeview`, addtional :term:`facet filters <facet filter>` that
   can be applied to the browse results are listed. For more information on using
   facet filters in AtoM, see: :ref:`recurring-facet-filters`.
7. If a user is authenticated (i.e. logged in) and has edit permissions, a
   :term:`button block` will be visible on the page, allowing the user to edit,
   delete, or add new terms. For more general information on working with terms
   in AtoM, see: :ref:`terms`, and especially :ref:`term-data-entry`. Public
   users who are not logged in will not see the button block.
8. Below the term information, :term:`archival descriptions
   <archival description>` that are linked to the current term as
   :term:`access points <access point>` are displayed as results. Clicking on a
   description result will redirect the user to the :term:`view page` for that
   result.

.. _browse-subjects-places-results:

Hierarchical terms and browse results
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When terms are organized hierarchically in a taxonomy (e.g. nested within broader
terms, with a :term:`parent <parent record>` to :term:`child <child record>`
relationship), and a child term is added as an :term:`access point` to an
archival description, AtoM includes the parent terms as well for context. This is
expressed as a :term:`breadcrumb trail` on archival descriptions in the Access
points :term:`information area`, as shown in the Places example below:

.. image:: images/access-point-place.*
   :align: center
   :width: 70%
   :alt: Example of hierarchical place access point

In the above example, the user has added the term "Waterloo" to the description -
but the term is organized hierarchically in the Places :term:`taxonomy`, and its
:term:`parent <parent record>` terms are inherited. Because of this, when browsing
results for the parent term "Waterloo, Regional Municipality of", the example
description will appear, even though the term was not directly added.

For users who would **only** like to see results where the current term has been
directly added, a link is provided at the top of the results, with a count of
directly related results:

.. image:: images/terms-exclude-narrower-terms.*
   :align: center
   :width: 80%
   :alt: View of the option to exclude narrower terms in Places browse

Click the "Exclude narrower terms" button at the top of the results, and AtoM
will reload the page, displaying only :term:`archival description` results where
the term has been directly added (and not inherited from a narrower term).

.. image:: images/terms-only-directly-related.*
   :align: center
   :width: 80%
   :alt: View of the option to exclude narrower terms in Places browse

A :term:`filter tag` appears at the top of the narrowed search results indicating
that only directly-related results are being displayed. To return to the previous
view of all results, click the **X** on the filter tag - AtoM will reload the page
and return to displaying all related results.


|digicon| Browse digital objects
--------------------------------

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

The automatic sort is alphabetic (title) for unauthenticated (e.g. not logged in)
users, which can be changed by the user to Most recent or alphabetic (identifier)
via the :ref:`recurring-sort-button` at the top right of the page.

.. TIP::

   :term:`Administrators <administrator>` can change the default sort order
   on search/browse pages for both public and authenticated (i.e. logged in)
   users, in **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.

|functicon| Browse functions
----------------------------

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

The functions browse page also includes a :term:`dedicated search box` to help
you locate records. For more information on its use, see:
:ref:`dedicated-search-functions`.


Browsing for authenticated users
================================

Authenticated (logged-in) users have access to browsing lists of donors and
accession records.

Browse accession records
------------------------

Click on the |edit| :ref:`Manage <main-menu-manage>` menu, then on Accessions.

.. image:: images/browse-accessions-all.*
   :align: center
   :width: 80%
   :alt: Browsing all accession records.

AtoM will display a list of all accessions by accession number as well as
when the :term:`accession record` was updated.

.. TIP::

   From this screen, users can also search accession records by name in
   the search box at the top of the results list. For more information on
   accession functionality, see :ref:`Accessions <accession-records>`. For
   information on using the Accessions search box, see:
   :ref:`dedicated-search-accessions`

When an accession record is clicked, the full record is displayed.

Browse donors
-------------

Click on the |edit| :ref:`Manage <main-menu-manage>` menu, then on Donors.

.. image:: images/browse-donors-all.*
   :align: center
   :width: 80%
   :alt: Browsing all donor records.

AtoM will display a list of all donors by name as well as
when the donor record was updated.

.. TIP::

   From this screen, users can also search donors by name in
   the search box at the top of the results list. For more information on
   donor record functionality, see :ref:`Donors <donors>`. For information on
   searching for Donor records in AtoM, see:
   :ref:`Donor search <dedicated-search-donors>`.

When an donor record is clicked, the full record is displayed, including any
related :term:`accessions <accession record>` and resources.

Browse Rights holders
---------------------

Click on the |edit| :ref:`Manage <main-menu-manage>` menu, then on Rights holders.

.. image:: images/browse-rightsholders-all.*
   :align: center
   :width: 80%
   :alt: Browsing all rights holders records.

AtoM will display a list of all rights holders by name as well as
when the rights holders record was updated.

.. TIP::

   From this screen, users can also search rights holders by name in
   the search box at the top of the results list. For more information on
   rights holders record functionality, see :ref:`Rights <rights>`. For more
   information on using the rights holder search box, see:
   :ref:`Rights holder search <dedicated-search-rights>`.

When a rights holders record is clicked, the full record is displayed.

:ref:`Back to top <browse>`
