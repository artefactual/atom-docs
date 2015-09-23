.. _advanced-search:

===============
Advanced search
===============

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

.. SEEALSO::

   * :ref:`search-atom`
   * :ref:`browse`
   * :ref:`navigate`
   * :ref:`archival-descriptions`

.. _advanced-search-interface:

The Advanced search interface
=============================

This section will outline how to use AtoM's advanced search interface. The
advanced search interface is used to find descriptions in AtoM that contain text
matching a search query. The advanced search hyperlink can be accessed in the
:term:`drop-down menu` that appears when a user places the cursor in the
:term:`search box` located in the AtoM :term:`header bar`. In the advanced
search page, a user can select "and, or, not" operators, and search specific
:term:`archival description` fields, to create a powerful search query. The
option to apply filters to limit or narrow the search are also provided in a
friendly :term:`user interface`.

**To search for archival descriptions using the advanced search interface:**

1. Place your cursor in the :term:`search box` located in the AtoM
   :term:`header bar`. A :term:`drop-down menu` will appear below the search
   box - to access the advanced search interface, click on the "Advanced
   search" link in the drop-down menu.

.. image:: images/searchbox-dropdown.*
   :align: center
   :width: 70%
   :alt: An image of the drop-down beneath the search box

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
   :alt: An image of the advanced search interface

3. To begin searching, enter a search term into the search field in the central
   column of the page.

.. image:: images/advancedsearch-start.*
   :align: center
   :width: 70%
   :alt: An image of a user entering data in the main search field of the
         advanced search interface

4. Use the drop-down menu to limit your search query to a specific
   :term:`field` in the :term:`archival description` templates. The default
   setting is to search any field. Options include:

   * Title
   * Archival history
   * Scope and content
   * Extent and medium
   * Subject access points
   * Name access points
   * Place access points
   * Identifier
   * Reference code

.. image:: images/advancedsearch-fields.*
   :align: center
   :width: 70%
   :alt: An image of a user limiting a search term to the scope and content
         field using the advanced search interface

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
   terms - repeat steps 3-5 as necessary.

.. image:: images/advancedsearch-andornot.*
   :align: center
   :width: 70%
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
   :width: 70%
   :alt: An image of a user adding search fields using the "Add new criteria"
         button in the Advanced search interface

.. image:: images/advanced-search-filters.*
   :align: right
   :width: 40%
   :alt: An image of the advanced search filters

6. You can also add filters to your search to limit the results returned to
   specific parameters. The functions of each search filter are outlined
   below:

* **Repository**: Limit the search to the :term:`holdings` of a specific
  :term:`archival institution`. The :term:`drop-down menu` will be populated
  by all of the archival institution records in AtoM.
* **Top-level descriptions**: This is an auto-complete field that will
  populate with all of the top-level descriptions held in AtoM (generally,
  :term:`fonds` and :term:`collections <collection>`, but if a series or
  another level is set as the top level of a descriptive hierarchy, it will
  be available in the list). Begin typing the title of a top-level
  description, and the auto-complete will populate the :term:`drop-down menu`
  with matching selections. Click on one to select it - search results will
  be limited to :term:`archival descriptions <archival description>` found
  within the chosen top-level description's descendants - i.e.
  :term:`children <child record>`.
* **General material designation**: This is a filter that is particular to a
  controlled field found within the :ref:`RAD template <rad-template>` for
  archival descriptions - it is a controlled vocabulary drawn directly from
  the Canadian Rules for Archival Description, and managed in one of AtoM's
  :term:`taxnomies <taxonomy>` and used to define the type of material found
  within an :term:`archival unit`. Select a GMD term from the
  :term:`drop-down menu` to limit search results to descriptions that have
  been been marked with the matching GMD value.
* **Media type**: Used to search for a particular type of
  :term:`digital object`. Values include: Audio, Image, Other, Text, or
  Video. Selecting a Media type term from the :term:`drop-down menu` to limit
  search results to include only those descriptions with linked digital
  objects that match the selected media type.
* **Digital object available**: Use this filter to determine if a the search
  results returned include :term:`digital objects <digital object>` (e.g.
  images, audio or video files, text documents, etc.), or by selecting "No",
  include only results without digital objects.
* **Level of description**: This filter will limit the returned search
  results to a specific :term:`level of description`.
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
* **Date range**: An inclusive date-range search. Its use is explained in
  greater detail in the section below, :ref:`date-range-search`.

7. Click "Search" in the :term:`button block` to view the results of your search
   query. Results will appear in order of relevance below the button block. If
   there are more than 10 results, a pager will be included at the bottom of the
   results page.

8. Click on the blue titles to navigate to that result's specific page.
   Navigating back will bring you back to your original list of results;
   however, navigating to the "Advanced search" page from the :term:`search
   box` will require you to restart your search from the beginning

9. Your search can be modified at any time and the results refrehsed accordingly
   by simply changing the required search :term:`terms <term>` and :term:`fields
   <field>` and clicking "Search" once again. You can also restart your search
   at any time; simply click the "Reset" button in the :term:`button block`.

.. _date-range-search:

Using the date range search filters
-----------------------------------

.. image:: images/date-range-search.*
   :align: right
   :width: 25%
   :alt: An image of the date range search filters

The date range search allows users to search for any records whose active
dates (e.g. dates of creation, accumulation, etc.) overlap a selected range.
It is a broadly inclusive search: any records whose dates overlap the user
input range will be returned. For example, a search for a range from 1950-1970
would return descriptions with the following dates:

* 1945 - 1990
* 1945 - 1950
* 1970 - 1990
* 1955 - 1965
* 1955 - (no end date)
* (no start date) 1980

In the following image, results in green will be returned by the search query;
results in red will be excluded from the results:

.. image:: images/2.3-advanced-date-search-1.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950-1970 query

You can also input only a start date, or an end date, into the date range
search if desired. If a user gives **just a start date**, it is interpreted to
mean 'filter to records that were active after this date' - in other words,
'end date of record **>** user supplied start date':

.. image:: images/2.3-advanced-date-search-2-startDate.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1950 start date query

If the user gives **just an end date**, it means 'filter to records that were
active before this date' - in other words, 'start date of record **<** user
supplied end date':

.. image:: images/2.3-advanced-date-search-3-endDate.*
   :align: center
   :width: 90%
   :alt: An example of results returned for a 1970 end date query

**Using the date range search filters**

When you place the cursor in the start date or end date fields of the date
range search, a calendar :term:`drop-down menu` will appear. This "datepicker"
offers a graphical user interface for selecting the date, if desired.

.. image:: images/date-range-calendar.*
   :align: center
   :width: 30%
   :alt: An example of calendar widget dropdown in the date range fields

Click on a day in the calendar to select that as your start or end date. You
can also navigate through the months using the black forward and back buttons.

The month and year can also be adjusted via the two drop-down menus:

.. image:: images/date-range-calendar-dropdown.*
   :align: center
   :width: 30%
   :alt: An example of calendar widget dropdown menus in the date range fields

You can also ignore the calendar widget, and simply enter a date directly into
the text field. AtoM expects the dates to be formattedd as **YYYY** or
**YYYY-MM-DD**. If you enter only the year, then AtoM will add -01-01 to start
dates and -12-31 to end dates when the search query is submitted - for
example, if you search for 1950 - 1970, AtoM will submit the query as 1950-01-01
(January 01, 1950) to 1970-12-31 (December 31, 1970).

If you attempt to enter a date manually, but do not use the correct format,
(e.g. you enter ``YYYY-MM``, or ``YYYYMMDD`` without the separating dashes)
AtoM will return a warning, which must be corrected before the query can be
submitted:

.. image:: images/date-range-error.*
   :align: center
   :width: 30%
   :alt: An example of incorrectly formatted values in the date range fields


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
:term:`search box`. What follows is a list of the most commonly used tools
available in the AtoM :term:`search box`.

.. _advanced-search-phrases:

Phrases
-------

By default in AtoM, the :term:`Boolean search` settings of AtoM are set to
use **OR** as the default operator when multiple search terms are entered.
This means that by default, a search for *city hall* will return results that
include "city" **OR** "hall".

**To search for a phrase** in AtoM, use double quotes to contain the terms
you wish to search. For example, search *"city hall"* to return results that
contain both "city" and "hall" in that exact order.


.. _advanced-search-operators:

Boolean operators
------------------

In AtoM, :term:`Boolean search` operators are supported in the :term:`search
box` and in the Adanced search menu. Boolean searching is a particular
application of what is known as Boolean logic, a subset of algebra used for
creating true/false statements. Since computers operate in binary (using ones
and zeroes), computer logic can often be expressed in boolen terms
(true/false). Boolean expressions use a number of operators, the most common
of which are AND, OR, and NOT - using Boolean operators in terms of search
queries (i.e. Boolean search) allows a user to limit, widen, or otherwise
define a search in granular terms  - for example, searching "fonds OR
collection" would widen a search to include results that have either term in
their title.

Using the Boolean operators available in AtoM allows users to build complex
queries from anywhere in AtoM using the general :term:`search box` located in
the AtoM :term:`header bar`, without having to navigate to the Advanced
search interface.

.. image:: images/advanced-search-boolean.*
   :align: center
   :width: 70%
   :alt: An example of a user building a boolean query in the AtoM search box

.. TIP:

   By default in AtoM, the :term:`Boolean search` settings of AtoM are set to
   use **OR** as the default operator when multiple search terms are entered.
   This means that by default, a search for *chocolate cake* will return results
   that include "chocolate" **OR** "cake".

**Using Boolean operators in the AtoM search box:**

* Use **AND** to combine search terms to narrow your search: e.g. search
  *vancouver* AND *"city hall"* to return only descriptions that contain both
  search terms
* Use **OR** to to combine search terms to broaden your search: e.g. search
  *vancouver* OR *"city hall"* to return descriptions that contain either
  search term
* Use **AND NOT** to exclude terms: e.g. search *vancouver* AND NOT
  *"city hall"* to return descriptions that include *vancouver* but do not
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
|   `"`  | Term enclosed in quotes must appear exactly as provided. Example: |
|        | "towel" will find towel, but not towels.                          |
+--------+-------------------------------------------------------------------+
|  `+`   | Term after "+" must be in the result. Example: +tea cricket       |
|        | requires that results that must contain the term tea in them, and |
|        | may have the term cricket.                                        |
+--------+-------------------------------------------------------------------+
|   `-`  | Term after "-" must not be in the result. Example: -tea cricket   |
|        | requires that results that must not contain the term tea in them, |
|        | and may have the term cricket.                                    |
+--------+-------------------------------------------------------------------+
|   `?`  | Single character wildcard. Example: p?per will find paper and     |
|        | piper, but not pepper.                                            |
+--------+-------------------------------------------------------------------+
|   `*`  | Multiple character wildcard. Example: `galax*` will find galaxy   |
|        |  and galaxies, but not galactic.                                  |
|        |                                                                   |
+--------+-------------------------------------------------------------------+
|   `~`  | Fuzzy search. Will return results with words similar to the term. |
|        | Example: fjord~ will find fjord, fjords, ford, form, fonds, etc.  |
+--------+-------------------------------------------------------------------+
|  `&&`  | Boolean operator. Can be used in place of AND. Will cause an      |
|        | error if combined with spelled-out operators. Example: Arthur &&  |
|        | Ford AND Zaphod will fail; Arthur && Ford && Zaphod will succeed. |
+--------+-------------------------------------------------------------------+
|   `!`  | Boolean operator. Can be used in place of NOT. Will cause an      |
|        | error  if combined with spelled-out operators.                    |
+--------+-------------------------------------------------------------------+
|   `^`  | Boost relevance. Multiplies the relevance of the preceding term   |
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
|  `( )` | Used to group search clauses. This can be useful if you want to   |
|        | control the precedence of boolean operators for a query, e.g.     |
|        | (coffee NOT tea) OR cream will return different results than      |
|        | coffee NOT (tea OR cream). Without grouping, by default in        |
|        | Elasticsearch, NOT takes precedence over AND, which takes         |
|        | precedence over OR.                                               |
+--------+-------------------------------------------------------------------+
|  `[ ]` | Closed interval range search. Example: ["Frogstar" TO             |
|        | "Magrathea"] will return results in the alphabetic range          |
|        | between "Frogstar" and "Magrathea", including"Frogstar" and       |
|        | "Magrathea".                                                      |
+--------+-------------------------------------------------------------------+
|  `{ }` | Open interval range search. Example: {"Frogstar" TO "Magrathea"}  |
|        | will return all results in the alphabetic range between           |
|        | "Frogstar" and "Magrathea", excluding"Frogstar" and "Magrathea".  |
+--------+-------------------------------------------------------------------+

For further examples of the use of these Boolean operators, users can consult
the `Zend Lucene search documentation
<http://framework.zend.com/manual/1.12/en/zend.search.lucene.query-language.html>`__
as Elasticsearch is built on the same Apache Lucene base as the Zend
framework. Developers interested in fine-tuning these settings, or technical
users interested in how Elasticsearch operates may wish to consult the
`query string query
<http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html>`__
Elasticsearch reference documentation for more information on Elasticsearch's
default behaviors, and possible configurations.

:ref:`Back to top <advanced-search>`
