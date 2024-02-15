.. _csv-export:

==========
CSV export
==========

.. |import| image:: images/download-alt.png
   :height: 18
   :width: 18
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18
.. |pencil| image:: images/edit-sign.png
   :height: 18
   :width: 18
.. |clip| image:: images/paperclip.png
   :height: 18

.. _ZIP: https://wikipedia.org/wiki/Zip_(file_format)

Most often understood as an acronym for "comma-separated values" (though
sometimes called "character-separated values" because the separator character
does not have to be a comma), CSV is a file format that stores tabular data in
plain-text form. Information with common properties that can be expressed as a
sequence of fields sharing a common header can be stored in plain-text using
the CSV format, making it application agnostic and highly transportable.

A CSV file consists of a number of records (rows), that have identical fields,
separated by commas (or in some cases, another separator). Often a header
column (i.e. the cell values in first or top row of a CSV file) is included,
naming each column and indicating what kind of data the column contains. Data
is then entered using a separator or delimiter (such as a comma) to indicate a
separation of fields (or cells), and a line break or carriage return to
indicate rows (i.e. different records). Most spreadsheet applications (such as
OpenOffice Calc or MS Excel) can open CSV files and express them as a
spreadsheet. See
`Wikipedia <http://en.wikipedia.org/wiki/Comma-separated_values>`__ for more
information on CSV.

**In AtoM**, there are several kinds of CSV exports available exports from the
:ref:`clipboard`; export of :term:`archival description` advanced search
results; and an export of jobs completed. Each will be outlined below.

.. NOTE::

   CSV exports performed via the :term:`user interface` are generated as 
   compressed `ZIP`_ packages, stored in the ``jobs`` subdirectory of the AtoM
   ``downloads`` directory. These packages are **not** automatically deleted
   after download, meaning a system administrator should periodically remove
   unnecessary older packages to conserve disk space, such as during upgrades. 
   For more information on the structure of the ``downloads`` directory, see:

   * :ref:`backup-uploads-downloads`

   Note that AtoM also has a command-line task that can be used by a system 
   administrator to manage and delete the contents of the ``jobs`` subdirectory. 
   For more information, see:

   * :ref:`tools-expire` 

**Jump to:**

* :ref:`csv-export-search`
* :ref:`csv-export-clipboard`
* :ref:`csv-export-jobs`

.. SEEALSO::

   * :ref:`csv-import`
   * :ref:`import-export-skos`
   * :ref:`advanced-search`
   * :ref:`manage-jobs`
   * :ref:`clipboard`
   * :ref:`archival-descriptions`
   * :ref:`csv-export-cli`
   * :ref:`csv-import-cli`
   * :ref:`cli-bulk-import-xml`
   * :ref:`cli-bulk-export`


.. _csv-export-search:

Export search and browse results in CSV format
==============================================

Any authenticated (i.e. logged in) user can generate a :term:`CSV` export of
:term:`archival description` :ref:`search-atom` or :ref:`browse` results. The
CSV export, after it is generated, is made available for download from the
jobs page.

.. SEEALSO::

   * :ref:`advanced-search`
   * :ref:`search-atom`
   * :ref:`browse`
   * :ref:`manage-jobs`

When downloaded, the file will be compressed in a
`ZIP <https://wikipedia.org/wiki/Zip_(file_format)>`__ archive - there are many
free utilities (likely there is one already included on your computer) that
will allow you to "unzip" a ZIP file.

.. NOTE::

   You must be logged in to perform a CSV export of search results.

**To generate and download a CSV export of search or browse results:**

1. Navigate to the :term:`archival description` :ref:`browse` page. You can
   get there using the :term:`browse menu` located in the AtoM
   :term:`header bar` - for more information, see: :ref:`browse-menu`. You can
   also perform a search directly via the global :term:`search box` in the AtoM
   header bar, or by placing your cursor in the search box, selecting "Advanced
   search" from the :term:`drop-down menu` that appears, and then using the
   :term:`advanced search panel` to perform a search. For more information,
   see: :ref:`search-atom` and :ref:`advanced-search`
2. If you wish to limit the results returned based on a search query
   before exporting, perform a search using the :term:`advanced search panel`,
   and/or limit the results using the :term:`facet filters <facet filter>`
   available in the left column. For more information on working with the
   fields and filters available on the advanced search panel, see:
   :ref:`advanced-search-interface`. For information on using the facets, see:
   :ref:`recurring-facet-filters`; particularly, :ref:`using-facet-filters`.

.. image:: images/advanced-search-example.*
   :align: center
   :width: 85%
   :alt: An example query on the advanced search page

3. When you want to export the search results returned, click on the "Export
   CSV" link - it's located below the :term:`advanced search panel`, but
   above the results, on the left.

.. image:: images/search-csv-export-button.*
   :align: center
   :width: 85%
   :alt: An image of the Export CSV button on the advanced search page

.. NOTE::

   Public users will **not** be able to see this export link. Currently, the
   search CSV export feature is only available to authenticated (i.e. logged
   in) users.

4. The CSV export of the search results will be generated by the job
   scheduler. After clicking the "Export CSV" link, AtoM will reload the page
   - scroll back up to the top to see a notification about the job, with a
   link to the jobs page where you can see the status of your job and download
   the CSV when it is ready. Click on the link in the notification to go to
   the jobs page.

.. image:: images/search-csv-export-notification.*
   :align: center
   :width: 85%
   :alt: An image of the notification after an export csv job is initiated

5. On the jobs page, you will find information about the export job, including
   a download link when the task is done. Check the "Job status" column - if
   it says "Completed," then the job has successfully finished and you can now
   download your CSV. It is says "Running," then the task is still being
   executed - try refreshing the page in a moment for an updated status. If
   the Job status column says "Error," then the CSV export has failed for some
   reason - talk to your system administrator for assistance. See the
   :ref:`manage-jobs` page for more information.

   When the job is complete, click on the Download link in the "Info" column,
   and the CSV, compressed in a ZIP file, will be downloaded to your computer.

.. image:: images/search-csv-export-jobs.*
   :align: center
   :width: 85%
   :alt: An image of the jobs page after a CSV export has been executed

.. TIP::

   The CSV export is formatted similarly to our CSV import templates. Curious
   about what fields are included, or uncertain what a certain field
   represents in the corresponding content standard? Take a look at our
   :ref:`csv-import` documentation on archival descriptions, or check out the
   CSV import templates on our wiki:

   * https://wiki.accesstomemory.org/Resources/CSV_templates

:ref:`Back to top <csv-export>`

.. _csv-export-clipboard:

Export Clipboard results in CSV format
======================================

.. _ZIP: https://wikipedia.org/wiki/Zip_(file_format)

AtoM includes a :term:`clipboard` that allows users to "pin" results to it for
review or further action. For more information, see: :ref:`clipboard`.

Any user can generate a :term:`CSV` export of :term:`Clipboard` results. The
CSV export, after it is generated, is made available for download from the jobs
page. For public users who do not have access to the Jobs page, a notification
will be displayed with a direct link to the download when the export is ready.

Currently users can export the following :term:`entity` types from the
clipboard in CSV format:

* :ref:`archival-descriptions`
* :ref:`authority-records`
* :ref:`archival-institutions`

.. NOTE::

   You can also perform XML imports from the clipboard. For more information,
   see: :ref:`xml-export-clipboard`.

   Depending on the settings enabled by an :term:`administrator`, it may
   also be possible for users to download :term:`digital objects <digital object>`
   associated with archival descriptions from the clipboard. See: 

   * :ref:`csv-export-clipboard-do`
   * :ref:`clipboard-settings`

   For general information on managing jobs and using the clipboard, see: 

   * :ref:`clipboard`
   * :ref:`manage-jobs`

When downloaded, the file will be compressed in a `ZIP`_ archive - there are
many free utilities (likely there is one already included on your computer)
that will allow you to "unzip" a ZIP file.

**To generate and download a CSV export of clipboard results:**

The default descriptive template used by AtoM is ISAD(G) and any exports from 
your AtoM instance will use the ISAD(G) template. In this version of AtoM, users
can now select to export their descriptions in RAD format, but this will need to 
be configured prior to exporting from the clipboard. To change the default template 
in your AtoM instance navigate to the Admin menu in the top right hand corner and from
the drop down menu select 'Settings'

.. image:: images/AtoM-admin-menu-dropdown.*
   :align: center
   :width: 90%
   :alt: An image Admin menu dropdown options.

Once you are in the ‘Settings’ menu, on the left hand side, select ‘Default template’ 
and there you will find three options: Archival description, Authority record and 
Archival institutions. Go to the ‘Archival description’ and from the dropdown menu 
select: ‘RAD, July 2008 version. Canadian Council of Archives’:

.. image:: images/description-menu-dropdown.*
   :align: center
   :width: 90%
   :alt: An image of the dropdown menue description template options.

Once the selection has been made hit ‘Save’ and then when material is exported from the 
Clipboard or when the export function is used, the related csv exports will have a ``rad_`` prefix 
to indicate that the csv fields will conform with RAD. 

.. image:: images/csv-download-RAD-prefix.*
   :align: center
   :width: 90%
   :alt: An image of an export in RAD in a local environment.

Once you have configured your instance then your description and your exports will use the
RAD description template.

**To generate and download a CSV export of clipboard results:**

1. You should first ensure that you have the results you would like to export
   already pinned to the Clipboard. For more information on using AtoM's
   Clipboard module, see: :ref:`clipboard`.

2. Navigate to the :ref:`clipboard` page. You can get there via the
   |clip| **Clipboard** menu in the AtoM :term:`header bar` - open the
   menu, and select "Go to Clipboard".

3. AtoM will redirect you to the Clipboard page. Above the Clipboard results,
   there is a :term:`drop-down menu` that will allow you to change the
   :term:`entity` type of the records being displayed. When you arrive, by
   default :term:`archival description` results will be shown, but you can use
   this menu to change the display to see other results. Make sure the record
   type you want to export is currently being displayed on the clipboard.

.. image:: images/clipboard-01.*
   :align: center
   :width: 90%
   :alt: An image of the Clipboard with results.

4. Click on the "Export" link in the :term:`button block` at the bottom of
   the page.

.. image:: images/button-block-clipboard.*
   :align: center
   :width: 90%
   :alt: An image of the button block on the Clipboard page

5. AtoM will redirect you to a page where you can configure your export. Make
   sure the Format :term:`drop-down menu` is set to "CSV".

6. An :term:`archival description` CSV export will include additional
   configuration options. Public users can select whether only the current
   description should be exported or all descendants (i.e. lower-level
   records). 

   .. TIP::

      AtoM also includes a setting that an :term:`administrator` can enable
      that will add an additional export configuration option to the clipboard, 
      allowing users to download :term:`digital objects <digital object>` that
      are associated with :term:`archival descriptions <archival description>`.

      For more information, see below: 

      * :ref:`csv-export-clipboard-do`

   If you want to include lower levels of description in your clipboard export, 
   click the checkbox marked "Include descendants".

   .. image:: images/csv-export-descriptions-01.*
      :align: center
      :width: 90%
      :alt: Configuration options for archival description CSV exports

   Once checked, the checkbox to "Include all levels of description" will
   become available, and will be automatically checked. If you want
   all lower-level records to be included in the export, then leave
   this box checked. However, if desired, you can uncheck this box and select
   only the levels of description you want included in the export. To do so,
   first uncheck the box labelled "Include all levels of description."

   AtoM will then display a list of all levels of description from the Levels
   of description :term:`taxonomy`. You can use your Control (Mac users:
   Command) and Shift keys to multi-select the levels you want included in the
   export.

   .. image:: images/csv-export-descriptions-02.*
      :align: center
      :width: 90%
      :alt: Configuration options for archival description CSV exports

   Finally, authenticated (i.e. logged in) users will also have the option to
   include :term:`draft <draft record>` records in the export. To include
   drafts, make sure that the "Include drafts" checkbox is selected.

.. IMPORTANT::

   If you are selecting only certain levels of description for export, then
   descriptions that are descendants of levels not included in the export will
   **also** be excluded!

   For example, let's say you want to export a :term:`collection` that has a
   child series, and the series has several child item-level descriptions. If
   you do not include "series" as a level of description, then the child items
   will also not be included in the exported CSV.

7. Once you have configured your export options, click the "Export" button in
   the :term:`button block` at the bottom of the page.

8. The CSV export of the clipboard results will be generated by the job
   scheduler. After clicking the "Export" button, AtoM will reload the page
   with a notification about the job at the top.

   For **authenticated users**, this will include a link to the
   :ref:`Jobs <manage-jobs>` page, where you can review the status of the
   export job, and download the ZIP file containing your CSV export when it is
   complete. Click on the link in the notification to go to the Jobs page.

   .. image:: images/clipboard-export-notification.*
      :align: center
      :width: 90%
      :alt: The notification message for authenticated users performing an export

   Authenticated users will be able to see in their exports a **slug** column which is a new
   feature in this release. This will help authenticated users with updating of digital object 
   and descriptions.
   
   For **public users**, first a notification that the job has been initiated
   will be displayed, with a link that will refresh the page to see if there
   are updates. Users can use the **X** icon on the right of the notification
   to remove it. You can now navigate elsewhere in the application - another
   notification will be provided when the export is complete and ready for
   download.

   .. image:: images/clipboard-export-notification-public-01.*
      :align: center
      :width: 90%
      :alt: The first notification message for public users performing an export

   Once the export job has completed, AtoM will display another notification
   that includes a download link the next time the page is refreshed. Click
   the Download link to download the export.

   .. image:: images/clipboard-export-notification-public-02.*
      :align: center
      :width: 90%
      :alt: The second notification message for public users performing an
            export

   For public users, the download notification will remain visible as you
   navigate around AtoM until you click the "**X**" to remove the notification.

9. On the jobs page, authenticated users will find information about the
   export job, including a download link when the task is done. Check the "Job
   status" column - if it says "Completed," then the job has successfully
   finished and you can now download your CSV. If it says "Running," then the
   task is still being executed - try refreshing the page in a moment for an
   updated status. If the Job status column says "Error," then the CSV export
   has failed for some reason - talk to your system administrator for
   assistance. See the :ref:`manage-jobs` page for more information.

   When the job is complete, click on the Download link in the "Info" column,
   and the CSV, compressed in a ZIP file, will be downloaded to your computer.

.. image:: images/export-clipboard-job.*
  :align: center
  :width: 85%
  :alt: An image of the jobs page after a CSV export has been executed

.. TIP::

   The CSV export is formatted similarly to our CSV import templates. Curious
   about what fields are included, or uncertain what a certain field
   represents in the corresponding content standard? Take a look at our
   :ref:`csv-import` documentation on archival descriptions, or check out the
   CSV import templates on our wiki:

   * https://wiki.accesstomemory.org/Resources/CSV_templates

.. _csv-export-clipboard-do:

Including digital objects in a clipboard CSV export
---------------------------------------------------

Some AtoM sites are :ref:`configured <clipboard-settings>` to enable users to
include attached digital objects when exporting archival descriptions from the
clipboard. In this case, the Export options screen will include a checkbox for
"Include digital objects".

.. image:: images/export-digital-objects-clipboard-job-xml.*
  :align: center
  :width: 85%
  :alt: Export options with include digital objects selected

If digital objects are included in the export, they will be contained in the
same ZIP package as the CSV files. 

Note that if the "Include digital objects" checkbox is checked, it is no longer
possible to include descendants in the export, and the "Include descendents"
checkbox will be greyed out. This means you will need to individually add the
descriptions with digital objects to the clipboard if you want to export them,
rather than just adding a parent description.

.. SEEALSO::

   * :ref:`clipboard-do-export-setting` (Clipboard settings)
   * :ref:`xml-export-clipboard-do`
   * :ref:`tools-expire` (command-line task)

:ref:`Back to top <csv-export>`

.. _csv-export-jobs:

Export completed jobs in CSV format
===================================

AtoM includes a job scheduler in order to execute certain long-running tasks
asynchronously to guarantee that web requests are handled promptly and work
loads can be distributed across multiple machines. This ensures time and/or
resource-intensive tasks do not timeout when running via the web browser. For
more information see, :ref:`manage-jobs`.

In case users would like to clear completed jobs but keep a record outside of
AtoM of previous jobs performed, a :term:`CSV` export of the Jobs table is
available. Like the display table in the :term:`user interface`, the output
contains columns for startDate, endDate, jobName, jobStatus, jobInfo, and
jobUser.

.. image:: images/jobs-csv-output.*
   :align: center
   :width: 80%
   :alt: An example image of the Jobs page CSV export

Simply navigate to the jobs page via |pencil| **Manage > Jobs**, and then
click the "Export history CSV" button located in the :term:`button block` on
the page. All jobs currently listed on the Jobs page will be included in the
export.

.. IMPORTANT::

   Only an :term:`administrator` can see all jobs initiated by all users in
   the system. Other users can only see jobs that they themselves have
   initiated - and will only be able to export a CSV of their own jobs. See
   the :ref:`manage-jobs` page for more information on using the Jobs page.

:ref:`Back to top <csv-export>`

