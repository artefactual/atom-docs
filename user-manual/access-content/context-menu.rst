.. _context-menu:

============
Context menu
============

.. |caret| image:: images/caret-down-grey.png
   :height: 17
   :width: 17

The context menu appears on all :term:`view <view page>` and some
:term:`edit <edit page>` pages to provide greater contextual information about
the record currently being viewed.

In the default theme, the :term:`Dominion theme`, AtoM’s view and edit pages
are  generally displayed in the :term:`user interface` in either a 2 or 3
column  layout - the current record’s display data is presented in the central
part of  the page, while the side column(s) are generally used to provide
additional options and further contextual information to enhance user
orientation and navigation. These side columns make up the context menu.

The information provided in the context menu varies by the :term:`entity`
type or display. Each is described separately below.

.. _context-menu-descriptions:

Archival descriptions
=====================

.. image:: images/context-menu-description.*
   :align: center
   :width: 80%
   :alt: Context menu shown for archival description

The context menu for an :term:`archival description` includes the following
elements:

1. The name/logo of the :term:`archival institution` which holds the resource
   described (this may not appear in single repository installations).

2. The treeview (described in more detail :ref:`below <context-menu-treeview>`)

3. Related :term:`subjects <subject>`, linking to descriptions with the same
   subject as the resource described.

4. Related people and organizations, including the :term:`creator` of the
   resource described as well as an people or organizations who are the
   :term:`subject` of the resource described. These link to the
   :term:`authority record` for the person or organization.

5. :term:`Physical storage` information.

.. TIP::

   :term:`Adminstrators <administrator>` can choose whether or not physical
   storage information is visible to all users. See
   :ref:`Physical storage <physical-storage>` for further information.

.. _context-menu-treeview:

Treeview
--------

The treeview is a contextual and navigation element located in the context
menu for :term:`archival descriptions <archival description>`, places, and
subjects. It serves the dual purpose of showing a record or
:term:`term's <term>` relationships to other records or terms in a hierarchy,
as well as serving as a navigational tool.

.. figure:: images/treeview-hierarchy.*
   :align: right
   :figwidth: 25%
   :width: 100%
   :alt: Treeview showing the hierarchy of child-levels in a fonds.

   Treeview showing the hierarchy of child-levels in a fonds.

In the figure to the right, the record for a file is highlighted, showing the
placement of the file in a hierarchy, e.g. what series and fonds does it
belong to. In this example, the user is viewing File 994058-001 in a Series
called "Personal records, in a fonds titled the "John Honsberger fonds." The
treeview allows the user to see the current record's position in the
collection hierarchy, and by clicking on the blue hyperlinked titles of other
records, the user can navigate easily from one record to another contained in
the same :term:`fonds` or :term:`collection`

To navigate the fonds or series users can do the following:

1. Click on a different file title to see that file level description. The
   main archival description :term:`view page` will reload to display the
   selected file-level record, which will now be highlighted in the treeview.

2. Click on the ellipses to expand more file descriptions not currently in
   view.

3. Click on the title of the series to read the series level descripton.
   Again, the main archival description :term:`view page` will reload to display
   the selected series-level record, which will now be highlighted in the
   treeview.

4. Click on the |caret| "caret" beside a description with children (e.g. the
   series description in this example) to expand or collapse all the children
   titles.

5. Click on the title of the :term:`fonds` to read the fonds-level description,
   which will also reload the :term:`view page` to display the selected fonds-
   level description.

As shown in this image, users can also click on the "Quick search" tab at
the top of the treeview to search for titles and identifiers within the fonds
or collection. For more information on using the Treeview quick search, see:
:ref:`treeview-search`.

.. image:: images/treeview-quicksearch.*
   :align: center
   :width: 20%
   :alt: The quick search box, located at the top of the treeview.

:term:`Administrators <administrator>` can decide how they would like
descriptions in the treeview to sort and display throughout their AtoM
installation. See :ref:`sort-treeview`.

In addition to displaying in the context menu for archival descriptions, the
treeview is also used for hierarchical :term:`taxonomies <taxonomy>` such as
Subjects, to show parent-child relationships between :term:`terms <term>`. For
more information, see:

* :ref:`context-menu-terms-treeview`
* :ref:`context-menu-results`



.. _context-menu-authorities:

Authority records
=================

.. image:: images/context-menu-authority.*
   :align: center
   :width: 80%
   :alt: Context menu shown for authority record

The context menu for an :term:`authority record` includes the following
elements:

1. :term:`Archival descriptions <archival description>` which the person or
   organization is the :term:`subject` of.

2. :term:`Archival descriptions <archival description>` which the person or
   organization is the :term:`creator` of.

.. NOTE::

   When a relationship is created between two :term:`authority records
   <authority record>` or between an authority record and a :term:`function`,
   the relationship is expressed in the body (i.e. the main part or center
   column) of the authority record's :term:`view page`, in the "Relationships"
   :term:`area <information area>` of the record.

.. _context-menu-terms:

Subject and Place browse pages
==============================

:term:`Subject` and :term:`Place` terms can be used in AtoM as
:term:`access points <access point>`, and then browsed to explore the
:term:`archival descriptions <archival description>` to which they are linked.
For more information, see:
:ref:`Browse subjects and places <browse-subjects-places>`.

.. image:: images/place-context-menu.*
   :align: center
   :width: 80%
   :alt: Context menu shown for term browse

When a term has been selected from the Subject or Places browse page, the user is
redirected to a term browse page, listing descriptions related to that term as
an access point. The context menu on this term browse page appears on both the
left and right-hand sides, and includes the following elements:

1. A terms :term:`treeview` on the left side of the page, with a list view and a
   term search included in separate tabs. The terms treeview is discussed in
   greater detail below: :ref:`context-menu-terms-treeview`.

2. Below the :term:`treeview`, addtional :term:`facet filters <facet filter>` that
   can be applied to the browse results are listed. For more information on using
   facet filters in AtoM, see: :ref:`recurring-facet-filters`.

3. On the right side of the page, additional contextual information is provided.
   This includes:

   * A count of :term:`archival description` results that have been linked to
     the term
   * If the current term is part of a hierarchy, a link to the
     :term:`parent record` is included under the heading *Broader term*.
   * If the current term has :term:`children <child record>` in the taxonomy, a
     count of child terms nested under the current selection is listed under the
     heading *No. narrower terms*.

.. SEEALSO::

   * :ref:`Browse subjects and places <browse-subjects-places>`
   * :ref:`terms`
   * :ref:`Context menu - results pages <context-menu-results>`

.. _context-menu-terms-treeview:

Terms treeview
--------------

The treeview is a contextual and navigation element located in the context
menu for :term:`archival descriptions <archival description>`,
:term:`places <place>`, and :term:`subjects <subject>`. It serves the dual
purpose of showing a record or :term:`term's <term>` relationships to other
records or terms in a hierarchy, as well as serving as a navigational tool.

.. image:: images/terms-tabs.*
   :align: center
   :width: 80%
   :alt: Treeview tabs available on a subject or place term browse page

The terms treeview, used on the browse page for a specific subject or place term,
includes three tabs - the default treeview tab, which displays the record in the
context of its hierarchical organization; the list tab, which displays terms of all
levels ordered alphabetically, and the search tab. Each is described in greater
detail below.

Treeview tab
^^^^^^^^^^^^

The treeview tab is the default view for the terms treeview. It shows the terms
belonging to the current :term:`taxonomy` (e.g. subjects or places) in hierarchical
context, and allows to the user to browse these hierarchies by clicking on
different nodes or titles in the treeview.

To navigate using the terms treeview, users can do the following:

1. Click on a different term title to see that term's description, and any
   :term:`archival descriptions <archival description>` that have been linked to
   it as an :term:`access point`. When a new term is clicked, the main term browse
   :term:`view page` will reload to display the selected term, which will now
   be highlighted in the treeview.

2. When a term has :term:`children <child record>` (e.g. narrower terms that are
   nested beneath it in the taxonomy), a |caret| "caret" icon appears next to
   the term in the treeview. Click on the |caret| "caret" beside a term with
   children to expand or collapse all the children titles.

3. The treeview will only load a certain amount of records at a time. In large
   :term:`taxonomy` with many terms, ellipses ( ... ) may sometimes appear,
   indicating that there are more records available. Click on the ellipses
   to expand more term descriptions not currently in view.

See also the instructions on using the archival description treeview,
:ref:`above <context-menu-treeview>` for further details - the main actions are
the same in both treeviews.

This main view of the treeview is also used when browsing terms in a taxonomy.
See below for more information: :ref:`context-menu-results`.

List tab
^^^^^^^^

The list tab allows users to browse all terms in the current :term:`taxonomy`
(e.g. subjects, or places), regardless of where they are positioned
hierarchically. In a taxonomy where many terms are nested as narrower terms,
it can be difficult to get a sense of all the terms available in the treeview
tab or the main taxonomy browse pages. A total count of terms is included at
bottom of the page. If there are more than 10 terms, "Next" and "Previous"
buttons are included to navigate between pages.

Search tab
^^^^^^^^^^

The search tab in the terms treeview operates the same as the dedicated search
for terms included in the terms browse page. Users can click the gear icon to
limit the search to the preferred term label (e.g. the authorized form of name),
'Use for' labels (e.g. non-preferred, alternate forms of name), or both. The
default setting is to search both.

For more information on using the dedicated term search box, see:
:ref:`Search for Terms <dedicated-search-terms>`.

.. _context-menu-institutions:

Archival institutions
=====================

.. image:: images/context-menu-institution.*
   :align: center
   :width: 80%
   :alt: Context menu shown for institution record

The context menu for an :term:`archival institution` includes the following
elements:

1. The name/logo of the institution.

2. A list of the first 10 alphabetically listed :term:`holdings` at the fonds
   or collection :term:`level of description` of the institution, with a link to
   the complete holdings.

3. The primary contact information for the institution, including buttons that
   link to the institution's website and email. The contact information is drawn
   from the information added to the “Contact” :term:`area <information area>` of
   the :term:`archival institution` record.

.. _context-menu-results:

Results pages
=============

When a user searches for :term:`information objects <information object>`, the
context menu consists of :term:`facet filters <facet filter>` which allow the
user to narrow down their search results.

.. image:: images/context-search-results.*
   :align: center
   :width: 80%
   :alt: Context menu shown for information object search results.

For more information on working with :term:`facet filters <facet filter>` in
AtoM, see: :ref:`recurring-facet-filters`.

When a user searches for a :term:`term` which is organized hierarchically in
a :term:`taxonomy` the context menu will include a :term:`treeview` of that
taxonomy.

.. image:: images/context-search-tree.*
   :align: center
   :width: 80%
   :alt: Context menu shown for term search with treeview

:term:`Place` and :term:`Subject` term browse pages have additional features
available in tabs in the treeview provided in the context menu. For more
information, see above, :ref:`context-menu-terms-treeview`.

:ref:`Back to top <context-menu>`
