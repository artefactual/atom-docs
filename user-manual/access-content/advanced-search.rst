.. _advanced-search:

===============
Advanced search
===============

.. |gears| image:: images/gears.png
   :height: 18

In addition to AtoM's general :term:`search box` (located in the AtoM
:term:`header bar`), AtoM also includes a robust advanced search interface
that allows user to build complex queries via the :term:`user interface`.
A number of filters have been included to narrow the search parameters, while
complex :term:`boolean search` queries using AND, OR, and NOT statements can
be built with the addition of search :term:`fields <field>`. The advanced search
interface is available to all users - i.e. you do not have to be logged in to
the application to access it. Note that it is designed to be used to search
for :term:`archival descriptions <archival description>` - please see the
sections on AtoM's :ref:`dedicated search boxes <dedicated-search>` and
:ref:`search-typeahead` for information on searching for different
:term:`entity` or record types.

This section will instruct you how to use AtoM's advanced search interface;
additionally, it will outline methods that are available in the general
:term:`search box` to perform advanced searches, using :term:`boolean search`
operators and special characters.

.. IMPORTANT::

   At this time, the Advanced search interface can only be used to search for
   :term:`archival descriptions <archival description>`. To search for other
   :term:`entity` types in AtoM (e.g.
   :term:`authority records <authority record>`, etc.), please use the
   Dedicated search boxes provided in the relevant page - for more
   information, see: :ref:`dedicated-search`.

   Note that you **can** get some results for other entities in the Global
   search box typeahead - for more information, see: :ref:`search-typeahead`.

More information on how AtoM default search behaviors are configured, a list
of fields, as well as tips and tricks on how to target specific fields, can be
found in :ref:`advanced-search-via-searchbox` and :ref:`es-fields-atom`.

**Jump to:**

* :ref:`advanced-search-interface`

  * :ref:`date-range-search`

* :ref:`advanced-search-via-searchbox`
* :ref:`es-fields-atom`
* :ref:`csv-export-search-2`

.. SEEALSO::

   * :ref:`search-atom`
   * :ref:`browse`
   * :ref:`navigate`
   * :ref:`archival-descriptions`
   * :ref:`csv-export-search`

.. _advanced-search-interface:

The Advanced search panel
=========================

This section will outline how to use AtoM's advanced search interface. The
advanced search interface is used to find descriptions in AtoM that contain text
matching a search query. The :term:`advanced search panel` is available on all
:term:`archival description` search and browse pages, at the top of the
results - click on the panel header to expand or collapse it:

.. image:: images/advancedsearch-panel.*
   :align: center
   :width: 70%
   :alt: An image of the advanced search panel, collapsed. Click to expand.

Users can also go directly to the search page with the advanced search
panel expanded by using the "Advanced search" hyperlink available in the
:term:`drop-down menu` that appears when a user places the cursor in the
:term:`search box` located in the AtoM :term:`header bar`.

In the advanced search panel, a user can select "and, or, not" operators to
build powerful :term:`Boolean search` queries, limit search terms to specific
:term:`archival description` fields, and/or apply a number of different
filters to limit or narrow the results returned along specific criteria, all
via a friendly :term:`user interface`.

**To search for archival descriptions using the advanced search panel:**

1. Place your cursor in the :term:`search box` located in the AtoM
   :term:`header bar`. A :term:`drop-down menu` will appear below the search
   box - to access the advanced search interface, click on the "Advanced
   search" link in the drop-down menu.

   .. image:: images/searchbox-dropdown.*
      :align: center
      :width: 70%
      :alt: An image of the drop-down beneath the search box

   Alternatively, you can use the :term:`Browse menu` to navigate to **Browse
   > Archival descriptions**, and then click on the Advanced search panel to
   expand it.

.. IMPORTANT::

   The advanced search options described here apply **only** to searches for
   :term:`archival descriptions <archival description>` - the advanced search
   interface returns archival description results by default. To search for
   other :term:`entity` or record types, see the sections on
   :ref:`search-typeahead` and on the :ref:`dedicated-search` available in the
   :ref:`search-atom` section.

2. AtoM will redirect you to the advanced search screen:

.. image:: images/advanced-search.*
   :align: center
   :width: 70%
   :alt: An image of the advanced search panel

3. To begin searching, enter a search term into the first search field at the
   top of the Advanced search panel, under the heading, "Find results
   with":

.. image:: images/advancedsearch-start.*
   :align: center
   :width: 70%
   :alt: An image of a user entering data in the main search field of the
         advanced search panel

4. Use the drop-down menu to limit your search query to a specific
   :term:`field` in the :term:`archival description` templates. The default
   setting is to search any field. Options include:

   * Title
   * Archival history
   * Scope and content
   * Extent and medium
   * :term:`Subject` access points
   * :term:`Name` access points
   * :term:`Place` access points
   * Genre access points
   * Identifier
   * :term:`Reference code`
   * Digital object text (i.e. text extracted from uploads such as PDFs and
     documents)
   * :ref:`Finding aid <print-finding-aids>` text
   * :term:`Creator`
   * Any field except finding aid text

.. image:: images/advancedsearch-fields.*
   :align: center
   :width: 80%
   :alt: An image of the targeted fields available in the advanced search panel

.. NOTE::

   The labels in the field :term:`drop-down menu` available in the advanced
   search interface are based on the labels used in the International Council
   on Archives (`ICA <http://www.ica.org/>`__) ISAD(G) standard. For more
   information on ISAD(G), see: :ref:`isad-template`. In other edit templates,
   labels may appear differently - for example, "Archival history" is known as
   "Custodial history" in the :ref:`RAD <rad-template>` edit template, while
   "Extent and medium" is simply called "Extent" in the
   :ref:`DACS <dacs-template>`. However, search results for each field will be
   returned regardless of the template used for display.

5. Use the "Add new criteria" button to build multi-part queries with
   :term:`Boolean search` operators via the :term:`user interface` - by using
   these operators, you can narrow your search, combine terms, or exclude
   terms. AtoM will add a new set of fields below, into which you can enter your
   terms - repeat steps 3-5 as necessary. You can use the **X** to the right
   of the fields to remove a row of fields from your Boolean query if needed.

.. image:: images/advancedsearch-andornot.*
   :align: center
   :width: 80%
   :alt: An image of a user adding search fields using the "Add new criteria"
         button in the Advanced search interface

* Use **AND** to combine search terms to narrow your search: e.g. search
  *vancouver* AND *"city hall"* to return only descriptions that contain both
  search terms
* Use **OR** to to combine search terms to broaden your search: e.g. search
  *vancouver* OR *"city hall"* to return descriptions that contain either
  search term
* Use **AND NOT** to exclude terms: e.g. search *vancouver* AND NOT
  *"city hall"* to return descriptions that include *vancouver* but do not
  contain the phrase "*city hall*"

.. image:: images/advancedsearch-newfields.*
   :align: center
   :width: 80%
   :alt: An image of a user adding search fields using the "Add new criteria"
         button in the Advanced search interface

6. The filters available under the "Limit results to:" section of the Advanced
   search panel will allow you to limit the results to a specific
   :term:`repository` or :term:`archival unit`.

   .. image:: images/advancedsearch-limits.*
      :align: center
      :width: 80%
      :alt: An image of the advanced search limiters

   * **Repository**: Limit the search to the :term:`holdings` of a specific
     :term:`archival institution`. The :term:`drop-down menu` will be
     populated by all of the archival institution records in AtoM. Select the
     :term:`repository` or archival institution you wish from the drop-down;
     when you submit your query, results returned will only include those
     associated with the selected repository.
   * **Top-level description**: This is an auto-complete field that will
     populate with all of the top-level descriptions held in AtoM (generally,
     :term:`fonds` and :term:`collections <collection>`, but if a series or
     another level is set as the top level of a descriptive hierarchy, it will
     be available in the list). Begin typing the title of a top-level
     description, and the auto-complete will populate the :term:`drop-down menu`
     with matching selections. Click on one to select it - search results will
     be limited to :term:`archival descriptions <archival description>` found
     within the chosen top-level description's descendants - i.e.
     :term:`children <child record>`.

7. In the section below that, labelled "Filter results by:", you can also add
   filters to your search to limit the results returned to specific parameters.
   The functions of each search filter are outlined below:

.. NOTE::

   An :term:`administrator` can control the visibility of some advanced search
   filters via the Default page elements settings. Depending on your settings,
   some fields described below may be hidden in your AtoM installation. For
   more information, see: :ref:`default-page-elements`.

.. image:: images/advancedsearch-filters.*
   :align: center
   :width: 80%
   :alt: An image of the advanced search filters

* **Level of description**: This filter will limit the returned search
  results to a specific :term:`level of description`.
* **Digital object available**: Use this filter to determine if a the search
  results returned include :term:`digital objects <digital object>` (e.g.
  images, audio or video files, text documents, etc.), or by selecting "No",
  include only results without digital objects.

.. TIP::

   If there are digital objects available in your results, you can then use
   the "Media type" :term:`facet <facet filter>` to further limit the results
   by media type - e.g. Video, Audio, Image, Text, or Other. For more
   information on using Facet filters in AtoM, see:

   * :ref:`Facet filters in AtoM (overview) <recurring-facet-filters>`
   * :ref:`facets-by-record-type`
   * :ref:`using-facet-filters`

* **Finding aid**: AtoM includes the ability for users to either upload a
  finding aid, or generate one from the full hierarchy of an
  :term:`archival unit` - for more information, see:
  :ref:`print-finding-aids`. The options available in this filter include:

    * *Yes*: Return only matching descriptions that have a finding aid. It
      doesn't matter if the finding aid is generated from a description or
      uploaded.
    * *No*: Return only matching descriptions that *do not* have a finding
      aid.
    * *Generated*: Return only matching descriptions that have a finding aid
      generated from the existing archival description hierarchy.
    * *Uploaded*: Return only matching descriptions that have an uploaded
      finding aid.

* **Copyright status**: AtoM :term:`archival description` templates include a
  the ability to add Rights statements, drawn from elements of the
  `PREMIS <http://www.loc.gov/standards/premis/>`__
  (Preservation Medata: Impmlementation Strategies) metadata standard
  maintained by the U.S. Library of Congress. Through this module, a user can
  add a copyright status to an archival description (with values including
  Public Domain, Under copyright, or Unknown). This filter will limit search
  results to those descriptions where a PREMIS Rights copyright status has
  been added matching the selection in the filter's :term:`drop-down menu`.
  For more information, see: :ref:`rights`.
* **General material designation**: This is a filter that is particular to a
  controlled field found within the :ref:`RAD template <rad-template>` for
  archival descriptions - it is a controlled vocabulary drawn directly from
  the Canadian Rules for Archival Description, and managed in one of AtoM's
  :term:`taxnomies <taxonomy>` and used to define the type of material found
  within an :term:`archival unit`. Select a GMD term from the
  :term:`drop-down menu` to limit search results to descriptions that have
  been been marked with the matching GMD value.

8. Finally, the last section, labelled "Filter by date range:", will allow you
   to search against the internal StartDate and EndDate values of of creation
   events associated with an :term:`archival description`. For more
   information on using the date range search in AtoM, see below,
   :ref:`date-range-search`.

9. If you wish to restart your search and quickly clear all filters and
   boolean fields, you can use the "Reset" button located at the bottom of the
   Advanced search panel. AtoM will reload the page, with all filters and
   parameters removed.

10. When you have entered all of your search parameters, click the "Search"
    button in the :term:`button block` at the bottom of the Advanced search
    panel to view the results of your search query. AtoM will reload
    the page, with a count of results above the Advanced search panel,
    and the results listed below. Results will appear in order of relevance
    below the button block. If there are more than 10 results, a pager will be
    included at the bottom of the results page. Remember, you can click on the
    header of the :term:`Advanced search panel` to collapse it out of view
    while you browse the results.

.. NOTE::

   An :term:`administrator` can set the default number of results per page
   throughout the application via |gears| **Admin > Settings**. For more
   information, see: :ref:`results-page`.

11. Click on the blue titles of the results stubs to navigate to that result's
    specific page. Navigating back will bring you back to your original list
    of results; however, navigating to the "Advanced search" page from the
    :term:`search box` will require you to restart your search from the
    beginning.

12. Your search can be modified at any time and the results refrehsed
    accordingly by simply changing the required search terms and
    :term:`fields <field>`, and clicking "Search" once again. You can also
    restart your search at any time; simply click the "Reset" button in the
    :term:`button block` of the :term:`Advanced search panel`.

.. _date-range-search:

Date range search filter
------------------------

.. image:: images/date-range-search.*
   :align: center
   :width: 90%
   :alt: An image of the date range search filters

The date range search allows users to search for any records whose active
dates (e.g. dates of creation, accumulation, etc.) either overlap, or fall
exactly within, a selected range. AtoM expects ISO 8601 formatted date values
for searching - i.e. YYYY-MM-DD. Note that the fields include calendar widgets,
to provide users with a graphical interface for date selection if desired -
alternatively, you can manually enter your range directly into the text field.
Whenever only YYYY values are entered, AtoM will automatically add -01-01 to
values in the Start date field, and -12-31 to values in the End date field.

.. IMPORTANT::

   When searching for a date range, AtoM searches against the values in
   internal, `ISO-8601 <https://en.wikipedia.org/wiki/ISO_8601>`__ ``startDate``
   and ``endDate`` fields - those hidden from users, and formatted as
   YYYY-MM-DD, YYYY-MM, or YYYY. This is not to be confused with the **Display
   date** field, which is shown to public users, and allows you to use
   typographical marks to express approximation or uncertainty:

   .. image:: images/date-range-search-fields-used.*
      :align: center
      :width: 90%
      :alt: An illustration of the different date fields and their uses

   This means, if you have NOT included internal start and end date values,
   then your description(s) will not be returned when performing a date range
   search!

There are 2 ways of searching dates, represented by the :term:`radio button`
options in the Date range search interface - "Overlapping" (which is the
default), and "Exact."

The **Overlapping** option is a broadly inclusive search: any records whose
dates overlap the user input range will be returned. For example, a search for
a range from 1950-1970 would return descriptions with the following dates:

* 1945 - 1990
* 1945 - 1950
* 1970 - 1990
* 1955 - 1965
* 1955 - (no end date)
* (no start date) - 1980

The **Exact** option means that records must fall exactly within the specified
parameters to be returned as a result. A search for 1950-1970 using the
"Exact" option would not return any of the results listed above - but its
results returned might include values such as:

* 1950 - 1955
* 1952 - 1969
* 1950 - 1970
* 1964 - 1969
* 1968 - 1970

To better clarify these options, some example diagrams have been included
below to indicate the difference, illustrating how each option behaves for
closed ranges (both start and end date included), and open ranges (where
either a start or end date is included, and the second date is left blank). In
the following images, results in green will be returned by the search query;
results in red will be excluded from the results:

.. _date-search-closed-example:

Closed range example
^^^^^^^^^^^^^^^^^^^^

**Overlapping**:

.. image:: images/2.3-advanced-date-search-1-OVERLAP.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950-1970 query using the
         Overlap option

**Exact**:

.. image:: images/2.3-advanced-date-search-1-EXACT.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950-1970 query using the Exact
         option

As you can see, the "Overlapping" option is very inclusive, while the "Exact"
option is much more strict in terms of the results returned.

.. _date-search-open-end-example:

Open end date example
^^^^^^^^^^^^^^^^^^^^^

You can also input only a start date, or an end date, into the date range
search if desired. If a user gives **just a start date**, it is interpreted to
mean 'filter to records that were active after this date' - in other words,
'end date of record **>** user supplied start date.'

**Overlapping**:

.. image:: images/2.3-advanced-date-search-2-startDate-OVERLAP.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950 start date query using the
         Overlapping option

When the "Overlapping" option is used, records which start before the
specified start date will be included if their date range extends into the
specified parameter.

**Exact**:

.. image:: images/2.3-advanced-date-search-2-startDate-EXACT.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950 start date query using the
         Exact option

When the "Exact" option is used, records starting before the specified start
date range are excluded.

.. _date-search-open-start-example:

Open start date example
^^^^^^^^^^^^^^^^^^^^^^^

If the user gives **just an end date**, it means 'filter to records that were
active before this date' - in other words, 'start date of record **<** user
supplied end date.'

**Overlapping**

.. image:: images/2.3-advanced-date-search-3-endDate-OVERLAP.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1970 end date query with the
         Overlap option used

When the "Overlapping" option is used for search with a specified end date but
no start date, records whose ranges extend beyond the specified range may be
included, if their start dates extend into the specified range.

**Exact**

.. image:: images/2.3-advanced-date-search-3-endDate-EXACT.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1970 end date query with the
         Exact option used

When the "Exact" option is used, any record whose end date falls outside of
the specified parameter will be excluded.

.. _using-date-range:

Using the date range search filter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When you place the cursor in the start date or end date fields of the date
range search, a calendar :term:`drop-down menu` will appear. This "datepicker"
offers a graphical user interface for selecting the date, if desired.

.. image:: images/date-range-calendar.*
   :align: center
   :width: 80%
   :alt: An example of calendar widget dropdown in the date range fields

Click on a day in the calendar to select that as your start or end date. You
can also navigate through the months using the black forward and back buttons.

The month and year can also be adjusted via the two drop-down menus:

.. image:: images/date-range-calendar-dropdown.*
   :align: center
   :width: 80%
   :alt: An example of calendar widget dropdown menus in the date range fields

Alternatively, you can also ignore the calendar widget, and simply enter a
date directly into the text field. AtoM expects the dates to be formatted as
**YYYY** or **YYYY-MM-DD**. If you enter only the year, then AtoM will add
-01-01 to start dates and -12-31 to end dates when the search query is
submitted - for example, if you search for 1950 - 1970, AtoM will submit the
query as 1950-01-01 (January 01, 1950) to 1970-12-31 (December 31, 1970).
You can also specify an open range, by entering just a start date or just an
end date.

.. NOTE::

   If you enter the dates in the wrong format, such as **YYYY-MM**, your
   search will return no results! In this case, AtoM will provide a warning
   above the date range fields:

   .. image:: images/date-range-error.*
      :align: center
      :width: 80%
      :alt: An example of improper dates entered into the Date range widget

Once you have entered your desired date range, use the :term:`radio button`
options to the right of the input fields to specify how the date range should
be performed. "Exact" means that the start and end dates of descriptions
returned must fall entirely within the date range entered, while "Overlapping"
is much more inclusive, and any description whose start or end dates touch or
overlap the target date range will be returned. See above for an illustration
of the differences between Overlapping and Exact when returning results for:

* :ref:`Closed range (start and end date) <date-search-closed-example>`
* :ref:`Open range (no end date) <date-search-open-end-example>`
* :ref:`Open range (no start date) <date-search-open-start-example>`

If you click the **(?)** Help icon, a :term:`tooltip <tooltips>` will appear
below the fields with a brief explanation of the difference between
"Overlapping" and "Exact."

.. image:: images/date-range-help.*
   :align: center
   :width: 80%
   :alt: An image of help tooltip in the date range fields

When you have entered all desired parameters, use the "Search" button to
submit your query. Remember, you can also use other Advanced search filters or
:term:`facets <facet filter>` to further refine your search!

:ref:`Back to top <advanced-search>`

.. _advanced-search-via-searchbox:

Advanced search using the AtoM Search box
==========================================

AtoM implements `Elasticsearch <http://www.elasticsearch.org/>`__, a distributed
search server based on Apache Lucene, which acts as the application's search
and analytic engine. Elasticsearch is not integrated directly into AtoM code
as a library, but as a service deployed in the same network which AtoM
interacts with through a
`REST <https://en.wikipedia.org/wiki/Representational_State_Transfer>`__ ful
`API <https://en.wikipedia.org/wiki/API>`__.

This provides a number of options for advanced searching from within the
:term:`search box`. What follows is a description of the default search
behaviors in AtoM, a list of special characters that can be used as
:ref:`advanced-search-operators` in the AtoM :term:`search box`, and a list of
Elasticsearch fields and how expert users can use the ES field names to target
specific fields and construct complex queries.

.. _advanced-search-phrases:

Phrases
-------

By default in AtoM, the :term:`Boolean search` settings of AtoM are set to
use **AND** as the default operator when multiple search terms are entered.
This means that by default, a search for *city hall* will return results that
include "city" **AND** "hall" - however, the order of terms doesn't matter in
the results returned, and they may not necesarily appear together.

**To search for an exact phrase** in AtoM, use double quotes to contain the
terms you wish to search. For example, search *"city hall"* to return results
that contain both "city" and "hall" together in that exact order.

If you wish to use "OR" as the operator between terms, see the section below,
:ref:`advanced-search-operators`.

.. _search-field-weighting:

Result matches and field weighting
----------------------------------

Each time a search is submitted in AtoM, the terms of the search are tokenized
and results are ranked and ordered based on how relevant the match seems to
the original search query.

To improve the relevancy of search results, AtoM includes some basic weighting
added to certain :term:`fields <field>`, so that when a search term matches
the data in one of these weighted fields, it is boosted and returned
higher in the list of matching results.

For example, if you search for the word ``Toronto``, then a record with
"Toronto" in the title will be returned higher in the list of results than one
that only has the word in a notes field. Below is a breakdown of how
:term:`archival description` fields are weighted in AtoM - the greater the
weight, the more importance the match is considered and therefore the more it
is boosted in the returned results:

* **10x weight**: Title
* **6x weight**: Creator
* **5x weight**: Identifier, :term:`Subject` access point, Scope and content
* **3x weight**: Name :term:`access point`, :term:`Place` access point

Note that weighting in AtoM is **cumulative**, so a match in multiple weighted
fields will increase amount the record is boosted.

For example, if you searched for ``city hall 123``, this search would understood
as: look for archival descriptions that contain ``city`` AND ``hall`` AND
``123`` in any field. If I have a description that has an identifier of
"123," the word "city" in the title, and the word "hall" in the scope and
content field, this record would be given a weight of +20 - that is, +10 for
matching the word "city" in the title; +5 for matching 123 in the identifier,
and +5 for matching "hall" in the scope and content :term:`field`. However a
record with "city hall" in the title and 123 in the Scope and content might be
returned higher, as it would receive +10 for matching "city" in the title,
another +10 for matching "hall" in the title, and +5 for matching 123 in the
scope and content field.

Note that there are many complex factors that go into how search relevance is
determined and ranked in Elasticsearch, and it may not always be immediately
apparent why some records appear higher in the returned results than others.
For example, the number of other words in a given field will affect how
elasticsearch ranks the relevance. So a search for "photographs" might return
a result higher in the list that ONLY has the word photographs in the scope
and content, than one where the word "photograph" appears in a 20-word long
title - even though the added weights to the title field are technically
higher than those added to the scope and content field.


.. _advanced-search-operators:

Boolean operators
------------------

In AtoM, :term:`Boolean search` operators are supported in the :term:`search
box` and in the Adanced search menu. Boolean searching is a particular
application of what is known as Boolean logic, a subset of algebra used for
creating true/false statements. Since computers operate in binary (using ones
and zeroes), computer logic can often be expressed in boolen terms
(true/false). Boolean expressions use a number of operators, the most common
of which are **AND**, **OR**, and **AND NOT**. Using Boolean operators in
terms of search queries (i.e. Boolean search) allows a user to limit, widen, or
otherwise define a search in granular terms  - for example, searching "fonds OR
collection" would widen a search to include results that have either term.

Using the Boolean operators available in AtoM allows users to build complex
queries from anywhere in AtoM using the general :term:`search box` located in
the AtoM :term:`header bar`, without having to navigate to the Advanced
search interface.

.. image:: images/advanced-search-boolean.*
   :align: center
   :width: 70%
   :alt: An example of a user building a boolean query in the AtoM search box

.. TIP::

   By default in AtoM, the :term:`Boolean search` settings of AtoM are set to
   use **AND** as the default operator when multiple search terms are entered.
   This means that by default, a search for *chocolate cake* will return results
   that include "chocolate" **AND** "cake". If you want to broaden your search
   to return records that include either term, you must expclitly use the OR
   operator.

**Using Boolean operators in the AtoM search box:**

* Use **AND** to combine search terms to narrow your search: e.g. search
  ``vancouver AND "city hall"`` to return only descriptions that contain both
  search terms
* Use **OR** to to combine search terms to broaden your search: e.g. search
  ``vancouver OR "city hall"`` to return descriptions that contain either
  search term
* Use **AND NOT** to exclude terms: e.g. search ``vancouver AND NOT
  "city hall"`` to return descriptions that include *vancouver* but do not
  contain the phrase "*city hall*"

.. IMPORTANT::

   Boolean operators can be combined, but there is a default precedence built
   into how Elasticsearch handles them - NOT takes precedence over AND, which
   takes precedence over OR. If you wish to combine Boolean operators, you
   may want to use parentheses ( ) to group clauses. See the table below for
   more details on grouping, and other operators available.

**Other Boolean operators available in AtoM:**

+--------+-------------------------------------------------------------------+
| Symbol | Use                                                               |
+========+===================================================================+
| ``"``  | Term enclosed in quotes must appear exactly as provided. Example: |
|        | "towel" will find towel, but not towels.                          |
+--------+-------------------------------------------------------------------+
| ``+``  | Term after "+" must be in the result. Example: +tea cricket       |
|        | requires that results that must contain the term tea in them, and |
|        | may have the term cricket.                                        |
+--------+-------------------------------------------------------------------+
|  ``-`` | Term after "-" must not be in the result. Example: -tea cricket   |
|        | requires that results that must not contain the term tea in them, |
|        | and may have the term cricket.                                    |
+--------+-------------------------------------------------------------------+
|  ``?`` | Single character wildcard. Example: p?per will find paper and     |
|        | piper, but not pepper.                                            |
+--------+-------------------------------------------------------------------+
| ``*``  | Multiple character wildcard. Example: ``galax*`` will find galaxy |
|        | and galaxies, but not galactic.                                   |
|        |                                                                   |
+--------+-------------------------------------------------------------------+
|  ``~`` | Fuzzy search. Will return results with words similar to the term. |
|        | Example: fjord~ will find fjord, fjords, ford, form, fonds, etc.  |
+--------+-------------------------------------------------------------------+
| ``&&`` | Boolean operator. Can be used in place of AND. Will cause an      |
|        | error if combined with spelled-out operators. Example: Arthur &&  |
|        | Ford AND Zaphod will fail; Arthur && Ford && Zaphod will succeed. |
+--------+-------------------------------------------------------------------+
|  ``!`` | Boolean operator. Can be used in place of NOT. Will cause an      |
|        | error  if combined with spelled-out operators.                    |
+--------+-------------------------------------------------------------------+
|  ``^`` | Boost relevance. Multiplies the relevance of the preceding term   |
|        | by the number following the symbol, affecting the sorting of the  |
|        | search results. Example: paranoid android^5 gives results         |
|        | containing the term "android" 5x the relevance as results         |
|        | containing only the word "paranoid", and will sort them closer to |
|        | the start of the search results.                                  |
+--------+-------------------------------------------------------------------+
| ``\``  | Escapes the immediately following character, so that it is        |
|        | treated as text, rather than as a special character. For example, |
|        | to search for "(1+1):2", use the following: ``\(1\+1\)\:2``       |
+--------+-------------------------------------------------------------------+
| ``()`` | Used to group search clauses. This can be useful if you want to   |
|        | control the precedence of boolean operators for a query, e.g.     |
|        | (coffee NOT tea) OR cream will return different results than      |
|        | coffee NOT (tea OR cream). Without grouping, by default in        |
|        | Elasticsearch, NOT takes precedence over AND, which takes         |
|        | precedence over OR.                                               |
+--------+-------------------------------------------------------------------+
| ``[]`` | Closed interval range search. Example: ["Frogstar" TO             |
|        | "Magrathea"] will return results in the alphabetic range          |
|        | between "Frogstar" and "Magrathea", including"Frogstar" and       |
|        | "Magrathea".                                                      |
+--------+-------------------------------------------------------------------+
| ``{}`` | Open interval range search. Example: {"Frogstar" TO "Magrathea"}  |
|        | will return all results in the alphabetic range between           |
|        | "Frogstar" and "Magrathea", excluding"Frogstar" and "Magrathea".  |
+--------+-------------------------------------------------------------------+

For further examples of the use of these Boolean operators, users can consult
the `Zend Lucene search documentation <http://framework.zend.com/manual/1.12/en/zend.search.lucene.query-language.html>`__
as Elasticsearch is built on the same Apache Lucene base as the Zend
framework. Developers interested in fine-tuning these settings, or technical
users interested in how Elasticsearch operates may wish to consult the
`query string query <http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html>`__
Elasticsearch reference documentation for more information on Elasticsearch's
default behaviors, and possible configurations.

.. _es-fields-atom:

Expert searching and indexed Elasticsearch fields
=================================================

Below is a list of all indexed archival description field names as they are
found in Elasticsearch. Expert users can use the infomation below to target
search queries to specific indexed fields, and implement search parameters
otherwise not directly available via the :term:`user interface`.

.. SEEALSO::

   Where possible, lists of the Elasticsearch fields for other entities have
   been added to each relevant dedicated search section in the general
   :ref:`search-atom` documentation, as they must be used in the related
   dedicated search box. See:

   * :ref:`es-fields-actor`
   * :ref:`es-fields-accession`
   * :ref:`es-fields-repository`
   * :ref:`es-fields-term`

.. _es-fields-intro:

Introduction and basic usage
----------------------------

AtoM currently uses Elasticsearch version 1.7 - you can find the documentation
for AtoM's ES version here:

* https://www.elastic.co/guide/en/elasticsearch/reference/1.7/index.html

The index is organized hierarchically so that related elements are nested
within broader categories. These are expressed in the ES field names as
periods separating the name elements. For example, AtoM's :ref:`alternative
identifiers <add-alternative-id>` consist of 2 fields - a label and an
identifier value. In the ES index, these are expressed as:

.. code-block:: none

   alternativeIdentifiers.identifier
   alternativeIdentifiers.label

To use the Elasticsearch field names below as part of a query in the AtoM
:term:`user interface`, use the following basic syntax:

``field.name:searchterm`` OR ``field.name:"search term"``

Use quotes for search multiple terms in a specific field; quotes not necessary
when searching for a single term. For example, to search for an alternative
identifier value of 123, you could enter the following search term into the
AtoM :term:`search box`:

.. code-block:: none

   alternativeIdentifiers.identifier:123

But to search for an alternative identifier label called "Legacy call number,"
enter:

.. code-block:: none

   alternativeIdentifiers.label:"Legacy call number"

Because AtoM is a
:ref:`multilingual application <multilingual-design-principles>`, some
translatable fields are organized together under the common prefix of "i18n"
(a common abbreviation in multilingual application development, short for
internationalization). When searching these fields, the culture of your search
must be entered as part of the field name, because nested within each i18n
element of the index there will be a different term for each language.

In the full field list below, some fields listed include ``%LANG%`` - this is
a **placeholder** indicating that you must insert the specifc 2-letter ISO
language code for the culture you want to search in - e.g. ``en`` for English,
``fr`` for French, etc. For example, the Extent and medium field is listed
below as: ``i18n.%LANG%.extentAndMedium``.

Therefore, to search your English data for "linear feet" in the Extent and
medium field, you would enter the search term as follows:

.. code-block:: none

   i18n.en.extentAndMedium:"linear feet"

.. _es-empty-fields:

Searching for empty fields
--------------------------

You can perform a field-specific search for fields that do **not** have any
data added to them (i.e. which are empty) using ``_missing_``. The basic
structure of the syntax is like this:

.. code-block:: none

   _missing_:field.name

For example, to search for English archival descriptions with no data in the
scope and content, use the following as your query:
field:

.. code-block:: none

   _missing_:i18n.en.scopeAndContent

.. _es-populated-fields:

Searching for populated fields
------------------------------

Similarly, you can also perform a search that will return all records that
include data in a specific Elasticsearch field, without having to provide a
specific keyword as a parameter. The following syntax structure can be used to
return results that have data in the specified field:

.. code-block:: none

   _exists_:field.name

For example: to search for all English archival descriptions that have data in
the "Finding aids" field:

.. code-block:: none

   _exists_:i18n.en.findingAids


.. _es-created-modified:

Searching for recently created or modified descriptions
-------------------------------------------------------

First, remember that the "Most recent" option of the Sort button
found on the search/browse page will change the sort order of displayed
results so that those most recently created or modified are shown first - for
more information, see: :ref:`recurring-sort-button`. Additionally, an
:term:`administrator` can use the Description updates module to search for
either created or modified (or both) records withing a specific date range -
for more information, see: :ref:`search-updates`.

However,  there is a way to query the ES fields directly -  The 2 Elasticsearch
fields are called ``createdAt`` and ``updatedAt``. When a new record is created,
``createdAt`` and ``updatedAt`` are initially the same. After subsequent
edits, the ``createdAt``  will never change, while the ``updatedAt`` value is
updated to the most recent time. Here are some example queries, which can be
used in the AtoM global search box:

.. code-block:: none

   updatedAt:[2010-01-01 TO 2012-12-31]

This will return all records last modified between Jan 1 2010 and Dec 31 2012

.. code-block:: none

   updatedAt:[* TO 2012-01-01]

In this case, the asterix is a wildcard. This will return all records modified
before 2012-01-01. For more information on wildcards and other special
characters for Boolean searching, see above, :ref:`advanced-search-operators`.

.. code-block:: none

   createdAt:[2012-01-01 TO *]

This will return all records created after January 1, 2012.

.. _es-digital-objects:

Searching for digital objects
-----------------------------

The :term:`digital object` fields in the Elasticsearch index are:

.. code-block:: none

   digitalObject.filename
   digitalObject.mediaTypeId
   hasDigitalObject
   digitalObject.thumbnailPath
   transcript

``hasDigitalObject`` is a binary field - 1 = yes, 0 = no. For example:

.. code-block:: none

   hasDigitalObject:1

Will return results that have a digital object attached.

.. TIP::

   Note that "Has digital objects" is also a filter in the Advanced search
   panel available in the user interface. For more information, see above,
   :ref:`advanced-search-interface`.

the ``mediaTypeId`` is an internal ID number for different types of digital
objects. The default values used in AtoM for each media type are:

* Audio: 135
* Image: 136
* Text: 137
* Video: 138
* Other: 139

For example, to return results with a video linked:

.. code-block:: none

   digitalObject.mediaTypeId:138

.. TIP::

   Media Type is also a facet available in AtoM's search/browse. For more
   information on facets in AtoM, see: :ref:`recurring-facet-filters`.

The ``transcript`` is the indexed text captured from the text or OCR layer of
a PDF or other text-based document uploaded as a :term:`digital object`. Note
that the Advanced search panel has an option to limit a search to transcript
text. For more information, see above, :ref:`advanced-search-interface`.

.. _es-pub-status:

Publication status
------------------

AtoM includes a publication status for archival descriptions, that allows
users with sufficient :term:`permissions <access privilege>` to hide "draft"
records from public view, or mark descriptions as "published" so they are
publicly visible to logged out users. For more information, see:
:ref:`publish-archival-description`. Administrators can also set a global
default status for new records via **Admin > Settings** - for more
information, see: :ref:`default-publication-status`. Finally, an administrator
can also use the Description updates module to identify Draft descriptions -
for more information, see: :ref:`search-updates`.

However, you can also use the related Elasticsearch field to search for all
published or draft records directly. Note that to return results marked
"draft," you must be authenticated (i.e. logged in) with permissions to view
drafts. (see :ref:`edit-user-permissions` for more information).

Draft and Published are :term:`terms <term>` in a locked :term:`taxonomy` in
AtoM, and you can search for them by using their internal ID values. In AtoM,
``159`` is the default term ID for Draft, while ``160`` is the default term ID
for Published. We can use AtoM's ``publicationStatusId`` Elasticsearch field
to perform a search for all draft records, or all published records:

To perform a search for all **draft** archival descriptions:

.. code-block:: none

   publicationStatusId:159

To perform a search for all **published** archival descriptions:

.. code-block:: none

   publicationStatusId:160

.. _es-field-list:

List of Archival description ES fields
--------------------------------------

Not all fields available in the :term:`archival description` edit templates
are added to AtoM's search index. Additionally, some fields are queried not
via Elasticsearch, but by searching directly against the database or via
another method in the AtoM code. Consequently, the list below is not
exhaustive, but it should cover the majority of available fields. You can use
the syntax described in the introductory section
:ref:`above <es-fields-intro>` to construct a query against a specific field.

.. code-block:: none

   alternativeIdentifiers.identifier
   alternativeIdentifiers.label
   createdAt
   digitalObject.filename
   digitalObject.mediaTypeId
   digitalObject.thumbnailPath
   findingAid.status
   findingAid.transcript
   hasDigitalObject
   i18n.%LANG%.accessConditions
   i18n.%LANG%.accruals
   i18n.%LANG%.acquisition
   i18n.%LANG%.alternateTitle
   i18n.%LANG%.appraisal
   i18n.%LANG%.archivalHistory
   i18n.%LANG%.arrangement
   i18n.%LANG%.edition
   i18n.%LANG%.extentAndMedium
   i18n.%LANG%.findingAids
   i18n.%LANG%.institutionResponsibleIdentifier
   i18n.%LANG%.locationOfCopies
   i18n.%LANG%.locationOfOriginals
   i18n.%LANG%.physicalCharacteristics
   i18n.%LANG%.relatedUnitsOfDescription
   i18n.%LANG%.reproductionConditions
   i18n.%LANG%.revisionHistory
   i18n.%LANG%.rules
   i18n.%LANG%.scopeAndContent
   i18n.%LANG%.sources
   i18n.%LANG%.title
   identifier
   levelOfDescriptionId
   materialTypeId
   publicationStatusId
   referenceCode
   referenceCodeWithoutCountryAndRepo
   slug
   sourceCulture
   transcript
   updatedAt

   generalNotes.i18n.%LANG%.content
   alphaNumericNotes.i18n.%LANG%.content
   conservationNotes.i18n.%LANG%.content
   physicalDescriptionNotes.i18n.%LANG%.content
   continuationOfTitleNotes.i18n.%LANG%.content

Additionally, there are some related fields belonging to linked
:term:`entities <entity>` that, when linked to an archival description, can be
searched to return related archival descriptions. These include
:term:`repository` records, :term:`authority records <authority record>`
(linked as either a :term:`creator` or :term:`name` access point), and
subject, place, and genre :term:`access points <access point>`.

For example, to return all English archival descriptions where "Jane Doe" is
linked as the creator, you could enter:

.. code-block:: none

   creators.i18n.en.authorizedFormOfName:"Jane Doe"

Here is the list of related entity fields that are searchable in the global
:term:`search box`, that will return linked archival description results:

.. code-block:: none

   creators.i18n.%LANG%.authorizedFormOfName
   creators.otherNames.i18n.%LANG%.name
   creators.parallelNames.i18n.%LANG%.name
   creators.standardizedNames.i18n.%LANG%.name
   genres.i18n.%LANG%.name
   names.i18n.%LANG%.authorizedFormOfName
   names.otherNames.i18n.%LANG%.name
   names.parallelNames.i18n.%LANG%.name
   names.standardizedNames.i18n.%LANG%.name
   places.i18n.%LANG%.name
   repository.i18n.%LANG%.authorizedFormOfName
   subjects.i18n.%LANG%.name

:ref:`Back to top <advanced-search>`

.. _csv-export-search-2:

Export advanced search results in CSV format
============================================

Any authenticated (i.e. logged in) user can generate a :term:`CSV` export of
:term:`advanced search` results. The CSV export, after it is generated, is
made available for download from the jobs page.

When downloaded, the file will be compressed in a
`ZIP <https://wikipedia.org/wiki/Zip_(file_format)>`__ archive - there are many
free utilities (likely there is one already included on your computer) that
will allow you to "unzip" a ZIP file.

**For more information, see the CSV export documentation:**

* :ref:`csv-export-search`.

.. NOTE::

   This functionality is currently only available to authenticated (i.e.
   logged in) users. Public users will not be able to generate and download
   CSV copies of their search results.

:ref:`Back to top <advanced-search>`
