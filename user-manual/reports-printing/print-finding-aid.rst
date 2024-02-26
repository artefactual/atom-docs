.. _print-finding-aids:

==================================================
Generate, upload, download, and print finding aids
==================================================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

.. |edit| image:: images/edit-sign.png
   :height: 18
   :width: 18

.. |check| image:: images/check.png
   :height: 17
   :width: 17

.. |uncheck| image:: images/uncheck.png
   :height: 17
   :width: 17

AtoM allows logged-in users to generate printer-friendly
:term:`finding aids <finding aid>` in either PDF or RTF format. The format and
some other parameters can be set by :term:`administrators <administrator>`
in the :ref:`finding aid settings <finding-aid>`. Alternatively, authenticated
users can choose to upload locally created finding aids instead of generating
them from existing descriptions. Once the finding aid is generated or uploaded,
it can be downloaded by any user, via a link provided in the right-hand
:term:`context menu`.

.. seealso::

   * :ref:`file-item-reports`
   * :ref:`archival-descriptions`
   * :ref:`manage-jobs`
   * :ref:`context-menu`
   * :ref:`cli-finding-aid-generate` (command line tool)

Finding aids in AtoM are generated asynchronously in the background using
`Gearman <http://gearman.org>`__, AtoM's job manager. You will need to make sure
that Gearman is properly configured during installation to be able to generate
finding aids - for more information, see: :ref:`maintenance-asynchronous-jobs`.
Additional information about the status of any Finding aid generation :term:`job`
can also be seen via |edit| **Manage > Jobs** - for more information on the Job
management page in AtoM, see: :ref:`manage-jobs`.

.. IMPORTANT::

   At this time, the finding aids being generated have only been formatted to use
   the Canadian Rules for Archival Description (RAD) template. If you are using
   another template, you can still generate finding aids - but they will be
   formatted according to the RAD standard. We hope to be able to add further
   options in the future. For more information on the RAD standard, see:
   :ref:`Rules for Archival Description <rad-template>`. For an overview of all
   data entry templates in AtoM, see: :ref:`data-entry` and
   :ref:`descriptive-standards`.

Below you'll find information on how to configure the finding aid settings,
generate or upload a finding aid, view information on the status of your
finding aid generation request, and how users can view the finding aid after
it has been successfully generated or uploaded.

**Jump to:**

* :ref:`print-finding-aid-settings`
* :ref:`generate-finding-aid`
* :ref:`delete-finding-aid`
* :ref:`finding-aid-layout`
* :ref:`finding-aid-troubleshoot`

.. _print-finding-aid-settings:

Finding aid settings
====================

Before generating your finding aids, you will want to carefully review the
settings for finding-aid generation. These can be accessed by an
:term:`administrator` by navigating to |gears| **Admin > Settings**, and
clicking on "Finding aid" in the settings menu on the left side of the page.

.. image:: images/finding-aid-settings.*
   :align: center
   :width: 80%
   :alt: Finding aid settings

**Finding aids enabled**: This setting will enable or disable the finding aid
upload and generation functionality in AtoM. When disabled, finding aid links 
(and options for authenticated users) are not displayed in archival description 
:term:`view pages <view page>`, finding aid generation is disabled, and the 
Finding aid search filter in the archival description 
:term:`advanced search panel` is hidden. Additionally, other settings on this
page will be hidden until the feature is re-enabled. 

.. SEEALSO:: 

   For additional :term:`advanced search panel` fields that can be hidden
   via settings changes, see: :ref:`default-page-elements`.

**Finding aid format**: AtoM can generate finding aids in either Portable
Document Format (PDF), or in Rich Text Format (RTF). Choose whether you would
like :term:`finding aids <finding aid>` generated in PDF or RTF - essentially, if
you would like users to have the ability to easily edit your finding aids locally
after download, choose RTF, and users should be able to open the finding aid with
any common document editor such as LibreOffice or Microsoft Word. If you prefer
that the finding aids remain static and cannot be as easily edited by users, PDF
will be a better choice. Note that most modern browsers include a PDF reader
(meaning that once a user clicks the download button for a PDF-formatted finding
aid, the finding aid will usually open in a new tab and be visible immediately to
the user), while RTF finding aids will require local download to access, and will
need to be opened in a separate application.

.. NOTE::

   Even if you are uploading pre-existing finding aids instead of generating
   them from your descriptions, you will need to set the format. During the
   upload process, AtoM will check that the uploaded format matches this
   setting, and will not allow you to upload other formats.

**Finding aid model**: At present, this setting will change how lower-level
descriptions (e.g. :term:`children <child record>`, such as files and items) are
presented in the finding aid. You can choose between "Full details" and
"Inventory summary." Hover your cursor over the Finding aid model field label to
see a brief tooltip:

.. image:: images/finding-aid-settings-tooltip.*
   :align: center
   :width: 80%
   :alt: Finding aid settings with tooltip displayed

The "Inventory summary" option is best used when your lower-level descriptions
do  not include a lot of detail - it includes lower-level descriptions (such
as files  and items) in a summary table beneath each :term:`parent record`,
such as a series,  sub-series, subfonds, etc. When lower-level descriptions
include more detail, such as a scope and content description, you may want to
include this information  in the finding aid - choose "Full details," and each
level of description will  display all fields available. A comparison image is
included below, with the  Inventory summary on the left, and a sample item
description with full details on the right:

.. image:: images/item-description-compare.*
   :align: center
   :width: 95%
   :alt: Finding aid details comparison - Full details vs Inventory summary

**Generate Finding Aid as public user**: This setting determines whether or not
:term:`Draft <draft record>` records are included in the PDF generated, as well
as :term:`physical storage` information, depending on your Visible elements
settings for physical storage.

When set to "Yes," draft descriptions are excluded from the finding aids
generated.  If you have hidden physical storage information via the Visible
elements module,  it will also be excluded from new finding aids generated.

For more information on the :term:`publication status` and setting records as
draft or public, see: :ref:`publish-archival-description`. For more information
on using the Visible elements module, see: :ref:`visible-elements`.

.. IMPORTANT::

   At this time, no other Visible elements settings are affected by this
   finding aid setting - only physical storage information. This means that
   even with the public setting engaged, any other fields you have hidden via
   the Visible elements module will still be included in your finding aid! Be
   sure to review your finding aids carefully.

.. TIP::

   If you have the "Generate Finding Aid as public user" setting set to "Yes,"
   the option to generate a finding aid will **not appear** on any
   :term:`draft <draft record>` descriptions in AtoM. You will have to publish
   the description before you can generate a finding aid. You will still have
   the option to upload a finding aid - but remember, if the associated
   description is in Draft mode, users won't be able to access it, or your
   uploaded finding aid until it's published.

:ref:`Back to top <print-finding-aids>`

.. _generate-finding-aid:

Generate or upload a finding aid
================================

Once you have configured the finding aid settings, you can now begin to
either generate or upload :term:`finding aids <finding aid>` for your
:term:`archival descriptions <archival description>`. While the settings can only
be configured by an :term:`administrator`, at present **any authenticated user**
can generate or upload a finding aid for a description they have permission to
view. An administrator can review all finding aid generation requests via the
Jobs page - for more information on managing :term:`jobs <job>` in AtoM, see:
:ref:`manage-jobs`.

.. TIP::

   It's possible to add an institutional logo to the cover page of your
   generated finding aids. For more information, see below:

   * :ref:`generate-finding-aid-logo`

**To generate or upload a finding aid:**

1. Navigate to the :term:`archival description` for which you would like to
   generate a finding aid. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`access-content` for more information on navigation in AtoM.

.. TIP::

   You can only generate or upload one finding aid per :term:`archival unit`
   (that is, one descriptive hierarchy), but you can generate or upload from
   any level of description in the hierarchy, not just the
   :term:`parent <parent record>` description.

2. In the right-hand :term:`context menu`, you will see a section titled "Finding
   aid". For logged-in users, this menu may include status information, and if
   a finding aid has already been generated or uploaded, a download button for
   the current finding aid. Status messages are never shown to public users - the
   finding aid section will only appear in the context menu if a finding aid has
   been successfully generated or uploaded.

   .. image:: images/finding-aid-statuses.*
      :align: center
      :width: 95%
      :alt: Finding aid status messages in the context menu and their meanings

   **Finding aid statuses and their meanings**

   * *No status*: No finding aid has been generated or uploaded for this
     description.
   * *In progress*: The job is underway and the finding aid is generating or
     being uploaded. Refresh the page for an updated status, and/or visit the
     Jobs page - see: :ref:`manage-jobs`
   * *Generated*: A finding aid that has been generated is available.
   * *Uploaded*: A finding aid that has been uploaded is available.
   * *Error*: Something went wrong with the finding aid generation. See the
     :ref:`finding-aid-troubleshoot` section below, and try generating a new
     finding aid.

.. TIP::

   Don't see the option to generate a finding in the right-hand context menu?
   It could be  because your :term:`archival description` is still in
   :term:`draft <draft record>` status, and your Finding aid
   :ref:`settings <print-finding-aid-settings>` are set to "Generate Finding Aid
   as public user." AtoM will hide the link to generate finding aids from any
   draft descriptions when this setting is engaged. You can either change your
   settings (see above), or you can publish the description - see:
   :ref:`publish-archival-description`. You'll still be able to upload a
   finding aid to a draft description, but remember: your public users will
   not be able to see the descriptions or the finding aid until the
   descriptions are published!

3. To **generate** a finding aid from your archival descriptions, click the
   "Generate" link in the Finding aid section of the right-hand context menu.
   AtoM will reload the page, and the Finding aid section will display a status
   message of "In progress".

.. image:: images/link-internal-generating.*
   :align: center
   :width: 20%
   :alt: An image of the Finding aid generating status message

4. To **upload** a finding aid, click the "Upload" link in the Finding aid
   section of the right-hand context menu. AtoM will redirect you to a page
   where you can select a finding aid from your local computer. When ready,
   click the "Upload" button. After upload, AtoM will redirect you to the
   archival description view page - you'll see the status message in the
   finding aid section of the right-hand :term:`context menu` will read "In
   progress" as your finding aid is uploaded.

.. image:: images/upload-fa.*
   :align: center
   :width: 90%
   :alt: An image of the Finding aid upload selection page

5. To update the status and determine if your finding aid was successfully
   generated or uploaded, wait a moment for the process to execute, and then
   refresh the browser. Alternately, you can navigate to the jobs page for more
   details about the status of a job - see: :ref:`manage-jobs` for more
   information.

6. If the finding aid has failed to generate, you will see an "Error" status
   message in the right-hand context menu. You can also navigate to |edit|
   **Manage > Jobs** to see if further details on the cause of the error are
   available. See the troubleshooting section
   :ref:`below <finding-aid-troubleshoot>` for suggestions on how to resolve
   errors.

.. image:: images/fa-error.*
   :align: center
   :width: 20%
   :alt: An image of an error message in the Finding aid section

7. If the finding aid has generated successfully, you will see a Download
   button when you refresh the page. The status message (visible only to
   logged-in users) will indicate if the existing finding aid was generated or
   uploaded. Click on the Download button to view your finding aid. If your
   description is published, unauthenticated (e.g. public) users will now be
   able to see this Download link as well - they will not see the status
   messages or delete options, however.

.. image:: images/fa-generated.*
   :align: center
   :width: 20%
   :alt: An image of a status message for a generated finding aid

8. You can re-generate or re-upload a new finding aid at any time by
   first deleting the existing finding aid (covered
   :ref:`below <delete-finding-aid>`, and then following steps 1-6 again.
   This can be useful if you make :ref:`edits <edit-archival-description>` to
   your :term:`archival description` or its :term:`children <child record>`, or
   if you change the format of the finding aid in the settings. **The finding
   aids are not automatically updated when you make edits to your
   descriptions**. Be sure to re-upload or regenerate a new finding aid if you
   have made changes.

.. TIP::

   In addition to providing a button to view the finding aid in the right-hand
   :term:`context menu`, AtoM will also automatically add a link in the body
   of the related description, appearing below the free-text "Finding aids"
   :term:`field`. The link description text will also specify whether the
   finding aid is uploaded or generated. Here is an example of a generated
   finding aid link in the :term:`view page` of an archival description:

   .. image:: images/fa-generated-link.*
      :align: center
      :width: 80%
      :alt: An image of a finding aid link for a Generated finding aid

   And here is an example of an uploaded finding aid link:

   .. image:: images/fa-uploaded-link.*
      :align: center
      :width: 80%
      :alt: An image of a finding aid link for an Uploaded finding aid

.. _generate-finding-aid-logo:

Include a repository logo in a generated finding aid
----------------------------------------------------

It's possible to have a logo included on the cover page of a generated 
:term:`finding aid`, such as the logo of your :term:`archival institution`. 

To do so, you will need a logo, and access to the root installation directory 
of your Atom installation. 

The finding logo filesize and format should follow the requirements for 
:term:`repository` logos: 

* No larger than 256 KB in size
* PNG format
* Dimensions between 200 x 200 to 270 x 270px

The logo must be named ``pdf-logo.png``, and be placed in the ``images`` 
directory, which is found just below the root AtoM installation directory. 

Once added the logo will appear on any PDF finding aid you generate in the 
future. It will **not** be retroactively added to existing finding aids. 

Example output: 

.. image:: images/fa-logo.*
   :align: center
   :width: 55%
   :alt: An image of a generated PDF finding aid cover page with a logo

.. NOTE::

   At this time, only one logo can be added to the ``images`` directory for use
   in finding aid generation, and it applies globally to all finding aids
   generated after it has been added. 

   This means it is currently not possible to generate finding aids with 
   separate :term:`archival institution` logos in a 
   :term:`multi-repository system`.

:ref:`Back to top <print-finding-aids>`

.. _delete-finding-aid:

Delete an existing finding aid
==============================

Each :term:`archival unit` (i.e. descriptive hierarchy) can only have one
finding aid associated with it, and finding aids are not automatically updated
when descriptions are edited. If you wish to generate or upload a new finding
aid to an archival unit that already has a finding aid, you will need to
delete the existing finding aid first. You must be authenticated (e.g. logged
in) to be able to delete existing finding aids or add new ones.

**To delete an existing finding aid:**

1. Navigate to the :term:`archival unit` whose finding aid you wish to delete,
   and locate the Finding aid section in the right-hand :term:`context menu`.
   You can do this from any level of description in the hierarchy.

2. The Finding aid section will include a status message indicating whether
   the current finding aid was uploaded or generated, a Delete link, and a
   Download button to view the current finding aid:

.. image:: images/fa-uploaded.*
   :align: center
   :width: 20%
   :alt: An image of a status message for an uploaded finding aid

3. In the Finding aid section, click on the "Delete" link.

.. image:: images/fa-generated-delete.*
   :align: center
   :width: 20%
   :alt: An image of a user clicking on the delete link in the finding aid
         section of the right-hand context menu

4. AtoM will redirect you to a confirmation page. Click the "Delete" button if
   you are certain you would like to delete the existing finding aid.
   Alternatively, you can click the "Cancel" button to abort the delete
   operation.

.. image:: images/fa-delete-warning.*
   :align: center
   :width: 90%
   :alt: An image of the delete confirmation page when deleting a finding aid

5. After clicking "Delete," AtoM will redirect you to the archival description
   :term:`view page`. You can now upload or generate a new finding aid,
   following the instructions in the section :ref:`above <generate-finding-aid>`.

:ref:`Back to top <print-finding-aids>`

.. _finding-aid-layout:

Finding aid layout
==================

AtoM's finding aid generation includes a simple cover page, a table of contents,
and some basic styling to separate areas of the finding aid.

The **cover page** includes the name of the :term:`archival institution` linked
to the description, the title of the archival unit (e.g.title of the
:term:`fonds`, :term:`collection`, etc), The date the finding aid was generated,
the language of the description, the address of the archival institution, and the
URL from which the source description originates in AtoM. An example cover is
pictured below:

.. image:: images/finding-aid-cover.*
   :align: center
   :width: 50%
   :alt: An image of a sample finding aid cover

The **table of contents** will be automatically generated, and includes hyperlinks
to the related section. In a PDF, this means that bookmarks to each main section
of the finding aid are included by default.

.. NOTE::

   The numbering of the table of contents has been known to display occasional
   problems when generated in RTF and then viewed in Microsoft Word. This is a
   problem with Word's display of RTF rather than a problem with the file. The
   table of contents displays in other document viewers correctly, such as
   OpenOffice and LibreOffice.

Each page includes a simple **header** and **footer**. The header includes the
title of the archival unit, and the identifier. The footer includes the name
of the related :term:`archival institution`, and a page number.

At present, AtoM has two primary layout options for the printable finding aids:
"Full details," and "Inventory summary." These options are managed via the Finding
aid settings - see: :ref:`print-finding-aid-settings`.

The **Inventory summary** option is best used when there has been minimal description
added to lower levels, such as file and item-level records. AtoM will display these
lower levels in a summary table beneath each parent series (or sub-series, etc).
The **Full details** will treat each lower-level record similar to the
higher-level ones, and all fields will be displayed. A sample first few pages of
each, minus the cover page, has been included in an image below for comparison.

.. image:: images/finding-aid-comparison-4.*
   :align: center
   :width: 90%
   :alt: An image of the two different finding aid layouts, side by side

:ref:`Back to top <print-finding-aids>`

.. _finding-aid-troubleshoot:

Troubleshooting finding aid issues
==================================

Below are a few common questions and problems users might encounter in generating
finding aids, and some suggestions on how to address them.

Before proceeding, make sure that you have followed all the installation
requirements for job scheduling in AtoM - for more information, see:
:ref:`maintenance-asynchronous-jobs`.

The AtoM Jobs page can possibly supply you with more information on any errors
encountered, as finding aid generation is a :term:`job` handled asynchronously
in AtoM. For more information on the Jobs page, see: :ref:`manage-jobs`.

**Jump to:**

* :ref:`fa-trouble-storage-excluded`
* :ref:`fa-trouble-storage-included`
* :ref:`fa-trouble-drafts-included`
* :ref:`fa-trouble-no-generate-link`
* :ref:`fa-trouble-fields-excluded`
* :ref:`fa-trouble-ead-export-failed`

.. _fa-trouble-storage-excluded:

Physical storage information is not included in my finding aid
--------------------------------------------------------------

Physical storage information is excluded from the Finding aid if:

* The "Generate Finding Aid as public user" setting is set to YES, **and**
* The Visible elements module for your template is set to hide physical storage
  information from public users (e.g. the box is unchecked).

If you have included physical storage information with your descriptions via
AtoM's Physical storage module, and would like it included in your finding aids,
you will also need to display it in the public :term:`view pages <view page>` for
your descriptions. To do so, navigate to |gears| **Admin > Visible elements** and
make sure that the Physical storage option is |check| checked.

Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

.. SEEALSO::

   * :ref:`visible-elements`
   * :ref:`physical-storage`
   * :ref:`print-finding-aid-settings`

.. _fa-trouble-storage-included:

I don't want to display physical storage information in my finding aid
-----------------------------------------------------------------------

Physical storage information is excluded from the Finding aid if:

* The "Generate Finding Aid as public user" setting is set to YES, **and**
* The Visible elements module for your template is set to hide physical storage
  information from public users (e.g. the box is unchecked).

If you have included physical storage information with your descriptions via
AtoM's Physical storage module, and **do not** want it included in your finding aids,
you will also need to hide it in the public :term:`view pages <view page>` for
your descriptions via AtoM's Visible elements module. To do so, navigate to
|gears| **Admin > Visible elements** and make sure that the Physical storage
option is |uncheck| unchecked.

You will then need to check the finding aid settings, and make sure that the
"Generate Finding Aid as public user" option is set to "yes". See
:ref:`above <print-finding-aid-settings>` for more details on the finding aid
settings.

Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

.. SEEALSO::

   * :ref:`visible-elements`
   * :ref:`physical-storage`
   * :ref:`print-finding-aid-settings`

.. _fa-trouble-drafts-included:

Draft descriptions are being shown in my finding aid
----------------------------------------------------

If you don't want draft descriptions shown in your finding aid, navigate to
|gears| **Admin > Settings**, and click the "Finding aid" section in the menu
on the left. AtoM will load the finding aid settings, described in detail
:ref:`above <print-finding-aid-settings>`.

Make sure that the "Generate Finding Aid as public user" option is set to
"yes", and remember to click the "Save" button in the :term:`button block` if
you make any changes.

Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

.. TIP::

   Don't see the option to generate a finding in the right-hand context menu?
   It could be  because your :term:`archival description` is still in
   :term:`draft <draft record>` status, and your Finding aid
   :ref:`settings <print-finding-aid-settings>` are set to "Generate Finding Aid
   as public user." AtoM will hide the link to generate finding aids from any
   draft descriptions when this setting is engaged. You can either change your
   settings (see above), or you can publish the description - see:
   :ref:`publish-archival-description`. You'll still be able to upload a
   finding aid to a draft description, but remember: your public users will
   not be able to see the descriptions or the finding aid until the
   descriptions are published!

.. SEEALSO::

   * :ref:`print-finding-aid-settings`
   * :ref:`publish-archival-description`

.. _fa-trouble-no-generate-link:

There's no option in the context menu to generate a finding aid
---------------------------------------------------------------

This could be because your archival description is in
:term:`draft mode <draft record>`, and the Finding aid settings are set to
generate as a public user.

If you have the "Generate Finding Aid as public user" setting set to "Yes,"
the option to generate a finding aid will **not appear** on any
:term:`draft <draft record>` descriptions in AtoM. You will have to publish
the description before you can generate a finding aid, or change the setting.

The finding aid generation in AtoM has **not** been tied to the
:term:`permissions <access privilege>` module at all - the module that allows
an :term:`administrator` to limit access for users and groups (see:
:ref:`edit-user-permissions` for more information). However, by hiding the
link on draft descriptions, an administrator can therefore restrict finding aid
generation for drafts to only those users who have publish privileges, as the
description must be published before the link will reappear.

Note that you will still have the option to upload a finding aid to a draft
archival description - but remember, your public users will not be able to see
the archival descriptions or the related finding aid until the
:term:`archival unit` is published.

.. SEEALSO::

   * :ref:`print-finding-aid-settings`
   * :ref:`publish-archival-description`
   * :ref:`edit-user-permissions`

.. _fa-trouble-fields-excluded:

My scope and content is not included for file and item level descriptions
-------------------------------------------------------------------------

This could be because you have selected the "Inventory summary" option in the
"Finding aid model" settings. AtoM has two different stylesheets for finding aids.
One includes only an inventory table with minimal details for lower-level
descriptions such as files and items (the "Inventory summary" option); the other
includes full details at all levels of description. A comparison image is
included below, with the Inventory summary on the left, and a sample item
description with full details on the right:

.. image:: images/item-description-compare.*
   :align: center
   :width: 95%
   :alt: Finding aid details comparison - Full details vs Inventory summary

If you want all fields present in your lower-level descriptions to be available
in the finding aid you generate, we suggest changing this setting to
"Full details." Remember to save your changes after making settings changes.

Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

.. SEEALSO::

   * :ref:`print-finding-aid-settings`

.. _fa-trouble-ead-export-failed:

Finding aid generation error; the jobs page says that "Exporting EAD has failed"
--------------------------------------------------------------------------------

First, check if you have a working internet connection. AtoM will attempt to
reach the EAD XML DTD kept at
http://lcweb2.loc.gov/xmlcommon/dtds/ead2002/ead.dtd and if there is no
internet connection the task may fail, with a message like this in the Job
details page:

.. image:: images/fa-saxon-fail.*
   :align: center
   :width: 95%
   :alt: An example of a failed finding aid generation in the Jobs page

If you restore your internet connection, you can try again - the issue may now
be resolved.

If not, it may have to do with the content you have added to your archival
description.

AtoM generates its PDF finding aids by first exporting the
:term:`archival description` as `EAD XML <http://www.loc.gov/ead/tglib/index.html>`__,
and then transforming that EAD XML using an
`XSLT <https://en.wikipedia.org/wiki/XSLT>`__ into the desired format (PDF or RFT).

For this process to work, the EAD XML must first be able to export - which means
it must first be valid `XML <https://en.wikipedia.org/wiki/XML>`__.

This means your EAD may fail to export properly if:

* You've used unescaped special characters, such as ampersands ``&`` or ``<``
  and ``>``.
* You've used inline HTML elements to style the display of some fields in AtoM -
  for example, using ``<em>`` or ``<i>`` elements for emphasis or italics.
* You've cut and pasted non UTF-8 encoded characters into AtoM - a common example
  would be the curvy quotation marks used in many word processing applications like
  Microsoft Word, instead of the standard `UTF-8 <https://en.wikipedia.org/wiki/UTF-8>`__
  straight quotes ``"``

We suggest you try reviewing your description(s) in :term:`edit mode` and look
for some of these common errors that can affect EAD export. Remove any HTML you
have added inside AtoM's edit fields. Make sure that you replace any non-standard
punctuation cut and pasted from common word processor applications.

Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

:ref:`Back to top <print-finding-aids>`
