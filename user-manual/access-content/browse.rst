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

.. |gears| image:: images/gears.png
   :height: 18

.. |clip| image:: images/paper-clip.png
   :height: 18


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
beside the :term:`search box` in the :term:`header bar`. There are also browse
links included on the :term:`home page` - see :ref:`home-page` for more
information.

.. image:: images/search-box-browse-button.*
   :align: left
   :alt: Search box with browse menu

The browse options listed below are in their default order, however,
adminstrative users can change the order, or remove browse options, through
the Admin-Menus menu (see: :ref:`Manage menus <manage-menus>`).

**Jump to:**

* :ref:`browse-result-limits`
* :ref:`browse-descriptions`

  * :ref:`browse-hierarchy`

* :ref:`browse-authority-records`
* :ref:`browse-institutions`

  * :ref:`browse-holdings`
  * :ref:`browse-maintained-actors`

* :ref:`browse-subjects-places`

  * :ref:`browse-subjects-places-results`

* :ref:`browse-digital-objects`
* :ref:`browse-functions`

**Or, jump to** :ref:`browse-authenticated`

.. _browse-result-limits:

Search, browse, and result limits
---------------------------------

In the event that there are more than 10,000 results to return when searching
or browsing, AtoM will stop loading to preserve memory capacity, and the user
will see the following message when attempting to jump to later results:

.. image:: images/sort-options.*
   :align: center
   :width: 70%
   :alt: Sort options error message

With the release of 2.5, a second sort option has been added in the top
right-hand corner to allow the user to change a sort from ascending to
descending. This allows the user to quickly review the results from the end of
the list. Note: this sort option is available for

* :term:`Accession <accession record>`
* :term:`Archival descriptions <archival description>`
* :term:`Archival institututions <archival institution>`
* :term:`Authority records <authority record>`
* Donors
* :term:`Functions <function>`
* :term:`Rights holders <rights record>`
* Browse :term:`digital objects <digital object>`
* :ref:`Clipboard results page <clipboard>`
* :term:`Taxonomies <taxonomy>`

The default sort is ascending.

.. image:: images/sort-ascending.*
   :align: center
   :width: 70%
   :alt: Sort option ascending

By choosing 'Direction: Descending' the user can view the browse results from
the end of the list:

.. image:: images/sort-descending.*
   :align: center
   :width: 70%
   :alt: Sort option descending

For more information, see: 

* :ref:`recurring-sort-button`

.. IMPORTANT::

   Results may not be exactly as expected. Alphabetic sort order in AtoM is
   'ASCII-betical'. For more, see :ref:`navigate`.

Alternatively, a system administrator can adjust the results limit via AtoM's
``search.yml`` configuration file, to increase it beyond the default 10,000 
record limit. **Doing so will impact memory usage** and may require additional
system memory. For more information, see: 

* :ref:`config-search`

:ref:`Back to top <browse>`

.. _browse-descriptions:

|desc| Browse archival descriptions
-----------------------------------

Click the Browse menu, then click on Archival descriptions.

.. image:: images/browse-archdesc.*
   :align: center
   :width: 80%
   :alt: View of browsing archival descriptions

When arriving on the :term:`archival description` browse page, a
:term:`top-level description filter` is engaged by default, meaning that all
results shown are :term:`parents <parent record>` with or without children, but
without any higher levels of description above them in the hierarchy. Users can
disengage this filter by clicking the **X** on the "Only top-level descriptions"
:term:`filter tag` at the top of the results (see
:ref:`browse-hierarchy-top-filter`).

The automatic sort is alphabetic by default for public users and by most
recently updated (date modifed) for authenticated users, but users can
change the sort to most recently updated, identifier, reference code, and start
or end date, using the :ref:`sort button <recurring-sort-button>` located at the
top-right of the page above the results.

.. TIP::

   :term:`Administrators <administrator>` can change the default sort order
   on search/browse pages for both public and authenticated (i.e. logged in)
   users, in **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.

Users can narrow the results list with the available 
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

Results appear in the main column of the page - click on a result and AtoM will
take you to a :term:`view page` for the related :term:`archival description`.
Additionally, the results include helpful contextual information, including:

.. image:: images/search-result-stub.*
   :align: center
   :width: 70%
   :alt: An image of a search results stub

* *Level of description* - i.e. fonds, series, file, item, etc. The
  :term:`level of description` will be diplayed next to the orange identifier,
  below the title of the record.
* *Publication status* - if a description's :term:`publication status` is
  "draft" (i.e. it is not visible to public users), the draft status will be
  indicated in the stub record.
* *Description* - if a scope and content note has been included in the
  archival description, its first 2-3 lines will be visible here for greater
  context.
* *Identifier* - if a reference code or other identifier has been added to
  the record, the results will display this in orange, beneath the title.
* *Creation dates* - if dates of creation have been added to the record, these
  will display on the same line as the identifier and level of description.
* *Part of* - if the record is the :term:`child <child record>` of a
  hierarchical :term:`archival unit` (e.g. a file in a fonds, etc), the title
  of the :term:`parent record` will be displayed as a hyperlink beneath the
  identifier, level of description, and creation dates.
* *Creator name* - if a creator's :term:`authority record` has been linked
  to an archival description, the results stub will display the creator
  name below the scope and content summary.

.. SEEALSO::

   * :ref:`search-archival-descriptions`
   * :ref:`recurring-page-elements`
   * :ref:`recurring-facet-filters`
   * :ref:`archival-descriptions`

.. _browse-hierarchy-browser:

Using the Hierarchy browser
^^^^^^^^^^^^^^^^^^^^^^^^^^^

If an :term:`administrator` has enabled the **Hierarchy browse** options (see
:ref:`treeview-settings`) users will also see a button to engage that view.

.. image:: images/browse-hierarchy-choice.*
   :align: center
   :width: 70%
   :alt: Browse hierarchy choice

Clicking this button will take users to a full-page, full-width
:term:`treeview` containing all top-level 
:term:`descriptions <archival description>` in AtoM, called the 
:term:`hierarchy browser`. 

.. image:: images/browse-hierarchy.*
   :align: center
   :width: 70%
   :alt: Browse hierarchy page

As with the current description treeview, each description in the hierarchy
browse page that has :term:`children <child record>` will display an
"expand/collapse" icon that can be clicked to display all the children of that
description. Any child descriptions that in turn have children will also be
expandable.

The amount of top-level records loaded into the hierarchy browser when it is 
first visited will be determined by the :ref:`fwt-items-per-page` setting 
available at |gears| **Admin > Settings > Treeview**. The default value is 50 
- an :term:`administrator` can adjust this value up to 1,000.  

At the top right of the page, a "Reset" will be present. Clicking this will 
return the hierarchy browser to its original state, collapsing all opened nodes
and displaying only the first load of records. 

Additionally, if there are more top-level descriptions available than those 
included in the initial load, a second button with a number in the top right 
corner of the page will indicate how many more descriptions can be seen in the 
hierarchy. Click on that number to bring up the next page of results.

.. image:: images/browse-hierarchy-more.*
   :align: center
   :width: 70%
   :alt: Browse hierarchy page

The hierarchy browser will have the same functionality as the standard treeview, 
except:

* All top level description titles in the catalogue database will be shown in
  alphabetic order
* When lower level descriptions exist, an "expand/collapse" icon will be
  visible; clicking that icon will display lower levels in the order in which
  they are described
* The treeview will use the entire display area of the page, so the “gripper” to
  expand and shrink the vertical size of the treeview pane will not be necessary
* When a user clicks a description title in the hierarchy browse page,they will
  be redirected to the related archival description view page with the standard
  treeview (the user should then be able to return to the hierarchy browse page
  where they left off)
* No filters or facets will be available on the hierarchy browse page
* The Reset button will remain available at all times

.. SEEALSO::

   * :ref:`treeview-settings`

:ref:`Back to top <browse>`

.. _browse-hierarchy:

Browsing within an archival unit's hierarchy
--------------------------------------------

There are several ways to explore lower-level records (i.e. :term:`children
<child record>`) within an :term:`archival unit` (such as a :term:`fonds`,
:term:`collection`, or series). Each will be described below.

**Jump to:**

* :ref:`browse-hierarchy-top-filter`
* :ref:`browse-hierarchy-facet`
* :ref:`browse-hierarchy-list`
* :ref:`browse-hierarchy-digi-objects`
* :ref:`browse-hierarchy-inventory`
* :ref:`browse-hierarchy-quick-search`

The "Part of" facet and Top-level description filter options are performed
from a Search/Browse page, while the remaining options are accessed from
the :term:`view page` of an :term:`archival description`

.. SEEALSO::

   * :ref:`search-atom`
   * :ref:`archival-descriptions`
   * :ref:`navigate`

.. _browse-hierarchy-top-filter:

Using the top-level description filter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Using the :ref:`browse-menu` located in the :ref:`atom-header-bar`, navigate
   to **Browse > Archival descriptions**. For more information on navigation in
   AtoM, see: :ref:`navigate`.
2. By default, AtoM will display only top-level :term:`parent <parent record>`
   records when arriving on the Browse page. This limits what you see to the
   highest levels of description.

.. image:: images/browse-topleveldesc.*
   :align: center
   :width: 80%
   :alt: View of top level description filter


3. Choose a description by clicking the hyperlink description name.
4. To see all child-l;evel descriptions, You can display all results by clicking
   the **X** on the "top-level descriptions" :term:`filter tag`.
5. You can continue to refine your browsing using :term:`facet filter` or :ref:`advanced-search`.

.. _browse-hierarchy-facet:

Using the "Part of" facet
^^^^^^^^^^^^^^^^^^^^^^^^^

When arriving on a search or browse page, you can use the "Part of"
:term:`facet filter` to limit results to :term:`children <child record>`
contained within an :term:`archival unit` such as a :term:`fonds` or
:term:`collection`. Note however that at present, the AtoM facet filters will
only show the top 10 results for any facet - so this method will only work if
your target archival unit is included in the facet's display (see the
section below on :ref:`browse-hierarchy-top-filter` if your target archival
unit is not included in the "Part of" facet filter).

.. SEEALSO::

   More information on using the search/browse pages and the facet filters
   can be found in the sections listed below:

   * :ref:`search-atom`
   * :ref:`browse`
   * :ref:`recurring-facet-filters`

**To use the "Part of" facet for limiting results to a single archival unit:**

1. Using the :ref:`browse-menu` located in the :ref:`atom-header-bar`, navigate
   to **Browse > Archival descriptions**.
2. Turn off the top-level descriptions filter. You can display all results by
   clicking the **X** on the "top-level descriptions" :term:`filter tag`.
3. In the left-hand column, locate the "Part of" facet filter. The facet will
   display the top 10 results - e.g. those top-level records with the most
   :term:`children <child record>`. For more information on using facet
   filters in AtoM, see: :ref:`recurring-facet-filters`
4. Click on the name of the :term:`archival unit` (e.g. fonds or collection)
   whose lower-level records (:term:`children <child record>`) you would like
   to explore.
5. AtoM will reload the page with the results filtered to the chosen archival
   unit. This will be indicated, and can be quickly removed, via the
   :term:`filter tag` with the name of the unit at the top of the
   search/browse results page. You can continue to apply further facets and
   fliters as desired to narrow your results within the selected archival unit.


.. _browse-hierarchy-list:

Using the "Browse as list" button
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you are already on the view page of an :term:`archival description` that
includes a descriptive hierarchy (i.e. a top-level description such as a
:term:`fonds`, :term:`collection`, or series that has lower-level
:term:`children <child record>`), you can explore the descriptions contained
in the :term:`archival unit` using the browse buttons included in the
"Explore" section of the right-hand :term:`context menu`. For more information
on context menu items in AtoM, see: :ref:`context-menu` and
:ref:`recurring-page-elements`.

There are two options for browsing within an archival unit included here - the
"Browse as list" button, and the "Browse digital objects" button.
Additionally, if it has been configured by an :term:`administrator`, there
may also be an option to view an inventory. This section will describe the
"Browse as list" button - see the
:ref:`Browse digital objects button <browse-hierarchy-digi-objects>` and
:ref:`Browse inventory list <browse-hierarchy-inventory>` sections below for
the other options in this part of the context menu.

.. NOTE::

   The "Browse as list" link will appear in the right-hand :term:`context menu` 
   in all cases - even if there are no lower-level descriptions to browse. So, 
   it is possible that clicking on the link will lead to a results page with only 
   one result.

**To use the Browse as list button:**

1. Navigate to an :term:`archival description` that is part of the
   :term:`archival unit` whose :term:`children <child record>` you wish to
   explore - it does not have to be the top-level :term:`parent record`. For
   more information on searching, browsing, and navigation in AtoM, see:
   :ref:`access-content`.
2. In the right-hand :term:`context menu`, locate the *Explore* section - you
   will see browse options listed there, including the "Browse as list"
   button.

.. image:: images/browse-collection-options.*
   :align: center
   :width: 30%
   :alt: An image of the Explore section of the right-hand context menu

3. Click on the "Browse as list" link. AtoM will redirect you to a browse
   page, limited to the current :term:`archival unit` - this will be indicated
   by the :term:`filter tag` at the top of the browse page with the name of
   the top-level description. If you click the **X** to remove the filter tag,
   AtoM will reload all search/browse results (i.e. the page will no longer be
   limited to the selected archival unit).

4. You can continue to apply further facets and fliters as desired to narrow
   your results within the selected archival unit.

.. SEEALSO::

   * :ref:`recurring-facet-filters`
   * :ref:`search-atom`
   * :ref:`advanced-search`

.. _browse-hierarchy-digi-objects:

Using the "Browse digital objects" button
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you are already on the view page of an :term:`archival description` that
includes a descriptive hierarchy (i.e. a top-level description such as a
:term:`fonds`, :term:`collection`, or series that has lower-level
:term:`children <child record>`), you can explore the descriptions contained
in the :term:`archival unit` using the browse buttons included in the
"Explore" section of the right-hand :term:`context menu`. For more information
on context menu items in AtoM, see: :ref:`context-menu` and
:ref:`recurring-page-elements`.

There are two options for browsing within an archival unit included here - the
"Browse as list" button, and the "Browse digital objects" button.
Additionally, if it has been configured by an :term:`administrator`, there
may also be an option to view an inventory. This section will describe the
"Browse digital objects" button - see the
:ref:`Browse digital objects button <browse-hierarchy-list>` section above,
and the :ref:`Browse inventory list <browse-hierarchy-inventory>` section below
for the other options in this part of the context menu.

The "Browse digital objects" button will allow you to explore the
:term:`digital objects <digital object>` associated with descriptions included
in the target :term:`archival unit`, on a dedicated browse page described in
the :ref:`browse-digital-objects` section below, but limited to that specific
descriptive hierarchy.

**To use the Browse digital objects button:**

1. Navigate to an :term:`archival description` that is part of the
   :term:`archival unit` whose :term:`children <child record>` you wish to
   explore - it does not have to be the top-level :term:`parent record`. For
   more information on searching, browsing, and navigation in AtoM, see:
   :ref:`access-content`.
2. In the right-hand :term:`context menu`, locate the *Explore* section - you
   will see browse options listed there, including the "Browse digital
   objects" button.

.. image:: images/browse-collection-options.*
   :align: center
   :width: 30%
   :alt: An image of the Explore section of the right-hand context menu

.. NOTE::

   The "Browse digital objects" option will **not** be displayed if there are no 
   digital objects linked to any descriptions in the current 
   :term:`archival unit`. 

3. Click on the "Browse digital objects" link. AtoM will redirect you to a
   digital object browse page, limited to the current :term:`archival unit` -
   this will be indicated by the :term:`filter tag` at the top of the browse
   page with the name of the top-level description. If you click the **X** to
   remove the filter tag, AtoM will reload all digital object browse results
   (i.e. the page will no longer be limited to the selected archival unit).

.. image:: images/browse-digital-objects-button.*
   :align: center
   :width: 70%
   :alt: An image of the Digital object browse page limited to a collection

4. You can continue to apply further facets and fliters as desired to narrow
   your results within the selected archival unit.

.. SEEALSO::

   * :ref:`recurring-facet-filters`
   * :ref:`search-atom`
   * :ref:`advanced-search`

.. _browse-hierarchy-inventory:

Using the Inventory list
^^^^^^^^^^^^^^^^^^^^^^^^

The Inventory list allows an :term:`administrator` to make a page of lower-
level descriptions contained within a :term:`parent record` available on a
separate inventory page formatted as a table with sortable columns.

.. IMPORTANT::

   The Inventory list requires configuration by an :term:`administrator`
   before it will appear in the AtoM user interface. For instructions on
   configuring the Inventory, see the :ref:`settings` page;
   specifically, :ref:`inventory-settings`.

.. image:: images/inventory-list.*
   :align: center
   :width: 80%
   :alt: An image of the Inventory list for a series

If there are a lot of lower-level descriptions (for example, many files and
items in a series), this can be a useful way to quickly browse the contents of
the :term:`archival unit` - and the sortable columns can be used to sort and
view the lower-level :term:`children <child record>` in a way that the
:term:`treeview` does not allow. Columns in the inventory page include:

* Identifier
* Title
* Level of description
* Date
* Digital object
* :ref:`clipboard` link

Only the :term:`digital object`  and the Clipboard columns are not sortable.

The Digital object column will provide an indication of whether or not there
is a digital object attached to the description - if so, the row will have a
hyperlink called "View" in the Digital object column. Clicking on the "View"
link will take a user directly to the :term:`master digital object` - if a
user does not have :term:`permission <access privilege>` to view the master,
the column's value will be empty for that row.

The :term:`clipboard` column contains links indicated by the |clip| paper clip
icon. Clicking on one of these will add the description in the related row
directly to the Clipboard. For more information on working with the Clipboard,
see: :ref:`clipboard`.

**Configuring the inventory list**

Whether or not the Inventory link appears on a particular description will
depend on how it has been configured in the settings page - there, an
:term:`administrator` determines which levels of description will be included
(see: :ref:`inventory-settings` for more information). If the current
:term:`archival description` you are viewing does **not** include lower-level
:term:`child <child record>` descriptions matching the settings, no link will
appear.

Because it is configurable, an inventory list may not include *ALL* lower-level
records available in a particular archival unit. For example, if you viewed
the inventory page from a :term:`fonds`-level description that included
sub-fonds, series, files, and items, but the administrator has configured the
inventory settings to display only files and items, then at the fonds level,
the inventory list will display all files and items (including those contained
within lower-level subfonds and series), but the subfonds and series records
themselves will not be included on the inventory page.

Similarly, the Inventory link will only appear on :term:`parent <parent record>`
records - for example, if you are viewing a file that is part of a series, you
would need to navigate to the series record to see the inventory link.

**To use the Inventory list:**

1. Navigate to the :term:`archival description` whose
   :term:`children <child record>` you would like to explore. For more
   information on navigation in AtoM, see: :ref:`access-content`.

.. TIP::

   If you are looking for a particular record in an archival unit (such as a
   series in a fonds), the other entries in this section might be useful to
   you! See above and below, :ref:`browse-hierarchy`. See also: information on
   using the :ref:`context-menu-treeview` for navigation, and information on the
   :ref:`treeview-search`.

2. If the description includes :term:`children <child record>` that match the
   inventory settings configured by the :term:`administrator` (see:
   :ref:`inventory-settings`), then an "Inventory" link will appear in the
   right-hand :term:`context menu`, in the *Explore* section:

.. image:: images/inventory-link.*
   :align: center
   :width: 80%
   :alt: An image of the Inventory link in the right-hand context menu of an
         archival description.

3. Click on the "Inventory" link. AtoM will redirect you to the inventory list
   of lower-level records for the chosen description.

.. image:: images/inventory-list-annotated.*
   :align: center
   :width: 80%
   :alt: An image of the Inventory list for a series, with annotations

4. The Inventory list page will include the title of the parent description,
   as well as a :term:`breadcrumb trail` back to the top-level description for
   the :term:`archival unit`. On the right-hand side of the page, a button to
   return to the :term:`view page` of the parent :term:`archival description`
   is also included.

5. The column headers of the inventory list that appear in blue can be clicked
   to sort the inventory list by that column. Clicking again will reverse the
   sort order of the column (for example, from A-Z to Z-A). The only column
   that cannot be sorted is the Digital objects column.

6. The Digital object column will indicate whether or not there is a
   :term:`digital object` associated with the :term:`archival description`
   listed in the inventory list row. If there is, and the user has sufficient
   :term:`permissions <access privilege>` to view the
   :term:`master digital object`, then AtoM will provide a direct link to the
   master digital object.

.. NOTE::

   By default, public users who are not logged into AtoM do not have
   permission to access the :term:`master digital object` for locally uploaded
   digital content. This can be changed by an :term:`administrator` via
   **Admin > Groups** - edit the archival description permissions for the
   "anonymous" group to grant permission to "View master." See:
   :ref:`edit-user-permissions` and :ref:`manage-user-accounts`.

   Note that the above means that there are many possible scenarios where a
   digital object is attached to a description, but there is no indication of
   this in the Inventory list - it will depend on the
   :term:`access privileges <access privilege>` of the user viewing the
   inventory list.

7. If there are more than 10 results, a pager, with a count of the total
   number of results above it, will be included at the bottom of the page.

.. TIP::

   10 results per page is just the default setting in AtoM, but this can be
   adjusted by an :term:`administrator` via **Admin > Settings > Global**. For
   more information, see: :ref:`results-page`. The number of results included
   on a single page of the inventory list is controlled by this global
   setting, which affects all paged-results in the application.

.. _browse-hierarchy-quick-search:

Using the Quick search bar's browse option
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :term:`view page` for an :term:`archival description` includes a feature
known as the Treeview Quick search - it allows a user to quickly search an
:term:`archival unit` for a specific lower-level description. Instructions on
how to use it can be found at:

* :ref:`treeview-search`

However, whenever a search query is returned with at least 1 matching result,
a link that allows a user to browse all descriptions in a dedicated
search/browse page, limited to the current archival unit, is also included:

.. image:: images/quicksearch-browse-link.*
   :align: center
   :width: 30%
   :alt: An image of the browse descriptions link on the Quick search results page

If you click the "Browse all descriptions" link included at the bottom of the
Quick search results, AtoM will redirect you to a search/browse results page,
limited to the current :term:`archival unit`.

.. TIP::

   The Quick search bar will accept Boolean operators (see
   :ref:`advanced-search-operators` for more information), including the ** * **
   wildcard character. If you just want to use the Quick search to access the
   browse link, you can enter an asterix and press enter - AtoM will return
   a subset of all results, and then provide the browse link.

   Of course, an easier way to do this would be to use the "Browse as list"
   button, described :ref:`above <browse-hierarchy-list>`


:ref:`Back to top <browse>`

.. _browse-authority-records:

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
which for :term:`authority records <authority record>` includes language,
:term:`entity` type (Person, Family or Corporate body),
:ref:`Maintaining repository <link-repo-actor>`, and
:ref:`Occupation <authority-access-points>`.

The authority record browse page also includes a dedicated search box - for
more information on searching for authority records in AtoM, see:
:ref:`Authority record search <dedicated-search-authority>`. For general
information on working with authority records, see: :ref:`authority-records`.

.. SEEALSO::

   * :ref:`link-repo-actor`
   * :ref:`authority-access-points`
   * :ref:`recurring-facet-filters`

.. _browse-institutions:

|repoicon| Browse archival institutions
---------------------------------------

In :term:`multi-repository installations <multi-repository system>` users can
browse a list of archival institutions represented in the database.

Click the Browse menu, then click Archival Institutions.

.. image:: images/browse-institutions.*
   :align: center
   :width: 80%
   :alt: View of browsing archival institutions, card view

There are 2 ways of viewing the browse page for institutions - the "card"
view, pictured above, or the "table" view:

.. image:: images/browse-institutions-table.*
   :align: center
   :width: 80%
   :alt: View of browsing archival institutions, table view

In the table view, the columns that appear as blue hyperlinks (the Name,
Region, and Locality columnns) can be clicked to sort the results
alphabetically by that column. Click the column header once to sort in
descending (A-Z) order; click again to sort in ascending (Z-A) order.

Users can flip between the table and card views while browsing, using the
view toggle button that appears to the right of the archival institution search box:

.. image:: images/view-toggle-repository.*
   :align: center
   :width: 80%
   :alt: An image of the view toggle button on the repository browse page

.. TIP::

   An :term:`administrator` can set the default view for the archival
   institution browse page, in |gears| **Admin > Settings > Global**. For more
   information, see: :ref:`default-repo-view`.

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
   users, in |gears| **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`.

Users can narrow the results list using the available
:term:`facet filters <facet filter>` on the left-hand side of the screen. For
more information on using the facet filters in AtoM, see:
:ref:`recurring-facet-filters`; especially
:ref:`Using facet filters in AtoM <using-facet-filters>`.

The archival institution browse page also includes a
:term:`dedicated search box`, and further filters available under the
"Advanced" button that appears below the search box. For more information on
searching for archival institutions in AtoM, see: :ref:`Archival institution search
<dedicated-search-institutions>`. For general information on working with
:term:`archival institution` records, see: :ref:`archival-institutions`.

.. _browse-holdings:

Browse the holdings of an institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
When a user clicks on a result in the :term:`archival institution` browse page,
they are taken to the :term:`view page` for the selected repository.

This view page includes a list of :term:`holdings` - :term:`archival descriptions
<archival description>` that have been linked to the current repository. For
more information on linking a description to an archival institution, see:
:ref:`link-archival-institution`.

.. TIP::

   When linking a repository to an archival description, link only at the top
   level of description - AtoM will automatically inherit the repository to
   lower levels of description (e.g. :term:`children <child record>`). If you
   link at all levels, it can not only impact performance, but it will also mean
   that each lower-level description will appear in the holdings list, instead
   of just the :term:`parent <parent record>` description.

.. image:: images/holdings-list.*
   :align: center
   :width: 35%
   :alt: An image of the archival institution holdings list

The holdings list can be used to browse the :term:`holdings` of a particular
:term:`archival institution`, which can be especially useful in a multi-repository
AtoM instance, such as a union catalogue, portal site, or network. It appears
in the left-hand :term:`context menu` of the :term:`view page` for an archival
institution, beneath the logo.

The **search box** on the holdings list will search all indexed fields in all
descriptions related to the archival institution. When used, it will take the
user to a full search results page, limited to the current institution (as
indicated by the :term:`filter tag` at the top of the search results).

.. image:: images/holdings-search-result.*
   :align: center
   :width: 80%
   :alt: An example of a results page from a search using the holdings search box

See :ref:`search-archival-descriptions` for more information on using the search
results page.

Below the search box, is a **holdings browse link**, that lists the total number
of holdings (e.g. top-level descriptions linked to the repository). Clicking on
this link will take a user to a browse page limited to the current repository,
and filtered to display only top-level descriptions. Users can remove these
filters by clicking the **X** next to the :term:`filter tag` to broaden the
results.  See :ref:`browse-descriptions` above for more information on browsing
:term:`archival descriptions <archival description>` in AtoM.

Below the search box and holdings browse link, an alphabetized **holdings list**
appears. The list consists of hyperlinks - clicking on one will take the user
to the related description. The number of results in this list per page is
controlled by the "results per page" setting found in **Admin > Settings > Global**.
See: :ref:`results-page` for information on changing this value. The default value
in AtoM is 10 results per page.

A **holdings count** appears under the holdings list, which includes the number
of results per page, and the total - e.g. *Results 1 to 10 of 45,* etc.

If there are more holdings than the number of results per page, a **pager**
will be included below. Click the **<-** back and forward **->** arrows to move
through the pages. The current page number is listed between the navigation
arrows. For large results sets, you can also manually enter a number into the
current page number box - the holdings list will jump to the appropriate page.
Any invalid numbers (e.g. entering 1000 when there are only 10 pages) will be
ignored, and after a moment, AtoM will replace the value with the current page
number.

.. SEEALSO::

   * :ref:`browse-descriptions`
   * :ref:`search-archival-descriptions`
   * :ref:`recurring-facet-filters`
   * :ref:`archival-institutions`

.. _browse-scoped-holdings:

Browse institution holdings when Institutional scoping is enabled
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

AtoM includes an additional mode that can be enabled by an :term:`administrator`
via |gears| **Admin > Settings > Global** called :ref:`enable-scoping`. When
institutional scoping is turned on, additional visual cues and user interface
elements are added to better support searching and browsing within the holdings
of one :term:`archival institution` when used in a :term:`multi-repository system`.
The most prominent of these changes in the :term:`user interface` is the addition
of the :term:`institution block`, comprised of the :term:`repository` logo,
as well a dedicated search box and browse menu that will both return results
linked to the current archival institution.

.. image:: images/scoping-comparison.*
   :align: center
   :width: 90%
   :alt: An comparison of the repository view page with and without
         institutional scoping

The **holdings list** behaves the same as before (see above,
:ref:`browse-holdings`, for more information on how to use the holdings list).
However, if you click on the **holdings browse link**, then the institution block
will also appear on the browse page, offering an additional visual cue that you
are viewing only the holdings of a particular institution.

.. image:: images/scoped-results.*
   :align: center
   :width: 90%
   :alt: An image of an archival description browse page, limited to the holdings
         of a particular repository, with insittutional scoping enabled.

You can remove the institutional scoping and see all global browse results a
number of different ways:

* By clicking the **X** on the :term:`filter tag` for the repository at the top
  of the browse results - this removes the repository filter. AtoM will reload
  the Browse page without the :term:`institution block` and show all results.
* By clicking the "All" link in the Archival institution :term:`facet filter` -
  this also removes the repository filter. AtoM will reload the Browse page
  without the :term:`institution block` and show all results.
* By using the :term:`browse menu` located in the AtoM :term:`header bar` at the
  top of the page and selecting **Browse > Archival descriptions**.
* By performing a search via the global :term:`search box` in the AtoM
  :term:`header bar` at the top of the page. AtoM will return global results from
  all repositories when the global search box is used.

For more information on using the elements of the archival description browse
page, see: :ref:`Browse archival descriptions <browse-descriptions>`.

Additionally, the :term:`institution block` introduces a dedicated browse menu
for the holdings of the :term:`archival institution`. The links in this menu
will take users to browse pages that are already limited to the :term:`holdings`
of the current :term:`repository`.

.. image:: images/scoped-browse-menu.*
   :align: center
   :width: 35%
   :alt: An image of an institution block with the browse menu open

If you follow these links, the institution block will remain visible on the
related browse page, and if a background color has been applied to the institution,
it will also be present on the browse page.

.. TIP::

   For more information on applying a custom background color, uploading a custom
   repository logo, and other aspects of archival institution theming, see:

   * :ref:`edit-institution-theme`

Institution scoping can again be removed at any time from these browse pages
using the methods described above.

.. SEEALSO::

   * :ref:`enable-scoping`
   * :ref:`browse-descriptions`
   * :ref:`search-archival-descriptions`
   * :ref:`recurring-facet-filters`
   * :ref:`archival-institutions`

.. _browse-maintained-actors:

Browse the authority records of an institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If an institution has linked its authority records (indicating that it is the
institution responsible for maintaining them), then a list, similar to the
:ref:`holdings list <browse-holdings>`, will appear on the archival
institution :term:`view page`. For more information on linking an authority
record to a repository, see: :ref:`link-repo-actor`.

The maintained authority records list can be used to browse the
:term:`authority records <authority record>` of a particular
:term:`archival institution`, which can be especially useful in a multi-repository
AtoM instance, such as a union catalogue, portal site, or network. It appears
in the left-hand :term:`context menu` of the :term:`view page` for an archival
institution, beneath the logo and the holdings list.

.. figure:: images/maintained-auth-list.*
   :align: center
   :figwidth: 30%
   :width: 100%
   :alt: An image of list of maintained authority records on an archival
         institution's view page

At the top of the maintained list is a **browse link**, that lists
the total number of authority records maintained by the repository. Clicking
on this link will take a user to an authority record browse page limited to
the current repository. See :ref:`browse-authority-records` for more
information on browsing.

Below the browse link, an alphabetized list of authority records appears. The
list consists of hyperlinks - clicking on one will take the user to the related
authority record. The number of results in this list per page is controlled by
the "results per page" setting found in **Admin > Settings > Global**.
See: :ref:`results-page` for information on changing this value. The default
value in AtoM is 10 results per page.

A **count** appears under the maintained authority records list, which
includes the number of results per page, and the total - e.g.
*Results 1 to 10 of 45,* etc.

If there are more maintained authority records  than the number of results per
page, a **pager** will be included below. Click the **<-** back and forward
**->** arrows to move through the pages. The current page number is listed
between the navigation arrows. For large results sets, you can also manually
enter a number into the current page number box - the list will jump to the
appropriate page. Any invalid numbers (e.g. entering 1000 when there
are only 10 pages) will be ignored, and after a moment, AtoM will replace the
value with the current page number.


.. SEEALSO::

   * :ref:`browse-authority-records`
   * :ref:`recurring-facet-filters`
   * :ref:`archival-institutions`
   * :ref:`authority-records`

:ref:`Back to top <browse>`

.. _browse-subjects-places:

|subjecticon| Browse subjects and places |placeicon|
----------------------------------------------------

Subjects and Places are two different kinds of :term:`terms <term>`, which are
managed via :term:`taxonomies <taxonomy>`. Subjects and Places, however, can also
be used as :term:`access points <access point>` associated with
:term:`archival descriptions <archival description>` and 
:term:`authority records <authority record>`, and public users can browse terms 
and view :term:`published <published record>` descriptions and/or authority 
records associated with those terms as access points.

To do so, click the :term:`Browse menu`, then click either Subjects or Places.
The following images and instructions will use examples from the Places browse
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
3. The number of descriptions and authority records associated with a particular 
   term as an :term:`access point` are listed in the *Archival description 
   count* and *Authority record count* columns.
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
redirect you to a term view page, described below.

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
   see the :ref:`context-menu-terms` entry on the Context menu page. Note that 
   for the Results count, this is :term:`entity` specific - in the example 
   shown here, it is showing the count of related :term:`archival description` 
   records, since the results tab (described below in 8) is currently on
   the description results. A separate count for related :term:`authority record` 
   results will be shown when the tab is changed. 
4. A :term:`treeview` for navigating hierarchically organized terms is included in
   the left-hand context menu. Details on its features and uses are described
   here: :ref:`Terms treeview <context-menu-terms-treeview>`.
5. Information about the current term is displayed in the top portion of the
   page's main column. This information is stored with the term in its taxonomy,
   and can be edited by authenticated (i.e. logged in) users with edit rights. For
   more information on the fields available and their uses, see:
   :ref:`term-data-entry`.
6. Below the :term:`treeview`, additional :term:`facet filters <facet filter>` that
   can be applied to the browse results are listed, if available. For more 
   information on using facet filters in AtoM, see: :ref:`recurring-facet-filters`.
7. If a user is authenticated (i.e. logged in) and has edit permissions, a
   :term:`button block` will be visible on the page, allowing the user to edit,
   delete, or add new terms. For more general information on working with terms
   in AtoM, see: :ref:`terms`, and especially :ref:`term-data-entry`. Public
   users who are not logged in will not see the button block.
8. At the top of the page, result tabs will be available, showing a count
   of related :term:`archival descriptions <archival description>` and 
   :term:`authority records <authority record>`, where the current term has 
   been used as an :term:`access point`. The related results for the currently
   selected tab are shown further below (see 9). Click the tabs to show the 
   related results for each :term:`entity` type.
9. Below the term information, results that are linked to the current term as
   :term:`access points <access point>` are displayed. Clicking on a related result 
   will redirect the user to the :term:`view page` for that record. Note that 
   while access points can be linked to both authority records and descriptions, 
   only one :term:`entity` type is shown at a time. Use the result tabs at the 
   top of the page (described above in 8) to switch between the different result 
   types.

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

.. SEEALSO::

   * :ref:`terms`
   * :ref:`recurring-page-elements`
   * :ref:`recurring-facet-filters`
   * :ref:`Searching for terms <dedicated-search-terms>`

.. _browse-digital-objects:

|digicon| Browse digital objects
--------------------------------

Click the Browse menu, then click Digital Objects.

.. image:: images/browse-digital-objects.*
   :align: center
   :width: 80%
   :alt: View of browsing all digital objects.

AtoM will display all of the digital objects in the database. By default, AtoM
will display 10 results per page; if there are more than 10
digital objects, a pager will be provided at the bottom of the results.

.. TIP::

   :term:`Administrators <administrator>` can change the default number of
   results returned per page in **Admin > Settings > Global**. For more
   information, see: :ref:`results-page`.

Users can filter the results by :term:`media type` by clicking open the "Media
type" :term:`facet <facet filter>` in the left-hand facet column and
selecting a specific media type - default types in AtoM are audio, image,
text, video, and other.

.. image:: images/digital-object-browse-button.*
   :align: center
   :width: 80%
   :alt: The media type facet in AtoM's search and browse pages

.. NOTE::

   Facets will not be displayed if there is only 1 or 0 results - so for example,
   if there are only images returned, then the Media type facet will not be
   displayed.

The automatic sort of the results is alphabetic (title) for unauthenticated
(e.g. not logged in) users, which can be changed by the user to various other
sort options via the :ref:`recurring-sort-button` at the top right of the page.

.. TIP::

   :term:`Administrators <administrator>` can change the default sort order
   on search/browse pages for both public and authenticated (i.e. logged in)
   users, in **Admin > Settings > Global**. For more information, see:
   :ref:`sort-browser-users` and :ref:`sort-browser-anonymous`. For more
   information on the sort button in general, see:
   :ref:`recurring-sort-button`.

The view of the results can be toggled from the default "card" based view of
the Digital object browse page to a "list" view like that found on the
:term:`archival description` browse page:

.. image:: images/browse-view-toggle.*
   :align: center
   :width: 80%
   :alt: The view toggle button on the Description browse page

Users can also use the other facets and filters available in the
:ref:`recurring-facet-filters` and the :ref:`advanced-search` panel to furthe
narrow results.

.. SEEALSO::

   * :ref:`search-atom`
   * :ref:`advanced-search`
   * :ref:`recurring-facet-filters`
   * :ref:`upload-digital-object`

.. _browse-functions:

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

.. SEEALSO::

   * :ref:`functions`
   * :ref:`dedicated-search-functions`
   * :ref:`recurring-sort-button`

.. _browse-authenticated:

Browsing for authenticated users
================================

Authenticated (logged-in) users have access to browsing lists of accession
records, donors, rights holders, and physical storage locations.

For information on physical storage, see: :ref:`browse-physical-storage`.

**Jump to:**

* :ref:`browse-accessions`
* :ref:`browse-donors`
* :ref:`browse-rights-holders`

:ref:`Back to top <browse>`

.. _browse-accessions:

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

.. _browse-donors:

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

.. _browse-rights-holders:

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
