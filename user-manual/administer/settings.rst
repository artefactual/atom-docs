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
* :ref:`Job scheduling <job-scheduling>`
* :ref:`Security panel <security-panel>`
* :ref:`Permissions <permissions>`

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
* :ref:`Sort treeview (information object) <sort-treeview>`
* :ref:`Sort browser (users) <sort-browser-users>`
* :ref:`Sort browser (anonymous) <sort-browser-anonymous>`
* :ref:`Multiple repositories <multiple-repositories>`
* :ref:`Default archival institution upload limit <default-institution-upload>`
* :ref:`Total space available for uploads <total-upload-space>`
* :ref:`Upload multi-page files as multiple descriptions <upload-multi-files>`
* :ref:`Show tooltips <tooltips>`
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
:term:`site title` and :term:`site description`. To save any modifications,
click the "Save" button located below the "Site Description" field.

.. image:: images/site-information.*
   :align: center
   :width: 70%
   :alt: An image of the Site information menu in AtoM

Note that the visibility of these elements can also be controlled via the
"Default page elements" settings, described below.

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
hide the element. The logo, site title, and site description all appear as
part of the AtoM :term:`header bar`:

.. image:: images/headerBar_admin.*
   :align: center
   :width: 70%
   :alt: An image of the AtoM header bar elements for an Administrator

For more information on page elements, see :ref:`Themes & Theming <themes>`.

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

.. image:: images/user-interface-label.*
   :align: right
   :width: 35%
   :alt: User interface label settings

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
<https://www.accesstomemory.org/community/translate>`_.

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

.. WARNING::

   This feature was developed for earlier versions of AtoM and has not been
   tested in AtoM 2.x. We hope to improve OAI features in future version
   releases of AtoM.

**Enable OAI**

Select "yes" if you want the system to act as an OAI repository and respond to
OAI harvesting requests.

**OAI repository code**

An alpha-numeric code can be added in the value field to uniquely identify this
particular OAI repository within its network domain to create a unqiue, OAI
compliant identifier.

**OAI repository identifier**

This is an auto-generated setting that produces an OAI compliant repository
identifier, which includes OAI repository code value if it is set.

**Sample OAI identifier**

This is an example of the auto-generated, OAI compliant identifier which is
created for each item in this particular OAI repository.

**Resumption token limit**

This relates to the number of :term:`entities <entity>` to include in a single
OAI response list before inserting a resumption token.

:ref:`Back to top <settings>`


.. _job-scheduling:

Job scheduling
==============

In Release 1.3, job scheduling was introduced, using `Gearman
<http://gearman.org/>`__, to make AtoM capable of running applications in the
background. At present, the only process that makes use of this feature is
SWORD.

.. image:: images/job-scheduling.*
   :align: center
   :width: 70%
   :alt: An image of the Job scheduling menu in AtoM

Click the :term:`radio button` beside "yes" to enable job scheduler.

.. NOTE::

   Users who have DIP uploads configured from Archivematica will need to
   enable this feature.

:ref:`Back to top <settings>`

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
make PREMIS rights records in archival descriptions actionable on
attached digital objects. For more instructions and examples, please see
:ref:`Make rights actionable on digital objects <rights-digital-object>`.

:ref:`Back to top <settings>`
