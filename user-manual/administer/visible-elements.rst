.. _visible-elements:

================
Visible elements
================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

.. |check| image:: images/check.png

.. |uncheck| image:: images/uncheck.png

.. image:: images/menu-visible-elements.*
   :align: right
   :width: 15%
   :alt: An image of the Visible elements option in the Admin menu

:term:`Visible elements <visible elements>` enables an :term:`administrator` to
"hide" specific :term:`fields <field>` in the database from the public (i.e.,
unauthorized users, or users who are not logged in). It also allows
administrators to hide :term:`digital object` metadata (such as file size,
name, upload date, etc) for uploaded or linked content, and  related
:ref:`Physical storage <physical-storage>` information.

To access the visible elements menu, click on the |gears| :ref:`Admin
<main-menu-admin>` menu in the :term:`main menu` located in the
:term:`header bar` and select "Visible elements" from the
:term:`drop-down menu`. Each visible elements area will appear collapsed when
the page first loads - click on one of the areas to expand it and view the
available fields listed below.

.. image:: images/visible-elements-collapsed.*
   :align: center
   :width: 40%
   :alt: An image of the Visible elements menu in AtoM

Each visible elements area includes a list of :term:`fields <field>` with
check boxes next to them. When an element's checkbox is |check| **checked**,
that element will be VISIBLE to public users. When it is |uncheck| **unchecked**,
it will NOT be visible to public users (e.g. those not logged in).

.. IMPORTANT::

   ALL authenticated users, from contributors to administrators, **will** be
   able to see those elements hidden from the public via the hidden elements
   module. If you are logged in, the Visible Elements module is not in
   operation.

Below you will find a brief outline of each Visible elements area:

* :ref:`visible-elements-global`
* :ref:`visible-elements-headers`
* :ref:`visible-elements-fields`
* :ref:`visible-elements-digital-object`
* :ref:`visible-elements-storage`



.. SEEALSO::

   * :ref:`archival-descriptions`
   * :ref:`isad-template`
   * :ref:`rad-template`
   * :ref:`dacs-template`
   * :ref:`physical-storage`
   * :ref:`upload-digital-object`
   * :ref:`log-in`

.. _visible-elements-global:

Hide or show the login button
=============================

An :term:`administrator` can hide the login button for public users. The
default setting allows the login button to be visible to all users. To change
this so that the login button is hidden to public users, an
:term:`administrator` can click the Global section of Visible Elements and 
uncheck the login button. Click "Save", and exit Visible Elements. The login 
button will still be visible for authenticated (i.e. logged in) users, but 
hidden for unauthenticated users.

.. image:: images/visible-elements-global.*
   :align: center
   :width: 40%
   :alt: An image of the Global Visible Elements

Note that the login screen can be accessed by adding 'user/login' at the end of
the site URL.

.. image:: images/forced-login.*
   :align: center
   :width: 80%
   :alt: An image of forcing the login screen

.. SEEALSO::

   A system administrator can also fully disable the ability to log into AtoM, 
   if you are using a version of AtoM as a read-only access site. See: 

   * :ref:`read-only-mode`

.. _visible-elements-headers:

Hide or show Information area headers
=====================================

AtoM :term:`archival description` data entry templates are based on
international and national content standards for description - more
information on the standards currently supported in AtoM can be found here:
:ref:`descriptive-standards`.

Most content standards are organized into sections or areas. In AtoM, these
are expressed in the :term:`view <view page>` and :term:`edit <edit page>`
pages as :term:`information areas <information area>`. Information areas appear
on :term:`view pages <view page>` and :term:`edit pages <edit page>` of any
standards-based description template in AtoM, and group related
:term:`fields <field>` based on the organization of elements of description in
`ICA <http://www.ica.org/>`__ (or other supported) descriptive standards. They
are comprised of a number of :term:`fields <field>` in the body of the
information area, and an :term:`area header`, whose name is drawn from the
related area or section of the standard upon which the descriptive template is
based.

While these area headers are useful to archivists working with content
standards for archival description, they may not be meaningful to public
users. If desired, an :term:`administrator` can choose to hide the various
:term:`area headers <area header>` for the :ref:`RAD <rad-template>`, 
:ref:`DACS <dacs-template>`, and :ref:`ISAD <isad-template>` templates.

.. image:: images/visible-elements-headers.*
   :align: center
   :width: 80%
   :alt: Visible elements menu with checkboxes for area headers.

To hide an :term:`area header` from public view, simply uncheck the checkbox
next to the header name. Remember to click "Save" in the :term:`button block`
at the bottom of the page when you are finished.

For illustration, below is an example description, displayed using the
:ref:`ISAD template <isad-template>`, with all
:term:`area headers <area header>` visible (i.e. all check boxes |check|
checked):

.. image:: images/visible-with-headers.*
   :align: center
   :width: 80%
   :alt: An example description with Area headers visible.

Here is the same description with all :term:`area headers <area header>`
hidden (i.e. all check boxes |uncheck| unchecked):

.. image:: images/visible-no-headers.*
   :align: center
   :width: 80%
   :alt: An example description with Area headers hidden.

:ref:`Back to top <visible-elements>`

.. _visible-elements-fields:

Hide or show metadata fields
============================

Within the :ref:`ISAD <isad-template>`, :ref:`RAD <rad-template>`, and 
:ref:`DACS <dacs-template>` templates for 
:term:`archival descriptions <archival description>`, specific
:term:`fields <field>` can also be hidden from public users if desired.

The names of each field available in the ISAD, RAD, and DACS elements areas are
taken directly from field names in AtoM's data entry templates - which are
themselves drawn directly from the related content standards. For specific
information on each field, see: :ref:`data-entry`.

An authenticated (logged-in) :term:`administrator` can |check| check the
checkboxes to reveal the :term:`field`, while an |uncheck| unchecked box hides
the field. To review which fields can be hidden from the public, select the
ISAD template, the RAD template, and/or the DACS template as applicable. Whether 
you choose to hide or show elements from the ISAD, RAD, and/or DACS area 
depends on which :ref:`default template <default-templates>` you are using.

.. image:: images/visible-elements-isad.*
   :align: center
   :width: 80%
   :alt: Visible elements menu with checkboxes.

When you have made your changes, remember to click "Save" in the
:term:`button block` at the bottom of the page.

.. IMPORTANT::

   Elements (e.g. :term:`fields <field>`) that are hidden via the Visible
   elements module will not be visible to public users in the interface.
   However, the data will still be contained in the EAD XML download available
   to end users! Note that physical storage information, described below, is
   different - because location information can be a security concern for some
   users, when physical storage information is hidden via the Visible elements
   module, it is also removed from the EAD XML export for public users.

   For more information on EAD XML export, see:
   :ref:`export-xml`

:ref:`Back to top <visible-elements>`

.. _visible-elements-digital-object:

Hide or show digital object metadata fields
===========================================

In AtoM, when a :term:`digital object` is uploaded and associated with an
:term:`archival description`, a new :term:`information area` will appear at
the bottom of the description with metadata about the associated digital
object:

.. image:: images/digital-object-metadata.*
   :align: center
   :width: 80%
   :alt: An image of the digital object metadata area on a description

An :term:`administrator` can choose to hide some or all of these fields from
unauthenticated (e.g. not logged in) users via the Visible elements module.

In the Digital object metadata :term:`area <information area>`, |check| check
a :term:`field` to make it visible to public users, or |uncheck| uncheck it to
hide the field from public users.

.. image:: images/visible-elements-digital-object.*
   :align: center
   :width: 80%
   :alt: Visible elements menu for digital object metadata

When you have made your changes, remember to click "Save" in the
:term:`button block` at the bottom of the page.

For more information on uploading digital objects in AtoM, see:
:ref:`upload-digital-object`.

:ref:`Back to top <visible-elements>`

.. _visible-elements-storage:

Hide or show Physical storage
=============================

Administrators can select whether Physical storage information is visible to
unauthorized (not logged-in) users or not by clicking on Physical storage area, and
|check| checking or |uncheck| unchecking the Physical storage button.

.. image:: images/visible-elements-storage.*
   :align: center
   :width: 80%
   :alt: Visible elements menu for physical storage

When you have made your changes, remember to click "Save" in the
:term:`button block` at the bottom of the page.

.. NOTE::

   If physical storage is hidden to unauthorized users, the physical
   storage information will also be missing from exported EAD XML file, if
   exported by a non-authenticated user. For more information on export and
   physical storage, see:

   * :ref:`export-xml`
   * :ref:`physical-storage`

:ref:`Back to top <visible-elements>`
