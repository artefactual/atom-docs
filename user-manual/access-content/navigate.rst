.. _navigate:

==================
Navigation in AtoM
==================

This section introduces users to key navigation elements in AtoM, as well as
recurring page elements that can be used to perform a variety of functions
throughout the application. Navigating involves understanding the current
location (:ref:`entity <entity-types>` and page), what can be done from that
location (view, edit, add new, search, etc.), how to get related
:ref:`entities <entity-types>`, and how to go to other pages to do other
things unrelated to the current entity.

**Below you'll find an introduction to:**

* :ref:`The AtoM header bar <atom-header-bar>`

  * :ref:`The log-in button <log-in-button>`
  * :ref:`The quick links menu <quick-links-menu>`
  * :ref:`The language menu <language-menu>`
  * :ref:`The clipboard menu <clipboard-menu-header>`
  * :ref:`The main menu <main-menu>`

    * |plus| :ref:`Add <main-menu-add>`
    * |pencil| :ref:`Manage <main-menu-manage>`
    * |import| :ref:`Import <main-menu-import>`
    * |gears| :ref:`Admin <main-menu-admin>`

  * :ref:`The browse menu <browse-menu>`
  * :ref:`The search box <search-box>`
  * :ref:`The site logo <site-logo-element>`

* :ref:`Recurring page elements <recurring-page-elements>`

.. seealso::

   * :ref:`Entity types <entity-types>`
   * :ref:`Page types <page-types>`
   * :ref:`Search <search-atom>`
   * :ref:`Browse <browse>`
   * :ref:`Context menu <context-menu>`
   * :ref:`Manage menus <manage-menus>`
   * :ref:`Settings <settings>`

.. _atom-header-bar:

The AtoM Header Bar
===================

The :term:`header bar` is the primary means to access, manage, and
create content in AtoM. It is persistent, meaning it remains available on all
pages throughout the application. The :term:`header bar` includes the log-in
button, :term:`quick links menu`, :term:`language menu`,
:term:`clipboard menu`, :term:`search box`, :term:`browse menu`, and
:term:`site logo` for all users, and the :term:`main menu` for authenticated
(i.e. logged in) users.

.. image:: images/headerBar_unauthenticated.*
   :align: center
   :width: 80%
   :alt: An image of the AtoM Header bar for unauthenticated users

Additionally, an :term:`administrator` can add a :term:`site title` and a
:term:`site description` via **Admin > Settings > Site information**, and
then determine whether or not these are visible in the :term:`header bar` via
**Admin > Settings > Default page elements**. The visibility of the :term:`site
logo` can also be controlled via Default page elements. For more information
see :ref:`Settings <settings>`.

.. TIP::

   An administrator can also use the settings available in |gears| **Admin >
   Settings > Default page elements** to hide some user interface elements,
   including the :term:`language menu`. See :ref:`Settings <settings>`.

The :term:`main menu` only becomes visible in the :term:`header bar` after a
user has logged in. Depending on a user's :term:`access privileges <access
privilege>`, the :term:`main menu` may show/hide different options - for
example, only :term:`administrators <administrator>` will see the
:term:`Admin menu`. Access privileges are based on defined :term:`user roles
<user role>` (see :ref:`User roles <user-roles>`).

.. image:: images/headerBar_admin.*
   :align: center
   :width: 80%
   :alt: An image of the AtoM Header bar for Administrators

.. seealso::

   * :ref:`The Log-in button <log-in-button>`
   * :ref:`The quick links menu <quick-links-menu>`
   * :ref:`The language menu <language-menu>`
   * :ref:`The clipboard menu <clipboard-menu-header>`
   * :ref:`The main menu <main-menu>`
   * :ref:`The browse menu <browse-menu>`
   * :ref:`The search box <search-box>`
   * :ref:`The site logo <site-logo-element>`

.. _log-in-button:

|login| Log-in button
=====================

.. |login| image:: images/login.png

The log-in button, located in the :term:`header bar`, directs unauthenticated
(i.e. not logged in) users to a log in screen where users with a :term:`user
account` can enter their credentials (email and password) to log into the
application. Once a user has successfully logged in, the log-in button will
display their chosen user name. Clicking on the log-in button after logging in
will reveal a :term:`drop-down menu` with the option to log out, or to visit
the user's profile page, where a user can update their credentials (username,
email, password).

.. NOTE::

   If your AtoM site has :ref:`CAS single sign-on <cas-enabling>` enabled then
   you will not be able to update your credentials from your profile page.
   You will need to contact your CAS administrator to make any changes.

* For more information on logging in, see: :ref:`Log in <log-in>`
* For information on user roles, see: :ref:`User roles <user-roles>`

.. seealso::

   * :doc:`Manage user accounts <../administer/manage-user-accounts>`
   * :doc:`Edit permissions <../administer/edit-permissions>`

:ref:`Back to top <navigate>`

.. _quick-links-menu:

|info| Quick links menu
=======================

.. |info| image:: images/info-sign.png
   :height: 23
   :width: 23

The :term:`quick links menu`, located in the :term:`header bar` in the
top-right corner of the page, allows users to navigate to :term:`static pages
<static page>` and/or other external links added to the application by an
:term:`administrator`.

By default, several static pages are included in AtoM and available through
the quick links menu - the :term:`home page` and the :term:`about page`.
:term:`Administrators <administrator>` can customize the content on these pages
via the :term:`user interface` and/or create new static pages (see:
:ref:`manage-static-pages`). Additionally, external links can be added to the
quick links menu (or any menu) via **Admin > Menus** - often an administrator
will add a direct link to their institution home page, and/or a link to the
AtoM documentation (as a"Help" link).

**For more information on managing menus and static pages, see:**

* :ref:`manage-menus`
* :ref:`manage-static-pages`

.. TIP::

   Don't need or want the quick links menu in the :term:`header bar`? You can
   remove it entirely if you prefer. :term:`Administrators <administrator>`
   can  also change what links appear in the  quick links menu (and all menus)
   via **Admin > Menus**. For more information,  see:
   :ref:`Manage menus <manage-menus>`.

:ref:`Back to top <navigate>`

.. _language-menu:

|globe2| Language menu
======================

.. |globe2| image:: images/globe.png
   :height: 23
   :width: 23

The :term:`language menu`, located in the :term:`header bar` in the top-right
corner of the page, allows the user to switch to any of the
:term:`supported languages <supported language>` in AtoM. It is available to
all users (whether or not they are logged in). It is represented by a |globe|
icon - clicking the globe icon will reveal a :term:`drop-down menu` that
lists the available languages. When a user selects a language from the menu,
the page will reload and all translated interface elements (such as menus,
edit templates, :term:`tooltips`, labels, help text, etc.) will appear in the
selected language, and will remain in the selected language until the user
changes the language again.

.. TIP::

   If the language menu is not needed for your site, it can be disabled and
   hidden via |gears| **Admin > Settings > Default page elements**. For more
   information, see: :ref:`default-page-elements`.

.. |globe| image:: images/globe.png
   :height: 18
   :width: 18

* For more information on changing the language, see: :ref:`Choose language
  <choose-language>`

.. SEEALSO::

   * :doc:`Default language <../administer/default-language>`
   * :ref:`Add/remove languages <add-remove-languages>`

:ref:`Back to top <navigate>`

.. _clipboard-menu-header:

|clip1| Clipboard menu
======================

.. |clip1| image:: images/paperclip.png
   :height: 23
   :width: 23

The :term:`Clipboard` is a :term:`user interface` element that allows users to
select archival descriptions while searching and browsing, and add them to a
list (the "clipboard"), for later review or further action. The
:term:`Clipboard menu` can be used to manage selections added to the
clipboard, or to navigate to the clipboard. For more information on using the
clipboard and the clipboard menu, see:

* :ref:`clipboard`


:ref:`Back to top <navigate>`

.. _main-menu:

Main menu
=========

The :term:`main menu`  is a navigational tool appears in the AtoM
:term:`header bar` for authenticated (i.e. logged in) users. It consists of 4
sub-menus, represented by icons:

* :ref:`Add <main-menu-add>` - represented by a |plus| icon
* :ref:`Manage <main-menu-manage>` - represented by a |pencil| icon
* :ref:`Import <main-menu-import>` - represented by a |import| icon
* :ref:`Admin <main-menu-admin>` - represented by a |gears| icon

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18
.. |pencil| image:: images/edit-sign.png
   :height: 18
   :width: 18
.. |import| image:: images/download-alt.png
   :height: 18
   :width: 18
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

Each sub-menu is designed as a :term:`drop-down menu` - hovering over an icon
in the :term:`main menu` will cause a :term:`tooltip <tooltips>` to appear
with the name of the sub-menu (Add, Manage, Import, or Admin). Clicking on
one of the icons will cause the drop-down to reveal the options available.

Access to the elements of the main menu (the sub-menus) depends on the
:term:`access privileges <access privilege>` associated with each user
account. Consequently, some users may not see some of the icons for the
sub-menus in the :term:`main menu` after logging in. Access privileges are
determined by the :term:`user role` associated with a :term:`user account` -
for example, a :term:`contributor` will see the :ref:`Add <main-menu-add>`
and :ref:`Manage <main-menu-manage>` menus, but not the :ref:`Import
<main-menu-import>` or :ref:`Admin <main-menu-admin>` menus. Only
:term:`adminstrators <administrator>` will see all 4 sub-menus (Add,
Manage, Import, Admin) in the :term:`main menu`.

* For information on user roles, see: :ref:`User roles <user-roles>`.
* For information on managing User accounts see: :ref:`manage-user-accounts`.
* For information on changing the permissions associated with an account or a
  group, see: :ref:`edit-user-permissions`.

.. TIP::

   :term:`Administrators <administrator>` can add and remove options in the
   sub-menus (Add, Manage, Import, Admin) of the main menu via **Admin >
   Menus**. For more information, see :ref:`manage-menus`

  .. _main-menu-add:

|plus2| Add
-----------

.. |plus2| image:: images/plus-sign.png
   :height: 23
   :width: 23

.. image:: images/add-menu.*
   :align: right
   :width: 25%
   :alt: An image of the Add menu's options

The Add menu's options will redirect users to blank records in :term:`edit
mode`, ready for data entry. Using the Add menu, users can quickly create new
:term:`accession records <accession record>`, :term:`archival descriptions
<archival description>`, :term:`archival institutions <archival institution>`,
:term:`authority records <authority record>`, :term:`functions <function>`,
and :term:`terms <term>`.

All records are created independently of other records, and will not be a
part of a pre-existing hierarchy - that is to say, they will be top-level
records.

**Find more information on working with:**

* :ref:`Accession records <accession-records>`
* :ref:`Archival descriptions <archival-descriptions>`
* :ref:`Archival institutions <archival-institutions>`
* :ref:`Authority records <authority-records>`
* :ref:`Functions <functions>`
* :ref:`Terms <terms>`

.. _main-menu-manage:

|pencil2| Manage
----------------

.. |pencil2| image:: images/edit-sign.png
   :height: 23
   :width: 23

.. image:: images/manage-menu.*
   :align: right
   :width: 25%
   :alt: An image of the Manage menu's options

The Manage menu allows authenticated (i.e. logged in) users to quickly access
browse lists for key :ref:`entity types <entity-types>` in AtoM -
:term:`accessions <accession record>`, donors, :term:`physical storage`,
:term:`rights holders <rights record>`, and :term:`taxonomies <taxonomy>`.
When selecting from the Manage menu's :term:`drop-down <drop-down menu>`, the
user is redirected to a browse page for the selected :term:`entity` or record
type. Users can also access the :term:`Jobs <job>` page for managing
asynchronous jobs run in the background - for more information, see:
:ref:`manage-jobs`

The Manage menu is distinct from the :term:`Browse menu` (available next to
the :term:`search box` in the :term:`header bar`), in that it offers users
direct access to browse pages that are not available to unauthenticated (i.e.
not logged in) users - public users who are not logged in cannot view
accessions, donor records, physical storage locations, rights records, or
access the full taxonomies list and the jobs page.

**Find more information on working with:**

* :ref:`Accession records <accession-records>`
* :ref:`Donors <donors>`
* :ref:`Physical storage <physical-storage>`
* :ref:`Rights <rights>`
* :ref:`Taxonomy terms <terms>`
* :ref:`Jobs <manage-jobs>`

.. _main-menu-import:

|import2| Import
----------------

.. |import2| image:: images/download-alt.png
   :height: 23
   :width: 23

.. image:: images/import-menu.*
   :align: right
   :width: 25%
   :alt: An image of the Import menu's options

The import menu allows authenticated (i.e. logged in) users with sufficient
:term:`access privileges <access privilege>` to import records into the
application. By default, only :term:`administrators <administrator>` have
access to the import menu - however, administrators can also change user
and group permissions (see: :ref:`edit-user-permissions` and
:ref:`manage-user-accounts`).

Two options are offered in the dropdown menu - XML (short for `eXtensible
Markup Language <https://en.wikipedia.org/wiki/Xml>`__) and CSV (short for
`Comma-Separated Values
<https://en.wikipedia.org/wiki/Comma-separated_values>`__). Selecting one of
the options from the Import :term:`drop-down menu` will redirect the user to
an import page specific to the format chosen. Using these options, an
:term:`administrator` can import descriptions and :term:`terms <term>` into
AtoM.

**Find more information on:**

* :ref:`Importing descriptions and terms <import-xml>`

.. seealso::

   * :ref:`Upload digital objects <upload-digital-object>`
   * :ref:`cli-bulk-import-xml`
   * :ref:`cli-bulk-export`

.. _main-menu-admin:

|gears2| Admin
--------------

.. |gears2| image:: images/gears.png
   :height: 23
   :width: 23

.. image:: images/admin-menu.*
   :align: right
   :width: 25%
   :alt: An image of the Admin menu's options

The admin menu allows users with :term:`administrator <administrator>`
access to customize AtoM to meet institution-specific requirements and
to manage :term:`user accounts <user account>`, :term:`user
profiles <user profile>` and :term:`access privileges <access privilege>`. An
administrator can also create and manage :term:`static pages <static page>`,
alter application menus, change the visibility of elements in the
:term:`header bar`, and change other application default settings.


By default, the admin menu is only visible to users with :term:`administrator`
privileges. However, an :term:`administrator` can also change user and group
permissions (:term:`access privileges <access privilege>`) via the Admin
menu.

**For more information working with Admin menu options, see:**
:ref:`Administer <administer>`

* :ref:`Manage user accounts <manage-user-accounts>`
* :ref:`Manage digital object storage <manage-digital-object-storage>`
* :ref:`Edit user permissions <edit-user-permissions>`
* :ref:`Manage static pages <manage-static-pages>`
* :ref:`Manage menus <manage-menus>`
* :ref:`Manage plugins <manage-plugins>`
* :ref:`Themes and theming <themes>`
* :ref:`Settings <settings>`
* :ref:`Default language <default-language>`
* :ref:`Site logo <site-logo>`
* :ref:`Search for updates <search-updates>`
* :ref:`Visible elements <visible-elements>`

:ref:`Back to top <navigate>`

.. _browse-menu:

|browse-menu| Browse menu
=========================

.. |browse-menu| image:: images/browse-menu.png

.. image:: images/browse-menu-full.*
   :align: right
   :width: 25%
   :alt: An image of the Browse menu's options

The browse menu provides persistent access to browse pages for some of AtoM's
key :ref:`entity types <entity-types>`. Browsing allows a user to see all
records that have a certain type of :term:`access point` (such as
:term:`subject`, :term:`name`, or :term:`place`) or other type of filter,
such as :term:`media type` or  type of :term:`entity`. Users can then browse
through the results provided, and/or further narrow the results via the use
of :term:`facet filters <facet filter>`.

In AtoM's default theme (the :term:`Dominion theme`) the browse menu appears
in a :term:`drop-down <drop-down menu>` next to the :ref:`search box
<search-box>` in the :ref:`header bar <atom-header-bar>` on all pages. The
:term:`drop-down menu` contains links to browse pages for :term:`archival
descriptions <archival description>`, :term:`authority records <authority
record>`, :term:`archival institutions <archival institution>`,
:term:`subjects <subject>`, :term:`places <place>`, and :term:`digital
objects <digital object>`.

Additionally, a browse menu is included on the :term:`home page` when users
first :ref:`log in <log-in>` to the application.

**For more information on browsing in AtoM see:** :ref:`Browse <browse>`

.. TIP::

   :term:`Administrators <administrator>` can change what links appear in the
   browse menu (and all menus) via **Admin > Menus**. For more information,
   see: :ref:`Manage menus <manage-menus>`.


:ref:`Back to top <navigate>`

.. _search-box:

Search box |searchbox|
=======================

.. |searchbox| image:: images/search-box.png
   :height: 30px

The search box is used to find descriptions in AtoM that contain text
matching a search query. The search box is located in the
:term:`header bar` on all AtoM pages, including the home page. By default,
when a user enters text and presses enter, the results returned are for
:term:`archival descriptions <archival description>`.

To enable the quick location of other core :ref:`entity types <entity-types>`
such as :term:`authority records <authority record>` and :term:`archival
institutions <archival institution>`, the AtoM search box also implements
:term:`typeahead`. As a user enters text into the search box, one or more
possible matches are found and presented to the user in a :term:`drop-down
<drop-down menu>` below the search box, which continue to narrow as the user
enters further text. This allows a user to dynamically view results and select
a resource without necessarily having to enter its full name or title. The
search box :term:`typeahead` results are organized into record-type categories
(or :term:`facets <facet filter>`), including:

* :term:`Archival description`
* :term:`Authority record`
* :term:`Archival institution`
* :term:`Subjects <subject>`
* :term:`Places <place>`

When multiple results for a record type exist, the :term:`typeahead`
drop-down includes an option to view all records for a particular record
type - clicking the "View all" link for a particular type of record will
redirect the user to a browse page of results.

Additionally, when a user has viewed an :term:`archival institution` record,
clicking in the search box will reveal a set of :term:`radio buttons <radio
button>` that allow the user limit the search results to the holdings of the
most recently viewed :term:`archival institution`, or to search globally
(i.e., across all records in the application).

**For more information on searching in AtoM, see:** :ref:`search-atom`.
**See also:** :ref:`advanced-search`.

:ref:`Back to top <navigate>`

.. _site-logo-element:

|site-logo| Site logo
=====================

.. |site-logo| image:: images/site-logo.png
   :scale: 80%

The :term:`site logo` is the graphic that appears at the top of all pages in
the left-hand corner of the :term:`header bar` in AtoM. Clicking on
the logo will take the user to the :term:`home page`. AtoM ships with
a default logo that can be replaced by :term:`administrators <administrator>`
to theme the application to their own institution or :term:`network` if
desired: see :ref:`Site logo <site-logo>`.

.. TIP::

   Users who do not have a logo, or who simply want to add a
   :term:`site title` to the :term:`header bar`, can do so via **Admin >
   Settings > Site information**, and make it visible in the :term:`header bar`
   via **Admin > Settings > Default page elements**. The :term:`site title`,
   when visible, will also act as a hyperlink to the :term:`home page`. To
   add and control the visibility of the site title, you must be an
   :term:`administrator`. For more information, see :ref:`Settings <settings>`.

   .. image:: images/site-title-description.*
      :align: center
      :height: 50px
      :alt: An image of the site logo with a site title visible

:ref:`Back to top <navigate>`

.. _recurring-page-elements:

Recurring page elements
=======================

This section outlines :term:`user interface` elements that appear throughout
the AtoM application on different :ref:`page types <page-types>`.
Understanding how these reoccurring page elements are used in the application
will improve a user's ability to navigate the application effectively.
Recurring page elements listed below include:

* :ref:`Title bar <recurring-title-bar>`
* :ref:`Text links <recurring-text-links>`
* :ref:`Context menu <recurring-context-menu>`
* :ref:`Column headers <recurring-column-headers>`
* :ref:`Information areas <recurring-information-areas>`
* :ref:`Carousel <recurring-carousel>`
* :ref:`Facet filters <recurring-facet-filters>`
* :ref:`Button block <recurring-button-block>`
* :ref:`Breadcrumb trail <recurring-breadcrumb-trail>`
* :ref:`Sort buttons <recurring-sort-button>`
* :ref:`Institution logos <recurring-institution-logos>`

.. _recurring-title-bar:

Title bar
---------

.. image:: images/title-bar.*
  :align: right
  :width: 45%
  :alt: An image of the title bar on an archival description

The :term:`title bar` is a contextual element that appears throughout AtoM on
various different :ref:`page types <page-types>`, offering the user an
indication of the type of page, and/or the name of the record, currently being
viewed.

On a :term:`view <view page>` or :term:`edit <edit page>` page, the
:term:`title bar` displays the name (title) of the current entity. The
title bar appears at the top of core :ref:`entity <entity-types>`
records in AtoM, including :term:`archival descriptions <archival
description>`, :term:`authority records <authority record>`,
:term:`archival institutions <archival institution>`, :term:`functions
<function>`, and :term:`terms <term>` (such as :term:`subjects <subject>`
and :term:`places <place>`), as well as at the top of :term:`physical
storage` locations. On :term:`archival descriptions <archival description>`,
the title bar also displays the :term:`level of description` of the displayed
description.

.. image:: images/title-bar-browse-search.*
  :align: right
  :width: 45%
  :alt: An image of the title bar on a search results page

On Donor and :term:`accession <accession record>` records, the title bar
displays a message indicating whether the record is in :term:`view <view mode>`
or :term:`edit <edit mode>` mode, with the record's name/title display below
(as a sub-title).

On :ref:`Browse <browse>` and :ref:`Search <search-atom>` pages, the
:term:`title bar` displays the number of results returned for the current
query. Elsewhere in the application, the title bar gives context to the user
about the :ref:`page type <page-types>` currently being viewed.

.. _recurring-text-links:

Text links
----------

Blue text always represents a link to a related entity (for example, from an
:term:`archival description` to the :term:`authority record` of the record's
:term:`creator`). When you hover your cursor over a link, the text darkens in
color. Text links behave similarly to internet `hyperlinks
<https://en.wikipedia.org/wiki/Hyperlink>`__, and can be used as navigational
elements: clicking on a text link will cause AtoM to redirect a user to the
related record referenced in the text of the text link.

.. NOTE::

   Some text links are white in the ArchivesCanada theme, such as in the
   :term:`context menu` (including the :term:`treeview`) and the
   :term:`breadcrumb trail` at the top of many :term:`entity` :term:`view
   pages <view page>`. Text links in the :term:`Dominion theme` included as
   the default theme in AtoM are almost universally blue.

.. _recurring-context-menu:

Context menu
------------

The context menu appears on all :term:`view <view page>` and some
:term:`edit pages <edit page>` to provide greater contextual information
about the record currently being viewed.

AtoM's :term:`view <view page>` and :term:`edit <edit page>` pages are
generally displayed in the :term:`user interface` in either a 2 or 3 column
layout - the current record's display data is presented in the central part
of the page, while the side column(s) are generally used to provide
additional options and further contextual information to enhance user
orientation and navigation.

.. figure:: images/context-menu-archdesc.*
   :align: right
   :figwidth: 50%
   :width: 100%
   :alt: Example of the context menu on an archival description

   Context menu (on left and right sides) on an archival description


On :term:`archival description` :term:`view pages <view page>`, this includes
the name and/or :ref:`logo <recurring-institution-logos>` of the
:term:`archival institution` or :term:`repository` who holds the
:term:`archival unit` the current record describes, and the
:term:`treeview`, which shows the current record's relationships to other
records, with links, on the left-hand side of the screen. The right-hand
side of the screen includes links to related people and organizations (i.e.,
:term:`authority records <authority record>`), :term:`subjects <subject>`, and
:term:`places <place>`, as well as available formats for export and printing.
Links in the right-hand column of the context menu are drawn from

When viewing an :term:`authority record` for a person, family, or
:term:`corporate body`, the left-hand side of the screen will show any
relationships with :term:`archival descriptions <archival description>`, where
the agent (the person, family, or corporate body described in the
:term:`authority record`) is linked as either a :term:`creator` (or as an
agent in any other :term:`event`), or when added as a name :term:`access
point`. The right-hand column of the page includes available export formats.

.. NOTE::

   When a relationship is created between two :term:`authority records
   <authority record>` or between an authority record and a :term:`function`,
   the relationship is expressed in the body (i.e. the main part or center
   column) of the authority record's :term:`view page`, in the "Relationships"
   :term:`area <information area>` of the record.

When viewing an :ref:`ISDIAH <isdiah-template>` record for an
:term:`archival institution`, the context menu displays the institution's logo
and a list of holdings on the left-hand side, with contact information for the
:term:`repository` provided on the right-hand side of the record. The contact
information is drawn from the information added to the "Contact"
:term:`area <information area>` of the :term:`archival institution` record.

On :ref:`Browse <browse>` and :ref:`Search <search-atom>` pages, the context
menu includes :term:`facet filters <facet filter>` that allow the user to
iteratively narrow the results presented. If the browse page is for a
:term:`term` that can be organized hierarchically in a :term:`taxonomy` (such
as a :term:`place` or :term:`subject` term), a version of the :term:`treeview`
is also presented, showing users the terms position in the hierarchy as well
as related "sibling" (i.e. on the same level) terms.

**Find more information on using the Context menu:**

* :ref:`Context menu <context-menu>`
* :ref:`Treeview <context-menu-treeview>`

.. seealso::

   * :ref:`Archival descriptions <archival-descriptions>`
   * :ref:`Authority records <authority-records>`
   * :ref:`Archival institutions <archival-institutions>`
   * :ref:`Terms <terms>`

.. _recurring-column-headers:

Column headers
--------------

.. figure:: images/column-headers.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: Sortable column headers in the Browse physical storage page

   Name and Updated column headers in the Browse Rights holders page

:term:`Column headers <column header>` appear at the top of the lists on list
pages and some browse results (e.g., :term:`subject` and :term:`place` browse
pages), and give the name of the :term:`field` for whatever is being listed
below. On some pages, the column headers include a |caret-down-grey| caret
icon next to the column header :term:`field` name - when pressed, these icons
will reverse the sort order of the data in the list based on that column
(i.e., changing from A-Z to Z-A, or from most recently updated first to
oldest update first).

Column headers appear wherever display data on a page has been organized into
a table, and are used extensively throughout the pages available in the
:ref:`Admin menu <main-menu-admin>`.

.. |caret-down-grey| image:: images/caret-down-grey.png
   :scale: 30%

.. _recurring-information-areas:

Information areas
-----------------

.. figure:: images/information-area.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: The Identity and Context Areas in an ISAD(G) archival description

   The Identity and Context Areas in an ISAD(G) archival description

Information areas appear on :term:`view <view page>` and :term:`edit <edit
page>` pages of any standards-based description template in AtoM, and group
related :term:`fields <field>` based on the organization of elements of
description in `ICA <http://www.ica.org/>`__ or other supported descriptive
standards. They are comprised of a number of :term:`fields <field>` in the
body of the information area, and an :term:`area header`, whose name is drawn
from the related area or section of the standard upon which the descriptive
template is based.

By default, when no data has been entered into a :term:`field` in an
information area's edit template, the field is not displayed when in
:term:`view mode`. Consequently, the size (length on a page) of an information
area will depend on the amount of data that has been entered (or imported) by
a user.

Clicking on the :term:`area header` of an information area toggles it between
closed (all fields in that area hidden) and open (all fields visible) when in
:term:`edit mode`; in :term:`view mode`, clicking on an :term:`area header`
will result in opening the related information area in :term:`edit mode`
(**if** the user is logged in and has sufficient :term:`access privileges
<access privilege>` to edit a record.)

**For more information, on supported standards, see:**

* :ref:`Descriptive standards <descriptive-standards>`
* :ref:`Data entry / templates <data-entry>`

.. _recurring-carousel:

Carousel
--------

The :term:`carousel` shows sets of :term:`thumbnails <thumbnail>` of
:term:`digital objects <digital object>` associated with :term:`archival
descriptions <archival description>` and allows the user to scroll
through the thumbnails using a mouse or keyboard scroll arrows. It is
similar to the `cover flow <http://en.wikipedia.org/wiki/Cover_flow>`_
used in "*the Macintosh Finder and other Apple Inc. products for
visually flipping through snapshots of documents, website bookmarks,
album artwork, or photographs.*"

.. figure:: images/carousel.*
   :align: right
   :figwidth: 50%
   :width: 100%
   :alt: An image of the carousel in AtoM

   An example of the carousel with the "Show all" button visible

In AtoM a :term:`carousel` viewer appears at the top of :term:`archival
descriptions <archival description>` (but below the :ref:`title bar
<recurring-title-bar>`)whenever there are associated lower-level descriptions
that have :term:`digital objects <digital object>` attached. The carousel
includes:

* :term:`Thumbnails <thumbnail>` of lower-level digital objects
* The title of the description to which the digital object is attached (titles
  are truncated with an `...` ellipsis after 25 characters)
* A draggable slider bar (for navigating with touch or using a mouse - right
  and left arrow keys can also be used for keyboard navigation)
* If the lower-levels of description include more than 10 digital objects, a
  count of all digital objects at lower levels, and a button to view all in a
  browse page.

The carousel is intended as a navigational element, and is not optimized for
viewing or browsing all related digital objects. Using the carousel, a user
can quickly browse the first 10 results - clicking on a :term:`thumbnail`
will load the related lower level of description (:term:`child record`),
where a larger version of the image and its description can be viewed. By
default, whenever there are more than 10 digital objects at lower levels,
only the first 10 will be displayed; a total count of related digital
objects, with a button to "View all" digital objects in a tile-based digital
object browse page appears to indicate to the user that there are more
digital objects than those displayed, and providing an option to view them
all.

**Using the carousel**

* Drag the slider left/right to scroll through the :term:`thumbnails
  <thumbnail>`

  * If no slider appears, this means there is only one :term:`digital object`
    at a lower :term:`level of description`.
  * You can also use your keyboard right and left arrows to scroll

* Click on a thumbnail to view its :term:`archival description` and a larger
  version of the :term:`digital object` that the thumbnail depicts
* If there are more than 10 digital objects, click the "Show all" button to
  view them all in a tile-based browse page. Click on a thumbnail in the
  browse page to navigate to the related :term:`archival description` and a
  larger version of the :term:`digital object` that the thumbnail depicts.

.. TIP::

   The carousel can be disabled and hidden if it is not desired, via |gears|
   **Admin > Settings > Default page elements**. For more information, see:
   :ref:`default-page-elements`.

.. _recurring-facet-filters:

Facet filters
-------------

In information science, a facet is a clearly defined component (based on a
particular concept group, characteristic or aspect) of a class or subject.
Facets are used in a system of faceted classification, which "*allows the
assignment of an object to multiple characteristics (attributes), enabling the
classification to be ordered in multiple ways, rather than in a single,
predetermined, taxonomic order.*" (`Wikipedia
<http://en.wikipedia.org/wiki/Faceted_classification>`__).

Facets are made up of clearly defined, often mutually exclusive categories
drawn from the properties of a group of information elements. When applied as
filters, facets allow a user to access and order query (search or browse)
results in multiple ways dynamically. Faceted searching and browsing has
become popular in both library catalogues and e-commerce websites (such as
Etsy, Amazon, Walmart, etc) to help users narrow down results to specific
categories - for example, a music website might categorize its music by adding
an artist facet, a genre facet, a price-range facet, and so forth. Users can
then click on a particular sub-class to narrow the results displayed to only
those that match the selected facet - choosing "Virginia Woolf" from an
author's facet in an online library catalogue would display only books where
Virginia Woolf was listed as the author.

.. figure:: images/facet-filters-archdesc.*
   :align: right
   :figwidth: 30%
   :width: 100%
   :alt: An image of the facet filters on an archival description browse page

   Facet filters available on an archival description browse page

**In AtoM**, facet filters are available to users on search and browse pages
as a means of grouping and narrowing results by a common characteristic.
They are drawn from available :term:`fields <field>` within the
:ref:`entity <entity-types>` or record type being browsed or searched. A
count of the records included in each facet appears next to the facet label,
giving users a sense of how many search/browse results fall under each facet
result.

.. NOTE::

   Facet filters are configured not to display if there are only 0 or 1
   facets. So for example, if you perform a search, and none of the results
   have :term:`digital objects <digital object>` attached, then the "Media
   types" facet filter will not display. Only those facets relevant to the
   results being displayed will appear in the user interface.


Facet filters in AtoM are configured so that each facet displays its results
with the highest number of matches at the top. Currently, AtoM will only
display a maximum of the top ten matched results in each facet. Facets are
displayed in the :term:`user interface` as :term:`drop-down menus <drop-down
menu>`; each facet can be expanded to view its available results/matches, or
collapsed to hide match results, by clicking on the facet title - facet titles
are highlighted in dark grey when opened in AtoM's :term:`Dominion theme`.

Available facet results appear below each facet heading as blue :ref:`text
links <recurring-text-links>`. When clicked by a user, the search/browse
results on the page will reload, filtered to show only results that match the
facet filter selected - for example, selecting "Series" in the Level of
description facet on an :term:`archival description` search/browse page will
reload the page results to display only series-level descriptions; clicking
"Ontario" under the Places facet will reload the page to display only results
that have a :term:`name` :term:`access point` of "Ontario" added to their
descriptions.

When a facet match result has been selected, the text changes from a blue
:ref:`text link <recurring-text-links>` to black underlined text. By
default, all facet filters are set to "All" when a user first arrives
at a search/browse page (unless a user has arrived from a pre-filtered query
- for example, clicking "Browse all holdings" in the :term:`context menu` of
an :term:`archival institution` page will take the user to a browse page
filtered to the holdings of that institution). the "All" filter will become a
blue :ref:`text link <recurring-text-links>` when another filter is engaged;
clicking "All" will then remove the current facet filter and refresh the
results page. When a filter is applied, all other facet results will be
refreshed to reflect the current selection, presenting filter results that
apply to the current results - for example, when "Ontario" has been applied
as a place filter, the "Levels of description" facet results will now display
results that apply only to the records being displayed (records with an
"Ontario" place :term:`access point`), until the previous facet filter is
removed.

.. _facets-by-record-type:

Facets available by record type in AtoM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently facets are only available on :term:`archival description`,
:term:`authority record`, and :term:`archival institution` search and browse
pages. Additionally, filter buttons by media type are available in the
top-right corner of the Browse digital objects page, which allow a user to
limit the results by available media type (image, audio, video, text, or
other).

Below, an outline of each :term:`facet filter` has been provided, with
information on what :term:`field` in the related record the information is
being pulled from.

**Archival descriptions**

* **Language:** Filters for content in a different available language (i.e.,
  if the content has been translated into more than one language)
* **Part of:** Allows users to limit results to
  :term:`children <child record>` of the selected top-level description
* **Archival institution:** Limits results to only the holdings of the
  selected institution
* **Creator:** Limits results to only those where the :term:`name` matches
  that of the :term:`creator` associated with the :term:`archival description`
* **Name:** Limits results to those with a matching :term:`name` added as a
  name :term:`access point` to an :term:`archival description`
* **Place:** Limits results to those with a matching :term:`place` added as a
  place :term:`access point` to an :term:`archival description`
* **Subject:** Limits results to those with a matching :term:`subject` added
  as a subject :term:`access point` to an :term:`archival description`
* **Genre:** Limits results to those with a matching genre :term:`term` added
  as an :term:`access point` to an :term:`archival description`
* **Level of description:** Limits results to those that match the selected
  :term:`level of description` (e.g. fonds, collection, series, file, item,
  etc). Includes a :term:`top-level description filter`, that allows users to
  limit results to those that are :term:`parents <parent record>` - e.g. the top
  hierarchical record in a multi-level descriptive :term:`archival unit`
* **Media type:** Limits results to those with a :term:`digital object`
  attached that matches the selected media type (image, audio, text, video,
  or other)

For more information on working with :term:`archival descriptions <archival
description>`, see: :ref:`archival-descriptions`. For help with a specific
standards-based data-entry template, see: :ref:`data-entry`.

**Archival institutions**

* **Language:** Filters for content in a different available language (i.e.,
  if the content has been translated into more than one language)
* **Archive type:** Limits results to those with a type matching data in the
  "Type" :term:`field` in the Identity :term:`area <information area>` of the
  :ref:`ISDIAH <isdiah-template>` archival institution edit template
* **Geographic region:** Limits results to those matching data entered into the
  "Region/province" :term:`field` in the physical location tab of the contact
  dialogue (available in the "Contact" :term:`area <information area>` of the
  :ref:`ISDIAH <isdiah-template>` archival institution edit template)
* **Geographic subregion:** Limits results to those institutions with a
  matching :term:`access point` added to the "Geographic subregion"
  :term:`field` in the Access points :term:`area <information area>` of the
  :ref:`ISDIAH <isdiah-template>` archival institution record
* **Locality:** Limits results to those matching data entered into the
  "City" (e.g. city, town, etc) :term:`field` in the physical location tab
  of the contact dialogue (available in the "Contact"
  :term:`area <information area>` of the :ref:`ISDIAH <isdiah-template>`
  archival institution edit template)
* **Thematic area:** Limits results to those institutions with a
  matching :term:`access point` added to the "Thematic area" :term:`field` in the
  Access points :term:`area <information area>` of the
  :ref:`ISDIAH <isdiah-template>` archival institution record

For more information on working with :term:`archival institutions <archival
institution>`, see: :ref:`archival-institutions`. For help with specific
fields in the archival institution edit template, see: :ref:`ISDIAH template
<isdiah-template>`. For specific instructions on working with archival
institution access points, see: :ref:`institution-access-points`.

**Authority records (People & organizations)**

* **Language:** Filters for content in a different available language (i.e.,
  if the content has been tranlsated into more than one language)
* **Entity type:** Limits results to those with a type matching data entered
  in the "Type of entity" :term:`field` available in the Identity :term:`area
  <information area>` of the :ref:`ISAAR <isaar-template>` edit template for
  :term:`authority records <authority record>`
* **Maintained by:** Limits results to those records being maintained by the
  related :term:`archival institution`. Depends on the authority being linked
  to a repository via the "Maintaining institution" field in the authority
  record - for more information, see: :ref:`link-repo-actor`.
* **Occupations:** Limits results to those authority records with a matching
  :term:`access point` added to the Occupations field in the "Access points"
  :term:`area <information area>` of the authority record edit template.

For more information on working with :term:`authority records <authority
record>` for people, families, and :term:`corporate bodies <corporate body>`,
see :ref:`authority-records`. For help with specific fields in the authority
record edit template, see: :ref:`ISAAR(CPF) template <isaar-template>`.

**Digital objects**

The :term:`digital object` browse page is the same as the
:term:`archival description` browse page - it merely has certain filters and
facets already applied when the user arrives. All facets available for
archival descriptions are available when browsing digital objects as well. See
above for information on the archival description facets

For more information on uploading and managing digital objects, see:

* :ref:`Upload digital objects <upload-digital-object>`

.. seealso::

   * :ref:`Manage digital object storage <manage-digital-object-storage>`
   * :ref:`Set a digital object upload limit for an archival institution
     <upload-limit>`

.. IMPORTANT::

   The usefulness of of the available :term:`facet filters <facet filter>`
   depends on the level of detail included in the related records. For
   example, if no :term:`place` :term:`access points <access point>` have been
   added to the :term:`archival descriptions <archival description>` in your
   installation, then no Places facet filter will be shown. The richer your
   descriptive data, the more useful the facet filters will be.

.. _using-facet-filters:

Using facet filters in AtoM:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Navigate to a :ref:`browse <browse>` or :ref:`search-atom` page
* Available :term:`facet filters <facet filter>` will appear on the left-hand
  side of the page (unless you are on the Digital objects browse page - the
  filter buttons there are in the upper right-hand corner of the page). If
  there are no facet filters present, they are not available for that
  :term:`entity` (e.g. Place, Subject, Function browse pages, etc.)
* Click on the heading of a facet to expand or collapse its available options
* The filter currently selected in a facet will appear in black underlined
  text. Available filters appear as blue :ref:`text links
  <recurring-text-links>`
* By default, filter options are set to display "All" when a user arrives to a
  browse page (unless a specific query has brought them there that engages a
  filter).
* Click on a blue :ref:`text link <recurring-text-links>` to apply a filter
* Click on "All" under a facet to remove an applied filter. Alternately, you
  can click on the related :term:`filter tag` that will appear above the
  search or browse results. For more information on filter tags, see:
  :ref:`search-atom`; see particularly :ref:`search-box-delimiters` for a
  screenshot and example application of the filter tags.
* When a filter is applied, all other facet filters are updated to provide
  filters that relate only to the results currently being displayed. For
  example, if you filter by :term:`Level of description` to display only
  series-level :term:`archival descriptions <archival description>`, all
  other facets will only show results that relate to the series-level
  descriptions, until the first facet is removed.
* In general, **facet filters in AtoM are mutually exclusive** - when one
  filter is applied, no further filters can be applied for that facet.
  However, if multiple :term:`name`, :term:`place`, or :term:`subject`
  :term:`access points <access point>` have been added to a description, you
  may be able to apply more than one name/place/subject filter to the results.
  For example, if a group of :term:`archival descriptions <archival
  description>` all bear the subject access points "Logging" "Industry" and
  "Unions", when a user filters by "Logging", the option to further filter
  the returned results by common subject access point ("Industry" and "Union")
  would remain.
* If no data exists in the related description fields for the records
  available under a facet, or there is only one result, then no facet filter
  for that data will appear.

.. seealso::

   * :ref:`Browse <browse>`
   * :ref:`Search <search-atom>`

.. _recurring-button-block:

Button block
------------

.. figure:: images/button-block-archdesc.*
   :align: right
   :figwidth: 50%
   :width: 100%
   :alt: An image of the button block on an archival description

   The button block with all options visible on an archival description

The button block allows authorized users to add, edit, delete, move, and
duplicate content and to save or cancel changes made in the :term:`edit pages
<edit page>`. It appears to authenticated (i.e. logged in) users with
sufficient :term:`access privileges <access privilege>` at the bottom of all
descriptive template :term:`view <view page>` and :term:`edit <edit
page>` pages, including :term:`accessions <accession record>` (and deaccession
records), :term:`archival descriptions <archival description>`,
:term:`archival institutions <archival institution>`, :term:`authority
records <authority record>`, :term:`terms <term>` (such as :term:`places
<place>` and :term:`subjects  <subject>`), :term:`functions <function>`,
:term:`physical storage` locations, donors,
:term:`rights records <rights record>`, as well as on any other page or
content type where a user might have to add, edit, or delete data (e.g.
:term:`static pages <static page>`, user and group permissions pages, etc).
In short, the :term:`button block` appears anywhere a user will need to
perform actions (add, edit, delete, move, and/or duplicate) on user data
and/or data entry templates in the application via the :term:`user interface`.

.. figure:: images/button-block-repository.*
   :align: right
   :figwidth: 50%
   :width: 100%
   :alt: An image of the button block on an archival institution

   The button block on an archival institution

The options available in the :term:`button block` depend on the possible
actions associated with an :term:`entity` or record type. For example, the
button block on an :term:`archival description`'s :term:`view <view page>` and
:term:`edit <edit page>` pages includes a "More" button that does not appear in
any other button block throughout the application - when clicked, further
user options are revealed, including: Link physical storage, Link digital
object, and Import digital objects (actions which only relate to archival
descriptions).

**Examples of buttons found in the button block throughout AtoM:**

.. |edit-button| image:: images/edit-buttonblock.png
   :height: 22px

.. |delete-button| image:: images/delete-buttonblock.png
   :height: 22px

.. |addnew-button| image:: images/addnew-buttonblock.png
   :height: 22px

.. |edittheme-button| image:: images/edit-theme-buttonblock.png
   :height: 22px

.. |duplicate-button| image:: images/duplicate-buttonblock.png
   :height: 22px

.. |move-button| image:: images/move-buttonblock.png
   :height: 22px

.. |cancel-button| image:: images/cancel-buttonblock.png
   :height: 22px

.. |save-button| image:: images/save-buttonblock.png
   :height: 22px

.. |more-button| image:: images/more-buttonblock.png
   :height: 22px

.. |create-button| image:: images/create-buttonblock.png
   :height: 22px

* |edit-button| **Edit**: Changes the current record from :term:`view mode` to
  :term:`edit mode`
* |delete-button| **Delete**: Deletes the current record (a confirmation is
  required first)
* |addnew-button| **Add new**: Opens a blank record in :term:`edit mode`. If
  you are viewing an :term:`archival description` when you click "Add new",
  the new record will be created as a :term:`child record` of the current
  description - i.e., it will be added as a lower :term:`level of
  description`.
* |duplicate-button| **Duplicate**: Only available on :term:`archival
  descriptions <archival description>`. Creates a duplicate of the current
  description and opens the duplicate in :term:`edit mode`. This option exists
  to simplify the workflow for users working with many similar descriptions;
  by editing only what needs to be changed (title, identifier, etc.) a user
  can avoid unnecessarily repeating data entry - see:
  :ref:`duplicate-archival-description`
* |move-button| **Move**: Only available on :term:`archival descriptions
  <archival description>`. Allows a user to move an archival description to a
  new :term:`parent record` (or make it a top-level description) - see:
  :ref:`move-archival-description`
* |cancel-button| **Cancel**: Aborts the current operation - no data entered
  is saved; the page will reload in :term:`view mode`
* |create-button| **Create**: Only appears when a new record is being created
  (when editing an existing record, the "Save" button will appear instead).
  Saves all user-entered data in the new record and reloads the page in
  :term:`view mode`
* |save-button| **Save**: Saves the current record when in :term:`edit mode`.
  All additions and changes made by the user to the current record are saved;
  the page will reload in :term:`view mode`.
* |more-button| **More**: Only available on :term:`archival descriptions
  <archival description>` and :term:`accessions <accession record>`.  Reveals
  several further options. On archival descriptions, these include: Rename,
  Update publications status, Link physical storage, Link digital object, Import
  digital objects, and Create new rights. See: :ref:`rename-title-slug`,
  :ref:`physical-storage`, and :ref:`upload-digital-object`. If a digital object
  is already linked to the description, "Edit digital object"  will be available
  instead of the link option - see: :ref:`edit-digital-object`. If rights have
  already been added to the description, the option to "Manage rights
  inheritance" will be available in addition to Create new rights - see:
  :ref:`rights-inheritance`. On accessions, the More menu includes the option
  to create new rights - see: :ref:`rights`.
* |edittheme-button| **Edit theme**: Only available on :term:`archival
  institutions <archival institution>`. Opens an edit page where an
  :term:`administrator` can customize the theme of a repository by changing
  the background color, uploading a logo and/or banner, and adding custom
  descriptive content - see: :ref:`edit-institution-theme`

.. NOTE::

   The above list is not intended to be comprehensive - there may be other
   buttons found in the application!


**For more infomation on adding and editing content in AtoM, see:**

* :ref:`add-edit-content`

.. seealso::

   * :ref:`user-roles`
   * :ref:`entity-types`

.. _recurring-breadcrumb-trail:

Breadcrumb trail
----------------

A breadcrumb trail is a navigational element in a :term:`user interface`
that provides contextual information about the current location of a user
in an application or document. Breadcrumb trails provide links back to
each previous page the user navigated through to get to the current page
or — in hierarchical site structures — the parent pages of the current
one.

**In AtoM,** a breadcrumb trail is displayed to add contextual information and
to facilitate navigation in several places:

* On :term:`archival descriptions <archival description>`, the breadcrumb
  trail is located at the top of record's :term:`view page` when viewing a
  :term:`child decription <child record>` to provide information about where
  in the hierarchy the current description appears.

.. figure:: images/breadcrumb-archdesc.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of breadcrumb trail on an archival description

   An example of a breadcrumb trail (below the title bar)
   on a lower-level archival description

* When moving :term:`archival descriptions <archival description>`
  (see: :ref:`move-archival-description`), a breadcrumb trail is used to
  indicate where in a hierarchy the Move browse results are currently showing.

.. figure:: images/breadcrumb-move.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of a hierarchy expressed as a breadcrumb in the Move screen

   An example of a description hierarchy expressed as a breadcrumb trail in
   the Move screen

* At the top of :term:`archival institution` and :term:`authority record`
  :term:`view pages <view page>`, the breadcrumb trail is used to provide a
  link back to the Browse page for each kind of record.

.. figure:: images/breadcrumb-repository.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of a breadcrumb trail above an archival institution record

   An example of a breadcrumb trail (below the title bar)
   above an archival institution record

* Additionally, :term:`taxonomy` :term:`terms <term>` (such as :term:`places
  <place>` and :term:`subjects <subject>`) that are organized hierarchically
  will also display parent terms as a breadcrumb trail when added to an
  :term:`archival description` - for example, if the subject term 'Apple' is a
  child of the term 'Fruit', then when 'Apple' is added as a subject
  :term:`access point` to an :term:`archival description`, it will be
  expressed as: **Fruit >> Apple**. These terms will be displayed in the
  "Access" :ref:`information area <recurring-information-areas>` of the
  related :term:`archival description`, as well as in the :ref:`context menu
  <recurring-context-menu>` on the right-hand-side. (See: :ref:`Terms
  <terms>` for more information on working with :term:`taxonomy` terms such as
  :term:`subjects <subject>` and :term:`places <place>` in AtoM)

.. figure:: images/breadcrumb-accesspoint-main.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of a hierarchical place term expressed as a breadcrumb trail

   An example of a hierarchical place term expressed as a breadcrumb trail in
   the "Access points" area of an archival description


In AtoM, breadcrumbs (i.e. individual components of a breadcrumb trail)
are expressed as hyperlinks, and can be clicked to navigate to the related
source or :term:`parent record`. Clicking a :term:`term` such as a
:term:`subject` or :term:`place` in an :term:`access point` will bring a user
to a Browse page listing results for other :term:`desriptions <archival
description>` that have also been tagged with the same access point.

.. _recurring-sort-button:

Sort buttons
------------

.. figure:: images/sort-button-archdesc.*
   :align: right
   :figwidth: 55%
   :width: 100%
   :alt: An image of sort buttons on an archival description browse page

   An example of the sort buttons on an archival description browse page

The sort buttons (**Sort by** and **Direction**) are navigational tools that appear on
some browse and search pages throughout AtoM. They allow a user to change the
sort order of the results being displayed. Common values used in the Sort by
button as it appears in AtoM include: Alphabetic, Relevance, Identifier,
:term:`Reference code` Most recent, or Start date and End date. The **Direction**
sort button reverses the direction (ascending or descending) of items according
to the **Sort by** option.

On search and/or browse pages, the Sort buttons appear as small :term:`drop-down
menus <drop-down menu>` at the top right of the results. Hovering over the
buttons reveal the option(s) currently not selected - a user can click the
desired option in the drop-down menu, and the page will reload in the new sort
order.

When the sort order is set to "Alphabetic,"results are organized A-Z. Note
that this is an **ASCII sort** - see the IMPORTANT note below for more
information.

When results are ordered by "Most recent," the most recently added and/or
edited records in the results will appear at the top of the list, allowing users
to discover new or recently updated content.

When the sort order is set to "Identifier," results are displayed by the 
identifier, based on an alphabetic **ASCII sort** (more information on ASCII 
sort is included in the IMPORTANT note below).

When the sort order is set to "Reference code," (on the :term:`archival description`
browse page) results are based on the full inherited reference
code, and NOT on the individual identifiers of each record, regardless of
whether or not :ref:`reference code inheritance <inherit-reference-code>` is
turned on in **Admin > Settings** or not. For more information on reference
codes vs. identifiers and display options, see: :ref:`inherit-reference-code`.

When the sort order is set to "Start date" or "End date" (currently only available on
:term:`archival descriptions <archival description>`), AtoM will order the
results by the internal, ISO-8601 formatted (e.g. YYYY-MM-DD) start date or end
date values - **not** the display date shown to public users, which is a free text
field allowing users to express approximation or uncertainty. Results without
a start date value or end date value will appear last.

.. IMPORTANT::

   Elasticsearch does not naturally apply alphabetic sort in a human-friendly
   way (what is often known as "**natural sort**" in computer science) -
   instead, it applies what is known as **ASCII sort**, based on the order of
   the characters in the `ASCII <https://en.wikipedia.org/wiki/Ascii>`__
   character encoding scheme. Consequently, some results may appear out of
   order, depending on how the titles have been entered. Artefactual hopes to
   improve sorting in AtoM for future releases. In the meantime, below is an
   image of an ASCII table - sort order is determined based on this schema -
   so that a description whose title starts with "A" will be preceded by one
   starting with a number, which in turn will be preceded by one beginning
   with a quotation mark, which will be preceded by a description that begins
   with a space before its first character. **If you are concerned about sort
   order, be sure to consider this when naming your records.**

   .. image:: images/ascii-sort.*
      :align: center
      :width: 400px


Sort buttons appear for the following records when on search, browse,
or list pages:

* :term:`Accession <accession record>`
* :term:`Archival descriptions <archival description>`
* :term:`Archival institututions <archival institution>`
* :term:`Authority records <authority record>`
* Donors
* :term:`Functions <function>`
* :term:`Rights holders <rights record>`
* Browse :term:`digital objects <digital object>`
* :ref:`Clipboard results page <clipboard>`
* :term:`Taxonomies <taxonomy>`


Sort buttons are customized for particular entities. For example, on the browse
page for :term:`accessions <accession record>`, the sort button has been
customized to offer sorting options specific to accession records, including:

* Accession number
* Most recent (created or updated)
* Title
* Acquisition date

.. SEEALSO::

   * :ref:`browse-result-limits`
   * :ref:`config-search`
   * :ref:`browse`

.. _recurring-institution-logos:

Institution logos
-----------------

Institution logos are theming elements that can be added by an
:term:`administrator` to an :term:`archival institution` record. As part of
the institutional theming module, an archival institution record can be
customized by adding a logo, banner, custom background color, and/or
customized descriptive content - see: :ref:`edit-institution-theme`. Some
theming elements, such as a logo or a custom background color, will also be
applied to any related :term:`archival descriptions <archival description>`,
offering user a visual cue as to which institution holds the current
description. When a logo has not been uploaded, a placeholder, which displays
the institution name, will still appear on the institution record and any
related archival descriptions.

In addition to providing a customized look and greater context when viewing
related archival descriptions, the institutional logo also acts as a
navigational element: the logo (or its placeholder if no logo has been
uploaded) operates as a hyperlink to the related :term:`archival
institution`. This allows a user to quickly navigate to the institution's
record to find out its location, opening hours, etc. as well as to view a
list of other :term:`holdings` held by the :term:`archival institution`.

On :term:`archival institution` records and related :term:`archival
descriptions <archival description>`, the institution logo appears on in the
top-left hand corner of the page, in the :term:`context menu`. On related
:term:`archival descriptions <archival description>`, it is positioned above
the :term:`treeview`; on the :term:`archival institution` record page, it is
positioned above the list of related :term:`holdings`.

.. figure:: images/institution-logo.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of an institution logo on a related archival description

   An example of an institution logo on a related archival description

Additionally, institution logos are used on the :term:`archival institution`
browse page (available via the :ref:`browse menu <browse-menu>`), the logos
(or logo placeholders if no logo has been uploaded) are presented to the user
in a tiled browse layout, with the title appearing below the logo in grey.

.. figure:: images/institution-logo-browse.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: An image of institution logos the archival institution browse page

   Institution logos on the Archival institution browse page. In the image,
   the Alberton Museum and the Alex Youck School Museum represent
   institutions without uploaded logos, showing placeholders instead.

**For information on adding a logo to an archival institution, see:**

* :ref:`add-institution-logo`

.. seealso::

   * :ref:`archival-institutions`
   * :ref:`edit-institution-theme`
   * :ref:`ISDIAH template <isdiah-template>`
   * :ref:`link-archival-institution`

:ref:`Back to top <navigate>`
