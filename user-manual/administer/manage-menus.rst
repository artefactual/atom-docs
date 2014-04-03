.. _manage-menus:

============
Manage Menus
============

AtoM includes a menu customization feature that allows authenticated (i.e.
logged-in) :term:`administrators <administrator>` to manage menu labels; menus
can be edited, created, moved menus to different positions on the page, deleted
as necessary.

In AtoM, "menus" and "menu labels" refer to ...

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

To view a list of menus, click the |gears| :ref:`Admin <main-menu-admin>` menu
in the :term:`main menu` located in the :term:`header bar` and select "Menus"
from the :term:`drop-down menu`.

.. image:: images/site-menu-list.*
   :align: center
   :width: 70%
   :alt: An image of menus list in AtoM

Below, you will find instructions on how to:

* :ref:`Add a new menu <add-menu>`
* :ref:`Edit an existing menu <edit-menu>`
* :ref:`Move a menu <move-menu>`
* :ref:`Delete a menu <delete-menu>`

.. _add-menu:

Add a new menu
==============

An authenticated (i.e. logged in) :term:`administrator` with edit privileges can
edit or update a menu type at any time. Users may add new menus to link to items
such as new static pages or external URLs. Users could also add menus to link to
new actions or modules (such as new edit templates), but such actions or modules
would need to be created first by developers working directly with the code.

For more information on edit privileges and user roles see: :ref:`User roles
<user-roles>`. For information on logging in, see: :ref:`Log in <log-in>`.

**To add a menu in AtoM:**

1. Navigate to the menu list: click on the |gears| :ref:`Admin
   <main-menu-admin>` menu in the :term:`main menu` located in the
   :term:`header bar` and select "Menus" from the :term:`drop-down menu`.
   AtoM will direct you to the "Site menu list" :term:`view page`.
2. Scroll to the bottom of thepage and click on the :term:`Add new button` in
   the :term:`button block`.
3. AtoM takes you to a blank :term:`edit page` for data entry. On loading, the
   :term:`edit page` displays all the :term:`information areas
   <information area>`.
4. Enter data in the blank :term:`field <field>` located below the information
   area headings.

* In the "Name" :term:`field`, enter a name for the menu.
* In the "Label" :term:`field`, enter a label (this does not need to be
  the same as the "Name").
* In the "Parent" :term:`field`, select a parent menu from the
  :term:`drop-down menu`.
* In the "Path" :term:`field`, enter the URL for the menu.
* In the "Description" :term:`field`, enter descriptive information about
  the menu if desired.

5. You can quit the creation process at any time by clicking the "Cancel"
   button in the :term:`button block`; any data already entered will not be
   saved, and no new menu will be created. Note that simply navigating away
   from the page by any other means, **without first clicking "Create"** will
   also result in no new record being created.
6. To save the new menu, click the "Save" button in the :term:`button block`.
7. AtoM will redirect you to the main page. The new menu should be visible and
   should link to your static page or external URL.

:ref:`Back to top <manage-menus>`

.. _edit-menu:

Edit an existing menu
=====================

To edit an existing menu in AtoM:

1. Navigate to the menu list: click on the |gears| :ref:`Admin
   <main-menu-admin>` menu in the :term:`main menu` located in the
   :term:`header bar` and select "Menus" from the :term:`drop-down menu`.
   AtoM will direct you to the "Site menu list" :term:`view page`.
2. Click on the blue menu name you wish to edit to be directed to that menu's
   :term:`edit page`.
3. On loading, the :term:`edit page` displays the menu name with all
   :term:`information areas <information area>` and editable :term:`fields
   <field>` grouped under them.
4. Add or edit data as required.
5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no changes being saved to the
   menu type.
6. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record. You will be redirected to the main page.

:ref:`Back to top <manage-menus>`

.. _move-menu:

Move an existing menu
=====================

There are two ways to move an existing menu in AtoM. Start by navigating to the
menu list page. You can do this by clicking on the |gears| :ref:`Admin
<main-menu-admin>` menu in the :term:`main menu` located in the
:term:`header bar` and select "Menus" from the :term:`drop-down menu`.
AtoM will direct you to the "Site menu list" :term:`view page`.

From here you can either:

1. Click on the up or down arrow located to the left of each menu link;

   **or**

2. Click on the blue menu name you wish to edit to be directed to that menu's
   :term:`edit page` where you can change the "Parent" :term:`field` to select a
   new parent menu. For example, if you wish to make the "Archival
   institution" menu a sub-menu of the admin menu in the main menu, select
   "Admin" from the :term:`drop-down menu`.

:ref:`Back to top <manage-menus>`

.. _delete-menu:

Delete an existing menu
=======================

To delete an existing menu:

1. Navigate to the menu list by clicking on the |gears| :ref:`Admin
   <main-menu-admin>` menu in the :term:`main menu` located in the
   :term:`header bar` and selecting "Menus" from the :term:`drop-down menu`.
   AtoM will direct you to the "Site menu list" :term:`view page`.
2. Click on the blue menu name you wish to delete to be directed to that menu's
   :term:`edit page`.
3. Scroll to the bottom of the :term:`edit page` and click the :term:`delete
   button` in the :term:`button block`.
4. AtoM will provide a warning and prompts you to confirm that you really wish
   to delete the institution. To delete the record, click the :term:`delete
   button`.
5. AtoM will delete the record and opens the menu list page.

.. NOTE::

   This action cannot be undone. However, the menu can be restored as a new
   menu. For more information, see :ref:`add a new menu <add-menu>`.

:ref:`Back to top <manage-menus>`
