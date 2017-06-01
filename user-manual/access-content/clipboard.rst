.. _clipboard:

=========
Clipboard
=========

.. |clip| image:: images/paperclip.png
   :height: 18

.. |gears| image:: images/gears.png
   :height: 18

The :term:`Clipboard` is a :term:`user interface` element that allows users to
select records while searching and browsing, and add them to a list (the
"clipboard"), for later review or further action. Authenicated users
(i.e. those logged in) can also perform CSV exports of Clipboard results via
the user interface. Currently the Clipboard is only available for use with
:term:`archival descriptions <archival description>`,
:term:`authority records <authority record>`, and
:term:`archival institutions <archival institution>`.

Additionally, the clipboard is **session-based** - meaning that it does not
persist between user sessions. When you close your browser, any results on
the clipboard will be lost.

.. IMPORTANT::

   The session is renewed when logging in or out of the application - so you
   might lose your results if you log in or log out! Be aware of this and plan
   accordingly.

.. image:: images/clipboard.*
   :align: center
   :width: 90%
   :alt: An image of the Clipboard with results.

The following sections will introduce you to the Clipboard and the
:term:`Clipboard menu` in the AtoM header bar, as well as how the Clipboard
can be used.

.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`authority-records`
   * :ref:`archival-institutions`
   * :ref:`csv-export-clipboard`
   * :ref:`navigate`

.. _clipboard-menu:

Clipboard menu
==============

The Clipboard has its own menu icon in the AtoM :term:`header bar`, visible to
all users. It is represented by the |clip| paperclip icon. Clicking on the
Clipboard icon in the header bar will reveal a :term:`drop-down menu` with a
count of the objects currently pinned to the clipboard, as well as options to
either clear all current selections from the clipboard, or to go the
Clipboard's view page:

.. image:: images/clipboard-menu.*
   :align: center
   :width: 60%
   :alt: An image of the Clipboard menu.

When records have been pinned to the the Clipboard, the menu will show a
count of pinned items as you move around the application, for reference:

.. image:: images/clipboard-menu2.*
   :align: center
   :width: 40%
   :alt: An image of the Clipboard menu when items are pinned.

The count is also shown in the :term:`drop-down menu`, where it will identify
the different :term:`entity` types:

.. image:: images/clipboard-menu3.*
   :align: center
   :width: 30%
   :alt: An image of the Clipboard menu when items are pinned.

The menu has 2 options. The "Clear selections" option will remove all items
(across all entity types) currently pinned to the clipboard. On the clipboard page,
they won't be cleared until you refresh the browser, giving you an opportunity
to repin them if you've removed them by accident - however, anywhere else in the
application, this **removal will be immediate**. The "Go to clipboard" option
in the menu will take you to the Cliboard page, described in more detail
below.

.. _clipboard-pinning:

Pinning records to the clipboard
================================

Users can add or "pin" an :term:`archival description` to the clipboard for
review or further action from 2 places:

* Any search or browse result page where the desired record appears
* Any :term:`view page` of a record that is a supported entity on the
  clipboard (e.g. the view pages for archival descriptions, authority records,
  and repository records)

You can add as many results as you want to the clipboard at a time - the
Clipboard will paginate if there are more than the global setting for
:ref:`results per page <results-page>`.

When they are not selected, the clip icons are represented in light grey. When
a user hovers over one, its background will turn grey, and a tooltip will
appear. When a result has been selected and pinned to the clipboard by
clicking on the clip icon, it will appear blue to indicate that the item is
now pinned.

**Search / browse pages**

On the :term:`archival description` results stubs that appear in search and
browse pages, a "paper clip" icon (similar to the one used in the
:term:`clipboard menu`) appears in the upper-right corner of the results stub.
Click on this icon to add the result to the Clipboard.

.. image:: images/pin-results.*
   :align: center
   :width: 85%
   :alt: An image of archival description results being pinned to the clipboard

If you are using the "card view", such as when browsing digital objects, the
clipboard link appears on the bottom right of the card:

.. image:: images/pin-results-card.*
   :align: center
   :width: 85%
   :alt: An image of archival description results being pinned to the clipboard

For :term:`archival institution` records, there are also two views - the card
view and the table view. See :ref:`browse-institutions` for more information.
On the table view, the clipboard link appears on the right side of the table:

.. image:: images/pin-repos-table.*
   :align: center
   :width: 85%
   :alt: An image of repository results being pinned to the clipboard

If you are using the "card view", the clipboard link appears on the bottom
right of the card:

.. image:: images/pin-repos-card.*
   :align: center
   :width: 85%
   :alt: An image of repository results being pinned to the clipboard

On :term:`authority record` search and browse pages, the clipboard links
appear on the right side of the results stubs:

.. image:: images/browse-people-orgs.*
   :align: center
   :width: 85%
   :alt: An image of the browse authority records page with clipboard links
         visible

**View pages**

On the :term:`view page` for an :term:`archival description`,
:term:`authority record`, or :term:`archival institution` record, the option to
pin the current record to the clipboard is found in the right-hand
:term:`context menu`, under a "Clipboard" heading. When the item has not yet
been pinned to the clipboard, the :ref:`text link <recurring-text-links>` in
the sidebar will read "Add". Click the link to add the current description to
the clipboard. Once selected, the link, now outlined in blue to indicate the
item is pinned, will read "Remove" - click the link again to remove the item
from the clipboard.

.. image:: images/pin-viewpage.*
   :align: center
   :width: 60%
   :alt: An image of various clip icon states on an archival view page

.. _clipboard-page:

Using the clipboard page
========================

When you've selected the records that you want, you can navigate to the
Clipboard using the "Go to clipboard" link in the :ref:`clipboard-menu`, found
in the AtoM :term:`header bar` at the top of the page.

On load, you'll see results stubs for the descriptions you've pinned. If there
are more than 10 results, a pager will appear.

.. TIP::

   10 results per page is the default global setting in AtoM, but an
   :term:`administrator` can change this value via |gears| **Admin >
   Settings**. For more information, see: :ref:`results-page`.

The Clipboard page will only display one :term:`entity` type at a time - by
default when first arriving on the page, :term:`archival description` results
will be displayed. You can switch to view other entity types using the Entity
type :term:`drop-down menu` at the top of the results:

.. image:: images/clipboard-switch-entity.*
   :align: center
   :width: 85%
   :alt: An image of the entity type drop-down menu on the clipboard page

When a new entity is selected, AtoM will reload the page and display the
clipped items for that entity. For example, here is the view page for
authority records pinned to the clipboard:

.. image:: images/clipboard-actors.*
   :width: 85%
   :alt: An image of the entity type drop-down menu on the clipboard page

A count of the results attached to the clipboard for the current entity will
appear at the top of the page (**tip:** remember you can always see the
global count, and a breakdown of each entity, in the :term:`clipboard menu`
drop-down). Below this, and above the Clipboard results, are several action
links - A print preview button on the far left, A :ref:`recurring-sort-button`
on the far right, and the Entity type drop-down menu.

.. image:: images/clipboard-2.*
   :align: center
   :width: 85%
   :alt: An image of the clipboard, with the link options highlighted

At the bottom of the page, in the :term:`button block` there is an option to
clear results. This button behaves differently than the option in the |clip|
:term:`clipboard menu` - it will **only** clear results for the current entity
(e.g. archival description, authority record, or repository record), leaving
other entity records pinned to the clipboard.

Authenticated (i.e. logged in) users will also see an Export button in the
button block - for more information on exporting from the clipboard, see:
:ref:`csv-export-clipboard`.

Print preview
-------------

Clicking this option will display a printer-optimized version of the page,
with all buttons removed. Note that you will still need to use your browser's
built-in print options for actual printing.

.. image:: images/clipboard-print.*
   :align: center
   :width: 70%
   :alt: An image of a Clipboard print preview

Sort button
-----------

This button will allow you to sort your pinned results a number of different
ways. For more information, see: :ref:`recurring-sort-button`.

Export CSV
----------

Authenticated users (e.g. those logged in) can generate a CSV export of their
clipboard results. When ready, the CSV is made available on the
:ref:`Jobs <manage-jobs>` page. For more information, see:
:ref:`csv-export-clipboard`.

Pinning and unpinning results on the clipboard
----------------------------------------------

Elsewhere in AtoM, when you unpin a result you have previously pinned to the
Clipboard, it will be immediately removed. However, on the Clipboard page, an
extra step is included, to allow you to better review your changes to the
Clipboard results. When a result is unpinned, AtoM will provide you with a
warning at the top of the page, but the result will stay visible until the
page reloads, in case you removed it by accident:

.. image:: images/clipboard-warning.*
   :align: center
   :width: 85%
   :alt: An image of the clipboard, with a removal warning at the top

The warning reads:

*Note: clipboard items unclipped in this page will be removed from the
clipboard when the page is refreshed. You can re-select them now, or reload
the page to remove them completely. Using the sort or print preview buttons
will also cause a page reload - so anything currently deselected will be lost!*

You can re-add results at this point, by clicking on the paperclip icon next
to the result again if desired. If you use any of the options on the page
(Print preview, Export, or change the sort order with the sort button),
the page will reload - so your unpinned results will be lost. If you manually
refresh your browser, this will also cause results unpinned on the Clipboard
page to be permanently removed. To re-add lost results after a reload, you
will have to return to either the relevant record's :term:`view page`, or
find it again via :ref:`search-atom` or :ref:`browse` and re-add it to the
clipboard.

To remove all results at once, you can either use the "Clear selections"
option found in the |clip| Clipboard menu in the AtoM :term:`header bar` (see
above, :ref:`clipboard-menu`), or you can use the "Clear" button found in
the :term:`button block` located at the bottom of the Clipboard page.

.. IMPORTANT::

   Remember, the Clear option in the |clip| Clipboard menu will remove **all**
   results from all entity types at once, without warning. The Clear button on
   the bottom of the Clipboard page will only remove the current :term:`entity`
   type - so if you clear archival descriptions, your authority records and
   institution records will still be pinned.

.. image:: images/button-block-clipboard.*
   :align: center
   :width: 85%
   :alt: An image of the button block found on the Clipboard page

You will still be provided with the warning when using these options on the
Clipboard page - but be aware: using the "Clear selections" option in the
Clipboard menu when elsewhere in the application will **immediately** remove
all results!

:ref:`Back to top <clipboard>`
