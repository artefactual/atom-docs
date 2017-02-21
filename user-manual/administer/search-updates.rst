.. _search-updates:

===================
Description Updates
===================

AtoM includes a module, available in the Admin menu, that helps an
:term:`administrator` search for new and updated records in AtoM. Only
an authenticated (i.e. logged-in) :term:`administrator` can search for updates
via this module.

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

**To search for new updates:**

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select 'Description updates' from
   the :term:`drop-down menu`. AtoM will redirect you to the Description
   updates view page.
2. By default, the Description updates module will display results of
   :term:`archival descriptions <archival description>` that have been either
   newly created or edited (modified) in the last 30 days. However, this can
   be changed using the Filter options available on the page. To reveal the
   filter options (which are hidden by default when first landing on the
   page), click the larger header at the top of the page that says "Filter
   options." The options will open to reveal the available filters.

.. image:: images/search-updates.*
   :align: center
   :width: 90%
   :alt: An image of the Description updates page in AtoM

3. In the Filter options menu, select a type of record to display from the
   "Type" :term:`drop-down menu`. Options include
   * Archival description
   * Authority record
   * Archival institution
   * Term
   * Function

4. Beside the "Type" drop-down, select the type of date used to filter the
   results:
   * Select *Creation* for new records
   * Select *Revision* for updated records, or
   * Select *Both* for both.

5. If searching for *Archival description*, set "Publication status" to either
   *published* or *draft* records, or both (i.e. *All*).

6. Select the range of time you for which you want to return results, using
   the Start and End date fields in the Date range area. When you click into
   one of the fields, AtoM will display a drop-down graphical date-picker you
   can use to select the desired date; alternatively, you can type a date into
   the field using the ISO 8601 Date format (YYYY-MM-DD).

.. image:: images/updates-datepicker.*
   :align: center
   :width: 90%
   :alt: An image of the Datepicker on the Description updates page in AtoM

7. When you have configured the filter options as you wish, click the "Search"
   button to apply them - AtoM will reload the page and display your results
   below the filters. Alternatively, you can click the "Reset" button to clear
   the existing values from the filters.

.. TIP::

   The number of results per page is controlled by the Results per page
   setting in |gears| **Admin > Settings**. By default, this setting shows 10
   results per page, but an :term:`administrator` can change this. For more
   infomation, see: :ref:`results-page`.

8. You can add results directly to the :term:`Clipboard` using the links in
   the right-hand column of the results table. To add all the results
   displayed on a page, click the "All" link at the top of the column. For
   more information on working with the Clipboard, see: :ref:`clipboard`.

9. You can click on the blue hyperlinked names in the Title column to navigate
   directly to a specific record.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`authority-records`
   * :ref:`archival-institutions`
   * :ref:`terms`
   * :ref:`functions`

:ref:`Back to top <search-updates>`
