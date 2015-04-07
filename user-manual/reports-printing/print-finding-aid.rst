.. _print-finding-aids:

==========================================
Generate, download, and print finding aids
==========================================

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
in the :ref:`finding aid settings <finding-aid>`. Once the finding aid is
generated, it can be downloaded from the top :term:`parent <parent record>`
description level of an :term:`archival description` by any user, via a link
provided in the right-hand :term:`context menu`.

.. seealso::

   * :ref:`create-file-list-report-print`
   * :ref:`create-item-list-report-print`
   * :ref:`archival-descriptions`
   * :ref:`manage-jobs`

Finding aids in AtoM are generated asynchronously in the background using
`Gearman <http://gearman.org>`__, AtoM's job manager. You will need to make sure
that Gearman is properly configured during installation to be able to generate
finding aids - for more information, see: :ref:`installation-asynchronous-jobs`.
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
generate a finding aid, view information on the status of your finding aid
generation request, and how users can view the finding aid after it has been
successfully generated.

**Jump to:**

* :ref:`print-finding-aid-settings`
* :ref:`generate-finding-aid`
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

.. WARNING::

   At present, you can only have 1 format of finding aid used for download
   throughout AtoM. If you have previously generated a bunch of PDF finding
   aids, and then you switch this setting to RTF, it will make the previous
   finding aids inaccessible, and  you will need to re-generate new finding
   aids in the new target format. If you switch the setting back, your PDFs will
   be available again - the file is still there, but this setting also determines
   what format the download link will look for, so unless you generate all your
   finding aids in both formats, be careful when switching settings!

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
   the description before you can generate a finding aid.

:ref:`Back to top <print-finding-aids>`

.. _generate-finding-aid:

Generate finding aid
====================

Once you have configured the finding aid settings, you can now begin to generate
:term:`finding aids <finding aid>` for your
:term:`archival descriptions <archival description>`. While the settings can only
be configured by an :term:`administrator`, at present **any authenticated user**
can generate a finding aid for a description they have permission to view. An
administrator can review all finding aid generation requests via the Jobs page -
for more information on managing :term:`jobs <job>` in AtoM, see:
:ref:`manage-jobs`.

**To generate a finding aid:**

1. Navigate to the :term:`archival description` for which you would like to
   generate a finding aid. You can do this by :ref:`browsing <browse>` or
   :ref:`searching <search-atom>` for the :term:`archival description` - see
   :ref:`access-content` for more information on navigation in AtoM.

.. NOTE::

   You can only generate a finding aid for a top-level description - e.g. a
   :term:`parent record` such as a :term:`fonds`, :term:`collection`, or perhaps
   a series (depending on local practice). The :term:`level of description` in
   AtoM does not determine if it is a top-level description or not (in AtoM,
   even an item-level description could be considered a top-level description if
   it has no :term:`parent <parent record>`) - instead, a description is
   considered top-level if it is not the :term:`child <child record>` of any
   other descriptions in a hierarchy.

2. In the right-hand :term:`context menu`, you will see a section titled "Finding
   aid". For logged-in users, this menu will include status information, and if a
   finding aid has already been generated, a download link for the current finding
   aid. Status messages are never shown to public users - the finding aid section
   will only appear in the context menu if a finding aid has been successfully
   generated.

   .. image:: images/finding-aid-statuses.*
      :align: center
      :width: 95%
      :alt: Finding aid status messages in the context menu and their meanings

   **Finding aid statuses and their meanings**

   * *Unknown*: No finding aid has previously been generated for this description.
   * *File missing*: Finding aid was previously generated, but the
     :ref:`print-finding-aid-settings` for have sinced changed. Generate a new
     finding aid to resolve.
   * *Error*: Something went wrong with the finding aid generation. See the
     :ref:`finding-aid-troubleshoot` section below, and try generating a new
     finding aid.
   * *Generating*: The job is underway and the finding aid is generating. Refresh
     the page for an updated status, and/or visit the Jobs page - see:
     :ref:`manage-jobs`

.. TIP::

   Don't see the Finding aid section in the right-hand context menu? It could be
   because your :term:`archival description` is still in
   :term:`draft <draft record>` status, and your Finding aid
   :ref:`settings <print-finding-aid-settings>` are set to "Generate Finding Aid
   as public user." AtoM will hide the link to generate finding aids from any
   draft descriptions when this setting is engaged. You can either change your
   settings (see above), or you can publish the description - see:
   :ref:`publish-archival-description`.

3. To generate a new finding aid, click the "Generate" link in the Finding aid
   section of the right-hand context menu. AtoM will reload the page, and the
   Finding aid section will display a status message of "Generating".

.. image:: images/link-internal-generating.*
   :align: center
   :width: 20%
   :alt: An image of the Finding aid generating status message

4. To update the status and determine if your finding aid was successfully
   generated, wait a moment for the process to execute, and then refresh the
   browser. Alternately, you can navigate to the jobs page for more details about
   the status of a job - see: :ref:`manage-jobs` for more information.

5. If the finding aid has failed to generate, you will see an "Error" status
   message in the right-hand context menu. You can also navigate to |edit|
   **Manage > Jobs** to see if further details on the cause of the error are
   available. See the troubleshooting section
   :ref:`below <finding-aid-troubleshoot>` for suggestions on how to resolve
   errors.

6. If the finding aid has generated successfully, you will see a Download link
   when you refresh the page. Click on this link to view your finding aid. Public
   users will now be able to see this Download link as well.

7. You can re-generate a new finding aid at any time by following steps 1-5 above.
   This can be useful if you make :ref:`edits <edit-archival-description>` to
   your :term:`archival description` or its :term:`children <child record>`, or
   if you change the format of the finding aid in the settings.

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
:ref:`installation-asynchronous-jobs`.

The AtoM Jobs page can possibly supply you with more information on any errors
encountered, as finding aid generation is a :term:`job` handled asynchronously
in AtoM. For more information on the Jobs page, see: :ref:`manage-jobs`.

**Jump to:**

* :ref:`fa-trouble-storage-excluded`
* :ref:`fa-trouble-storage-included`
* :ref:`fa-trouble-drafts-included`
* :ref:`fa-trouble-no-generate-link`
* :ref:`fa-trouble-file-missing`
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

.. SEEALSO::

   * :ref:`print-finding-aid-settings`
   * :ref:`publish-archival-description`
   * :ref:`edit-user-permissions`

.. _fa-trouble-file-missing:

My finding aid link says "Status: File missing"
-----------------------------------------------

.. image:: images/link-internal-generating.*
   :align: right
   :width: 15%
   :alt: An image of the Finding aid missing status message

This could be because you changed the finding aid format in the
:ref:`Finding aid settings<print-finding-aid-settings>`.

At present, AtoM can only offer one type of finding aid download at a time to
users - there is no option for a public user to pick the format even if both a
PDF and an RTF finding aid have been generated. This means that the "Finding aid
format" setting is actually setting 2 things - the format for future finding aid
generation, AND the default download format for finding aids.

If you have generated a bunch of finding aids in PDF format, and then you change
the format setting to RTF, your previous descriptions with PDF finding aids will
now display a "Status: missing" message, and the download link will be hidden
from public users. This is because AtoM is now looking for an RTF finding aid,
and not finding it. You can either generate a new finding aid in RTF format, or
you can change the setting back - your PDF finding aids have not been lost. Once
the Format setting is restored to PDF, any previous finding aids generated in PDF
format will be available again via the Download link.

.. SEEALSO::

   * :ref:`print-finding-aid-settings`
   * :ref:`generate-finding-aid`

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

AtoM generates its PDF finding aids by first exporting the
:term:`archival description` as `EAD XML <http://www.loc.gov/ead/tglib/index.html>`__,
and then transforming that EAD XML using an
`XSLT <https://en.wikipedia.org/wiki/XSLT>`__ into the desired format (PDF or RFT).

For this process to work, the EAD XML must first be able to export - which means
it must first be valid `XML <https://en.wikipedia.org/wiki/XML>`__.

This means your EAD may fail to export properly if:

* You've used unescaped special characters, such as ampersands ``&``
* You've used inline HTML elements to style the display of some fields in AtoM -
  for example, using ``<em>`` or ``<i>`` elements for emphasis or italics.
* You've cut and pasted non UTF-8 encoded characters into AtoM - a common example
  would be the curvy quotation marks used in many word processing applications like
  Microsoft Word, instead of the standard `UTF-8 <https://en.wikipedia.org/wiki/UTF-8>`__
  straight quotes ``"``

We suggest you try reviewing your description(s) in :term:`edit mode` and look
for some of these common errors that can affect EAD export. Remove any HTML you
have added inside AtoM's edit fields. Make sure that you replace any non-standard
punctuation cut and pasted from common word processor applications. You can also
escape special characters using HTML character escapes - for example, ``&amp;``,
when written in an :term:`edit page` field in AtoM and saved, will render in the
:term:`view page` as ``&``.

**Other useful character escapes:**

========== ================
Character  Character escape
========== ================
``&lt;``   ``<``
``&gt;``   ``<``
``&amp;``  ``&``
``&quot;`` ``"``
``&#39;``  ``'``
========== ================


Now you can re-generate your finding aids, following the steps above,
:ref:`generate-finding-aid`.

:ref:`Back to top <print-finding-aids>`
