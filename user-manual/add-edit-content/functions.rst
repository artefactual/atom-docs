.. _functions:

=========
Functions
=========

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

.. |pencil| image:: images/pencil.png
   :height: 17
   :width: 17

A function is a type of :ref:`entity <entity-types>` that describes activities
linked to records creation, maintenance, and use. The International Council on
Archives (`ICA <http://www.ica.org/>`__) defines a function as:

    *Any high level purpose, responsibility or task assigned to the
    accountability agenda of a corporate body by legislation, policy or
    mandate. Functions may be decomposed into sets of co-ordinated operations
    such as subfunctions, business processes, activities, tasks or
    transactions.*

.. figure:: images/functions-ERD.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: Function, Corporate bodies, and records relationships as depicted in
         the ISDF standard

   From the ISDF, Appendix A: "Representation of the relationships of
   functions with corporate bodies and archival resources"

Associated predominantly with :term:`corporate bodies <corporate body>`,
functions may be generally understood as the activities of an organization (or
individual, in some cases) performed to accomplish some mandate or mission.
Traditional attempts to track the provenance of records created by corporate
bodies became stymied by the constantly-changing nature of bureaucratic
organizations - a department, for example, may have its name changed many
times throughout its existence; it may assume broader responsibilities over
time, be merged with other departments, or eventually decommissioned; equally,
it may fall under the jurisdiction of many different divisions or other
higher-level organizational units throughout its existence. To ensure more
accurate records management over time, many organizations have applied a
system of functional classification, which is based on the analysis of functions
and activities of an organization, and the transactions which constitute these
activities.

In 2007, recognizing the value that this approach could have for
archivists, the ICA released its first draft of the *International Standard
for Describing Functions*. In the overview to the standard, they point out the
value that the description of functions can have, noting that it can play a
"vital role" in explaining the provenance of records by "placing them more
securely in the context of their creation and use." Understanding how and why
records were created, what purpose or function they were designed to fulfill,
and how they relate to other records created by the same organization can be
essential for properly interpreting archival materials. The ICA notes:

    *Descriptions of functions are intended to complement and supplement
    descriptions of records created in accordance with ISAD(G) and authority
    records created in accordance with ISAAR(CPF). Keeping information on
    functions separate both from descriptions of records and authority records
    means less repetition of information and allows for the construction of
    flexible archival descriptive systems.*

**In AtoM**, :term:`functions <function>` are structured into
:term:`information areas <information area>` based on the International
Council on Archives' *International Standard for Describing Functions*,
First edition, May 2007 (:ref:`ISDF <isdf-template>`).

**Below are instruction for using the Functions module in AtoM to:**

* :ref:`Add a new function <add-function>`
* :ref:`Edit an existing function <edit-function>`
* :ref:`Link a function to an authority record <link-function-authority>`
* :ref:`Link a function to an archival description
  <link-function-description>`
* :ref:`Link a function to another function <link-functions>`
* :ref:`Delete a function <delete-function>`

For information on working with specific fields in AtoM's functions
:term:`edit page`, see:

* International Standard for Describing Functions (:ref:`ISDF
  <isdf-template>`)

.. seealso::

   * :ref:`authority-records`
   * :ref:`archival-descriptions`
   * :ref:`access-content`
   * :ref:`entity-types`
   * :ref:`log-in`
   * :ref:`exit-edit-mode`

.. _add-function:

Add a new function
==================

.. figure:: images/function-example.*
   :align: right
   :figwidth: 40%
   :width: 100%
   :alt: An example of a function in AtoM

   An example of a function record in AtoM

This section contains instructions on how to create a new :term:`function`
record in AtoM. Note that a user must be logged in to AtoM with sufficient
:term:`access privileges <access privilege>` to create new records. For more
information on user permissions, see: :ref:`user-roles` and
:ref:`default-user-permissions`.

There are 3 main ways a new function can be created - doing so via the
|plus| :ref:`"Add" <main-menu-add>` menu is the easiest, but to accommodate
different workflows, functions can be added from the functions browse page,
or from the :term:`view page` of an existing function. Below are instructions
to add a new function:

* :ref:`From the Add menu <add-function-add-menu>`
* :ref:`From the Functions browse page <add-function-browse>`
* :ref:`From another function's view page <add-function-viewpage>`

For information on working with specific fields in AtoM's functions
:term:`edit page`, see: :ref:`ISDF <isdf-template>`.

.. _add-function-add-menu:

Add a new function from the main menu
-------------------------------------

.. image:: images/add-functions.*
   :align: right
   :width: 20%
   :alt: Choosing functions in the Add menu

A new function can be added at any time, from anywhere in the application,
via the :term:`main menu`, provided that a user has sufficient :term:`access
privileges <access privilege>` to create new records. For more information on
user permissions, see: :ref:`user-roles` and :ref:`default-user-permissions`.

**To create a new function from the main menu**

1. In the :term:`main menu` located in the :term:`header bar`, click the
   |plus| :ref:`"Add" <main-menu-add>` menu and select "Function"
   from the :term:`drop-down menu`.
2. AtoM takes you to a blank :term:`edit page` for data entry.
3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.

.. figure:: images/blank-function.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: An image of a blank ISDF record in edit mode

   When creating a new function from the Add menu, all information areas
   will appear closed on the blank function record - click to open and add
   data as required.

4. You can quit the process at any time by clicking the "Cancel" button in the
   :term:`button block`; any data already entered will not be saved and no new
   record will be added. Note that simply navigating away from the page by
   any other means, **without first clicking "Create"** will also result
   in no new record being created.
5. To save the new function record, click the
   :term:`"Create" button <Create button>` in the :term:`button block` at the
   bottom of the record. AtoM will redirect you to the function's :term:`view
   page`, so you can review your work.

.. _add-function-browse:

Add a new function from the Functions browse page
-------------------------------------------------

.. image:: images/browse-functions.*
   :align: right
   :width: 20%
   :alt: Choosing functions in the Browse menu

1. Using the :term:`browse menu` located in the AtoM :term:`header bar`,
   navigate to **Browse > Functions**. AtoM will redirect you to the functions
   browse page. See :ref:`browse-menu` for more information on the Browse
   menu, and :ref:`browse` for more information on browsing in AtoM.
2. At the bottom of the functions browse page, you will see the
   :term:`button block`. Click the :term:`Add new button`.

.. image:: images/addnew-functions.*
   :align: center
   :alt: An image of the "Add new" button in the button block


3. AtoM takes you to a blank :term:`edit page` for data entry.
4. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.
5. You can quit the process at any time by clicking the "Cancel" button in the
   :term:`button block`; any data already entered will not be saved and no new
   record will be added. Note that simply navigating away from the page by
   any other means, **without first clicking "Create"** will also result
   in no new record being created.
6. To save the new function record, click the
   :term:`"Create" button <Create button>` in the :term:`button block` at the
   bottom of the record. AtoM will redirect you to the function's :term:`view
   page`, so you can review your work.


.. _add-function-viewpage:

Add a new function from the view page of an existing function
--------------------------------------------------------------

.. image:: images/addnew2-functions.*
   :align: right
   :width: 40%
   :alt: An image of the "Add new" button in the button block of an existing
         function

1. Navigate to an existing function. You can do so using the :term:`browse
   menu` located in the AtoM :term:`header bar` and navigating to **Browse >
   Functions**. AtoM will redirect you to the functions browse page. Click on
   an existing function to view the function record in :term:`view mode`.
2. At the bottom of the function's :term:`view page`, you will see
   the :term:`button block` with several options (Edit, Delete, and Add new).
   Click the :term:`Add new button`.
3. AtoM takes you to a blank :term:`edit page` for data entry.
4. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.
5. You can quit the process at any time by clicking the "Cancel" button in the
   :term:`button block`; any data already entered will not be saved and no new
   record will be added. Note that simply navigating away from the page by
   any other means, **without first clicking "Create"** will also result
   in no new record being created.
6. To save the new function record, click the
   :term:`"Create" button <Create button>` in the :term:`button block` at the
   bottom of the record. AtoM will redirect you to the function's :term:`view
   page`, so you can review your work.

:ref:`Back to top <functions>`

.. _edit-function:

Edit an existing function
=========================

An :term:`editor` or other users with sufficient :term:`access privileges
<access privilege>` can review and revise existing functions at any time. To
edit an existing function in AtoM:

1. Navigate to the function you want to edit. You can do so using the
   :term:`browse menu` located in the AtoM :term:`header bar` and navigating
   to **Browse > Functions**, and then either selecting the desired function
   from the list, or using the search bar provided on the Functions browse
   page. For more information on searching and browsing in AtoM, see
   :ref:`access-content`.

.. figure:: images/functions-search.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: An image of the dedicated search box available in Browse functions

   The browse functions page includes a sort button (alphabetic or most
   recent) and a dedicated functions search box to help you locate the
   function you wish to edit.

2. When you have located the function you would like to edit, click on it to
   view the function in :term:`view mode`. AtoM will take you to the
   :term:`view page` for the function.
3. Enter :term:`edit mode` either by clicking the "Edit" button located in the
   :term:`button block` at the bottom of the record, or by clicking on one of
   the :term:`area headers <area header>`; this takes you to the function's
   :term:`edit page`.
4. Add and/or revise data as required. See :ref:`ISDF <ISDF-template>` for
   field-specific guidance.
5. You can quit the edit process at any time by clicking the "Cancel" button
   in the :term:`button block`; any data already entered or altered will not be
   saved. Note that simply navigating away from the page by any other
   means, **without first clicking "Save"** will also result in no changes
   record being saved.
6. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record. AtoM will reload the page in
   :term:`view mode` so you can review your changes.

:ref:`Back to top <functions>`

.. _link-function-authority:

Link a function to an authority record
======================================

AtoM can create a linked relationship between a :term:`function` and an
:term:`authority record`. Authority records are collections of information
about actors - corporate bodies, persons, or families - who interact with
archival materials, typically as creators. For more information on working
with authority records in AtoM, see: :ref:`authority-records`. Below are
the steps to create a relationship between an existing authority record
and an existing function:

1. Navigate to the :term:`function` you would like to relate to an
   :term:`authority record`. You can do this by going to the Browse page for
   functions (**Browse > Functions**) and then either browsing through the
   list, or using the dedicated Functions search bar on the Browse functions
   page to find the related function. Click on the related function to
   navigate to its :term:`view page`. For more information on browsing and
   searching in AtoM, see: :doc:`Browse <../access-content/browse>` or
   :doc:`Search <../access-content/search-atom>`.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.
3. In the "Relationships" :term:`information area` of the function's
   :term:`edit page`, click the "Add new" button under "Related authority
   records".

.. figure:: images/relatedAuthority.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: An image of the Related authority records table in the Relationships
         Area

   An example of a related authority record, as seen in the Relationships
   Area when in edit mode. Click "Add new" to create a new relationship.

4. AtoM will open a pop-up dialog where you can select the related
   :term:`authority record` and define the nature and time frame of the
   relationship.

.. image:: images/relatedAuthority-popup.*
   :align: center
   :width: 40%
   :alt: The Related authority record pop-up dialog

5. The first :term:`field` in the pop-up dialog, "Title of the related
   resource," is an `auto-complete <https://en.wikipedia.org/wiki /Auto-
   complete>`__ field: as you type, matching results will load in a
   :term:`drop-down menu` below the field. When you see the
   :term:`authority record` you would like to link, click on it to select
   it.

.. NOTE::

   You cannot create a new authority record from this dialog by entering a
   new name. If the related authority record does not exist yet, follow the
   steps to :ref:`create a new authority record <create-authority-record>` and
   then follow these steps from the beginning to create the relationship.

6. Add additional details in the subsequent fields to qualify the
   relationship. When you are finished, click "Submit".
7. The related :term:`authority record` will now appear in the *Related
   authority records* table of the Relationships area. Click the |pencil|
   pencil icon to re-open the pop-up dialog and edit the relationship, or
   click the **X** icon to remove the relationship link. You can also repeat
   this process to add multiple links by clicking the "Add new" button below
   the *Related authority records* again - AtoM will open a new pop-up dialog.
   Repeat steps 3-6 as needed.
8. When you are finished, click "Save" in the :term:`button block` at the
   bottom of the function's :term:`edit page` to save your changes and exit
   :term:`edit mode`.
9. AtoM will reload the :term:`function` in :term:`view mode`. The
   relationship is expressed in the "Relationships" :term:`information area`
   of the function's :term:`view page`, and the related record's name will
   appear as a hyperlink. If you follow the hyperlink, you will see that the
   related function now appears in the "Relationships" area of the linked
   authority record.

:ref:`Back to top <functions>`

.. _link-function-description:

Link a function to an archival description
==========================================

AtoM can also create a linked relationship between a :term:`function` and an
:term:`archival description`. An archival description is a body of information
about an archival record, or an aggregate of records, which provides
contextual information about the archival materials and are generally
arranged into hierarchical levels (such as fonds, series, files, and items,
and variations of these in accordance with national and international
standards). For more information on working with archival descriptions in AtoM,
see: :ref:`archival-descriptions`. Below are the steps to create a relationship
between an existing archival description and an existing function:

1. Navigate to the :term:`function` you would like to relate to an
   :term:`archival description`. You can do this by going to the Browse page for
   functions (**Browse > Functions**) and then either browsing through the
   list, or using the dedicated Functions search bar on the Browse functions
   page to find the related function. Click on the related function to
   navigate to its :term:`view page`. For more information on browsing and
   searching in AtoM, see: :doc:`Browse <../access-content/browse>` or
   :doc:`Search <../access-content/search-atom>`.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the record's
   :term:`edit page`.
3. In the "Relationships" :term:`information area` of the function's
   :term:`edit page`, click the "Add new" button under "Related resources".

.. figure:: images/relatedResources.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: An image of the Related resources table in the Relationships
         Area

   An example of a related archival description, as seen in the Relationships
   Area when in edit mode. Click "Add new" to create a new relationship.

4. AtoM will open a pop-up dialog where you can select the related
   :term:`archival description` and define the nature and time frame of the
   relationship.
5. The first :term:`field` in the pop-up dialog, "Title of the related
   resource," is an `auto-complete <https://en.wikipedia.org/wiki /Auto-
   complete>`__ field: as you type, matching results will load in a
   :term:`drop-down menu` below the field. When you see the
   :term:`archival description` you would like to link, click on it to select
   it. .

.. NOTE::

   You cannot create a new archival description from this dialog by entering a
   new name. If the related description does not exist yet, follow the
   steps to :ref:`create a new archival description <add-archival-description>`
   and then follow these steps from the beginning to create the relationship.

6. Add additional details in the subsequent fields to qualify the
   relationship. When you are finished, click "Submit".

.. figure:: images/relatedResources-popup.*
   :align: center
   :figwidth: 40%
   :width: 100%
   :alt: An image of the Related resources popup dialog

   Click "submit" in the popup dialog when you are finished entering
   information about the relationship between the function and the
   description

7. The related :term:`archival description` will now appear in the *Related
   resources* table of the Relationships area. Click the |pencil| pencil icon
   to re-open the pop-up dialog and edit the relationship, or click the **X**
   icon to remove the relationship link. You can also repeat this process to
   add multiple links by clicking the "Add new" button below the *Related
   resources* again - AtoM will open a new pop-up dialog. Repeat steps
   3-6 as needed.
8. When you are finished, click "Save" in the :term:`button block` at the
   bottom of the function's :term:`edit page` to save your changes and exit
   :term:`edit mode`.
9. AtoM will reload the :term:`function` in :term:`view mode`. The relationship
   is expressed in the "Relationships" :term:`information area` of the
   function's :term:`view page`, and the related record's name will appear as a
   hyperlink.

.. IMPORTANT::

   At this time, a function linked to an :term:`archival description` is NOT
   viewable from the related archival description. To see the relationship
   expressed between the two, you will have to be viewing the function
   record. The related archival description's :term:`view page` is unchanged.


:ref:`Back to top <functions>`

.. _link-functions:

Link a function to another function
===================================

AtoM also has the ability to create relationships between functions. This can
be useful for creating complex associative and/or hierarchical relationships
between functions, sub-functions, business processes, activities, tasks, and
related functions, etc. Relationships can be defined as hierarchical,
associative, or temporal, with a free-text field to better define the context
of the relationship provided. All data added about the relationship will
appear in the Relationships :term:`information area` of both records. To
create a relationship between two functions:

1. Navigate to one of the :term:`functions <function>` you would like to relate
   to each other (either one). You can do this by going to the Browse page for
   functions (**Browse > Functions**) and then either browsing through the
   list, or using the dedicated Functions search bar on the Browse functions
   page to find the related function. Click on the function to navigate to its
   :term:`view page`. For more information on browsing and searching in AtoM,
   see: :doc:`Browse <../access-content/browse>` or
   :doc:`Search <../access-content/search-atom>`.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit"
   button in the :term:`button block`, or by clicking on one of the
   :term:`information area` headings; this takes you to the function record's
   :term:`edit page`.
3. In the "Relationships" :term:`information area` of the function's
   :term:`edit page`, click the "Add new" button under "Related functions".

.. figure:: images/relatedFunctions.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: An image of the Related functions table in the Relationships
         Area

   The related functions table in the Relationships area. Click "Add new" to
   link two functions.

4. AtoM will open a pop-up dialog where you can select the related
   :term:`function` and define the nature and time frame of the
   relationship.
5. The first :term:`field` in the pop-up dialog, "Authorized form of name," is
   an `auto-complete <https://en.wikipedia.org/wiki/Auto-complete>`__ field:
   as you type, matching results will load in a :term:`drop-down menu` below
   the field. When you see the :term:`function` you would like to link, click
   on it to select it.

.. figure:: images/relatedFunctions-popup.*
   :align: center
   :figwidth: 40%
   :width: 100%
   :alt: An image of the Related functions pop-up

   An image of the Related functions pop-up dialog. In this image, a user has
   started typing in the autocomplete field - matching results appear below.

.. NOTE::

   You cannot create a new function from this dialog by entering a
   new name. If the related function does not exist yet, follow the
   steps above to :ref:`create a new function <add-function>` and then follow
   these steps from the beginning to create the relationship.

6. Add additional details in the subsequent fields to qualify the
   relationship. When you are finished, click "Submit".
7. The related :term:`function` will now appear in the *Related
   functions* table of the Relationships area. Click the |pencil| pencil icon
   to re-open the pop-up dialog and edit the relationship, or click the **X**
   icon to remove the relationship link. You can also repeat this process to
   add multiple links by clicking the "Add new" button below the *Related
   functions* again - AtoM will open a new pop-up dialog. Repeat steps
   3-6 as needed.
8. When you are finished, click "Save" in the :term:`button block` at the
   bottom of the function's :term:`edit page` to save your changes and exit
   :term:`edit mode`.
9. AtoM will reload the :term:`function` in :term:`view mode`. The relationship
   is expressed in the "Relationships" :term:`information area` of the function's
   :term:`view page`, and the related function's name will appear as a
   hyperlink. If you follow the hyperlink (by clicking on it), you will see
   that the related function now appears in the "Relationships" area of the
   linked function, with contextual details.

:ref:`Back to top <functions>`

.. _delete-function:

Delete a function
=================

A function can be deleted at any time, via the :term:`main menu`, provided
that a user has sufficient :term:`access privileges <access privilege>` to
delete records. For more information on user permissions, see:
:ref:`user-roles` and :ref:`default-user-permissions`.

**To delete a function permanently in AtoM:**

1. Navigate to the :term:`function` you would like to delete. You can do this
   by going to the Browse page for functions (**Browse > Functions**) and then
   either browsing through the list, or using the dedicated Functions search
   bar on the Browse functions page to find the related function. Click on the
   function to navigate to its :term:`view page`. For more information on
   browsing and searching in AtoM, see: :doc:`Browse <../access-content/browse>`
   or :doc:`Search <../access-content/search-atom>`.
2. At the bottom of the page, click the :term:`Delete button` located in the
   :term:`button block`.
3. AtoM will provide a warning, and prompt you to confirm the delete request.
   If you wish to abort the delete process, click "Cancel" - AtoM will return
   you to the function :term:`view page`. If you are sure you would like to
   permanently delete the function, click "Delete" - AtoM will remove the
   function, and redirect you to the Functions browse page.

.. image:: images/deleteWarning.*
   :align: center
   :width: 60%
   :alt: An image example of a delete warning for a function in AtoM

.. IMPORTANT::

   **Consequenses of deleting a function:** The :term:`function` will be
   deleted permanently, and will also be removed from any related functions,
   :term:`archival descriptions <archival description>`, and :term:`authority
   records <authority record>`. (The related entities will not be deleted
   however).

:ref:`Back to top <functions>`
