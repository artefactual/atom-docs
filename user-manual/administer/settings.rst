.. _settings:

========
Settings
========

This section describes how to customize your AtoM application to the
specific requirements of your own institution or :term:`network`.

Below, you will find information on the following :term:`information areas
<information area>`:

* :ref:`Global settings <global-settings>`
* :ref:`Site information <site-information>`
* :ref:`Default page elements <default-page-elements>`
* :ref:`Default templates <default-templates>`
* :ref:`User interface labels <user-interface-labels>`
* :ref:`Add/Remove languages <add-remove-languages>`
* :ref:`OAI repository <oai-repository>`
* :ref:`Finding aid <finding-aid>`
* :ref:`Security panel <security-panel>`
* :ref:`Permissions <permissions>`
* :ref:`inventory-settings`
* :ref:`digital-object-derivatives`

Each of the settings areas listed above is accessible via a list of links on
the left-hand side of the settings page. Click on the appropriate link, and
click save after making your changes.

.. figure:: images/settings-menu.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: Settings menu appears on left hand side

   Choose the settings area you wish to view/edit by clicking a link in the menu on the left-hand side.

.. _global-settings:

Global settings
===============

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

Global settings allow :term:`administrators <administrator>` to control certain
aspects of how AtoM appears and behaves.

To access the "Settings" menu in AtoM, click on the |gears| :ref:`Admin
menu <main-menu-admin>` in the :term:`main menu` located in the
:term:`header bar` and select "Settings" from the :term:`drop-down menu`. You
will be redirected to the "Site Settings", where a number of :term:`information
areas <information area>`, including the "Global" settings, should be opened.
If closed, simply click on the "Global" blue menu to open the area and view the
:term:`fields <field>`.

.. image:: images/global-settings.*
   :align: center
   :width: 70%
   :alt: An image of the Global settings in AtoM

This section will describe each :term:`field` in the "Global"
:term:`information area`:

* :ref:`Application version <application-version>`
* :ref:`Check for updates <check-updates>`
* :ref:`Maximum image width <max-image-width>`
* :ref:`Results per page <results-page>`
* :ref:`Accession mask <accession-mask>`
* :ref:`Accession counter <accession-counter>`
* :ref:`Reference code separator <reference-code-separator>`
* :ref:`Inherit reference code (Information object) <inherit-reference-code>`
* :ref:`Treeview type <treeview-type>`
* :ref:`Sort treeview (information object) <sort-treeview>`
* :ref:`Sort browser (users) <sort-browser-users>`
* :ref:`Sort browser (anonymous) <sort-browser-anonymous>`
* :ref:`Default repository browse view <default-repo-view>`
* :ref:`Multiple repositories <multiple-repositories>`
* :ref:`Default archival institution upload limit <default-institution-upload>`
* :ref:`Total space available for uploads <total-upload-space>`
* :ref:`Upload multi-page files as multiple descriptions <upload-multi-files>`
* :ref:`Show tooltips <tooltips>`
* :ref:`Generate description permalinks from <description-permalinks>`
* :ref:`Default publication status <default-publication-status>`
* :ref:`SWORD deposit directory <sword-directory>`

Hovering over each :term:`field` will also provide additional information on
that field - it will appear in an "information box" below your cursor.

When making changes to the global settings in AtoM, don't forget to click the
"Save" button in the :term:`button block`, located at the bottom of the "Global"
settings :term:`information area`.

.. _application-version:

Application version
-------------------

This :term:`field` shows the current version of the software. The value cannot
be edited but is automatically updated when AtoM is upgraded to a newer
release.

For more information on installing AtoM and searching for different versions,
see:

* Installing AtoM with:

  * :ref:`Linus <installation-linux>`
  * :ref:`Windows <installation-windows>`
  * :ref:`Mac OS X <installation-macosx>`

* :ref:`Search for updates <search-updates>`

.. _check-updates:

Check for updates
-----------------

If yes is selected, an :term:`administrator` will automatically receive a
notification if a newer version of the AtoM software has been released and can
be installed. This notification will appear in the browser for authenticated
(i.e. logged in) users, as an orange bar across the top of the application
alerting users to the newest release available.

.. figure:: images/cva-theme.*
   :align: center
   :width: 100%
   :figwidth: 75%
   :alt: An image of a themed AtoM instance showing an update notification

   This image shows a themed AtoM installation at the
   `City of Vancouver Archives <http://searcharchives.vancouver.ca/>`__,
   showing an update notification in orange at the top of the screen. Only
   authenticated users will see this notification.

For more information on updates, see:

* :ref:`Search for updates <search-updates>`

.. _max-image-width:

Maximum image width (pixels)
----------------------------

One of AtoM's design assumptions is that the display dimensions of files
users upload typically will be too large to fit into the :term:`view page` for
an :term:`archival description`. Therefore, when you upload a file, AtoM creates
a :term:`reference display copy` for displaying in the view page.

AtoM ships with a default setting specifying the maximum width of the
:term:`reference display copy` at **480 pixels**. This is the optimized width
given AtoM's :term:`field` width. :term:`Administrators <administrator>`,
however, can increase or decrease the maximum reference image
width to suit the requirements of their institution or network.

.. seealso::

   * :ref:`Styling static pages <styling-static-page>`
   * :ref:`Themes & Theming <themes>`

.. _results-page:

Results per page
----------------

By default, AtoM lists objects in list pages and search results **ten at a
time**, with a pager at the bottom of the page to allow users to navigate
through long lists of objects. :term:`Administrators <administrator>` can
increase or decrease this default number.

For more information on navigating in AtoM, see :ref:`Searching in AtoM
<search-atom>` and :ref:`Navigating in AtoM <navigate>`.

.. NOTE::

   Editing this number to display a large number of results per page may
   affect page load times.

.. _accession-mask:

Accession mask
--------------

By default, AtoM creates the :term:`accession record` identifier as a unique
number compiled from YEAR-MONTH-DAY-Incremental#, expressed as ``%Y-%m-%d/#i``.
This mask, or default counter, can be changed by
:term:`administrators <administrator>` to suit institutional needs.

.. image:: images/accession-mask.*
   :align: center
   :width: 75%
   :alt: an image of the accession mask

For more information on accession records, see :ref:`accession-records`.

.. _accession-counter:

Accession counter
-----------------

AtoM provides you with the number of :term:`accessions <accession record>`
created. If you delete an accession, it will still be included in the Accession
counter total value. If this number is changed by an administrator, the next
accession created will receive the next number in sequence.

.. _reference-code-separator:

Reference code separator
------------------------

The reference code separator is the character separating hierarchal elements
in a reference code (see Inherit reference code, below). The default
reference code separator appears as a dash "-" in AtoM, which can be changed
by an administrator to suit institutional practices.

.. _inherit-reference-code:

Inherit reference code (information object)
-------------------------------------------

When this is set to "yes", the reference code string will be built using the
archival description identifier plus the identifier of all its ancestors
(:term:`parent records <parent record>`), as well as the repository identifier
and country code if they have been entered. The string will appear in this
order with the applicable elements:

* Country code (derived from the country code of the country entered into the
  contact information of the related :term:`archival institution`)
* Repository identifier (derived from the identifier field on the related
  :term:`archival institution`)
* Fonds/Collection level identifier
* Series identifier
* Subseries identifier
* File identifier
* Item identifier

.. image:: images/refcode-inherit.*
   :align: center
   :width: 75%
   :alt: an example of reference code inheritance

When reference code inheritance is enabled, AtoM will also display the full
reference code in the edit page for
:term:`archival descriptions <archival description>`, as contextual
information to help orient the user.

.. image:: images/reference-edit-mode.*
   :align: center
   :width: 45%
   :alt: an example of the reference code display in edit mode

.. IMPORTANT::

   Whether reference code inheritance is turned on or not, the
   :ref:`sort button <recurring-sort-button>` option on the
   :term:`archival description` browse page will still sort by full inherited
   reference code, and **not** by identifier alone. This setting only affects
   the display. For more information on sorting, see:
   :ref:`recurring-sort-button`.

.. SEEALSO::

   * :ref:`Control area <control-area>`

.. _treeview-type:

Treeview type
-------------

This setting allows administrators to choose between two different display
formats for the :term:`treeview`. For more information about the treeview in
AtoM, see: :ref:`context-menu-treeview`.

The **Sidebar** setting refers to the classic treeview that appears in the
left-hand :term:`context menu` of an :term:`archival description`. The **Full
width** treeview, introduced in the AtoM 2.3 release, will display below the
description title, and above the first :term:`information area` of the
description. The display space of the full-width treeview can be expanded by
users by gripping and dragging the bottom bar of the treeview downwards to
expand the viewing area.

Other differences include:

* The sidebar version does not indent lower-levels, while indentation is used
  in the full width treeview
* The Identifier is included in the sidebar treeview nodes, while no
  identifier is included in those of the full width version
* The results in the sidebar treeview are truncated - the first 5-6 nodes in
  the hierarchy are displayed by default, after which an approximate count of
  remaining nodes in the current level is provided, with the option to expand
  the results to display more. All nodes are shown in the full width treeview.

Below are screenshots of the same :term:`fonds`, shown with each version of
the treeview enabled, for comparison.

**Sidebar treeview**

.. image:: images/treeview-sidebar-example.*
   :align: center
   :width: 75%
   :alt: an example a description displayed with the sidebar treeview


**Full width treeview**

.. image:: images/treeview-fullwidth-example.*
   :align: center
   :width: 75%
   :alt: an example a description displayed with the full width treeview

.. SEEALSO::

   * :ref:`context-menu-treeview`
   * :ref:`context-menu`
   * :ref:`archival-descriptions`

.. _sort-treeview:

Sort treeview (information object)
----------------------------------

This setting determines how lower-level :term:`descriptions <archival
description>` are sorted in an :term:`archival description's <archival
description>` :term:`context menu`.

* Selecting "manual" means the descriptions will appear in the order in which
  they were entered into AtoM. If manual sort is selected, editors can also
  drag and drop descriptions within the :term:`treeview` to re-order.
* Selecting "title" sorts the descriptions by title.
* Selecting "identifier - title" sorts the descriptions by identifier, then by
  title.

.. TIP::

   AtoM's search index is based on Elasticsearch, which sorts characters based
   on the order of the in the `ASCII <https://en.wikipedia.org/wiki/Ascii>`_
   character encoding scheme. This can result in seemingly wrong orders when
   sorting by identifier- for example, 1-1 will be followed by 1-10 instead of
   1-2. The solution is to use **leading zeroes** when forumulating
   identifiers that you wish to sort in a human- readable order, e.g. 1-01,
   1-02, etc.

For more information, see :ref:`treeview-search`.

.. _sort-browser-users:

Sort browser (users)
--------------------

:term:`Administrators <administrator>` can configure default sort order for
the browse display as either "alphabetic", "last updated," or "identifier" for
logged-in users. "Last updated" will display records most recently added or
edited at the top of the results, allowing users to explore what has changed.
By default, the sort order is set to "Last updated" for authenticated users.
However, users have the option to reorder the page while browsing via the
:ref:`sort button <recurring-sort-button>` located at the top of most browse
pages.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`recurring-sort-button`
   * :ref:`user-roles`

.. _sort-browser-anonymous:

Sort browser (anonymous)
------------------------

:term:`Administrators <administrator>` can configure default sort order for
the browse display as either "alphabetic," "last updated," or "identifier" for
public users (e.g., not logged-in). "Last updated" will display records most
recently added or edited at the top of the results, allowing users to explore
what has changed. By default, the sort order is set to "Alphabetic" for
anonymous (i.e. public) users. However, users have the option to reorder the
page while browsing via the :ref:`sort button <recurring-sort-button>` located
at the top of most browse pages.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`recurring-sort-button`
   * :ref:`user-roles`

.. _default-repo-view:

Default repository browse view
------------------------------

This setting will determine if the "card view" or the "table view" is the
default view for the :term:`archival institution` browse page, when users
first arrive on the page.

.. image:: images/repo-views.*
   :align: center
   :width: 70%
   :alt: An comparison of the card and table views of the repository browse page

.. TIP::

   Regardless of which setting you choose, any user can easily toggle between
   the card view and the table view on the :term:`archival institution` browse
   page, using the view toggle button that appears to the right of the archival
   institution search box:

   .. image:: images/view-toggle-repository.*
      :align: center
      :width: 80%
      :alt: An image of the view toggle button on the repository browse page

For more information on working with archival institutions, see:

* :ref:`Browse archival institutions <browse-institutions>`
* :ref:`Search archival institutions <dedicated-search-institutions>`
* :ref:`archival-institutions`


.. _multiple-repositories:

Multiple repositories
---------------------

Select "yes" if your AtoM application is acting as a union list or portal for
:term:`descriptions <archival description>` of materials held at more than one
:term:`archival institution` or :term:`repository`. The repository will appear
as a column on the "Browse archival descriptions" page. The repository will
appear as a link in the :term:`context menu`.

Select "no" if your AtoM application is being used only by a single institution.
By selecting "no", the repository name will be excluded from certain displays
because it will be too repetitive and the :term:`creator` rather than the
repository will now appear as a column on the list :term:`archival description`
page.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`archival-descriptions`
   * :ref:`archival-institutions`

.. _default-institution-upload:

Default archival institution upload limit (GB)
----------------------------------------------

Enter the upload limit in GB allowed for uploading digital objects. Use "-1" as
the value for unlimited upload space. This setting can be modified by an
authenticated (i.e. logged-in) :term:`administrator`.

A value of "0" (zero) disables file upload.

For more information, see :ref:`upload-digital-object`.

.. TIP::

   While this setting is global, an upload limit can also be set by an
   :term:`administrator` on a per-repository basis, from the
   :term:`archival institution` page. For more information, see:
   :ref:`upload-limit`.

.. _total-upload-space:

Total space available for uploads
---------------------------------

This field will display the used space for digital objects as well as the
total space available.

.. _upload-multi-files:

Upload multi-page files as multiple descriptions
------------------------------------------------

Select "yes" if you would like each page of a multi-page file to be attached
to a separate :term:`child-level <child record>` description. For example, a
PDF file with 10 pages uploaded to a description would result in 10 individual
descriptions, one for each page in the file.

Select, "no" if you would like one multi-page file to be attached to a single
description.

.. seealso::

   * :ref:`archival-descriptions`
   * :ref:`upload-digital-object`

.. _tooltips:

Show tooltips
-------------

:term:`Tooltips` are online text designed to assist users to enter data in
:term:`edit pages <edit page>`. While adding or editing an :term:`archival
description`, tooltip text is usually derived from the standards on which the
edit templates are based (e.g. RAD, ISAD, etc).

:term:`Administrators <administrator>` can select "yes" to to have tooltips
appear in :term:`edit pages <edit page>` as the user enters data. Selecting "no"
will disable tooltips.

.. _description-permalinks:

Generate description permalinks from
------------------------------------

This setting allows an :term:`administrator` to determine if the :term:`slug`
(or permalink) generated from an :term:`archival description` when it is saved
is derived from the title, or from the reference code of the description (for
more information on how reference codes are constructed in AtoM, see above:
:ref:`inherit-reference-code`). By default, AtoM will derive the slug from the
title of a description - the title will be sanitized by removing
capitalization, spaces, and special characters; it will also be truncated if
it exceeds a certain length. Administrators can now choose, via this setting,
if they prefer that the slug is derived from the reference code instead.

Note that this setting does not apply retro-actively to descriptions already
created. It will only apply to new descriptions created after changing the
setting.

For further context on slugs in AtoM, see: :ref:`slugs-in-atom`

.. TIP::

   This setting will also be respected by the command-line task to generate
   slugs - see: :ref:`cli-generate-slugs`. So it would be possible to update
   legacy descriptions in AtoM by deleting their slugs, and then generating
   new ones after changing this setting.

.. _default-publication-status:

Default publication status
--------------------------

This setting determines whether new :term:`archival descriptions <archival
description>` will automatically appear as :term:`draft records <draft record>`
or :term:`published records <published record>`. Note that this setting also
affects imported descriptions. For more information, see
:ref:`archival-descriptions`.

.. _sword-directory:

SWORD deposit directory
-----------------------

The SWORD deposit directory is currently being used to support packages
deposited by `Archivematica <https://www.archivematica.org/>`__ into AtoM.
If you do not know the name of your deposit directory, consult with your
systems administrator. The default is ``/tmp``.

:ref:`Back to top <settings>`


.. _site-information:

Site information
================

In this section, :term:`administrators <administrator>` can change the
:term:`site title` and :term:`site description`, and set a :term:`Base URL` for
the application.

.. image:: images/site-information.*
   :align: center
   :width: 70%
   :alt: An image of the Site information menu in AtoM

The site title and description will appear in the AtoM header bar, if they
are included in the default page elements. See
:ref:`below <default-page-elements>` for an image of where the Title and
description appear, and more about setting the visibility of default page
elements.

The base URL is used to create absolute URLs included in XML exports (e.g.
MODS and EAD exports). For example, your AtoM site is made up a series of web
pages. Each page has a full Uniform Resource Locator (URL) something like
``http://www.your-atom-site.com/your-description``. The Base URL is the part of
this URL that does not change - in this example, ``http://www.your-atom-site.com``.

Setting this value will ensure that links included in your XML exports will be
properly formed. Do not include a slash ``/`` at the end of your base URL -
AtoM will automatically add this when building the absolute URLs.

To save any modifications, click the "Save" button located below the
"Site Description" field.

:ref:`Back to top <settings>`

.. _default-page-elements:

Default page elements
=====================

This section allows :term:`administrators <administrator>` to enable or disable
certain page elements. Unless they have been overridden by a specific theme,
these settings will be used site-wide.

.. image:: images/default-page-elements.*
   :align: center
   :width: 70%
   :alt: An image of the Default page elements menu in AtoM

Checked boxes will display the corresponding element and unchecked boxes will
hide the element. The logo, site title, site description, and language menu
all appear as part of the AtoM :term:`header bar`:

.. image:: images/headerBar_admin.*
   :align: center
   :width: 70%
   :alt: An image of the AtoM header bar elements for an Administrator

The digital object :term:`carousel` appears when there are multiple
:term:`digital objects <digital object>` attached to lower-level
:term:`descriptions <archival description>`:

.. image:: images/carousel-example.*
   :align: center
   :width: 80%
   :alt: An image of the carousel shown at the top of a description

When unchecked, these elements will be hidden from display after you save the
default page element settings. This can be useful for customization - for
example, if you are not translating the content of your website and do not
need the language menu, unchecking it here will remove it from the AtoM
:term:`header bar`.

.. SEEALSO::

   * :ref:`Theming - Add or remove elements <themes-add-remove-elements>`
   * :ref:`Carousel <recurring-carousel>`
   * :ref:`The language menu <language-menu>`
   * :ref:`The AtoM header bar <atom-header-bar>`
   * :ref:`default-page-elements`


:ref:`Back to top <settings>`

.. _default-templates:

Default templates
=================

AtoM ships with default page templates for viewing and editing
:term:`archival descriptions <archival description>`, :term:`authority records
<authority record>`, and :term:`archival institutions <archival
institution>`. For more information on the standards on which these
templates are based, see :ref:`descriptive-standards`.

.. image:: images/default-template.*
   :align: center
   :width: 70%
   :alt: An image of the Default template menu in AtoM

The "Name" column shows the types of :term:`entities <entity>` that are
described in AtoM: "Archival descriptions", "Authority records" and "Archival
institutions". :term:`Drop-down menus <drop-down menu>` of descriptive standards
for each are provided under the "Value" column.
:term:`Administrators <administrator>` may select one for each entity using
the drop-down menus.

Once changes have been saved, records on the site will be able to be edited and
viewed in the templates that have been selected.

.. SEEALSO::

   * :ref:`data-entry`
   * :ref:`descriptive-standards`

:ref:`Back to top <settings>`

.. _user-interface-labels:

User interface labels
=====================

Users of AtoM interact with six main :term:`entities <entity>`: :term:`accession
records <accession record>`, :term:`archival descriptions <archival
description>`, :term:`authority records <authority record>`, :term:`archival
institutions <archival institution>`, :term:`functions <function>` and
:term:`terms <term>`.

.. seealso::

   * :ref:`entity-types`
   * :ref:`recurring-facet-filters`

AtoM is flexible enough to support descriptions a variety of cultural
materials such as archival, library, museum, and art gallery collections.
The code, therefore, uses generic terms for entities.
:term:`Administrators <administrator>` can specify how they want these
:term:`terms <term>` to appear in the :term:`user interface` labels to suit the
institution's collections. The default labels that ship with AtoM are terms
typically used by archival institutions.

.. image:: images/user-interface-label.*
   :align: center
   :width: 65%
   :alt: User interface label settings

The "Name" column shows the generic entity name and the "Value" column
shows AtoM's default user interface labels. The following is a list of the
generic terms and their AtoM user interface labels. Click on each label below to
see glossary definitions and descriptions of how the terms are used in AtoM.

* informationobject: :term:`archival description`
* actor: :term:`Authority record`
* creator: :term:`Creator`
* repository: :term:`Archival institution`
* function: :term:`Function`
* term: :term:`Term`
* subject: :term:`Subject`
* collection: :term:`Fonds`
* holdings: :term:`Holdings`
* place: :term:`Place`
* name: :term:`Name`
* digitalobject: :term:`Digital object`
* physicalobject: :term:`Physical storage`
* mediatype: :term:`Media type`
* materialtype: Material type (general material designations used in the
  :ref:`Canadian Rules for Archival Description <rad-template>`).
* facetstitle: :term:`facets title`
* genre: Term for the Genre access point taxonomy, currently only available on
  the :ref:`RAD template <rad-template>`. It appears as a :term:`facet filter`
  in the :term:`archival description` browse and search pages - this label will
  change the display in the facet headers.

:term:`User interface <user interface>` labels can be changed by
:term:`administrators <administrator>` by entering a new label(s) into the
:term:`field(s) <field>` under the "Value" column. Changes will only be
saved once the "Save" button is clicked. Changing the label will change its
appearance throughout AtoM for both authenticated (logged-in) and
public users.

.. NOTE::

   Changing the user interface labels will *not* automatically change the
   corresponding labels in the navigation menus. To change these menus, go to
   **Admin > Menus**. See the :ref:`Manage menus <manage-menus>` page for more
   information.

:ref:`Back to top <settings>`

.. _add-remove-languages:

Add/Remove languages
====================

AtoM relies on volunteer translators from the community to support new language
options. The translations are managed using
`Transifex <https://www.transifex.com/projects/p/atom/>`__ and community
members can learn more about contibuting translations `here
<https://wiki.accesstomemory.org/Resources/Translation>`_.

.. image:: images/add-remove-languages.*
   :align: center
   :width: 70%
   :alt: An image of the add/remove languages menu in AtoM

The language menu will display the languages that are currently available in
your AtoM application.

.. |delete| image:: images/xdelete.png
   :height: 18
   :width: 18

.. |globe| image:: images/globe.png
   :height: 18
   :width: 18

**To add a language:**

#. Select a language from the :term:`drop-down menu` located under "Language
   code".
#. Click the "Add" button.
#. AtoM adds the language and refreshes the page; the added language will now
   appear in the "Add/remove language" section in "Settings", as well as in the
   :term:`drop-down menu` of the |globe| :term:`language navigation menu
   <language menu>` located at the top right corner of the :term:`header bar`.

.. IMPORTANT::

   If you are adding a new language to the AtoM user interface, you **must
   re-index your site** for the new language to work as expected after adding
   it via the settings page. Using the command-line, a system administrator
   will need to run the following command from the root directory of your AtoM
   installation:

   .. code-block:: bash

      php symfony search:populate

   See: :ref:`maintenance-populate-search-index` for more information.

.. NOTE::

   Many languages appear in the "Add/remove language" section in "Settings",
   but the translations for all languages are not completed. If a language is
   selected from the **Language menu** in the :term:`header bar`, content that
   has not yet been translated will remain in English.

To continue adding languages, repeat these steps as required.

.. NOTE::

   If a user selects a language that is not currently supported (i.e., where
   the content has not yet been translated through Transifex), AtoM will
   refresh the settings screen without implementing any changes.

**To remove a language:**

#. Click the delete |delete| located in the third (blank) column next to the
   language.
#. AtoM will delete the language and refresh the page; the deleted language will
   no longer appear in the "Add/remove language" section in "Settings", nor in
   the :term:`drop-down menu` of the |globe| :term:`language navigation menu
   <language menu>` located at the top right corner of the :term:`header bar`.

To continue removing languages, repeat these steps as required.

.. seealso::

   * :ref:`choose-language`
   * :ref:`default-language`
   * :ref:`language-menu`

:ref:`Back to top <settings>`


.. _oai-repository:

OAI repository
==============

`Open Archives Initiative <http://www.openarchives.org/>`_, or OAI, is a
protocol for metadata harvesting that allows automatic data harvesting
and crawling within other systems that support OAI harvesters.

.. image:: images/oai-repository.*
   :align: center
   :width: 70%
   :alt: An image of the OAI repository menu in AtoM

Comprehensive documentation on each field in the OAI repository settings is
included in the :ref:`OAI repository <oai-pmh>` documentation, here:

* :ref:`oai-pmh-settings`

.. TIP::

   To use the OAI repository functionality in AtoM, you must first make sure
   that the arOAIPlugin is turned on. For more information, see:

   * :ref:`oai-pmh-plugin`
   * :ref:`manage-plugins`

   If the arOAIPlugin is **not** turned on, then you won't see the OAI
   repository tab on the settings page menu!

:ref:`Back to top <settings>`

.. _finding-aid:

Finding aid
===========

These settings configure how AtoM generates :term:`finding aids <finding aid>`
from :term:`archival descriptions <archival description>`. For more information,
see :ref:`Print finding aids <print-finding-aids>`; specifically,
:ref:`print-finding-aid-settings` includes a description of each settings field.

.. image:: images/finding-aid-settings.*
   :align: center
   :width: 80%
   :alt: Finding aid settings

.. _security-panel:

Security panel
==============

.. image:: images/security-panel.*
   :align: right
   :width: 35%
   :alt: Security settings in AtoM

**Limit administrator functionality by IP address**

This feature allows :term:`administrators <administrator>` to limit
administrator functionality to one or more IP addresses or IP ranges. Separate
multiple IP address or ranges by semicolons, and use a dash to indicate an IP
range. For example:

  * 192.168.0.1 (single IP address)
  * 192.168.0.1;192.168.0.255 (multiple unique IP addresses)
  * 192.168.0.1-192.168.0.255 (IP range)

**Require SSL for all administrator functionality**

This feature allows administrators the option to enable the `Hypertext
Transfer Protocol Secure (HTTPS) <http://en.wikipedia.org/wiki/HTTP_Secure>`_,
which is a protocol for security over a computer network. It works by layering
the Hypertext Transfer Protocol (HTTP) with the SSL/TLS protocol (Secure
Sockets Layer/Transport Layer Security).

Select yes to require all HTTP requests to be redirected to the HTTPS server,
changing the URI scheme from "http" to "https."

.. NOTE::

   This will only apply to users who are authenticated (logged-in) or
   visiting the login page.


**Require strong passwords**

This feature allows :term:`administrators <administrator>` to enhance login
validation by requiring the use of strong passwords. Strong passwords use
least 8 characters, and contain characters from 3 of the following
classes:

  #. Upper case letters
  #. Lower case letters
  #. Numbers
  #. Special characters

Choose "yes" to require authenticated (logged-in) users to have strong
passwords.

.. _permissions:

Permissions
===========

Permissions settings are used by :term:`administrators <administrator>` to
make PREMIS rights records in
:term:`archival descriptions <archival description>` actionable on
attached :term:`digital objects <digital object>`. See :ref:`rights` for more
information on working with rights in AtoM.

The permissions settings page is divided into 3 sections - PREMIS access
permissions, PREMIS access statements, and the Copyright statement.

For information on configuring the PEMIS access permissions, see:
:ref:`rights-digital-object` (and for an example use case, see:
:ref:`rights-digital-object-example`). For information on configuring the PREMIS
access statements, see: :ref:`disallow-statements`. For information on
configuring and using the Copyright statement, see: :ref:`copyright-pop-up`.

.. image:: images/permissions-settings.*
   :align: center
   :width: 80%
   :alt: Permissions settings in AtoM

:ref:`Back to top <settings>`

.. _inventory-settings:

Inventory
=========

The Inventory list allows an :term:`administrator` to make a page of lower-
level descriptions contained within a :term:`parent record` available on a
separate inventory page formatted as a table with sortable columns. For more
information, screenshots, and instructions for end users, see:
:ref:`browse-hierarchy-inventory`.

.. image:: images/inventory-settings.*
   :align: center
   :width: 80%
   :alt: Inventory settings in AtoM

The selections an administrator makes in this section of the settings will
determine what :term:`levels of description <level of description>` are
included in the inventory list when accessed by users.

To multi-select multiple levels of description for inclusion in the inventory
list, hold down the CTRL key (or the Command key on a Mac) while clicking the
target levels.

.. image:: images/inventory-select.*
   :align: center
   :width: 70%
   :alt: Selecting multiple levels of description in the inventory settings

Any level not selected will not appear in the inventory list results when a
user clicks the inventory link.

Because level of description :term:`terms <term>` are included in a
:term:`taxonomy` that can be configured by users with the appropriate
:term:`permissions <access privilege>`, a hyperlink to the Levels of
description taxonomy is also provided - an :term:`administrator` can customize
available terms by adding new ones, removing unused ones, or editing existing
terms (for more information, see: :ref:`terms`). Any new term added to the
Levels of description taxonomy will show up in the Inventory settings page the
next time an administrator returns to the settings page.

When you have selected the levels of description you want included in the
Inventory list, remember to click the "Save" button located in the
:term:`button block` at the bottom of the page.

.. IMPORTANT::

   **Configuring the Inventory settings in a multilingual environment**

   If you have multilingual content in your AtoM instance, or you expect users
   to be browsing in different cultures (using the :ref:`language-menu`), you
   will need to configure the Inventory settings for each target culture. For
   example, to configure the settings for English, French, and Spanish:

   1. Make sure the user interface is set to "English" using the
      :term:`language menu` - see :ref:`language-menu` for more information.
   2. Configure the inventory settings as described above for English, and
      save.
   3. Using the :term:`language menu`, flip the user interface to French.
   4. Repeat steps 1-2.
   5. Using the :term:`language menu`, flip the user interface to Spanish, and
      repeat steps 1-2 again.

:ref:`Back to top <settings>`

.. _digital-object-derivatives:

Digital object derivatives
==========================

This setting will affect the :term:`digital object` derivatives generated by
AtoM when uploading multi-page content, such as a PDF.

Whenever a digital object is linked to an :term:`archival description`, AtoM
will generate two derivative copies from the :term:`master digital object`
(e.g. the original) -  a :term:`reference display copy`, used on the archival
description :term:`view page`, and a :term:`thumbnail`, used in search and
browse results, and in the digital object
:ref:`carousel <recurring-carousel>`. By default, AtoM will use the first page
of multi-page content (such as a PDF) when generating the derivative images.

However, with multi-page content such as PDFs, the first page may not be
useful to users browsing the content - it may be an institutional cover page
used on all digitized content, a blank cover page, etc.

This setting will allow users to set a page number that should be used when
generating the derivative copies. It will work for both locally uploaded
content, and for PDFs linked via URL. If a system administrator runs the
:ref:`derivatives regeneration task <cli-regenerate-derivatives>`, AtoM will
use the setting value when regenerating PDF derivatives.

.. TIP::

   If you enter a page number that does not exist for one or more of your
   derivatives (for example, entering 99 as the value, when your PDF only has
   9 pages), AtoM will use the closest available value (in this example, page
   9) when generating the derivatives.

If you make changes, remember to click the "Save" button in the
:term:`button block`.

.. image:: images/derivatives-settings.*
   :align: center
   :width: 80%
   :alt: Digital object derivative settings in AtoM

:ref:`Back to top <settings>`
