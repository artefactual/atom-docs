.. _export-xml:

==========
Export XML
==========

.. |clip| image:: images/paperclip.png
   :height: 18

AtoM provides an export functionality that can be used to export
:term:`archival descriptions <archival description>` and
:term:`authority records <authority record>` as XML data.

The following file types can be exported:

* EAD 2002 XML (hierarchical archival descriptions)
* Dublin Core XML, MODS XML (individual archival descriptions)
* EAC-CPF XML (authority records)

In addition to individually exporting records from the :term:`view page` of
the associated record, users can also export multiple records at once by first
adding them to the :term:`clipboard` and then using the export options
available there. Each export option will be explained below.

**Jump to:**

* :ref:`ead-export-view`
* :ref:`dc-export-view`
* :ref:`mods-export-view`
* :ref:`eac-export-view`
* :ref:`xml-export-clipboard`


.. SEEALSO::

   * :ref:`cli-bulk-export`
   * :ref:`csv-export`
   * :ref:`import-export-skos`
   * :ref:`archival-descriptions`
   * :ref:`authority-records`
   * :ref:`clipboard`
   * :ref:`manage-jobs`

.. _ead-export-view:

EAD export from an archival description view page
=================================================

All users can export EAD 2002 XML from the :term:`view page` of an
:term:`archival description`, via the export links available in the right-hand
:term:`context menu`. For more information on the context menu and archival
descriptions, see :ref:`Context menu <context-menu-descriptions>`.

.. image:: images/export-ead.*
   :align: center
   :width: 80%
   :alt: Export EAD file from archival description page.

In the :term:`archival description` :term:`view page`, select EAD 2002 XML
under Export. This will export the current archival description plus all its
:term:`child records <child record>`.

By default, the export is created on-request via the web browser. However, for
large hierarchies, this can lead to timeout issues in the browser before the
full EAD 2002 XML file can be generated.

.. TIP::

   An :term:`administrator` does have the option of turning on a setting that
   will generate the XML for archival descriptions in advance on save, so that
   large files can be served up without needing to be generated on the fly.
   There is also a command-line task that will allow a system administrator to
   generate cached XML for all existing descriptions.

   Note that pre-generated, cached XML files never contain
   :term:`draft <draft record>` descriptions.

   For more information, see:

   * :ref:`cache-xml-setting`
   * :ref:`cache-xml-cli`

Public users will not see :term:`draft <draft record>` descriptions in the EAD
XML provided. For authenticated (i.e. logged in) users, all descriptions will
be included in the EAD 2002 XML export from the description view page,
regardless of publication status.

Additionally, if an :term:`administrator` has used the
:term:`visible elements` to hide the display of :term:`physical storage` data,
then this information will also be excluded from public EAD 2002 XML exports.

.. IMPORTANT::

   The :ref:`inherit-reference-code` setting also determines how the
   ``<unitid>`` element in the EAD XML is populated. If the inheritance is
   turned on, then AtoM will populate all descendant records in the EAD XML
   with the full inherited reference code. If inheritance is turned off, AtoM
   will only add the identifier for that record in the ``<unitid>`` on export.
   This allows users exporting to a different source system that does not have
   a reference code inheritance setting to maintain a full reference code at
   all levels in the target system. **However, if you are exporting from one
   AtoM instance to another** (for example, from a local institution to a
   portal site), you might want to consider how this will impact your record
   display in the target system - if you have reference code inheritance
   turned on when you export, and the target AtoM instance *also* has the
   setting turned on, you may end up with duplication in the display!

**To export EAD 2002 XML from an archival description view page**

1. Navigate to the :term:`archival unit` you wish to export. You  can do this
   by :ref:`browsing <browse>` or :ref:`searching <search-atom>` for the
   :term:`archival description` - see :ref:`access-content` for more information
   on navigation in AtoM.
2. On the view page of the top-level :term:`archival description` for the
   hierarchy you wish to export, locate the Export links in the right-hand
   :term:`context menu`.
3. Click the export option for "EAD 2002 XML".

.. image:: images/export-ead-button.*
   :align: center
   :width: 30%
   :alt: Export button for EAD 2002 XML on the archival description view page

4. AtoM will reload the page, and present you with the EAD 2002 XML data. To
   save the data locally, right-click on the page and use the "Save as" option
   in your web browser.

.. TIP::

   We have noticed that in some cases the Safari browser will only save as HTML.
   Try using Firefox, IE, or Chrome to "Save page as" XML.

5. To exit the XML export file, click on your browser's back button.

:ref:`Back to top <export-xml>`

.. _dc-export-view:

Dublin Core XML export from an archival description view page
=============================================================

In addition to supporting EAD 2002 XML exports from the :term:`view page` of
an :term:`archival description`, AtoM can also export individual records in DC
XML format.

In the :term:`archival description` :term:`view page`, select Dublin Core 1.1 XML
under Export. This will export the current archival description as DC XML.

.. image:: images/export-dublin-core.*
   :align: center
   :width: 80%
   :alt: Export Dublin Core file from archival description page.

.. IMPORTANT::

   The DC XML export is **not hierarchical** - that is,
   :term:`child records <child record>` and lower descendants (such as series
   and items beneath a collection) will not be included in the DC XML export
   of a top-level description. To capture the full hierarchy of an
   :term:`archival unit`, we recommend using the EAD 2002 XML export. See
   :ref:`above <ead-export-view>` for more information.

By default, the export is created on-request via the web browser.

.. TIP::

   An :term:`administrator` does have the option of turning on a setting that
   will generate the XML for archival descriptions in advance on save, so that
   large files can be served up without needing to be generated on the fly.
   There is also a command-line task that will allow a system administrator to
   generate cached XML for all existing descriptions.

   Note that pre-generated, cached XML files never contain
   :term:`draft <draft record>` descriptions.

   For more information, see:

   * :ref:`cache-xml-setting`
   * :ref:`cache-xml-cli`

**To export DC XML from an archival description view page**

1. Navigate to the :term:`archival unit` you wish to export. You  can do this
   by :ref:`browsing <browse>` or :ref:`searching <search-atom>` for the
   :term:`archival description` - see :ref:`access-content` for more information
   on navigation in AtoM.
2. On the view page of the top-level :term:`archival description` for the
   hierarchy you wish to export, locate the Export links in the right-hand
   :term:`context menu`.
3. Click the export option for "Dublin Core 1.1 XML".

.. image:: images/export-ead-button.*
   :align: center
   :width: 30%
   :alt: Export button for DC XML on the archival description view page

4. AtoM will reload the page, and present you with the DC XML data. To
   save the data locally, right-click on the page and use the "Save as" option
   in your web browser.

.. TIP::

   We have noticed that in some cases the Safari browser will only save as HTML.
   Try using Firefox, IE, or Chrome to "Save page as" XML.

5. To exit the XML export file, click on your browser's back button.

:ref:`Back to top <export-xml>`

.. _mods-export-view:

MODS XML export from an archival description view page
======================================================

If the administrator has set the default :term:`archival description` template
to MODS, then a MODS XML button will also appear in the right-hand
:term:`context menu` as an export option. For more information on changing the
display template, see:

* :ref:`default-templates`
* :ref:`change-display-standard`

.. TIP::

   Don't want to change the display standard to get the MODS export? You can
   temporarily change the view of the record by appending ``;mods`` to the URL
   and pressing enter. AtoM will reload the page, displaying the archival
   description using the MODS template, and the MODS export option should be
   visible.

In the :term:`archival description` :term:`view page`, in the right-hand
:term:`context menu`, select MODS 3.5 XML under Export. This will export the
current archival description.

.. image:: images/export-mods.*
   :align: center
   :width: 30%
   :alt: Export MODS file from archival description page.

.. IMPORTANT::

   The MODS XML export is **not hierarchical** - that is,
   :term:`child records <child record>` and lower descendants (such as series
   and items beneath a collection) will not be included in the DC XML export
   of a top-level description. The titles and identifiers of immediate parent
   and child records will be included, but URLs to these resources are not,
   nor is further descriptive metadata.

   To capture the full hierarchy of an :term:`archival unit`, we recommend
   using the EAD 2002 XML export. See :ref:`above <ead-export-view>` for more
   information.

.. _eac-export-view:

EAC-CPF XML export from an authority record view page
=====================================================

Metadata about actors - represented in AtoM via an :term:`authority record` -
can be exported as EAC-CPF XML. For more information on working with authority
records, see: :ref:`authority-records`. All users (both public and logged in)
can export EAC-CPF XML data from the right-hand context menu of an authority
record's :term:`view page`.

**To export EAC-CPF XML from an authority record:**

1. Navigate to the :term:`authority record` you wish to export. You can do
   this by :ref:`browsing <browse>` or :ref:`searching <search-atom>` for the
   authority record - see :ref:`access-content` for more information
   on navigation in AtoM.
2. On the :term:`view page` of the authority record you wish to export, locate
   the Export links in the right-hand :term:`context menu`.
3. Click the export option for "EAC".

.. image:: images/export-eac.*
   :align: center
   :width: 80%
   :alt: Export EAC file from authority record page.

4. AtoM will reload the page, and present you with the EAC-CPF XML data. To
   save the data locally, right-click on the page and use the "Save as" option
   in your web browser.

.. TIP::

   We have noticed that in some cases the Safari browser will only save as HTML.
   Try using Firefox, Edge, or Chrome to "Save page as" XML.

5. To exit the XML export file, click on your browser's back button.

:ref:`Back to top <export-xml>`

.. _xml-export-clipboard:

Export multiple XML files using the Clipboard
=============================================

.. _ZIP: https://wikipedia.org/wiki/Zip_(file_format)

AtoM includes a :term:`clipboard` that allows users to "pin" results to it for
review or further action. For more information, see: :ref:`clipboard`.

Any user can generate XML exports of :term:`Clipboard` results, where the
format is supported. The XML exports, after they are generated generated, are
made available for download from the :ref:`Jobs <manage-jobs>` page. For public
users who do not have access to the Jobs page, a notification
will be displayed with a direct link to the download when the export is ready.

Currently users can export the following :term:`entity` types from the
clipboard in XML format:

* :ref:`archival-descriptions`
* :ref:`authority-records`

.. NOTE::

   You can also perform CSV exports from the clipboard. For more information,
   see: :ref:`csv-export-clipboard`.

   Depending on the settings enabled by an :term:`administrator`, it may
   also be possible for users to download :term:`digital objects <digital object>`
   associated with archival descriptions from the clipboard. See: 

   * :ref:`xml-export-clipboard-do`
   * :ref:`clipboard-settings`

   For general information on managing jobs and using the clipboard, see: 

   * :ref:`clipboard`
   * :ref:`manage-jobs`

When downloaded, the XML files will be compressed in a `ZIP`_ archive - there 
are many free utilities (likely there is one already included on your 
computer) that will allow you to "unzip" a ZIP file.

.. NOTE::

   XML exports performed via the :term:`clipboard` are stored in the ``jobs`` 
   subdirectory of the AtoM ``downloads`` directory. These packages are **not** 
   automatically deleted after download, meaning a system administrator should 
   periodically remove unnecessary older packages to conserve disk space, such 
   as during upgrades. For more information on the structure of the 
   ``downloads`` directory, see:

   * :ref:`backup-uploads-downloads`

   Note that AtoM also has a command-line task that can be used by a system 
   administrator to manage and delete the contents of the ``jobs`` subdirectory. 
   For more information, see:

   * :ref:`tools-expire`

**To generate and download XML exports of clipboard results:**

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
   sure the Format :term:`drop-down menu` is set to "XML".

6. An :term:`archival description` XML export will include additional
   configuration options. Public users can select whether only the current
   description should be exported or all descendants (i.e. lower-level
   records). Currently the only type of XML export supported on the Clipboard 
   is EAD 2002 XML.

   .. image:: images/xml-export-descriptions-01.*
      :align: center
      :width: 90%
      :alt: Configuration options for archival description XML exports

   .. TIP::

      AtoM also includes a setting that an :term:`administrator` can enable
      that will add an additional export configuration option to the clipboard, 
      allowing users to download :term:`digital objects <digital object>` that
      are associated with :term:`archival descriptions <archival description>`.

      For more information, see below: 

      * :ref:`xml-export-clipboard-do`


   If you want to include lower levels of description as well, click
   the checkbox marked "Include descendants".

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

   .. image:: images/xml-export-descriptions-02.*
      :align: center
      :width: 90%
      :alt: Configuration options for archival description XML exports

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
   will also not be included in the exported EAD 2002 XML.

7. Once you have configured your export options, click the "Export" button in
   the :term:`button block` at the bottom of the page.

8. The XML export of the clipboard results will be generated by the job
   scheduler. After clicking the "Export" button, AtoM will reload the page
   with a notification about the job at the top.

   For **authenticated users**, this will include a link to the
   :ref:`Jobs <manage-jobs>` page, where you can review the status of the
   export job, and download the ZIP file containing your CSV export when it is
   complete. Click on the link in the notification to go to the Jobs page.

   .. image:: images/clipboard-export-notification.*
      :align: center
      :width: 90%
      :alt: The notification message for authenticated users performing an
            export

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

   .. image:: images/xml-export-public-notification.*
      :align: center
      :width: 90%
      :alt: The second notification message for public users performing an
            export

   For public users, the download notification will remain visible as you
   navigate around AtoM until you click the "**X**" to remove the notification.

9. On the jobs page, authenticated users will find information about the
   export job, including a download link when the task is done. Check the "Job
   status" column - if it says "Completed," then the job has successfully
   finished and you can now download your ZIP file of the XML exports. If it
   says "Running,"then the task is still being executed - try refreshing the
   page in a moment for an updated status. If the Job status column says
   "Error," then the XML export has failed for some reason - talk to your
   system administrator for assistance. See the :ref:`manage-jobs` page for
   more information.

   When the job is complete, click on the Download link in the "Info" column,
   and the XML files, compressed in a ZIP file, will be downloaded to your
   computer.

.. image:: images/export-clipboard-job-xml.*
  :align: center
  :width: 85%
  :alt: An image of the jobs page after an XML export has been executed

:ref:`Back to top <export-xml>`

.. _xml-export-clipboard-do:

Including digital objects with an XML clipboard export
------------------------------------------------------

Some AtoM sites are :ref:`configured <clipboard-settings>` configured to enable
users to include attached digital objects when exporting archival descriptions
from the clipboard. In this case, the Export options screen will include a
checkbox for "Include digital objects".

.. image:: images/export-digital-objects-clipboard-job-xml.*
  :align: center
  :width: 85%
  :alt: Export options with include digital objects selected

If digital objects are included in the export, they will be contained in the
same ZIP package as the XML files. 

Note that if the "Include digital objects" checkbox is checked, it is no longer
possible to include descendants in the export, and the "Include descendents"
checkbox will be greyed out. This means you will need to individually add the
descriptions with digital objects to the clipboard if you want to export them,
rather than just adding a parent description.

.. SEEALSO::

   * :ref:`clipboard-do-export-setting` (Clipboard settings)
   * :ref:`csv-export-clipboard-do`
   * :ref:`tools-expire` (command-line task)

:ref:`Back to top <export-xml>`
