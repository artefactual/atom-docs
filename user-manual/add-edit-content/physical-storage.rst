.. _physical-storage:

================
Physical storage
================

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18
.. |pencil| image:: images/edit-sign.png
   :height: 18
   :width: 18
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM allows archival institutions to create relationships between
:term:`archival descriptions <archival description>` and
:term:`accession records <accession record>` and their associated physical
storage containers and locations. Details on how to create, manage, link, and 
delete physical storage containers are included below. 

**Jump to**:

* :ref:`manage-storage-types`
* :ref:`link-physical-storage`
* :ref:`browse-physical-storage`
* :ref:`physical-storage-visibility`

.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`csv-import-storage-cli`
   * :ref:`create-physical-storage-report`
   * :ref:`cli-normalize-physical-object` (command-line tasks)

.. _manage-storage-types:

Manage physical storage types
=============================

Institutions can change and manage the terms used to describe physical object
containers and locations by using the Physical Object Type :term:`taxonomy`:

Click on the |pencil| :ref:`Manage <main-menu-manage>` menu, then on
Taxonomies. From the list, click on Physical Object Type.

.. image:: images/physical-object-taxonomy.*
   :align: center
   :width: 80%
   :alt: Physical Object Type taxonomy

By clicking on an object type, you can view the object type in the taxonomy,
displaying hierarchical terms if applicable.

.. image:: images/physical-object-hierarchy.*
   :align: center
   :width: 80%
   :alt: Physical object taxonomy showing hierarchy

The default hierarchy in the Physical Object type :term:`taxonomy` in AtoM is as
follows:

.. image:: images/object-type-terms.*
   :align: center
   :height: 380px
   :alt: Physical object taxonomy showing hierarchy

The intended use is for "Containers" to include specific storage containers,
such as box numbers, cabinet drawers, etc., and for "Locations" to include
more general storage locations, such as "Cold storage," "Vault," etc.
Storage types and uses can be customized to meet institutional
practices, however in order to :ref:`link <link-physical-storage>` a custom
storage container to a new or existing :term:`archival description` you must
nest the storage container under "Container."

For more information on working with terms and taxonomies in AtoM, see:
:ref:`terms`.

.. _manage-storage-edit-types:

Edit storage types
------------------

All storage :term:`terms <term>` except "Artefact", "Container" and "Location"
can be edited or deleted by authenticated users (for more information
about locked terms, see :ref:`Terms <terms>`).

Click on the name of a Physical Object Type, then click on edit:

.. image:: images/physical-object-edit.*
   :align: center
   :width: 80%
   :alt: Editing a physical object type

From here, the name of the physical object type can be changed, and internal
notes, codes and uses can be added.

By clicking on the Relationships area, the term's placement in the hierarchy
can be altered and new narrow terms can be added:

.. image:: images/physical-object-relationships.*
   :align: center
   :width: 80%
   :alt: Editing a physical object type's relationships

Click on save to save your changes.

.. _manage-storage-add-types:

Add storage types
-----------------

New physical storage types can be created by clicking "Add new" in the
:term:`button block` located on the Physical Object Type taxonomy
:term:`view page`:

.. image:: images/physical-object-add-new.*
   :align: center
   :width: 80%
   :alt: Add new physical object type

Another method of adding a new storage type is to click "Add new" when
viewing an existing Physical Object type. This will automatically nest the
new term as a :term:`child <child record>` of the existing term.

.. note::

   This is the method to use if you wish to add a storage container to link to
   :term:`archival descriptions <archival description>`. Find "Container," and
   click "Add new."

.. image:: images/physical-object-add-child.*
   :align: center
   :width: 80%
   :alt: Add new physical object type as a child

.. _link-physical-storage:

Link physical storage
=====================

Linking :term:`archival descriptions <archival description>` and/or 
:term:`accession records <accession record>` to physical storage locations is 
performed from the :term:`view page` of the related record. For archival 
descriptions, physical storage containers can be linked at any 
:term:`level of description`.

It's possible to add multiple physical storage links to a single description or
accession - similarly, a single storage container might be linked to multiple 
descriptions or accessions. While linking physical storage to a target record, 
you can create new storage containers on the fly as well as link to existing
storage containers from the same screen. The instructions below will outline 
these options separately, but they can be performed as one single user edit if 
desired. 

**Jump to**:

* :ref:`link-storage-change-remove`
* :ref:`link-storage-add-new`

.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`accession-records`
   * :ref:`create-physical-storage-report`
   * :ref:`csv-import-storage-cli`

.. _link-storage-change-remove:

Add, change, or remove container links
--------------------------------------

.. NOTE:: 

   The following screenshots will use archival descriptions as an example, but 
   the process is the same for accession records. 

1. Navigate to the :term:`view page` of the record to which you would like to
   link a physical storage container. Scroll to the bottom of the view page
   and click on the "More" button in the :term:`button block`, and then select
   "Link physical storage":

.. image:: images/physical-storage-link.*
   :align: center
   :width: 80%
   :alt: Linking an archival description to physical storage

2. AtoM will redirect you to the Link physical storage :term:`edit page`. If a 
   link to a physical storage container or location already exists, it can be 
   edited by clicking the pencil icon, or deleted by clicking the **X**.

.. image:: images/physical-storage-edit.*
   :align: center
   :width: 80%
   :alt: Editing or adding a physical storage link

.. IMPORTANT::

   This edits the information associated with the Physical storage container
   and location. If you change this information the change will apply across
   all records associated with the container.

.. image:: images/physical-storage-edit-2.*
   :align: center
   :width: 80%
   :alt: Editing a physical storage container

3. To create a link with a different existing storage container, begin to type
   the container name in the Container field. AtoM will auto-suggest existing
   containers as you type. When you see the target container, click on it in
   the autocomplete :term:`drop-down menu` to select it.

4. You can repeat this process as needed to add multiple containers. When you
   are finished, click the Save button in the :term:`button block` at the
   bottom of the :term:`edit page` to save your work. After saving, AtoM will
   redirect you to the :term:`view page` of the related record. You will see
   the linked physical storage container(s) listed in the right-hand
   :term:`context menu`.

.. image:: images/physical-storage-context-menu.*
   :align: center
   :width: 30%
   :alt: An example of a physical storage container shown in the context menu

.. _link-storage-add-new:

Create a new container on the fly
---------------------------------

To link an :term:`archival description` or :term:`accession record` with a new 
container that does not yet exist in AtoM, follow step 1 in the instructions 
:ref:`above <link-storage-change-remove>` - that is, start from the 
:term:`view page` of the target record; click the "More" button; and select
"Link physical storage." AtoM will redirect you to the Link physical storage 
:term:`edit page`, where we can create new physical storage containers on the 
fly, as well as edit and/or remove existing container links. To create a new
physical storage container on the fly to link to your record:

1. Scroll to the bottom half of the :term:`edit page`, with the 
   :term:`area header` of "Or, create a new container." In the edit fields of 
   this section, enter a container name and location, and select a container 
   type from the :term:`drop-down menu` in the Type field. 

.. image:: images/physical-storage-new.*
   :align: center
   :width: 80%
   :alt: Creating a new container

.. NOTE::

   The "Type" :term:`drop-down menu` is associated with the 
   "Physical Object Type" :term:`taxonomy`. Users with sufficient access 
   :term:`permissions <access privilege>` can modify, delete, and add new
   storage container types via |pencil| **Manage > Taxonomies**, but you 
   cannot create new types on the fly via this drop-down menu. 

   For more information, see:

   * :ref:`manage-storage-types`
   * :ref:`terms`

2. When you are done adding your new container, click the "Save" button found
   in the :term:`button block` at the bottom of the :term:`edit page`. AtoM
   will redirect you to the related record's :term:`view page`, and you should
   see your new linked physical storage container listed in the right-hand
   :term:`context menu`.

.. image:: images/physical-storage-context-menu.*
   :align: center
   :width: 30%
   :alt: An example of a physical storage container shown in the context menu

.. TIP:: 
   
   New physical storage containers can also be created from the Browse physical 
   storage area, by navigating to |pencil| **Manage > Physical storage**, 
   and clicking the "Add new" button in the :term:`button block` at the bottom 
   of the page. 

:ref:`Back to top <physical-storage>`

.. _browse-physical-storage:

Browse and manage physical storage
==================================

Physical storage can be browsed by authenticated (logged in) users with 
sufficient access :term:`permissions <access privilege>` through
the |pencil| :ref:`Manage <main-menu-manage>` menu:

.. image:: images/manage-phys-storage.*
   :align: center
   :width: 30%
   :alt: Accessing physical storage in Manage menu

Once in Browse Physical storage, users have the option of sorting the storage
entries by Name (of container) or Location by clicking in the first row of the
Physical storage table:

.. image:: images/physical-storage-table.*
   :align: center
   :width: 100%
   :alt: Physical storage table with sorting

From here, you can now:

* :ref:`Add a new container <manage-storage-new-container>`
* :ref:`View and edit existing storage containers <manage-storage-edit-container>`
* :ref:`Generate a storage report <generate-storage-report>`

.. _manage-storage-new-container:

Add a new container from the physical storage module
----------------------------------------------------

From the Browse physical storage page, you can add new physical storage 
containers by clicking the "Add new" button in the :term:`button block` at the 
bottom of the page. 

Once clicked, AtoM will redirect you to an :term:`edit page` where you can add
more information about your new storage container. 

.. image:: images/physical-storage-new-from-browse.*
   :align: center
   :width: 80%
   :alt: An empty physical storage container edit page

The "Name" and "Location" edit fields are free-text - enter a unique name for 
your storage container (to better be able to distinguish it when browsing, and 
when using the autocomplete fields to 
:ref:`link related records <link-physical-storage>` to the container), and a 
meaningful location that will help you retrieve the container. 

The "Type" field is a :term:`drop-down menu` associated with the "Physical 
Object Type" :term:`taxonomy`. You can select an existing value from the 
drop-down menu, but you can't add new values on this screen. 

.. TIP:: 

   Users with sufficient access :term:`permissions <access privilege>` can 
   modify, delete, and add new storage container types via |pencil| 
   **Manage > Taxonomies**. For more information, see:

   * :ref:`manage-storage-types`
   * :ref:`terms`

When you are happy with your edits, click the "Save" button in the 
:term:`button block` at the bottom of the edit page. AtoM will save the changes
and display the :term:`view page` for the new physical storage container. You
can click the "Edit" button on the view page to re-enter edit mode and make 
further changes, or the "Delete" button to delete it. 

To return to the Physical storage browse page, use the |pencil| 
:ref:`Manage <main-menu-manage>` menu in the AtoM :term:`header bar`, and 
select "Physical storage."

.. _manage-storage-edit-container:

View and edit existing storage containers
-----------------------------------------

Starting from the Browse physical storage page, when a user clicks on a
container name in the browse results, AtoM will redirect the user to the
:term:`view page` of the selected container, and display a list of the
resources associated with the selected storage container:

.. image:: images/view-storage-name.*
   :align: center
   :width: 80%
   :alt: Viewing a storage name with related resources listed

Clicking one of the blue hyperlinks listed under the Related resources will 
redirect you to the :term:`view page` for the related record. 

Alternatively, by clicking the :term:`print icon` next to the container name, 
you can generate a simple HTML report (formatted for printing) for the storage
container that includes the Reference code, Title, Dates, Part of (fonds or
collection name) and Conditions governing access of any related 
:term:`archival descriptions <archival description>`.

.. image:: images/storage-print-report.*
   :align: center
   :width: 80%
   :alt: Storage print report

.. NOTE:: 

   At this time, the container report does not include related 
   :term:`accession records <accession record>` linked to the physical storage
   container - though these will be displayed on the :term:`view page` of the 
   container. 

   See also: :ref:`storage-report-manage`

Click "close" to return to the container storage view page.

Finally, the :term:`button block` at the bottom of the storage container's 
:term:`view page` contains two buttons - Edit and Delete. 

Clicking the :term:`Edit button` will redirect you to the :term:`edit page` for 
the current physical storage container, where you can edit the information 
associated with the container, including the container name, location and type. 

.. image:: images/physical-storage-edit-2.*
   :align: center
   :width: 80%
   :alt: Editing a physical storage container

.. NOTE::

   You cannot edit the related records linked to the physical storage container 
   from this screen. To change the records associated with the container, you 
   must do so from the related :term:`archival description` or 
   :term:`accession record` for each resource. For more information, see above: 
   :ref:`link-storage-change-remove`.

   In the edit page of the container, the "Type" :term:`drop-down menu` is 
   associated with the "Physical Object Type" :term:`taxonomy`. You can choose 
   different a taxonomy :term:`term` in this edit page, but you cannot add new 
   container types here. Users with sufficient access 
   :term:`permissions <access privilege>` can modify, delete, and add new
   storage container types via |pencil| **Manage > Taxonomies**. For more 
   information, see:

   * :ref:`manage-storage-types`
   * :ref:`terms`

When you're done making your changes, click the Save button in the 
:term:`button block` at the bottom of the container's :term:`edit page`. AtoM
will save your changes and redirect you to the :term:`view page` for the current
container, so you can review your work. You can repeat this process as needed
until you are satisfied with your changes. 

The container's view page also includes a Delete button, which can be used to
permanently delete the physical storage container. When clicked, AtoM will
first present you with a confirmation page, including a list of related
records from which the linked storage information will be removed when the 
container is deleted: 

.. image:: images/physical-storage-delete.*
   :align: center
   :width: 80%
   :alt: Physical storage deletion confirmation page example 

Click Delete again to confirm the operation, or Cancel to return to the 
:term:`view page` for the physical storage container. 

.. IMPORTANT:: 
   
   Once you click Delete on the confirmation page, the physical storage container
   will be permanently deleted! 

   Related records will **not** be deleted by this operation, but the related
   storage information for this container will be removed from any linked 
   :term:`archival description` or :term:`accession record` once the container
   is deleted. 

Once you have made all your edits or deletions, you can return to the Physical 
storage browse page using the |pencil| :ref:`Manage <main-menu-manage>` menu in 
the AtoM :term:`header bar`, and select "Physical storage."

.. _generate-storage-report:

Generate a physical storage report
----------------------------------

AtoM includes a global physical storage report that can be generated via the 
:term:`user interface` from the :term:`Physical storage` module and downloaded
as a CSV file from the :ref:`Jobs <manage-jobs>` page. This report is focused
on container relations (i.e. physical storage containers linked to other 
:term:`entity` types in AtoM, such as 
:term:`archival description <archival description>` and 
:term:`accession records <accession record>`), and can also be used to identify
unlinked containers. Export options on the report generation page allow users to 
choose which of these criteria should be included when creating the report.

For more information and detailed instructions, see: 

* :ref:`global-storage-report`

.. SEEALSO::

   * :ref:`storage-report-view`
   * :ref:`storage-report-manage`
   * :ref:`box-label-report`

:ref:`Back to top <physical-storage>`

.. _physical-storage-visibility:

Visibility and physical storage
===============================

Administrators are able to choose to make physical storage information
available to unauthenticated (not logged-in) users or not through the
:ref:`Visible elements <visible-elements>` section of the Admin menu.

.. image:: images/physical-storage-hide.*
   :align: center
   :width: 80%
   :alt: Visible elements showing physical storage

To access the visible elements menu, click on the |gears|
:ref:`Admin <main-menu-admin>` menu in the :term:`main menu` located in the
:term:`header bar` and select "Visible elements" from the
:term:`drop-down menu`.

Click on "Physical storage" to show the Physical storage check box. Check the
box to allow unauthenticated users to see storage information or uncheck to
disallow. Click save.

If visible, physical storage information will appear in the right hand column
of the screen when viewing an :term:`archival description`.

.. image:: images/physical-storage-public.*
   :align: center
   :width: 80%
   :alt: Physical storage visible to the unauthenicated users

.. NOTE::

   These visibility settings do not impact :term:`accession record` container
   visibility. Accession records are not accessible to public users, and the 
   Visible elements settings only apply to unauthenticated (i.e. public) users.

:ref:`Back to top <physical-storage>`
