.. _search-updates:

===================
Description Updates
===================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM includes a module, available in the Admin menu, that helps an
:term:`administrator` search for new and updated records in AtoM. Only
an authenticated (i.e. logged-in) :term:`administrator` can search for updates
via this module. The Description updates page (historically referred to as 
"Search updates" and "Newest additions" as well) includes a number of filters 
that can be used to narrow results, as well as :term:`clipboard` pins so 
administrators can easily add new updates to the clipboard for export.

.. image:: images/search-updates.*
   :align: center
   :width: 90%
   :alt: An image of the Description updates page in AtoM

.. SEEALSO::

   * :ref:`clipboard`
   * :ref:`drafts-notification`

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

.. image:: images/search-updates-filters.*
   :align: center
   :width: 90%
   :alt: An image of the Description updates page in AtoM with filters shown

3. In the Filter options menu, select a type of record to display from the
   "Type" :term:`drop-down menu`. Options include:

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

5. You can limit the results to records associated with a specific 
   :term:`archival institution` using the :term:`repository` filter. Note that 
   currently this filter **only** works with :term:`archival description` records 
   - if you flip the "Type" to a different :term:`entity`, the Repository filter 
   will be hidden. 

6. If an :term:`administrator` has enabled the archival description audit log
   (via the :ref:`enable-audit-logging` setting in |gears| **Admin > Settings 
   > Global**), then an additional "User" filter will be available. This is an
   autocomplete field linked to user accounts, that will allow you to filter 
   the results returned based on the modification history of a specific user. 
   To filter results by a specific user, start typing the target :term:`username`
   into the autocomplete field, and select the matching result from the 
   drop-down field that will appear below. 

.. image:: images/updates-user-filter.*
   :align: center
   :width: 90%
   :alt: An image of the User filter on the Description updates page in AtoM

.. NOTE::

   The User filter will not be visible on the Description updates page if the
   audit log has not first been enabled via the Global settings. Only changes
   that have occurred **after** the audit log has been enabled will return
   results when the User filter is used on Description updates. For more 
   information, see: :ref:`enable-audit-logging`. 

7. If searching for *Archival description*, set "Publication status" to either
   *published* or *draft* records, or both (i.e. *All*).

8. Select the range of time you for which you want to return results, using
   the Start and End date fields in the Date range area. When you click into
   one of the fields, AtoM will display a drop-down graphical date-picker you
   can use to select the desired date; alternatively, you can type a date into
   the field using the ISO 8601 Date format (YYYY-MM-DD).

.. image:: images/updates-datepicker.*
   :align: center
   :width: 90%
   :alt: An image of the Datepicker on the Description updates page in AtoM

9. When you have configured the filter options as you wish, click the "Search"
   button to apply them - AtoM will reload the page and display your results
   below the filters. Alternatively, you can click the "Reset" button to clear
   the existing values from the filters.

.. TIP::

   The number of results per page is controlled by the Results per page
   setting in |gears| **Admin > Settings**. By default, this setting shows 10
   results per page, but an :term:`administrator` can change this. For more
   infomation, see: :ref:`results-page`.

10. You can add results directly to the :term:`Clipboard` using the links in
    the right-hand column of the results table. To add all the results
    displayed on a page, click the "All" link at the top of the column. For
    more information on working with the Clipboard, see: :ref:`clipboard`.

11. You can click on the blue hyperlinked names in the Title column to navigate
    directly to a specific record.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`authority-records`
   * :ref:`archival-institutions`
   * :ref:`terms`
   * :ref:`functions`
   * :ref:`enable-audit-logging`

:ref:`Back to top <search-updates>`
