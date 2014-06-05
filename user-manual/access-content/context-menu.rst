.. _context-menu:

============
Context menu
============

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
^^^^^^^^

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
belong to.

To navigate the fonds or series users can do the following:

1. Click on a different file title to see that file level description.

2. Click on the ellipses to expand more file descriptions not currently in
   view.

3. Click on the title of the series to read the series level descripton

4. Click on the "carrot" beside a description with children (e.g. the series
   description in this example) to expand or collapse all the children titles.

4. Click on the title of the fonds to read the fonds level description

As shown in this image, users can also click on the "Quick search" tab at
the top of the treeview to search for titles and identifiers within the fonds
or collection.

.. image:: images/treeview-quicksearch.*
   :align: center
   :width: 20%
   :alt: The quick search box, located at the top of the treeview.

:term:`Administrators <administrator>` can decide how they would like
descriptions in the treeview to display throughout their AtoM installation.
See :ref:`sort-treeview`.

In addition to displaying in the context menu for archival descriptions, the
treeview is also used for hierarchical :term:`taxonomies <taxonomy>` such as
Subjects, to show parent-child relationships between :term:`terms <term>`.

.. image:: images/treeview-subjects.*
   :align: center
   :width: 20%
   :alt: The treeview being used in the Subjects taxonomy.


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

Results pages
=============

When a user searches for :term:`information objects <information object>`, the
context menu consists of :term:`facet filters <facet filter>` which allow the
user to narrow down their search results.

.. image:: images/context-search-results.*
   :align: center
   :width: 80%
   :alt: Context menu shown for information object search results.

When a user searches for a :term:`term` which is organized hierarchically in
a :term:`taxonomy` the context menu will include a :term:`treeview` of that
taxonomy. Terms which are organized in taxonomies include
:term:`subjects <subject>`, :term:`places <place>` and
:term:`functions <function>`.

.. image:: images/context-search-tree.*
   :align: center
   :width: 80%
   :alt: Context menu shown for term search with treeview

:ref:`Back to top <context-menu>`
