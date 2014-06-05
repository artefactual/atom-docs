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
:term:`archival descriptions <archival description>` and their physical storage
locations.

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

   This is the method to use is you wish to add a storage container to link to
   :term:`archival descriptions <archival description>`. Find "Container," and
   click "Add new."

.. image:: images/physical-object-add-child.*
   :align: center
   :width: 80%
   :alt: Add new physical object type as a child

.. _link-physical-storage:

Link physical storage
=====================

Linking :term:`archival descriptions <archival description>` to physical
locations is performed from the :term:`view page` of the related archival
description.

Add/change container links
--------------------------

Physical storage can be linked at any :term:`level of description`. When
viewing a description as a logged-in user, click on the "More" button in the
:term:`button block`, and then on "Link physical storage":

.. image:: images/physical-storage-link.*
   :align: center
   :width: 80%
   :alt: Linking an archival description to physical storage

If a link to a physical storage container or location already exists, it can
be edited by clicking the pencil icon, or deleted by clicking the **X**.

.. image:: images/physical-storage-edit.*
   :align: center
   :width: 80%
   :alt: Editing or adding a physical storage link

.. IMPORTANT::

   This edits the information associated with the Physical storage container
   and location. If you change this information the change will apply across
   all :term:`descriptions <archival description>` associated with the container.

.. image:: images/physical-storage-edit-2.*
   :align: center
   :width: 80%
   :alt: Editing a physical storage cnntainer

To create a link with a different storage container, begin to type the
container name in the Container field. AtoM will auto-suggest existing
containers as you type.

Create new container
--------------------

To link the :term:`archival description` with a container that does not yet
exist in AtoM, enter a container name, location and type and click save.

.. image:: images/physical-storage-new.*
   :align: center
   :width: 80%
   :alt: Creating a new container

New containers can also be created from the Browse physical storage area, by
clicking Add new (see below).

Browse physical storage
=======================

Physical storage can be browsed by authenticated (logged in) users through
the |pencil| :ref:`Manage <main-menu-manage>` menu:

.. image:: images/manage-phys-storage.*
   :align: center
   :alt: Accessing physical storage in Manage menu

Once in Browse Physical storage, users have the option of sorting the storage
entries by Name (of container) or Location by clicking in the first row of the
Physical storage table:

.. image:: images/physical-storage-table.*
   :align: center
   :width: 100%
   :alt: Physical storage table with sorting

When a user clicks on a container name, AtoM displays a list of the resources
associated with that name:

.. image:: images/view-storage-name.*
   :align: center
   :width: 80%
   :alt: Viewing a storage name with related resources listed

.. TIP::

   If you click "edit" while viewing a container name, you can edit the
   information associated with the container, including the name, location and
   type. To change the resources associated with that container name, you must
   do so from the :term:`archival description` for each resource.

By clicking the :term:`print icon` users can produce a report for the storage
container which includes the Reference code, Title, Dates, Part of (fonds or
collection name) and Conditions governing access.

.. image:: images/storage-print-report.*
   :align: center
   :width: 80%
   :alt: Storage print report

Click "close" to return to the container storage view.


Visibility
==========

Administrators are able to choose to make physical storage information
available to unauthenicated (not logged-in) users or not through the
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
box to allow unauthenicated users to see storage information or uncheck to
disallow. Click save.

If visible, physical storage information will appear in the right hand column
of the screen when viewing an :term:`archival description`.

.. image:: images/physical-storage-public.*
   :align: center
   :width: 80%
   :alt: Physical storage visible to the unauthenicated users

:ref:`Back to top <physical-storage>`
