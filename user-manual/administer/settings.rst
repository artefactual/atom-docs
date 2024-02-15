.. _settings:

========
Settings
========

This section describes how to customize your AtoM application to the
specific requirements of your own institution or :term:`network`.

Below, you will find information on the following :term:`information areas
<information area>`:

* :ref:`Global settings <global-settings>`
* :ref:`csv-validator-settings`
* :ref:`clipboard-settings`
* :ref:`dip-upload-settings`
* :ref:`Default page elements <default-page-elements>`
* :ref:`Default templates <default-templates>`
* :ref:`Diacritics <diacritics>`
* :ref:`digital-object-derivatives`
* :ref:`Finding aid <finding-aid>`
* :ref:`Add/Remove languages <add-remove-languages>`
* :ref:`identifier-settings`
* :ref:`inventory-settings`
* :ref:`markdown-settings`
* :ref:`OAI repository <oai-repository>`
* :ref:`Permissions <permissions>`
* :ref:`privacy-notification`
* :ref:`Security panel <security-panel>`
* :ref:`Site information <site-information>`
* :ref:`Storage service <storage-service>`
* :ref:`treeview-settings`
* :ref:`upload-settings`
* :ref:`User interface labels <user-interface-labels>`

Each of the settings areas listed above is accessible via a list of links on
the left-hand side of the settings page. Click on the appropriate link, and
click save after making your changes. A notification will appear confirming
that your changes have been saved.

.. figure:: images/settings-saved-notification.*
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: Settings menu appears on left hand side

   Choose the settings area you wish to view/edit by clicking a link in the
   menu on the left-hand side, click "Save" when you've made your changes.

By default, users will first be shown the :ref:`global-settings` when first
arriving on the Settings page. Otherwise, Settings are organized in the
left-hand menu alphabetically.

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
areas <information area>`, including the "Global" settings,  which should be
opened first by default.

.. image:: images/global-settings.*
   :align: center
   :width: 80%
   :alt: An image of the Global settings in AtoM

This section will describe each setting in the "Global" :term:`information area`.

**Jump to:**

* :ref:`Application version <application-version>`
* :ref:`Check for updates <check-updates>`
* :ref:`Results per page <results-page>`
* :ref:`escape-chars`
* :ref:`Sort browser (users) <sort-browser-users>`
* :ref:`Sort browser (anonymous) <sort-browser-anonymous>`
* :ref:`Default repository browse view <default-repo-view>`
* :ref:`default-description-view`
* :ref:`Multiple repositories <multiple-repositories>`
* :ref:`enable-scoping`
* :ref:`enable-audit-logging`
* :ref:`Show tooltips <tooltips>`
* :ref:`Generate description permalinks from <description-permalinks>`
* :ref:`permissive-slugs`
* :ref:`Default publication status <default-publication-status>`
* :ref:`drafts-notification`
* :ref:`SWORD deposit directory <sword-directory>`
* :ref:`maps-api-key`
* :ref:`cache-xml-setting`
* :ref:`clipboard-save-setting`

Hovering over each setting :term:`field` will also provide additional
information on that field - it will appear in an "information box" below your
cursor.

When making changes to the global settings in AtoM, don't forget to click the
"Save" button in the :term:`button block`, located at the bottom of the "Global"
settings :term:`information area`.

.. _application-version:

Application version
-------------------

This :term:`field` shows the current version of the software. The value cannot
be edited but is automatically updated when AtoM is upgraded to a newer
release.

The second number after the dash represents the database schema version.
This can be useful information to include in a support message if you are
experiencing unexpected issues with your installation - if a system administrator
forgets to run the :ref:`upgrade task <upgrading-run-upgrade-task>` as part of
a site upgrade this can lead to missing tables and/or columns in the database,
which can cause unexpected errors later when trying to use AtoM.

For more information on installing AtoM and searching for different versions,
see:

* Installing AtoM with:

  * :ref:`Linux Ubuntu <installation-ubuntu>`
  * :ref:`Windows <installation-windows>`
  * :ref:`Mac OS X <installation-macosx>`

* :ref:`installation-upgrading`
* :ref:`check-updates`

.. SEEALSO::

   * :ref:`cli-get-version` (command-line task)

.. _check-updates:

Check for updates
-----------------

If yes is selected, authenticated (i.e. logged in) users will automatically
receive a notification if a newer version of the AtoM software has been
released and can be installed. This notification will appear in the browser
for authenticated (i.e. logged in) users, as an orange bar across the top of
the application alerting users to the newest release available.

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

.. _results-page:

Results per page
----------------

By default, AtoM lists objects in list pages and search results **ten at a
time**, with a pager at the bottom of the page to allow users to navigate
through long lists of objects. :term:`Administrators <administrator>` can
increase or decrease this default number. Note that the minimum accepted value
is 5 results per page, and the max value is 100.

For more information on navigating in AtoM, see :ref:`Searching in AtoM
<search-atom>` and :ref:`Navigating in AtoM <navigate>`.

.. NOTE::

   Editing this number to display a large number of results per page may
   affect page load times.

.. _escape-chars:

Escape special characters from searches
---------------------------------------

This setting allows users to define special characters that should be escaped
when performing a search, to avoid errors.

AtoM uses `Elasticsearch <https://www.elastic.co/products/elasticsearch>`__  (ES)
as its search index. In ES, certain characters are normally reserved to be used as
operators in advanced searching - for more information, see:
:ref:`advanced-search-via-searchbox` - particularly,
:ref:`advanced-search-operators`. Normally, if you want to perform a search using
these special characters **without** them being interpreted as operators, then
you need to manually escape them with a ``\`` leading backslash character. From
the ES `documentation <https://www.elastic.co/guide/en/elasticsearch/reference/1.7/query-dsl-query-string-query.html#_reserved_characters>`__:

  If you need to use any of the characters which function as operators in your
  query itself (and not as operators), then you should escape them with a
  leading backslash. For instance, to search for ``(1+1)=2``, you would need to
  write your query as ``\(1\+1\)\=2``.

  The reserved characters are: ``+ - = && || > < ! ( ) { } [ ] ^ " ~ * ? : \ /``

  Failing to escape these special characters correctly could lead to a syntax
  error which prevents your query from running.

Many institutions prefer to use a ``/`` slash character as the default
:ref:`reference-code-separator`. This can lead to errors for users trying to
search for full reference code strings. However, with this setting, you can
define characters (such as the ``/``) that you wish to be automatically escaped
when a search string is submitted as a query.

You can add multiple escape characters to the field by separating them with
commas:

.. image:: images/escape-chars.*
   :align: center
   :width: 90%
   :alt: An image of multiple escape characters in the escape field, separated
         by commas

.. IMPORTANT::

   It is important to understand how searching works in AtoM's ES index, to
   understand the consequences of escaping special characters and how it might
   affect search results.

   ES will automatically tokenize a search string - that is, when submitting a
   string such as ``city hall`` as a search, it is automatically broken into
   tokens that can be searched individually and weighted for relevance when
   returning results. So, ``city hall`` automatically becomes ``city AND
   hall`` - that is, return records that have both ``city`` AND ``hall`` in
   them. By default, spaces as well as some punctuation marks are interpreted
   as breaking points between tokens, and are removed when searching to
   prevent too many poor results from being returned - so for example,
   ``city-hall`` would also be submitted as ``city hall``, and searched as
   ``city AND hall``.

   When you escape a special character, you are essentially telling AtoM to
   ignore it in the search - so it effectively becomes a white space. Thus, a
   reference code search for ``01/02/03/04``, when ``/`` is escaped, becomes a
   command to return results that include ``01 AND 02 AND 03 AND 04``. This
   means that you may still see unexpected results returned.

   Note that users can still search for an exact string by using quotations.
   The special character will still be escaped and removed, but with
   quotations, exact order and proximity are also taken into account,
   producing better results.

   For more search tips and tricks, see:

   * :ref:`advanced-search-via-searchbox`
   * :ref:`advanced-search-operators`
   * :ref:`Searching for phrases <advanced-search-phrases>`
   * :ref:`es-fields-atom`

   You can see what Elasticsearch tokenizers and filters are implemented in AtoM
   in the following file:

   * https://github.com/artefactual/atom/blob/HEAD/plugins/arElasticSearchPlugin/config/search.yml

:ref:`Back to top <settings>`

.. _sort-browser-users:

Sort browser (users)
--------------------

This setting controls the default sort order of records shown on :ref:`browse`
pages in AtoM - specifically, :term:`archival description` results. Sorting can
always be changed by users via the :ref:`sort button <recurring-sort-button>`
available on related search and browse pages, but an :term:`administrator` can
use this setting to control the default sort when arriving on the page for the
first time.

:term:`Administrators <administrator>` can configure default sort order for
the browse display for both authenticated (i.e. logged in) and unauthenticated
(i.e. public) users - **this** setting controls the default sort of records
for logged in users, while the setting described below,
:ref:`sort-browser-anonymous`, affects the default sort for public users.

Options available include:

* **Title/name**: An "alphabetic" A-Z sort (but see the IMPORTANT admonition
  below) based on the title or authorized form of name
* **Date modified**: Will sort based on the date the records were created or last
  modified.
* **Identifier**: A-Z (but see the IMPORTANT admonition below) based on the
  unique identifier value added to the record
* **Reference code**: A-Z (but see the IMPORTANT admonition below) based on
  the :term:`reference code` associated with the description. See the related
  setting, :ref:`inherit-reference-code` for more information.

.. IMPORTANT::

   The Title/name, Identifier, and Reference code sorts are all based on what
   is sometimes known as ASCII sort - that is, the sort is not a true
   alphabetic sort as humans think of it, but rather as computers do.

   Elasticsearch does not naturally apply alphabetic sort in a human-friendly
   way (what is often known as "**natural sort**" in computer science) -
   instead, it applies what is known as **ASCII sort**, based on the order of
   the characters in the `ASCII <https://en.wikipedia.org/wiki/Ascii>`__
   character encoding scheme. Consequently, some results may appear out of
   order, depending on how the values have been entered. Artefactual hopes to
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


By default in a new installation, the sort order is set to "Last updated" for
authenticated users. However, users have the option to reorder the page while
browsing via the :ref:`sort button <recurring-sort-button>` located at the top
of most browse pages.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`recurring-sort-button`
   * :ref:`inherit-reference-code`
   * :ref:`sort-browser-anonymous`

.. _sort-browser-anonymous:

Sort browser (anonymous)
------------------------

This setting controls the default sort order of records shown on :ref:`browse`
pages in AtoM - specifically, :term:`archival description` results. Sorting can
always be changed by users via the :ref:`sort button <recurring-sort-button>`
available on related search and browse pages, but an :term:`administrator` can
use this setting to control the default sort when arriving on the page for the
first time.

:term:`Administrators <administrator>` can configure default sort order for
the browse display for both authenticated (i.e. logged in) and unauthenticated
(i.e. public) users - **this** setting controls the default sort of records
for public (i.e. anonymous; unauthenticated) users, while the setting
described above, :ref:`sort-browser-users`, affects the default sort for
logged in users.

Options available include:

* **Title/name**: An "alphabetic" A-Z sort (but see the IMPORTANT admonition
  below) based on the title or authorized form of name
* **Date modified**: Will sort based on the date the records were created or last
  modified.
* **Identifier**: A-Z (but see the IMPORTANT admonition below) based on the
  unique identifier value added to the record
* **Reference code**: A-Z (but see the IMPORTANT admonition below) based on
  the :term:`reference code` associated with the description. See the related
  setting, :ref:`inherit-reference-code` for more information.

.. IMPORTANT::

   The Title/name, Identifier, and Reference code sorts are all based on what
   is sometimes known as ASCII sort - that is, the sort is not a true
   alphabetic sort as humans think of it, but rather as computers do.

   Elasticsearch does not naturally apply alphabetic sort in a human-friendly
   way (what is often known as "**natural sort**" in computer science) -
   instead, it applies what is known as **ASCII sort**, based on the order of
   the characters in the `ASCII <https://en.wikipedia.org/wiki/Ascii>`__
   character encoding scheme. Consequently, some results may appear out of
   order, depending on how the values have been entered. Artefactual hopes to
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


By default in a new installation, the sort order is set to "Alphabetic" for
public users. However, users have the option to reorder the page while
browsing via the :ref:`sort button <recurring-sort-button>` located at the top
of most browse pages.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`recurring-sort-button`
   * :ref:`inherit-reference-code`
   * :ref:`sort-browser-users`

.. _default-repo-view:

Default repository browse view
------------------------------

This setting will determine if the "card view" or the "table view" is the
default view for the :term:`archival institution` browse page, when users
first arrive on the page. By default in a new installation, this setting is set
to "card."

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

.. _default-description-view:

Default archival description browse view
----------------------------------------

Similar to the :ref:`default-repo-view` setting, this setting will determine if
the "card view" (used by default on the Digital object browse page) or the
"results stub view" (the default description search/browse view in new AtoM
installations - called "table" in the related setting) is used when users first
arrive on the :term:`archival description` search/browse page. By default in a
new installation, this setting is set to "table"  - aka the results stub view.

.. image:: images/description-view-options.*
   :align: center
   :width: 70%
   :alt: A comparison of the card and results stub views of the archival
         description browse page

Note that this setting will not affect the use of the card view on the Digital
object browse page - however, an :term:`administrator` could change this by
altering the path in the related node of the :term:`browse menu` - for more
information on editing menus, see: :ref:`manage-menus`.

Additionally, even once set, any user can easily toggle between the results stub
view and the card view, by using the view toggle button that appears above
archival description and digital object results:

.. image:: images/description-view-toggle.*
   :align: center
   :width: 70%
   :alt: An image of the description view toggle button on the description
         browse page

For more information on working with archival descriptions, see:
:ref:`archival-descriptions`. For information on searching, browsing, and
navigating in AtoM, see:

* :ref:`search-atom`
* :ref:`browse-descriptions`
* :ref:`navigate`
* :ref:`advanced-search`

.. _multiple-repositories:

Multiple repositories
---------------------

Select "yes" if your AtoM application is acting as a union list or portal for
:term:`descriptions <archival description>` of materials held at more than one
:term:`archival institution` or :term:`repository`. The repository will appear
as a :term:`facet filter` on the "Browse archival descriptions" page. Once a
specific description linked to an archival institution, or a repository record
has been visited, AtoM will also provide the option to filter searches in the
global :term:`search box` to the most recent repository - for more information,
see: :ref:`search-box-delimiters`

Select "no" if your AtoM application is being used only by a single institution.
By selecting "no", the repository name will be excluded from certain displays
because it will be too repetitive. Other changes include:

* Hiding the repository :term:`facet filter` from archival description search
  and browse result pages
* Hiding the repository filter in the :term:`advanced search panel`
* Hiding the :ref:`search-box-delimiters` in the global :term:`search box`
* Hiding the related repository name in search/browse result stubs

.. TIP::

   The "Archival institutions" link in the :term:`Browse menu` will **not** be
   hidden by default when this setting is changed. However, an
   :term:`administrator` can manually remove this link by editing the Browse
   menu via |gears| **Admin > Menus**. For more information, see:
   :ref:`manage-menus`.

.. seealso::

   * :ref:`Browsing in AtoM <browse>`
   * :ref:`archival-descriptions`
   * :ref:`archival-institutions`
   * :ref:`enable-scoping`
   * :ref:`repository-upload-setting`
   * :ref:`default-institution-upload`

.. _enable-scoping:

Enable institutional scoping
----------------------------

Institutional scoping adds additional visual cues and user interface elements
to better support searching and browsing within the holdings of one
:term:`archival institution` when used in a :term:`multi-repository system`.
We strongly recommend that the setting above, :ref:`multiple-repositories`, is
set to "Yes" when using this setting.

When enabled (i.e. set to "Yes"), this setting will add an
:term:`institution block` to the repository :term:`view page`, consisting of the
repository logo, as well a dedicated search box and browse menu that will both
return results linked to the current archival institution.

.. image:: images/scoping-comparison.*
   :align: center
   :width: 90%
   :alt: An comparison of the repository view page with and without
         institutional scoping

Similarly, when an :term:`archival description` search or browse page is
filtered (or "scoped") to a particular repository, the
:term:`institution block` will appear, and (if applied) the custom background
color of the institution will also be displayed behind the scoped search results.

.. image:: images/scoped-results.*
   :align: center
   :width: 90%
   :alt: An image of an archival description browse page, limited to the holdings
         of a particular repository, with insittutional scoping enabled.

.. TIP::

   For more information on applying a custom background color, uploading a custom
   repository logo, and other aspects of archival institution theming, see:

   * :ref:`edit-institution-theme`

Additionally, the :ref:`search-box-delimiters` are disabled when Institutional
scoping is enabled - the global :term:`search box` in the AtoM
:term:`header bar`
will only return results from all repositories, while the dedicated search box
inside the :term:`institution block` can be used to search the holdings of the
scoped repository. As such, the institution block offers users a method of
remaining "scoped" to one institution's holdings - users can still search and
browse across all repositories using the global :term:`search box` and
:term:`browse menu` found in the AtoM :term:`header bar`, but the institution
block provides a method of better limiting results to one institution as a user
explores.

Finally, the institution block will also appear on the :term:`view page` of a
related :term:`archival description`, but **only** if the description is
arrived at via one of the scoped elements - i.e. the holdings list on the
:term:`repository` view page, or from a scoped search or browse page. If a
user arrives at the archival description via a global search or browse page,
the institution block will not appear.

An :term:`administrator` can customize the search box header text via **Admin >
User interface labels**, using the ``institutionSearchHoldings`` field - for more
information on changing these settings, see: :ref:`user-interface-labels`. At
installation, the default text label is "Search our collection."

.. image:: images/scoping-search-label.*
   :align: center
   :width: 90%
   :alt: An image of the Institution search holdings label settings

The institution block's dedicted browse menu can also be customized via **Admin
> Manage menus**, under the ``browseInstitution`` menu - for more information
on working with menus, see: :ref:`manage-menus`.

.. image:: images/scoping-browse-menu.*
   :align: center
   :width: 90%
   :alt: An image of the Institution browse menu settings in Manage menus

.. SEEALSO::

   * :ref:`archival-institutions`
   * :ref:`browse-scoped-holdings`
   * :ref:`multiple-repositories` (setting)
   * :ref:`repository-upload-setting`
   * :ref:`default-institution-upload`


:ref:`Back to top <settings>`

.. _enable-audit-logging:

Enable description change logging
---------------------------------

.. _audit log: https://en.wikipedia.org/wiki/Audit_trail

This setting will enable a basic `audit log`_ for
:term:`archival descriptions <archival description>` in AtoM. When enabled,
the log will capture basic information on creation and modification events
related to archival descriptions, including date, type (creation or
modification), :term:`username`, and/or related description title, depending on
where the information is viewed. Note that the contents of specific changes made
are **not** currently captured as part of the modification history's audit
trail.

Once enabled, authenticated (i.e. logged in) users with sufficient
:term:`permissions <access privilege>` can view the modification history for a
description by opening the "More" menu in the :term:`button block` at the bottom
of the description's :term:`view page`, and selecting "View modification
history." For more details, see:

* :ref:`view-modification-history`

Users can see their own description modification history by navigating to their
user profile. An :term:`administrator` can view the description modification
history for any user. Fore more details, see:

* :ref:`user-modification-history`

Additionally, an administrator can filter archival description results in the
:ref:`Description updates <search-updates>` module by a specific username. For
more information on using the Description updates module, see:

* :ref:`search-updates`

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

.. SEEALSO::

   * :ref:`data-entry`

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
if they prefer that the slug is derived from the identifier or the reference
code (with or without the country and repository code included) instead.

Note that this setting does **not** apply retro-actively to descriptions
already created. It will only apply to new descriptions created after changing
the setting.

.. NOTE::

   This setting will also be respected by the command-line task to generate
   slugs - see: :ref:`cli-generate-slugs`. So it would be possible to update
   legacy descriptions in AtoM by deleting their slugs, and then generating
   new ones after changing this setting.

For further context on slugs in AtoM, see: :ref:`slugs-in-atom`

.. TIP::

   Users with sufficient edit :term:`permissions <access privilege>` can also
   edit the slug associated with an :term:`archival description` via the user
   interface, using the Rename module. For more information, see:

   * :ref:`rename-title-slug`

.. SEEALSO::

   Users can also update slug(s) via a command line tool. For more information,
   see:

   * :ref:`cli-rename-slugs`

.. _permissive-slugs:

Use any valid URI path segment and uppercase character in slugs
---------------------------------------------------------------

.. _RFC 3987: https://tools.ietf.org/html/rfc3987

This setting will affect how AtoM generates permalinks, or :term:`slugs <slug>`
for new records. In new installations, this setting is set to "No" by default.

When set to "No," generated slugs will only allow digits, letters, and dashes.
Sequences of unaccepted characters (e.g. accented or special characters, etc.)
are replaced with valid characters such as English alphabet equivalents or
dashes. When set to to "Yes," AtoM will allow upper case characters, any valid
unicode characters as specified in
`RFC 3987`_ including accented characters, and some special characters such
as: ``, - _ ~ : = * @``. For further details, see:

* :ref:`slugs-in-atom`

The command-line task to generate slugs, and AtoM's Rename module (which will
allow users to edit the slug associated with an :term:`archival description`)
will both respect and enforce the setting going forward. However, changing this
setting will **not** automatically alter existing slugs. For more information,
see:

* :ref:`cli-generate-slugs`
* :ref:`rename-title-slug`

.. _default-publication-status:

Default publication status
--------------------------

This setting determines whether new :term:`archival descriptions <archival
description>` will automatically appear as :term:`draft records <draft record>`
or :term:`published records <published record>`. By default, public users (i.e.
those who are not logged into AtoM) cannot see draft descriptions.

Note that this setting also affects imported descriptions. For more information,
see :ref:`archival-descriptions` - specifically, see:

* :ref:`publish-archival-description`

.. _drafts-notification:

Show available drafts notification upon user login
--------------------------------------------------

This setting, when enabled, will display a notification with a count of the
number of :term:`draft <draft record>` archival descriptions currently
available in AtoM. A link to the Description updates page is also provided if
users wish to review the current available draft records - for more
information on working with the Description updates page, see:
:ref:`search-updates`.

.. image:: images/drafts-notification.*
   :align: center
   :width: 70%
   :alt: An image of a notification of available draft records on login.

This notification, when enabled, will be visible to all authenticated (i.e.
logged in) users.

.. _sword-directory:

SWORD deposit directory
-----------------------

.. _Archivematica: https://www.archivematica.org/

The SWORD deposit directory is currently being used to support packages
deposited by `Archivematica`_ into AtoM. If you do not know the name of your
deposit directory, consult with your system administrator. The default is
``/tmp``.

AtoM 2.7 has added a new feature that deletes the DIP directory from the SWORD
deposit after uploading the DIP to AtoM. In order for AtoM to delete this
directory, the AtoM user (`www-data` or `nginx` by default) must have write
permissions to this directory in order to delete it. The easiest way is to use
the setfacl command.

Using the default SWORD deposit (```/tmp```) will not work and setfacl should not be
used on the ```/tmp``` directory as it could cause security issues when setting new
permissions.

If you are using the `archivematica` user to rsync from Archivematoca to AtoM,
you can create a new SWORD deposit directory on ```/home/archivematica```.

First, install the `acl` package on Ubuntu or CentOS:

.. code-block:: bash

   sudo apt-get install acl # Ubuntu
   sudo yum install acl  # CentOS

Create a new SWORD deposit directory:

.. code-block:: bash

   sudo mkdir /home/archivematica/atom_sword_deposit
   sudo chown archivematica:www-data /home/archivematica/atom_sword_deposit
   sudo chmod 770 /home/archivematica/atom_sword_deposit

Set the ACL on new directory:

.. code-block:: bash

   sudo setfacl -d -m u:www-data:rwX /home/archivematica/atom_sword_deposit

The ACL sets `rw-` permissions for files and `rwx` permissions for directories
for the nginx user and then the `www-data` (or `nginx`) user can delete the
temporay DIP directory.

.. NOTE::

   Use the `nginx` group and user on CentOS instead of `www-data`.


Almost all the \*NIX filesystems support ACL. NFSv4 can support ACLs but still
requires the server to support ACLs. Anyways you can force the uid and gid for
new files when mounting cifs or nfs on ``/etc/fstab``.


.. _maps-api-key:

Google Maps Javascript API key setting
--------------------------------------

This setting allows you to store and use a Google Maps API key - AtoM relies
on this setting to be able to add dynamic Google maps to the :term:`view page`
of a :term:`repository`, and to the Metadata :term:`area <information area>`
of a :term:`digital object`, when latitude and longitude values are provided.
For more information on these features, see:

* :ref:`add-map`
* :ref:`digital-object-map`

.. NOTE::

   For the digital object map, you must also check the "Digital object map"
   setting in **Admin > Settings > Default page elements**. See:
   :ref:`default-page-elements`.

You can request a Google Maps API key free of charge - all you need is a
Google account. For more information, see:

* https://developers.google.com/maps/documentation/javascript/get-api-key

.. IMPORTANT::

   There is a limitation on how many maps you can generate a day with the free
   version of this key. For more information, see:

   * https://developers.google.com/maps/documentation/javascript/usage


.. _reports-public-setting:

Generate archival description reports as public user
----------------------------------------------------

This setting relates to the creation of file and item-level reports for
archival descriptions, as well as finding aids - for more information, see:

* :ref:`file-item-reports`
* :ref:`print-finding-aids`

This setting determines whether or not :term:`draft records <draft record>` and
retrieval information is included in the reports generated or not - that is,
:term:`physical storage` information such as location, container type, and name.

When this setting is set to "Yes", then reports generated will **not** include
draft descriptions. Additionally, if physical storage information is hidden
via the :ref:`visible-elements` settings, then :term:`physical storage`
information will also be excluded from finding aids. When set to "No", then the
reports and finding aids will include drafts and physical storage information.


.. _cache-xml-setting:

Cache description XML exports upon creation/modification
--------------------------------------------------------

AtoM includes several options for exporting :term:`archival description`
metadata in XML format - for more information, see: :ref:`export-xml`.

Additionally, users can enable the OAI plugin to allow harvesters to collect
archival description metadata via the OAI-PMH protocol, in EAD 2002 or Dublin
Core XML - for more information, see: :ref:`oai-pmh`.

Normally, when exporting or exposing archival description metadata, the XML is
generated synchronously - that is, on request via the web browser. However,
many web browsers have a built-in timeout limit of approximately 1 minute, to
prevent long-running tasks and requests from exhausting system resources.
Because of this, attempts to export or harvest EAD 2002 XML for large
descriptive hierarchies can fail, as the browser times out before the document
can be fully generated and served to the end user.

To avoid this, AtoM includes this setting, which allows users to pre-generate
XML exports via AtoM's job scheduler, and then cache them in the ``downloads``
directory. This way, when users attempt to download large XML files, they can
be served directly, instead of having to generate before the browser timeout
limit is reached.

When this setting is set to "Yes," then anytime an :term:`archival description`
is created or modified via the :term:`user interface`, this will automatically
trigger a background :term:`job` that will generate and cache EAD 2002 XML and
DC XML for the related resource. With any new description or edit, two jobs
are initiated - one to generate the EAD 2002 XML, and the other to generate
the Dublin Core XML.

.. figure:: images/xml-cache-jobs.*
   :align: center
   :figwidth: 90%
   :width: 100%
   :alt: XML cache jobs as seen on the Jobs page.

   Highlighted in red is an example of the 2 jobs triggered by an edit to an
   archival description when the Cache XML setting is turned on -  one job to
   generate an updated version of the cached EAD 2002 XML, and another job to
   generate an updated version of the cached DC XML.

The XML generated will be cached in AtoM's ``downloads`` directory - 2
subdirectories named ``ead`` and ``dc`` will automatically be created, and the
XML will be stored by type in these two subdirectories.

.. image:: images/downloads-dir.*
   :align: center
   :width: 40%
   :alt: An image of the Downloads directory structure as seen in a file
         explorer

When users attempt to download XML from the :term:`view page` of an archival
description, AtoM will check if there is a cached copy of the requested XML
and if so, it will serve it. If there is no cached version available, then
AtoM will fall back to the default behavior of generating the XML on request.

In an OAI-PMH request, if a cached version of the EAD 2002 XML is available,
AtoM will serve it in response to ``oai_ead`` requests - if there is **not** a
cached version, then AtoM will return a "Metadata format unavailable" reponse.
In contrast, if no cached DC XML exists, the OAI Repository module will
generate DC XML on the fly to respond to the request. For further information,
see: :ref:`oai-pmh`.

By default, cached XML files are generated for public users, meaning that
:term:`draft <draft record>` descriptions are **not** included in the XML.

.. IMPORTANT::

   This functionality does **not** cover imports - you will need to edit the
   record in the user interface after an import to trigger the automatic cache
   XML job.

   Additionally, edits to related entities (such as a linked
   :term:`authority record`, :term:`subject` or :term:`place` access points,
   etc.) will **not** automatically trigger an update to the cached EAD 2002
   and DC XML. Again, you will need to manually edit the related description
   to trigger an update.

There is also a command-line task available that will generate cached
EAD 2002 and DC XML for all existing descriptions. See:

* :ref:`cache-xml-cli`

If you are making many edits to your AtoM site, you may want to disable this
setting until your edits are complete and then run the command-line task, to
avoid constantly triggering many jobs.

.. NOTE::

   Archival description XML data exported via the :term:`clipboard` is
   generated on request via AtoM's job scheduler - the cached XML is not used.
   For more information on this functionality, see:
   :ref:`xml-export-clipboard`

:ref:`Back to top <settings>`

.. _csv-validator-settings:

CSV Validator settings
======================

.. image:: images/csv-validator-settings.*
   :align: center
   :width: 90%
   :alt: An image of the CSV Validator setting options

To help avoid unexpected :ref:`CSV import <csv-import>` problems, AtoM includes
a CSV validation task that can check for and report on common issues found in
CSV files prior to import. This task can be run independently of import,
either via the command-line or the :term:`user interface`. For more
information, see:

* :ref:`csv-validation-ui`
* :ref:`csv-validation-cli`

.. SEEALSO::

   * :ref:`csv-import`
   * :ref:`cli-import-export`

Additionally, these settings allow an :term:`administrator` to configure
validation to run automatically before any CSV import performed via the
:term:`user interface`.

There are three configurable options in the CSV validator settings. The
default setting in new installations is **Off** - when this option is set, no
validation will be performed when a CSV is imported via the user interface.

The other two settings will enable AtoM to automatically run validation
whenever a CSV import is initiated via the user interface, though with
different behaviors:

* When the **Permissive** option is set, only :ref:`csv-validation-error`
  messages during validation will prevent the CSV import from proceeding.
  :ref:`csv-validation-warning` messages will still be reported in related
  console log output shown on the :term:`job details page <job-details>` of
  the CSV import, but they will not prevent the import from proceeding.
* When the **Strict** option is set, both :ref:`csv-validation-error` and
  :ref:`csv-validation-warning` messages returned during validation will
  prevent the import from proceeding.

Issues that prevent import will need to be resolved before the CSV import can
be successfully re-launched, or else the setting will need to be changed by an
:term:`administrator`.

For more information on how to interpret the results of the validation report,
and general information on the structure of the report, see:

* :ref:`csv-validation`

.. NOTE::

   This setting does **not** impact CSV imports peformed from the command-line.
   However, the validation task can be run independently from an import via
   the command-line as well. For more information, see:

   * :ref:`csv-validation-cli`
   * :ref:`csv-import-cli`

:ref:`Back to top <settings>`

.. _clipboard-settings:

Clipboard settings
==================

.. image:: images/clipboard-settings.*
   :align: center
   :width: 80%
   :alt: Clipboard settings page in AtoM

These settings allow an :term:`administrator` to configure and/or enable certain
features related to AtoM's :term:`clipboard` functionality. For more information
on using the clipboard, see:

* :ref:`clipboard`

**Jump to:**

* :ref:`clipboard-save-setting`
* :ref:`clipboard-sending`
* :ref:`clipboard-do-export-setting`

.. _clipboard-save-setting:

Saved clipboard maximum age
---------------------------

Both public and authenticated (i.e. logged in) users have the option to save
results pinned to AtoM's :term:`clipboard`, and load them at a later date - for
more information, see:

* :ref:`save-clipboard`
* :ref:`load-saved-clipboard`

To avoid having AtoM's database grow indefinitely when the clipboard is used
heavily, saved clipboards are not stored indefinitely. Instead, an
:term:`administrator` can configure how many days saved clipboards are stored
before being purged from the database.

The setting takes a numeric value that represents the number of days a saved
clipboard should be stored before it is eligible for automatic deletion from
the database.

.. IMPORTANT::

   By default in new AtoM installations, this value is 0 - meaning that saved
   clipboards will be purged the following day! If you intend to allow your
   users to make use of the Saved clipboard feature, be sure to configure this
   to a reasonable value - e.g. 30 (days), etc.

Note that AtoM also has a command-line task that can be used by a system
administrator to manage and delete saved clipboards. For more information, see:

* :ref:`tools-expire`

.. _clipboard-sending:

Clipboard sending
-----------------

.. _JSON: https://en.wikipedia.org/wiki/JSON
.. _POST or GET: https://www.w3schools.com/tags/ref_httpmethods.asp

These settings can be configured to integrate the clipboard with a third-party
site or application, for use in reference requests, loans, or other similar
cases. When configured, it will allow results on the clipboard to be sent to a
specified URL as a `JSON`_ array of :term:`slugs <slug>`. Data can be sent using
either HTTP `POST or GET`_ methods.

When a user adds items to the clipboard and these settings are enabled, an
additional button will display on the clipboard's :term:`view page`. The button
text can be customized, along with the text shown to the user while the results
are being sent. When clicked, AtoM will send a JSON array of the clipboard
results to the target URL, and then will redirect the user to that URL for
further action.

.. image:: images/clipboard-send-button.*
   :align: center
   :width: 80%
   :alt: An example of a Clipboard send button with customized text

In new installations, this functionality is disabled by default, but can be
configured and enabled via the settings described below.

Enable clipboard send functionality
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This setting enables or disables the :term:`Clipboard` send functionality
globally. When set to "No", the Clipboard send button will not be displayed on
the clipboard's :term:`view page`.

External URL to send clipboard contents to
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Enter the URL to which you would like your array of clipboard results to be sent.
Must be a valid HTTP or HTTPS URL.

Example value: ``http://myarchives.example.com/archives-request``

Send button text
^^^^^^^^^^^^^^^^

When the Clipboard send functionality is enabled, an additional button is added
to the Clipboard's :term:`view page`. The default text in new installations is
simply "Send" but an :term:`administrator` can modify this as needed.

Text or HTML to display when sending clipboard contents
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the brief interval before the user is redirected to the external URL, the
text added to this setting is what will be shown to the user while the clipboard
results are being sent. The default text in new installations is "Sending..."
but this too can be customized as desired.

.. NOTE::

   In most cases, this page will not be shown long enough for the user to read
   much text, unless the clipboard results are extensive. We recommend keeping
   this message fairly short and simple.

HTTP method to use when sending clipboard contents
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

An :term:`administrator` can choose between using HTTP `POST or GET`_ methods
for delivering the clipboard payload to the external site.

:ref:`Back to top <settings>`

.. _clipboard-do-export-setting:

Enable digital object export functionality
------------------------------------------

In AtoM 2.7 and higher, an :term:`administrator` can enable users to include
:term:`digital objects <digital object>` with :term:`archival description` XML
and CSV exports from the clipboard. By default, this setting is set to "No" in
new installations.

When set to Yes, the clipboard export options screen will include an "Include
digital objects" checkbox. If the user checks that checkbox, any digital
objects attached to the archival descriptions being exported will be included
in the ZIP package the user downloads. Administrators should ensure that the
server on which the AtoM instance is installed has enough processing power,
memory and storage space to create and temporarily store zipped packages of
the digital objects selected for download.

.. TIP::

   AtoM has a command-line task that system administrators can use to manage
   the deletion of temporary files, including ZIP packages generated for user
   download. For more information, see:

   * :ref:`tools-expire`

Note that if the user checks the "Include digital objects" checkbox in the
export options screen, it is no longer possible to include descendants in the
export, and the "Include descendents" checkbox will be greyed out. This is a
safeguard designed to prevent users from deliberately or inadvertently exporting
large descriptive hierarchies with hundreds or thousands of digital objects
attached at descendant levels of description.

For more information on using this feature, see:

* :ref:`xml-export-clipboard-do`
* :ref:`csv-export-clipboard-do`

.. SEEALSO::

   * :ref:`clipboard`
   * :ref:`csv-export-clipboard`
   * :ref:`xml-export-clipboard`

:ref:`Back to top <settings>`


.. _dip-upload-settings:

DIP upload
==========

.. image:: images/dip-upload-settings.*
   :align: center
   :width: 80%
   :alt: DIP upload settings page in AtoM

This setting is for users who are uploading content from a linked
Archivematica instance. Archivematica is an open-source digital preservation
system developed by Artefactual Systems, the same creators of AtoM. For more
information, see: https://www.archivematica.org

.. NOTE::

   AtoM 2.7 has added a new feature that deletes the DIP directory from the
   SWORD deposit after uploading the DIP to AtoM. In order for AtoM to delete
   this directory, the AtoM user (www-data or nginx by default) must have write
   permissions to this directory in order to delete it. More info in SWORD
   deposit directory section.

   * :ref:`SWORD deposit directory <sword-directory>`

.. SEEALSO::

   For information on DIP upload from Archivematica to AtoM, see the
   following page in the Archivematica documentation:

   * :ref:`Upload DIP to AtoM <archivematica:upload-atom>`

Archivematica can be used to manage and prepare digital content for long-term
preservation, and can generate a Dissemination Information Package (DIP) with
access-copy derivatives of your :term:`master digital object` files processed
in Archivematica, for upload into AtoM.

If no additional metadata is provided with the content during preparation,
then when uploaded to AtoM, AtoM will use the file names as the default titles
for the associated :term:`information objects <information object>` (a.k.a.
:term:`descriptions <archival description>`) generated, to which the digital
objects in the DIP will be attached. However, this might produce descriptions
with titles like ``my-picture.jpg``, or ``my.document.pdf``.

When this setting is set to "Yes," AtoM will automatically strip the file
extensions from the information object names automatically generated during
the DIP upload process - from the examples above, this setting would lead to
information object titles such as ``my-picture`` or ``my.document``. Users can
still edit the description title after DIP upload to customize them as
desired.

Note that the setting will **not** retroactively affect existing
uploads/information objects, only new information objects created during the
DIP upload process from Archivematica. Similarly, the uploaded file itself is
**not** affected (the extension is not stripped from the
:term:`digital object`) - only the title of the description generated so the
digital object can be attached and uploaded.


:ref:`Back to top <settings>`

.. _default-page-elements:

Default page elements
=====================

.. _API Key: https://developers.google.com/maps/documentation/javascript/get-api-key

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

The Copyright status filter and the General material designation filter appear
as filters available in the Advanced search panel. For more information on
using this panel, see: :ref:`advanced-search`. The Copyright status filter
relates to PREMIS rights added to descriptions - for more information, see:
:ref:`rights`. The General material designation filter is derived from the
Canadian Rules for Archival Description (:ref:`RAD <rad-template>`) standard,
and is only used on the RAD template.

.. image:: images/search-filters-hide.*
   :align: center
   :width: 80%
   :alt: An image of the Copyright status and GMD filters in the advanced
         search panel

.. TIP::

   AtoM has a separate setting that can disable
   :term:`finding aid <print-finding-aids>` generation and upload. When
   disabled, the related filter in the :term:`advanced search panel` will
   also be hidden. For more information, see: :ref:`print-finding-aid-settings`.

The Digital object map setting relates to the ability for users to add basic
geolocation data to :term:`digital objects <digital object>`, by displaying a
dynamic Google map in the Digital object metadata
:term:`area <information area>`. For more information, see:
:ref:`digital-object-map`

.. IMPORTANT::

   To be able to enable this setting, you must first request a Google MAPS
   `API Key`_, and the Google Maps Javascript API key setting in |gears|
   **Admin > Settings > Global** must be populated - see: :ref:`maps-api-key`

When unchecked, the above elements will be hidden from display after you save
the default page element settings. This can be useful for customization - for
example, if you are not translating the content of your website and do not
need the language menu, unchecking it here will remove it from the AtoM
:term:`header bar`. Similarly, if you are not using the Canadian :ref:`RAD
<rad-template>` standard as your :ref:`default template <default-templates>`,
you might want to hide the General material designation filter from the
advanced search panel.

.. SEEALSO::

   * :ref:`Theming - Add or remove elements <themes-add-remove-elements>`
   * :ref:`Carousel <recurring-carousel>`
   * :ref:`The language menu <language-menu>`
   * :ref:`The AtoM header bar <atom-header-bar>`
   * :ref:`digital-object-map`

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

.. _diacritics:

Diacritics
=================

Diacritics, also known as accents, are dots and glyphs written above or
below certain letters of the alphabet of many languages, indicating something
about thir pronounciation. Languages using diacritics vary from using a single
diacritic to multiple diacritics on a single letter.

AtoM uses `Elasticsearch <https://www.elastic.co/products/elasticsearch>`__ (ES)
as its search index, which offers a variety of filters and analyzers to convert or
strip strings into their Latin equivalents for searching purposes. By default,
AtoM is configured for languages using a single diacritic, but not multiple.
However, :term:`Administrators <administrator>` can create additional mappings
for special characters by uploading a YAML file to AtoM.

.. image:: images/diacritics.*
   :align: center
   :width: 70%
   :alt: An image of the Diacritics setting in AtoM

To enable the setting, a valid character mapping YAML must be uploaded to AtoM.


A character mapping YAML should be constructed like so::

   # Custom diacritics char filter
   type: mapping
   mappings:
     - ’ => '
     - Ɂ => '
     - ɂ => '
     - À => A
     - Á => A
     - Ä => A
     - Ā => A
     - Ą => A
     - Ǎ => A
     - Ç => C

Note that YAML files are case sensitive and structured as a map or a list,
following a hierarchy based on the indentation. The first line is an optional
comment but the following 2 lines are required for AtoM to configure these mappings.
The rest are examples of mapping special characters (on the left of the ``=>``)
to its Latin equivalent (on the right of the ``=>``) for ES to process. Each
mapping should be indented with 2 spaces (tabs are not accepted for indentation)
and listed with a ``-``.

.. IMPORTANT::

   If you change this setting, for changes take effect, a system administrator
   will need to :ref:`populate the search <maintenance-populate-search-index>`.
   Clearing your web browser and :ref:`the application cache <maintenance-clear-cache>`,
   are also recommended.

.. SEEALSO::

   * :ref:`advanced-search`

:ref:`Back to top <settings>`

.. _digital-object-derivatives:

Digital object derivatives
==========================

Whenever a :term:`digital object` is linked to an :term:`archival description`,
AtoM will generate two derivative copies from the :term:`master digital object`
(e.g. the original) -  a :term:`reference display copy`, used on the archival
description :term:`view page`, and a :term:`thumbnail`, used in search and browse
results, and in the digital object :ref:`carousel <recurring-carousel>`.

The following settings affect the way that
:term:`reference <reference display copy>` derivatives are generated in AtoM.

**Jump to:**

* :ref:`pdf-page-settings`
* :ref:`Maximum image width <max-image-width>`

.. SEEALSO::

   * :ref:`total-upload-space`
   * :ref:`default-institution-upload`
   * :ref:`upload-multi-files`

.. image:: images/derivatives-settings.*
   :align: center
   :width: 80%
   :alt: Digital object derivative settings in AtoM

.. _pdf-page-settings:

PDF page number for image derivative
------------------------------------

This setting will affect the :term:`digital object` derivatives generated by
AtoM when uploading multi-page content, such as a PDF.

By default, AtoM will use the first page of multi-page content (such as a PDF)
when generating the :term:`reference display copy` and :term:`thumbnail` images.

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
   9 pages), AtoM will use the closest available value (in this example, page 9)
   when generating the derivatives.

If you make changes, remember to click the "Save" button in the
:term:`button block`.

.. _max-image-width:

Maximum length on longest edge (pixels)
---------------------------------------

This setting determines the maximum size of the :term:`reference display copy`
derivative created from a :term:`master digital object` during digital object
upload. It is measured in pixels, and will be applied either to height or
width - whichever side reaches the pixel limit first.

One of AtoM's design assumptions is that the display dimensions of files
users upload typically will be too large to fit into the :term:`view page` for
an :term:`archival description`. Therefore, when you upload a file, AtoM creates
a :term:`reference display copy` for displaying in the view page.

AtoM ships with a default setting specifying the maximum width or height of the
:term:`reference display copy` at **480 pixels**. This is the optimized width
given AtoM's :term:`field` width. :term:`Administrators <administrator>`,
however, can increase or decrease the maximum reference image
size to suit the requirements of their institution or network.

.. seealso::

   * :ref:`Styling static pages <styling-static-page>`
   * :ref:`Themes & Theming <themes>`
   * :ref:`Upload settings <upload-settings>`

:ref:`Back to top <settings>`

.. _finding-aid:

Finding aid
===========

These settings configure how AtoM generates :term:`finding aids <finding aid>`
from :term:`archival descriptions <archival description>`. For more information,
see :ref:`print-finding-aids`; specifically,
:ref:`print-finding-aid-settings` includes a description of each settings field.

.. image:: images/finding-aid-settings.*
   :align: center
   :width: 80%
   :alt: Finding aid settings

:ref:`Back to top <settings>`

.. _add-remove-languages:

Add/Remove languages
====================

.. _Weblate: https://translations.artefactual.com/

AtoM relies on volunteer translators from the community to support new language
options. The translations are managed using an Artefactual-hosted instance of
`Weblate`_ and community members can learn more about contibuting translations
here:

* https://wiki.accesstomemory.org/Resources/Translation

With each new  major public release, we incorporate community-supplied
translations of AtoM's  :term:`user interface`, which can easily be changed by
end users by selecting a different language from the global
:ref:`language menu <language-menu>`. The language menu will display the
languages that are currently enabled in your AtoM application. This setting
determines what languages appear in the language menu.

.. image:: images/add-remove-languages.*
   :align: center
   :width: 70%
   :alt: An image of the add/remove languages menu in AtoM

.. |delete| image:: images/xdelete.png
   :height: 18
   :width: 18

.. |globe| image:: images/globe.png
   :height: 18
   :width: 18

**To add a language:**

1. Select a language from the :term:`drop-down menu` located under "Language
   code".
2. Click the "Add" button.
3. AtoM adds the language and refreshes the page; the added language will now
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

  If a user selects a language that is not currently supported, AtoM will
  refresh the settings screen without implementing any changes.

**To remove a language:**

4. Click the delete |delete| located in the third (blank) column next to the
   language.
5. AtoM will delete the language and refresh the page; the deleted language will
   no longer appear in the "Add/remove language" section in "Settings", nor in
   the :term:`drop-down menu` of the |globe| :term:`language navigation menu
   <language menu>` located at the top right corner of the :term:`header bar`.

To continue removing languages, repeat these steps as required.

.. seealso::

   * :ref:`choose-language`
   * :ref:`default-language`
   * :ref:`language-menu`

:ref:`Back to top <settings>`

.. _identifier-settings:

Identifier settings
===================

Settings in this section relate to :term:`archival description` identifiers, as
well as :term:`accession record` numbers. AtoM can automatically generate
unique identifiers for these :term:`entities <entity>` based on a configurable
mask. Users can also set :term:`reference code` behavior for descriptions in this
section of the settings.

.. figure:: images/identifier-settings.*
   :align: center
   :width: 100%
   :figwidth: 75%
   :alt: An image of the identifier-related settings in AtoM

   The identifier-related settings in AtoM. These affect descriptions and
   accession records

**Jump to:**

* :ref:`enable-accession-mask`
* :ref:`accession-mask`
* :ref:`accession-counter`
* :ref:`enable-identifier-mask`
* :ref:`identifier-mask`
* :ref:`identifier-counter`
* :ref:`reference-code-separator`
* :ref:`inherit-reference-code`
* :ref:`inherit-reference-dc`

.. _enable-accession-mask:

Enable accession mask
---------------------

This setting controls whether or not the :ref:`accession-mask` (described in
the section :ref:`below <accession-mask>`) is enabled or not.

When this setting is set to "yes," then when a user creates a new
:term:`accession record`, the Accession number :term:`field` will be
prepopulated with the next unique value based upon the :ref:`accession-mask`
settings - users can still manually edit the pre-populated value provided by
the mask, so long as a unique number is used.

When this setting is set to "no," then the accession mask will not be used,
and when creating a new accession record, the accession number field will be
blank.

See:

* :ref:`add-new-accession`
* :ref:`accession-mask`

.. NOTE::

   In a new installation, the accession mask is enabled by default. An
   :term:`administrator` can use this setting to disable it if desired.

.. _accession-mask:

Accession mask
--------------

.. _PHP strftime parameters: https://www.php.net/manual/en/function.strftime.php

When working with an :term:`accession record`, AtoM requires that a unique
Accession number be added - for more information, see:
:ref:`add-new-accession`. To help ensure that accession record numbers are
created in a consistent and unique manner, AtoM includes an accession mask,
which can define a pattern by which the next unique accession number is
generated. Turning the mask on or off is controlled by the setting described
above, :ref:`enable-accession-mask`.

On installation, the accession mask is enabled by default, and prepopulated
with a suggested value that will generate unique accession numbers. Expressed
in the mask setting as ``%Y-%m-%d/#i``, this value will generate a unique
accession number for every new accession record compiled from the following
elements: ``YEAR-MONTH-DAY/Incremental#``. So for example with the default
mask setting, the first accession you create, if it was generated on January
01, 2018, would have an accession number of ``2018-01-01/1``.

This mask, or default counter, can be changed by an :term:`administrator` to
suit institutional needs, using text strings and `PHP strftime parameters`_.
To add leading zeroes to the unique incrementing number for example, you can
add more ``i`` characters to the mask setting - so for example
``%Y-%m-%d/#iii`` would lead to incremental numbers like 001, 002, 003, etc.

The value of the incremental number is based on the :ref:`accession-counter`
value, described below. An administrator can choose to manually change or
reset the counter number if desired.

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
accession created will receive the next number in sequence. The value of this
counter is used to inform the incremental value used in the
:ref:`accession-mask`, described above.

.. NOTE::

   A CSV import of accession records will **not** increment this value - AtoM
   can only automatically track and increment the number based on accessions
   created manually via the :term:`user interface`. This is another reason why
   the accession counter is an editable value - if you perform a CSV import of
   accessions, you may wish to manualy increment the counter to the correct
   value, to ensure consistency.

.. _enable-identifier-mask:

Enable identifier mask
----------------------

This setting controls whether or not the :ref:`identifier-mask` (described in
the section below) is enabled or not.

When this setting is set to "yes," then when a user creates a new
:term:`archival description`, the Identifier :term:`field` will be
prepopulated with the next unique value based upon the :ref:`identifier-mask`
settings - users can still manually edit the pre-populated value provided by
the mask. AtoM does not enforce the uniqueness of archival description
identifier values.

When this setting is set to "no," then the identifier mask will not be used
to pre-populate identifier values, and when creating a new archival description,
the identifier field will be blank. However, a *Generate identifier* option
will still be provided below the field - if clicked, then the settings defined
in the Identifier mask will be used to populate the field.

See:

* :ref:`add-archival-description`
* :ref:`identifier-mask`

.. NOTE::

   In a new installation, the identifier mask is disabled by default. An
   :term:`administrator` can use this setting to enable it if desired.

.. _identifier-mask:

Identifier mask
---------------

The Identifier mask can be used to manage the creation of unique
:term:`archival description` identifier values when creating new
descriptins. By enabling the identifier mask, all descriptions created through
the user interface will be assigned an identifier based on a pre-defined pattern.

On installation, the identifier mask is **disabled** by default - to change
this, use the :ref:`enable-identifier-mask` setting described above.

The identifier mask is prepopulated with a suggested value that will generate
unique identifiers. Expressed in the mask setting as ``%Y-%m-%d/#i``, this
value will generate a unique identifiers for every new
:term:`archival description` created, comprised of the following elements:
``YEAR-MONTH-DAY/Incremental#``. So for example with the default mask setting,
the first description you create, if it was created on January 01, 2018, would
have an identifier of ``2018-01-01/1``. The value of the parameter, *#i*,
represents the :ref:`identifier-counter` value.

This mask, can be changed by an :term:`administrator` to suit institutional
needs, using text strings and `PHP strftime parameters`_. To add leading
zeroes to the unique incrementing number for example, you can add more ``i``
characters to the mask setting - so for example ``%Y-%m-%d/#iii`` would lead
to incremental numbers like 001, 002, 003, etc.

The value of the incremental number is based on the :ref:`identifier-counter`
value, described below. An administrator can choose to manually change or
reset the counter number if desired.

It is also possible to replace an existing :term:`archival description`
identifier with one based on the identifier mask by editing a description and
selecting *Generate identifier* below the identifier field.

For more information on creating archival descriptions, see:

* :ref:`add-archival-description`

.. _identifier-counter:

Identifier counter
------------------

The identifier counter defines incremental integer at the end of a generated
identifier, represented in the identifier mask as *#i*. AtoM provides you with
a count of the number of :term:`archival description` records created via the
:term:`user interface`. This value is then used as part of the
:ref:`identifier-mask` as the incrementing number value.

Deleting an archival description will not affect the counter - it simply adds the
next integer, rather than looking for unused integers. If this number is
changed by an administrator, the next accession created will receive the next
number in sequence.

.. NOTE::

   A CSV import of archival descriptions will **not** increment this value -
   AtoM can only automatically track and increment the number based on records
   created manually via the :term:`user interface`. This is another reason why
   the identifier counter is an editable value - if you perform a CSV import
   of descriptions, you may wish to manualy increment the counter to the
   correct value, to ensure consistency.

.. _reference-code-separator:

Reference code separator
------------------------

The reference code separator is the character separating hierarchal elements
in a :term:`reference code` (see Inherit reference code,
:ref:`below <inherit-reference-code>`).The default reference code separator
appears as a dash ``-`` in AtoM, which can be changed by an
:term:`administrator` to suit institutional practices.

.. TIP::

   If you intend to use a ``/`` slash as your reference code separator, we
   recommend you review the following setting! See:

   * :ref:`escape-chars`

.. IMPORTANT::

   If you change this setting, it will be applied immediately on
   :term:`view pages <view page>`. However, to see these changes take effect
   in search and browse results pages, a system administrator will need to
   :ref:`clear the application cache <maintenance-clear-cache>`,
   :ref:`restart services <troubleshooting-restart-services>`, and
   :ref:`populate the search <maintenance-populate-search-index>` before they
   are visible.

   If you continue to see the previous reference code separator in
   search/browse results after performing the above tasks, be sure to clear
   your web browser cache as well.

.. _inherit-reference-code:

Inherit reference code (information object)
-------------------------------------------

In AtoM, a reference code is a unique identifier string associated with an
:term:`archival description`, created through the combination of inherited
identifiers from other related entities. While an individual description
identifier is rarely globally unique (and is often not unique even in the same
AtoM instance), by combining additional elements such as a the country code,
repository code, and any :term:`parent <parent record>` identifiers, a unique
reference code can be created, which facilitates international discovery and
exchange.

When this setting is set to "yes", the reference code string will be built
using the archival description identifier plus the identifier of all its
ancestors (:term:`parent records <parent record>`), as well as the repository
identifier and country code if they have been entered. The string will appear
in this order with the applicable elements:

* Country code (derived from the country code of the country entered into the
  contact information of the related :term:`archival institution`)
* Repository identifier (derived from the identifier field on the related
  :term:`archival institution`)
* Fonds/Collection level identifier
* Series identifier
* Subseries identifier
* File identifier
* Item identifier
* etc.

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

   This setting also determines how the ``<unitid>`` element in the EAD XML is
   populated. If the inheritance is turned on, then AtoM will populate all
   descendant records in the EAD XML with the full inherited reference code.
   If inheritance is turned off, AtoM will only add the identifier for that
   record in the ``<unitid>`` on export. This allows users exporting to a
   different source system that does not have a reference code inheritance
   setting to maintain a full reference code at all levels in the target
   system. **However, if you are exporting from one AtoM instance to another**
   (for example, from a local institution to a portal site), you might want to
   consider how this will impact your record display in the target system - if
   you have reference code inheritance turned on when you export, and the
   target AtoM instance *also* has the setting turned on, you may end up with
   duplication in the display!

   Note as well, this setting does **not** affect the behavior of DC XML exports.
   This behavior can be managed separately via a different setting - see below:

   * :ref:`inherit-reference-dc`

.. SEEALSO::

   * :ref:`Control area <control-area>`
   * :ref:`reference-code-separator`
   * :ref:`escape-chars`
   * :ref:`inherit-reference-dc`

.. _inherit-reference-dc:

Inherit reference code (DC XML)
-------------------------------

This setting controls whether an individual :term:`archival description`'s
identifier or its full inherited :term:`reference code` is used when a
description is exported as Dublin Core XML (including when exposed via AtoM's
:ref:`oai-pmh` module.

.. SEEALSO::

   * For more information on reference codes in AtoM and how inheritance works,
     see above: :ref:`inherit-reference-code`
   * To set the default separator character used in inherited reference codes,
     see: :ref:`reference-code-separator`
   * To learn more about Dublin Core in AtoM, see: :ref:`dc-template`
   * For more on XML export, see: :ref:`export-xml`
   * To learn more about how Dublin Core XML is used in AtoM's OAI repository
     module, see: :ref:`oai-pmh`

When set to "No," only the current description's identifier will be included in
DC XML exports. When set to "Yes," AtoM will use the reference code inheritance
model described above in :ref:`inherit-reference-code`, meaning in addition to
the description's local identifier, the ``<dc:identifer>`` will also include:

* The country code of any related :term:`archival institution` (derived from the
  country added in the address section of the related :term:`repository` record)
* The repository identifier of any related :term:`archival institution`
* Identifiers of any :term:`parent <parent record>` descriptions, separated by
  the default separator defined in the :ref:`reference-code-separator` setting

By default, this setting is set to "No" in new installations.

.. IMPORTANT::

   This setting does **not** alter the behavior of how identifiers / reference
   codes are displayed on description :term:`view pages <view page>`, nor does
   it affect how identifiers are handled in EAD 2002 XML exports.

   Both of these are instead affected by the :ref:`inherit-reference-code`
   setting, described above.

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

.. _markdown-settings:

Markdown settings
=================

.. image:: images/markdown-settings.*
   :align: center
   :width: 75%
   :alt: An image of the markdown settings in AtoM

.. _Markdown: https://daringfireball.net/projects/markdown/
.. _Parsedown: https://parsedown.org/

Markdown_ is a lightweight markup syntax for text formatting, originally created
by John Gruber. As of the 2.5 release, AtoM supports the use of Markdown_ in
both :term:`edit pages <edit page>` and :term:`static pages <static page>`, via
a PHP library known as Parsedown_.

This setting enables Markdown support in AtoM, which will allow for content
added to edit and static pages to be styled using Markdown syntax. For more
information on using Markdown in AtoM, see: :ref:`formatting`.

.. IMPORTANT::

   After enabling or disabling this setting, a system administrator **must**
   rebuild the search index for the changes to take effect. For more information
   on how to rebuild AtoM's search index, see:

   * :ref:`maintenance-populate-search-index`.

   To ensure you are seeing the most up-to-date results, you may also want to
   :ref:`clear the application cache <maintenance-clear-cache>` and restart services
   (such as :ref:`PHP-FPM <troubleshooting-restart-php-fpm>` and
   :ref:`Memcached <troubleshooting-restart-memcached>` if you
   are using it for additional caching), and clear your web browser cache.

   Markdown is also used in the default text of the :ref:`privacy-notification`
   banner in new installations. If you are using the privacy notification and
   intend to disable Markdown in AtoM, be sure to review and update your
   notification message!

:ref:`Back to top <settings>`

.. _oai-repository:

OAI repository
==============

.. _Open Archives Initiative: http://www.openarchives.org/

The `Open Archives Initiative`_ Protocol for Metadata Harvesting, or OAI-PMH,
is a protocol for metadata harvesting that allows automatic data harvesting
and crawling within other systems that support OAI harvesters.

.. image:: images/oai-repository.*
   :align: center
   :width: 70%
   :alt: An image of the OAI repository menu in AtoM

Comprehensive documentation on each field in the OAI repository settings is
included in the :ref:`OAI repository <oai-pmh>` documentation, here:

* :ref:`oai-pmh-settings`

.. TIP::

   To use the OAI repository functionality in AtoM and to see the related
   settings, you must first make sure that the arOAIPlugin is turned on. For
   more information, see:

   * :ref:`oai-pmh-plugin`
   * :ref:`manage-plugins`

   If the arOAIPlugin is **not** turned on, then you won't see the OAI
   repository tab on the settings page menu!

:ref:`Back to top <settings>`

.. _permissions:

Permissions
===========

Permissions settings are used by :term:`administrators <administrator>` to
make PREMIS rights records in
:term:`archival descriptions <archival description>` actionable on
attached :term:`digital objects <digital object>`. See :ref:`rights` for more
information on working with rights in AtoM.

The permissions settings page is divided into 4 sections:

* PREMIS access permissions
* PREMIS access statements
* Copyright statement
* Preservation system access statement

.. image:: images/permissions-settings.*
   :align: center
   :width: 90%
   :alt: Permissions settings in AtoM

For information on configuring the PREMIS access permissions, see:
:ref:`rights-digital-object` (and for an example use case, see:
:ref:`rights-digital-object-example`).

For information on configuring the PREMIS access statements, see:
:ref:`disallow-statements`.

For information on configuring and using the Copyright statement, see:
:ref:`copyright-pop-up`.

For information on configurating and using the Preservation system access
statement, see: :ref:`preservation-access-statement`.

:ref:`Back to top <settings>`

.. _privacy-notification:

Privacy notification
====================

.. _cookies: https://en.wikipedia.org/wiki/HTTP_cookie
.. _GDPR: https://en.wikipedia.org/wiki/General_Data_Protection_Regulation
.. _Google Analytics: https://www.google.com/analytics/
.. _Data Processing Terms: https://privacy.google.com/businesses/processorterms/

The Privacy notification provides :term:`administrators <administrator>` with
a configurable notification banner that, when enabled, will be shown to all
users when first visiting AtoM in a session. It was designed to assist site
administrators in complying with proactive privacy policy disclosure
regulations such as the European Union's General Data Protection Regulation
(GDPR_), which requires that any information collected about a user through the
use of a website must be disclosed to the user in advance, with the option to
opt out and/or leave the site. However, the notification message is entirely
customizable and could be repurposed for any use.

.. NOTE::

   **AtoM's data collection**

   AtoM collects cookies_ in order to enable browsing and loading of certain
   types of content. Visitors to AtoM sites who do not wish to have cookies
   placed on their computers can set their browsers to refuse cookies.
   However, certain features (such as the :ref:`clipboard`) may not function
   properly without the aid of cookies.

   AtoM supports integration with `Google Analytics`_ for the purposes of
   gathering statistics on page views, site usage, user location, and other
   data on site visits. All data collected by Google Analytics are stored and
   processed by Google, according to the Google Ads `Data Processing Terms`_.

   None of the information gathered through the use of cookies or Google
   Analytics is used for any purpose other than the ones described here.

   Users who log in have user accounts with usernames and passwords. These
   data are collected solely for the purpose of enabling users to log in to
   the software and are not disclosed to third parties. All AtoM user
   passwords are stored in encrypted form to enhance data security.

To support the use of the notification banner in proactive privacy disclosure,
AtoM includes a default Privacy Policy :term:`static page` which contains a
slightly more detailed version of the text in the note above about AtoM's data
collection.

.. image:: images/privacy-static-page.*
   :align: center
   :width: 80%
   :alt: An image of the default Privacy Policy static page in AtoM

A link to the page is also included in the :ref:`Quick links menu <quick-links-menu>`
as "Privacy Policy." The static page and the Quick links menu node can both be
customized or deleted by an :term:`administrator` - for more information on
working with menus and static pages, see:

* :ref:`manage-static-pages`
* :ref:`manage-menus`

**Enabling the Privacy notification**

.. image:: images/privacy-notification-settings.*
   :align: center
   :width: 80%
   :alt: Privacy notification settings in AtoM

By default in new installations, the Privacy notification banner will be turned
off, meaning it will not display unless an :term:`administrator` enables it.
To enable the setting, log in and navigate to |gears| **Admin > Settings >
Privacy Notification**.

In the Privacy notification settings page, set the :term:`radio button` to "Yes"
to enable the privacy notification banner. Once you click Save in the
:term:`button block` at the bottom of the settings, the banner will immediately
become visible. When users visit the site, the banner will remain persistently
visible until the "Ok" button in the notification banner is clicked.

.. image:: images/privacy-notification.*
   :align: center
   :width: 80%
   :alt: An image of the privacy notification banner shown above an AtoM homepage

**Customizing the Privacy notification message**

Administrators can customize the content shown in the notification banner by
editing the text included in the "Privacy Notification Message" :term:`field`.
The default text included in this field in new installations is:

.. code-block:: none

   This website uses cookies to enhance your ability to browse and load
   content. [More Info.](/privacy)

The ``[More Info.](/privacy)`` text, when saved, will render as a hyperlink to
the Privacy policy :term:`static page`. This hyperlink is created using Markdown_
- for more information on using Markdown for text formatting in AtoM, see:

* :ref:`formatting`
* :ref:`markdown-settings`

.. IMPORTANT::

   If you are using AtoM with a custom theme, a developer or system administrator
   may need to make some changes to your custom theme plugin to ensure that the
   Privacy notification displays properly. Further details are included in the
   :ref:`installation-upgrading` documentation - see:

   * :ref:`upgrading-custom-themes`

:ref:`Back to top <settings>`

.. _security-panel:

Security panel
==============

This section includes settings that administrators can enable to enhance the
security of AtoM.

**Jump to:**

* :ref:`security-limit-ip`
* :ref:`security-require-ssl`
* :ref:`security-require-strong-pass`

.. SEEALSO::

   The Administrator's manual has some further suggestions on security for
   site administrators. See:

   * :ref:`security`

.. image:: images/security-panel.*
   :align: center
   :width: 70%
   :alt: Security settings in AtoM

.. _security-limit-ip:

Limit administrator functionality by IP address
-----------------------------------------------

This feature allows :term:`administrators <administrator>` to limit
administrator functionality to one or more IP addresses or IP ranges. Separate
multiple IP address or ranges by semicolons, and use a dash to indicate an IP
range. For example:

  * 192.168.0.1 (single IP address)
  * 192.168.0.1;192.168.0.255 (multiple unique IP addresses)
  * 192.168.0.1-192.168.0.255 (IP range)

.. _security-require-ssl:

Require SSL for all administrator functionality
-----------------------------------------------

.. _HTTPS: http://en.wikipedia.org/wiki/HTTP_Secure

This feature allows administrators the option to enable the Hypertext Transfer
Protocol Secure (`HTTPS`_), which is a protocol for security over a computer
network. It works by layering the Hypertext Transfer Protocol (HTTP) with the
SSL/TLS protocol (Secure Sockets Layer/Transport Layer Security).

.. WARNING::

   To use this setting, you must **first** ensure that your server is configured
   to support SSL! If you enable this setting and haven't first acquired and
   installed and SSL certificate and updated your site to use HTTPS, then you
   will end up locking yourself out of your site!

Select yes to require all HTTP requests to be redirected to the HTTPS server,
changing the URI scheme from "http" to "https." This will only apply to users
who are authenticated (logged-in) or visiting the login page. Any attempts to
log in without using proper HTTPS will redirect to the home page.

.. TIP::

   If you have accidentally enabled this setting and locked yourself out of
   your AtoM site, a system administrator can use SQL to turn off the setting in
   the database. For more information, see:

   * :ref:`sql-disable-ssl`

.. _security-require-strong-pass:

Require strong passwords
------------------------

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
are included in the default page elements. See :ref:`default-page-elements` for
an image of where the Title and description appear, and more about setting the
visibility of default page elements. These are also used when your site is
indexed by web crawlers for public results in search engines such as Google,
Yahoo, Bing, etc. You can choose to hide them from public view via the
:ref:`default-page-elements` settings, but we recommending adding site
information here even if you decide not to display the title and description
publicly.

The base URL is used to create absolute URLs included in exports (e.g. MODS
and EAD exports, and the ``digitalObjectURI`` column in CSV exports). For
example, your AtoM site is made up a series of web pages. Each page has a full
Uniform Resource Locator (URL) something like
``http://www.your-atom-site.com/your-description``. The Base URL is the part
of this URL that does not change - in this example,
``http://www.your-atom-site.com``.

Setting this value will ensure that links included in your XML exports will be
properly formed. Do not include a slash ``/`` at the end of your base URL -
AtoM will automatically add this when building the absolute URLs.

To save any modifications, click the "Save" button located below the
"Site Description" field.

:ref:`Back to top <settings>`


.. _storage-service:

Storage Service
===============
In this section, :term:`administrators <administrator>` can enable the
download of original files and Archival Information Packages (AIPs) from an
`Archivematica`_ digital preservation system that
has uploaded Dissemination Information Package (DIP) access copies to AtoM.

.. IMPORTANT::

   Both the **arStorageServicePlugin** and **arRestApiPlugin** must be enabled
   for this "Storage service" option to appear on the Settings menu and for
   the Archivematica integration to work. See
   :ref:`Manage Plugins <manage-plugins>`.

1. Fill in the appropriate value for the address of the Storage Service API
   used by the Archivematica instance. This is typically located at port 8000.
   Don't forget to add the api version.
2. Log into the Storage Service with an authorized account. Go to
   **Administration > Users** and  click the "Edit" button for an active
   account. Note the "Username" and copy the "Api key" at the bottom of the
   page.
3. Enter these values in the "Storage Service username" field and "Storage
   Service API key" field on the AtoM Storage Service settings form.
4. Toggle the "Enable AIP download" option to "Enabled". Press the "Save"
   button.

.. image:: images/storage-service-settings.*
   :align: center
   :width: 90%
   :alt: Storage service settings

.. NOTE::

   By default this will only enable Archivematica File and AIP download for
   users that are members of the "Adminstrator" group.

5. Browse to a digital object that was created using the DIP Upload feature.
   Download links are located to the right of the File and AIP UUIDs.

.. image:: images/digital-object-preservation-copies-with-access.*
   :align: center
   :width: 90%
   :alt: Digital object preservation copies, with download access

.. NOTE::

   When these links are clicked a new tab will temporarily open and will
   remain open until the Storage Service responds to the request. Once the
   file download begins, the download tab will disappear to be replaced with
   the download status icon for your browser. The files are saved with the
   name sent in the Storage Service response. If there is an error with the
   call to the Storage Service, the error status page will be displayed in
   this tab.

6. To enable this feature for other user groups you must update the
   ``security.yml`` file in the arStorageServicePlugin folder. Starting from
   the root folder of the AtoM application, e.g.

    .. code-block:: bash

       /usr/share/nginx/atom

    it is found at:

    .. code-block:: bash

       plugins/arStorageServicePlugin/modules/arStorageService/config/
       security.yml

7. The default content is:

    .. code-block:: bash

       all:
         is_secure: true
         credentials: administrator

8. The ``all`` setting indicates that administrator users have the ability to
   download both AIPs and original files. If you want to give another user
   group (e.g. editors) the same capability, you would edit the
   ``security.yml`` file to read:

    .. code-block:: bash

       all:
         is_secure: true
         credentials: [[ administrator, editor ]]

9. You can also configure more fine-grained permissions to allow for the
   download of just AIPs or just for original files by using the ``download``
   or ``extractFile`` settings.

10. If you use the ``download`` or ``extractFile`` setting, it overrides the
    ``all`` setting and you need to repeat those user group values in the more
    granular permission. Otherwise those groups will lose their permissions.
    For example, in the settings below, the administrator and editor groups
    have to be added to ``download`` and ``extractFile`` in order for them to
    retain both AIP and original file download permission.

    .. code-block:: bash

       all:
         is_secure: true
         credentials: [[ administrator, editor ]]

       download:
         is_secure: true
         credentials: [[ administrator, editor, contributor ]]

       extractFile:
         is_secure: true
         credentials: [[ admninistrator, editor, translator ]]

11. In the examples above, members of the administrator and editor user group
    can download both AIP packages and original files. Contributors can only
    download AIPs and translators can only download original files. Members of
    other user groups (e.g. authenticated) do not have any download
    permissions and will not see a download link or icon next to the AIP UUID
    or File UUID.

.. IMPORTANT::

   After making changes to the ``security.yml`` file, refresh the application
   cache for the new permission settings to take effect:

     .. code-block:: bash

        php symfony cc

:ref:`Back to top <settings>`

.. _treeview-settings:

Treeview settings
=================

.. image:: images/treeview-settings-page.*
   :align: center
   :width: 90%
   :alt: Treview settings page in AtoM

The :term:`treeview` is a user interface element designed to assist with
hierarchical navigation. The settings in this section relate to the treeview as
it is displayed and used on :term:`archival description` view pages. For more
information on navigation with and use of the treeview, see:
:ref:`context-menu-treeview`.

**Jump to:**

* :ref:`treeview-type`
* :ref:`treeview-collapsible`
* :ref:`hierarchy-browser-settings`
* :ref:`sidebar-treeview-settings`
* :ref:`fullwidth-treeview-settings`

.. SEEALSO::

   * :ref:`context-menu`
   * :ref:`archival-descriptions`
   * :ref:`treeview-search`

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
* The Identifier is included in the sidebar treeview nodes. With the full-width
  treeview, users can configure which elements are included in each node - for
  more information, see below: :ref:`fullwidth-treeview-settings`.
* The results in the sidebar treeview are truncated - the first 5-6 nodes in
  the hierarchy are displayed by default, after which an approximate count of
  remaining nodes in the current level is provided, with the option to expand
  the results to display more. All nodes are shown in the full-width treeview.

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

For more information on each treeview type, see:

* :ref:`context-menu-treeview-sidebar`
* :ref:`context-menu-treeview-full`

With the 2.5 release, administrators can also choose to show a **browse
hierarchy** option on the :term:`archival descriptions <archival description>`
browse page. This new feature will provide users with an additional way of
browsing records held in AtoM - via a full-page version of the full-width
treeview that contains all descriptions.

This new browsing mode will be disabled by default in new installations. To
offer that option to users, an administrator can enable this feature by choosing
'Yes' to 'Show browse hierarchy page' in the treeview settings. When enabled, a
new link will appear on the archival description
:ref:`search/browse page <browse>`, labelled "Browse by hierarchy."

For more information on browsing with this option, see:

* :ref:`browse`

.. _treeview-collapsible:

Make full width treeview collapsible on description pages
---------------------------------------------------------

This setting affects the default display of the full width treeview when users
first arrive on the :term:`view page` of an :term:`archival description`. See
:ref:`treeview-type` above for more information on the different treeview types
available in AtoM.

By default in new AtoM installations, this setting will be disabled (i.e. set
to "no"). When this setting is enabled (i.e. set to "yes"), the full-width
treeview will be wrapped in a collapsible section, similar to
:ref:`advanced-search-interface` on archival description search and browse
pages.

.. image:: images/treeview-collapsed.*
   :align: center
   :width: 70%
   :alt: An image showing the full-width treeview collapsed on a descrpition

Once the setting is enabled, the treeview collapsible section will be closed
when users first arrive on a :term:`view page`, but users can click to expand
it, and it will maintain its open state as users navigate to different
descriptions in the hierarchy via the treeview nodes.

.. image:: images/treeview-expanded.*
   :align: center
   :width: 70%
   :alt: An image showing the full-width treeview expanded on a descrpition

Users can click the container heading again at any time to collapse or expand
the treeview. Navigating elsewhere or triggering a full page refresh will
result in the treeview widget returning to its default collapsed state.

An :term:`administrator` can also customize the labels used on the widget - the
default text included during installation reads "Show hierarchy" when collapsed,
and "Hide hierarchy" when expanded. To customize these default labels, see:

* :ref:`user-interface-labels`

.. SEEALSO::

   * :ref:`fullwidth-treeview-settings`
   * :ref:`treeview-type`
   * :ref:`context-menu-treeview`

.. _hierarchy-browser-settings:

Show browse hierarchy page
--------------------------

The :term:`hierarchy browser` is a :term:`user interface` element that can be
enabled or disabled by an :term:`administrator`. When enabled, it provides end
users with a full-width :term:`treeview` of all of AtoM's
:term:`archival description` :term:`holdings`. Users can expand and collapse
individual nodes in the treeview to explore the hierarchical arrangement of a
specific :term:`archival unit`; however, clicking any node in the hierarchy
browser will redirect the user to the related description's :term:`view page`.
For more information on using the hierarchy browser, see:
:ref:`browse-hierarchy-browser`.

When "Show browse hierarchy page" is set to **yes**, a new option will be added
to the archival description browse page, above the results:

.. image:: images/browse-hierarchy-choice.*
   :align: center
   :width: 70%
   :alt: Browse hierarchy choice

This option will be available to all users, including unauthenticated (i.e.
public, or not logged in) users. When clicked, users will be taken  to a
full-page, full-width treeview containing all top-level descriptions in AtoM,
which can be used for high-level browsing:

.. image:: images/browse-hierarchy.*
   :align: center
   :width: 70%
   :alt: Browse hierarchy page

See the related :ref:`browse documentation <browse-hierarchy-browser>`
for further information on the hierarchy browser's behavior and use.

When the setting is set to **no**, the hierarchy browser will not be created,
and the link on the browse page will not be shown.

.. _sidebar-treeview-settings:

Sidebar treeview settings
-------------------------

Settings in this area relate only to the sidebar treeview. They will not affect
the behavior of the full-width treeview.

.. _sort-treeview:

Sort treeview (information object)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _ASCII: https://en.wikipedia.org/wiki/Ascii

This setting determines how lower-level
:term:`descriptions <archival description>` are sorted in an archival
description's :term:`context menu`.

* Selecting "manual" means the descriptions will appear in the order in which
  they were entered into AtoM. If manual sort is selected, editors can also
  drag and drop descriptions within the :term:`treeview` to re-order.
* Selecting "title" sorts the descriptions by title.
* Selecting "identifier - title" sorts the descriptions by identifier, then by
  title.

In new installations, the default sort order is Manual. Note that when the
treeview sort is set to Manual, an authenticated (i.e. logged in) user with
edit :term:`permissions <access privilege>` can re-order sibling descriptions
in the treeview by dragging and dropping them. This ability **only** works when
the treeview sort setting is set to "Manual." For more information, see:

* :ref:`Change the sort order of an archival hierarchy <change-sort-order>`

.. TIP::

   AtoM's search index is based on Elasticsearch, which sorts characters based
   on the order of the in the `ASCII`_ character encoding scheme. This can
   result in seemingly wrong orders when sorting by identifier- for example,
   1-1 will be followed by 1-10 instead of 1-2. The solution is to use
   **leading zeroes** when forumulating identifiers that you wish to sort in a
   human- readable order, e.g. 1-01, 1-02, etc.

.. _fullwidth-treeview-settings:

Full-width treeview settings
----------------------------

Settings in this area relate to the functionality and display of the
full-width treeview. They do not affect the behavior of the sidebar treeview.

Currently all elements in this section relate to what information is displayed
in the treeview for each node. Users can configure whether the
identifier/reference code, level of description, and/or dates of creation are
included in each node's display.

When all elements are displayed, the ordering of the metadata elements is as
follows:

.. code-block:: none

   [Level] ID - Title of description, dates

So for a Series level description with an identifier of 004 called
"Photographs" and created in 1959, the display with all elements would be:

.. code-block:: none

   [Series] 004 - Photographs, 1959

Each configurable element is described further below.

.. SEEALSO::

   * :ref:`treeview-collapsible`

.. _fwt-show-id:

Show identifier
^^^^^^^^^^^^^^^

This setting controls whether or not an identifier or full inherited
:term:`reference code` is included in the treeview display for each node.

For more information on how reference codes are formed in AtoM and the
difference between an identifier and a full reference code, see above,
:ref:`inherit-reference-code`.

.. _fwt-show-lod:

Show level of description
^^^^^^^^^^^^^^^^^^^^^^^^^

This setting determines whether or not the level of description assigned to the
current description is included in the treeview node display or not.

.. _fwt-show-dates:

Show dates
^^^^^^^^^^

This setting determines whether or not dates of creation are included in the
treeview node display or not. Where there are multiple dates of creation, only
the first will be shown. Other event type dates (for example, dates of
accumulation, or dates of broadcast, etc.) are not included regardless of the
setting.

.. _fwt-items-per-page:

Items per page
^^^^^^^^^^^^^^

This setting controls how many immediate :term:`child <child record>`
descriptions are loaded below the top-level description when users first visit
a hierarchical description's :term:`view page`. It also controls the number
of top-level descriptions that are added to the :term:`hierarchy browser` on
first load

Like the sidebar treeview, for performance reasons AtoM may not load all
available descriptions at once in the full-width treeview, when there are many
immediate :term:`children <child record>` below the top-level description in the
:term:`archival unit`. The default value for this behavior is 50 - meaning, if
there are more than 50 immediate children below the parent description, AtoM
will add a count of the number of remaining records not immediately displayed to
a button in the top right corner.

.. image:: images/treeview-paging-1.*
   :align: center
   :width: 80%
   :alt: An image of paging in the full-width treeview

Clicking on that button will load the next set of records, using this "items
per page" setting value to determine how many to load at once. If there are
still more records not displayed, the number of remaining records will be
shown and the user can choose to see the next set, or return to the beginning
by choosing "reset".

.. image:: images/treeview-paging-2.*
   :align: center
   :width: 80%
   :alt: An image of paging in the full-width treeview

To allow for more records to be loaded initially, and with each subsequent click
of the "More" button, an :term:`administrator` can adjust this "Items per page"
value. The minimum value is 10, and the maximum value that can be set via the
:term:`user interface` is 10,000.

.. TIP::

   If your site has very large hierarchies and you need to set the initial page
   load value higher than 10,000 records, a system administrator can modify this
   max value in the configuration file found at ``config/app.yml``.
   Look for the following line in the file:

   .. code-block:: bash

      treeview_items_per_page_max: 10000

   After the change, you will need to clear the application cache, and restart
   PHP-FPM. For more information, see:

   * :ref:`customization-config-files`
   * :ref:`maintenance-clear-cache`
   * :ref:`troubleshooting-restart-php-fpm`

The behavior is similar for the :term:`hierarchy browser`, though instead of
affecting the number of :term:`children <child record>` loaded below the
top-level :term:`archival description`, here the setting will determine how many
top-level descriptions are loaded in the initial view. See
:ref:`browse-hierarchy-browser` for more information.

:ref:`Back to top <settings>`

.. _upload-settings:

Uploads
=======

.. image:: images/upload-settings.*
   :align: center
   :width: 90%
   :alt: An image of the Uploads settings in AtoM

These settings allow an :term:`administrator` to manage the upload of
:term:`digital objects <digital object>` to AtoM, including per-repository
upload limits when AtoM is used as a :term:`multi-repository system`.

**Jump to:**

* :ref:`total-upload-space`
* :ref:`repository-upload-setting`
* :ref:`default-institution-upload`
* :ref:`upload-multi-files`

.. SEEALSO::

   * :ref:`upload-digital-object`
   * :ref:`digital-object-derivatives`
   * :ref:`upload-limit`
   * :ref:`archival-institutions`

.. _total-upload-space:

Total space available for uploads
---------------------------------

This field will display the used space for
:term:`digital objects <digital object>` as well as the total space available.
The space available is determined by a configurable setting that a system
administrator can modify in one of AtoM's configuration files - see:

* :ref:`config-app-yml`

.. _repository-upload-setting:

Archival institution upload limits
----------------------------------

In addition to setting a global limit on the total space available for
:term:`digital object` uploads, an :term:`administrator` can also set
individual upload limits per :term:`archival institution`, which can be useful
when AtoM is used as a :term:`multi-repository system`. There is also
a setting for configuring what the default upload limit is per repository - see
below:

* :ref:`default-institution-upload`

This setting controls whether or not the configurable per-repository upload
limit widget is enabled and displayed. When set to "Enabled", an administrator
can further customize the upload limit per archival institution using the
widget displayed to authenticated (i.e. logged in) users on the related
repository :term:`view page`. However, disabling this widget can sometimes be
useful for improving page load performance, particularly in large
installations.

For more information on using the per-repository upload limit widget, see:

* :ref:`upload-limit`

.. image:: images/upload-limit.*
   :align: center
   :width: 90%
   :alt: An image of the per-repository upload limit widget in AtoM

.. _default-institution-upload:

Default archival institution upload limit (GB)
----------------------------------------------

In addition to setting a :ref:`global limit <total-upload-space>` on the total
space available for :term:`digital object` uploads, it's also possible to set
a default limit per :term:`archival institution` when using AtoM as a
:term:`multi-repository system`. When set, this will be applied as the new
default upload limit per institution.

Enter the upload limit in GB allowed for uploading digital objects. Use "-1" as
the value for unlimited upload space. This setting can be modified by an
authenticated (i.e. logged-in) :term:`administrator`.

A value of "0" (zero) disables file upload.

For more information, see :ref:`upload-digital-object`.

.. TIP::

   While this setting sets a default global limit per repository, an individual
   upload limit can also be set by an :term:`administrator` on a per-repository
   basis, from the :term:`archival institution` page. For more information, see:
   :ref:`upload-limit`.

   Note that an administrator can also disable the display of this widget,
   which can sometimes be useful for improving page load performance. See above:

   * :ref:`repository-upload-setting`

.. _upload-multi-files:

Upload multi-page files as multiple descriptions
------------------------------------------------

Normally, a multi-page file such as a PDF is uploaded as a single
:term:`digital object`, linked to a single target :term:`archival description`.
However, it is possible to break up each page into its own digital object, and
attach these to new :term:`child <child record>` descriptions

Select "yes" if you would like each page of a multi-page file to be attached
to a separate :term:`child-level <child record>` description. For example, a
PDF file with 10 pages uploaded to a description would result in 10 individual
descriptions, one for each page in the file.

Select, "no" if you would like one multi-page file to be attached to a single
description.

.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`upload-digital-object`
   * :ref:`Digital object derivative settings <digital-object-derivatives>`

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
typically used by archival institutions, but can be customized as desired.
Additionally, some of the user interface label settings allow an administrator
to customize the display labels on particular user interface elements, such as
the text shown for collapsing and expanding the full width treeview when the
:ref:`treeview-collapsible` is enabled.

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
* globalSearch: the placeholder help text that will appear in the global
  :term:`search box`.
* institutionSearchHoldings: only visible if institutional scoping is enabled -
  when enabled, this is the default placeholder help text that will appear in the
  per-institution search box included in the :term:`institution block`. For more
  information, see: :ref:`enable-scoping`
* fullTreeviewCollapseOpenedButtonText: Text used in the setting to
  :ref:`treeview-collapsible`. This text will be displayed on the collapsible widget
  when the widget is expanded, showing the descriptions. The text used should
  suggest to users that clicking it will cause the widget to collapse, hiding the
  treeview.
* fullTreeviewCollapseClosedButtonText: Text used in the setting to
  :ref:`treeview-collapsible`. This text will be displayed on the collapsible widget
  when the widget is collapsed, hiding the descriptions. The text used should
  suggest to users that clicking it will cause the widget to expand, showing the
  treeview.

:term:`User interface <user interface>` labels can be changed by
:term:`administrators <administrator>` by entering a new label(s) into the
:term:`field(s) <field>` under the "Value" column. Changes will only be
saved once the "Save" button is clicked. Changing the label will change its
appearance throughout AtoM for both authenticated (logged-in) and
public users.

.. NOTE::

   Changing the user interface labels will *not* automatically change the
   corresponding labels in the navigation menus. To change these menus, go to
   |gears| **Admin > Menus**. See the :ref:`Manage menus <manage-menus>` page
   for more information.

:ref:`Back to top <settings>`
