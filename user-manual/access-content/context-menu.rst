.. _context-menu:

============
Context menu
============

.. |caret| image:: images/caret-down-grey.png
   :height: 17
   :width: 17

.. |gears| image:: images/gears.png
   :height: 17
   :width: 17

The context menu appears on all :term:`view <view page>` and some
:term:`edit <edit page>` pages to provide greater contextual information about
the record currently being viewed.

In the default theme, the :term:`Dominion theme`, AtoM’s view and edit pages
are  generally displayed in the :term:`user interface` in either a 2 or 3
column  layout - the current record’s display data is presented in the central
part of the page, while the side column(s) are generally used to provide
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

The context menu for an :term:`archival description` can include the following
elements, depending on some configuration options set by an
:term:`administrator` via the application settings:

**Left-hand context menu**

1. The name/logo of the :term:`archival institution` which holds the resource
   described. For more information on linking an archival institution to an
   archival description, see: :ref:`link-archival-institution`.

2. The treeview (described in more detail :ref:`below <context-menu-treeview>`)
   if it is set to display in the sidebar mode, and the Quick search box. In
   the above image, the treeview is set to Full-width display, so only the Quick
   search box is visible in the left-hand context menu (the full-width treeview
   appears in the central body of the page). An :term:`administrator` can set
   the treeview display mode via **Admin > Settings > Global** - see:
   :ref:`treeview-type`. For more information on the Quick search, see:
   :ref:`treeview-search`.

3. If you have configured a custom sidebar menu with links to static pages,
   these will appear on all archival description
   :term:`view pages <view page>` below the Quick search and Treeview, in
   addition to the home page. For more information, see:
   :ref:`static-pages-menu`.

**Right-hand context menu**

4. A link to add the current record to the :term:`Clipboard`. For more
   information on using the Clipboard, see: :ref:`clipboard`.

5. The "Explore" section, which contains various ways to explore the current
   :term:`archival unit`. These include:

   * The reports module. For more information, see: :ref:`reports-printing`.
   * If the inventory list is configured, and the current description has
     descendants that match the configuration, a link to the Inventory list
     will be present, allowing users to explore lower-level records in a
     table-based list. For more information, see:
     :ref:`browse-hierarchy-inventory`. For settings and configuration, see:
     :ref:`inventory-settings`.
   * The "Browse as list" option - for more information, see: :ref:`browse-hierarchy-list`.
   * The "Browse digital objects" option - for more information, see:
     :ref:`browse-hierarchy-digi-objects`.

6. Import and Export options. For more information on import and export, see:
   :ref:`import-export`.

7. Finding aid generation options. For more information on generating and
   using finding aids in AtoM, see: :ref:`print-finding-aids`.

8. Related subject, name, genre, and place :term:`access point` terms that
   have been linked to the :term:`archival description` currently displayed.
   These include:

   * Related :term:`subjects <subject>`, linking to descriptions with the same
     subject as the resource described.
   * Related people and organizations, including the :term:`creator` of the
     resource described as well as an people or organizations who are the
     subject of the resource described. These link to the
     :term:`authority record` for the person or organization.
   * Related genre access point terms, which indicate the types of materials
     associated with the :term:`archival description`
   * Related :term:`place` access points, linking to descriptions with the
     same geographical location as the resource described.

   For more information on adding an :term:`access point` to an archival
   description, see: :ref:`add-term-fly`.

9. :term:`Physical storage` information related to the archival description.
   For more information on linking a physical storage location to an archival
   description, see: :ref:`link-physical-storage`.

.. TIP::

   :term:`Adminstrators <administrator>` can choose whether or not physical
   storage information is visible to all users, via the Visible elements
   module. See  :ref:`physical-storage` and :ref:`visible-elements` for
   further information.

.. _context-menu-treeview:

Treeview
--------

The treeview is a contextual and navigation element for
:term:`archival descriptions <archival description>` or :term:`terms <term>`
(such as :term:`place`, :term:`subject`, or genre :term:`access points <access point>`.
It serves the dual purpose of showing a record or :term:`term's <term>`
relationships to other records or terms in a hierarchy, as well as serving as a
navigational tool. This section will focus on the Treeview as used for context
and navigation in :term:`archival description` view pages - for more
information on the Terms treeview, see: :ref:`context-menu-terms-treeview`.

The treeview for archival descriptions has 2 ways of being displayed - either
in the left-hand context menu (referred to as the sidebar treeview), or in a
larger version in the main column of the :term:`view page` of an archival
description. The display of the treeview can be controlled by an
:term:`administrator` via a global setting - for more information, see:
:ref:`treeview-type`.

.. figure:: images/treeview-comparison.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: A comparison of the full-width and sidebar treeview displays.

   A comparison of the full-width and sidebar treeview displays.

The specific features of each treeview display option will be outlined below.

**Jump now to:**

* :ref:`context-menu-treeview-sidebar`
* :ref:`context-menu-treeview-full`

Users can also click on the "Quick search" tab to search for desriptions
within the current archival unit. For more information on using the Treeview
quick search, see: :ref:`treeview-search`.

.. image:: images/treeview-quicksearch.*
   :align: center
   :width: 50%
   :alt: The quick search box, located in the left context menu.

:term:`Administrators <administrator>` can decide how they would like
descriptions in the sidebar treeview to sort and display throughout their
AtoM installation. See :ref:`sort-treeview`. For the full-width treeview, the 
sort is automatically set to Manual.

In addition to supporting navigation, both treeview types can also be used to 
support arrangement. That is, a logged in user with sufficient edit 
:term:`permissions <access privilege>` can drag and drop sibling nodes 
(i.e. descriptions with the same parent) to re-order them. Dragging and dropping 
is not currently supported between levels (for example, dragging a file-level 
description to a different parent Series). For the sidebar treeview, the sort 
settings must be set to "Manual" for this to work - see: :ref:`sort-treeview`. 
For more information, see: 

* :ref:`Change the sort order of an archival hierarchy <change-sort-order>`

.. SEEALSO::

   In addition to displaying in the context menu for archival descriptions, the
   treeview is also used for hierarchical :term:`taxonomies <taxonomy>` such as
   Subjects, to show parent-child relationships between :term:`terms <term>`. For
   more information, see:   

   * :ref:`context-menu-terms-treeview`
   * :ref:`context-menu-results`

.. _context-menu-treeview-sidebar:

Sidebar treeview
^^^^^^^^^^^^^^^^

.. figure:: images/treeview-hierarchy.*
   :align: right
   :figwidth: 25%
   :width: 100%
   :alt: Treeview showing the hierarchy of child-levels in a fonds.

   Sidebar treeview showing the hierarchy of child-levels in a fonds.

In the figure to the right, the record for an item is highlighted, showing the
placement of the file in a hierarchy, e.g. what series and fonds does it
belong to. In this example, the user is viewing Item 2000029-02P in a Series
called "Photographs," in a fonds titled the "John Honsberger fonds." The
treeview allows the user to see the current record's position in the
collection hierarchy, and by clicking on the blue hyperlinked titles of other
records, the user can navigate easily from one record to another contained in
the same :term:`fonds` or :term:`collection`.

For performance reasons, AtoM may also not load all available descriptions in
the current position of the hierarchy - for example, if you are browsing in a
series with 20 descriptions, only the first 6-7 may display. In this case,
AtoM will include an approximate count of remaining descriptions - clicking on
this will load the next batch of available descriptions in the treeview. In
the image on the right, there are approximately 10 more item-level
descriptions in the "Photographs" series. After the first 2 times, a scrollbar
will appear and the treeview will continue to load 4 more descriptions as the
user scrolls lower in the treeview pane.

When first arriving on the view page for a top-level description (e.g. a fonds
or collection, etc), lower-level records with children will appear with a
|caret| "caret" beside them to indicate that they contain children. In the
treeview on the left in the image below, for example, the user is currently
viewing the top-level fonds record for the John Honsberger fonds - the series
below, each of which have children, are displayed. Clicking on a series title
will reload the page and display that series. However, a user can also click
directly on the caret to expand that series without leaving the current
:term:`view page`. The treeview will reload without reloading the whole page,
and sibling series will be hidden, as the lower-level item records are
displayed for browsing. You could click the caret again to close the current
series, and return to viewing all series below the fonds-level record.

.. figure:: images/treeview-sidebar-states.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: Treeview states compared

   Sidebar treeview states compared - browsing the series in a fonds (left),
   then browsing the items in a series (right).

**To navigate with the sidebar treeview, users can do the following:**

1. Click on a different description title to see that description.
   The main archival description :term:`view page` will reload to display the
   selected record, which will now be highlighted in the treeview.

2. Click on the approximate count button to expand more descriptions not
   currently in view.

3. Click on the |caret| "caret" beside a description with children (e.g. the
   series description in this example) to expand or collapse all the children
   titles.

4. Click on the title of the :term:`fonds` to return to the fonds-level
   description, which will also reload the :term:`view page` to display the
   selected fonds-level description.

An :term:`administrator` can also change the default sort order of the sidebar 
treeview via |gears| **Admin > Settings**. For more information, see: 
:ref:`sort-treeview`.

.. _context-menu-treeview-full:

Full-width treeview
^^^^^^^^^^^^^^^^^^^

.. figure:: images/treeview-full.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: An image of the full-width treeview

   An example of the treeview when displayed in Full-width mode

The full-width treeview, pictured above, has some notable differences from the
older sidebar treeview. Most notably, it will allow users to browse all levels
of description in the hierarchy of the :term:`archival unit` at one, while the
sidebar treeview will only display siblings of the currently viewed level. By
being positioned in the center of the page, it necessarily has more room - and
a user can click and drag the bottom bar of the treeview to expand the viewing
area further:

.. figure:: images/treeview-full-expanded.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: Full-width treeview expanded by dragging the bottom bar

   Click and drag the bottom bar of the full-width treeview viewing area to expand it

The full-width treeview also supports keyboard navigation - use the up and
down keys to navigate, and the left/right keys to expand or collapse
descriptions with children.

Basic indentation is used to better visually indicate the hierarchical
relationships in the full-width treeview. When a description contains
children, a **+** plus sign appears to the left of its title - click this (or
use the right arrow key when the record is selected) to expand the children.
The **-** minus sign can then be clicked (or the left arrow key used) to
collapse the :term:`parent record` again.

Basic icons are also used to help visually distinguish different levels. At
present, these are hard-coded and cannot be changed without a
:term:`developer` making changes in AtoM's code. The collection and
fonds-level records will use the box icon; series, sub-series, and other
intermediate levels use the folder icon, while file and item-level records use
the document icon. If a user adds a new :term:`level of description` to the
Levels of description :term:`taxonomy`, it will by default use the folder
icon:

.. figure:: images/treeview-lod.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: An image of the icons used at different levels in the full-width treeview

   To help differentiate the levels at a glance, 3 different icons have been
   used in the full-width treeview. New levels added to the Levels of
   description taxonomy will use the folder icon by default.

As different descriptions are selected in the full-width treeview, the
description :term:`view page` will automatically update to display that
record. When navigating with a keyboard, the view page will not update until
the user presses the "enter" key to select the description for viewing.

Like the sidebar treeview, "(Draft)" will appear beside all draft descriptions 
displayed to authenticated (i.e. logged in) users. Unlike the sidebar treeview,
however, an :term:`administrator` can configure what metadata elements are used 
for display in each treeview node - for more information, see: 

* :ref:`fullwidth-treeview-settings`


**To navigate with the full-width treeview, users can do the following:**

1. Click on a different description title to see that description.
   The main archival description :term:`view page` will reload to display the
   selected record, which will now be highlighted in the treeview. When using
   the keyboard to navigate, pressing enter will load the selected record in
   the view page.

2. Use the scroll bar or the up/down arrow keys to navigate up and down the
   displayed records.

3. Click on the **+** "plus" sign beside a description with children to expand
   or collapse all the children titles. If navigating with the keyboard, the
   right arrow can be used. Click on the **-** "minus" sign to collapse the
   child records again, or use the left arrow key.

4. Click and drag the bottom bar of the treeview viewing area to expand it

.. SEEALSO::

   * :ref:`context-menu-terms-treeview`
   * :ref:`treeview-search`
   * :ref:`fullwidth-treeview-settings`

:ref:`Back to top <context-menu>`

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
