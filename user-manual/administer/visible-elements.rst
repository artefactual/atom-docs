.. _visible-elements:

================
Visible elements
================

:term:`Visible elements <visible elements>` enables an :term:`administrator` to
"hide" specific :term:`fields <field>` in the database from the public (i.e.,
unauthorized users, or users who are not logged in). It also allows
administrators to hide the :ref:`Physical storage <physical-storage>` area.

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

To access the visible elements menu, click on the |gears| :ref:`Admin
<main-menu-admin>` menu in the :term:`main menu` located in the
:term:`header bar` and select "Visible elements" from the
:term:`drop-down menu`.

.. image:: images/visible-elements.*
   :align: center
   :width: 80%
   :alt: An image of the Visible elements menu in AtoM

Hide or show metadata fields
============================

An authenticated (logged-in) :term:`administrator` can click on the
checkboxes to reveal the :term:`field`, while an unchecked box hides the field.
To review which fields can be hidden from the public, select ISAD template, RAD
template, or Digital object metadata area as applicable. Whether you
hide/show elements from the ISAD or RAD area depends on which
:ref:`default template <default-template>` you are using.

.. image:: images/visible-elements-check.*
   :align: center
   :width: 80%
   :alt: Visible elements menu with checkboxes.

Click "Save" to save your changes.

Hide or show Physical storage
=============================

Administrators can select whether Physical storage information is visible to
unauthorized (not logged-in) users or not by clicking on Physical storage area, and
checking or unchecking the Physical storage button.

.. image:: images/visible-elements-physical.*
   :align: center
   :width: 80%
   :alt: Visible elements menu for physical storage

Click "Save" to save your changes.

.. NOTE::

   If physical storage is hidden to unauthorized users, the physical
   storage information will also be missing from exported EAD file, if
   exported by a non-authenticated user.


:ref:`Back to top <visible-elements>`
