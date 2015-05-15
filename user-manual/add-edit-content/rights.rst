.. _rights:

======
Rights
======

.. |edit| image:: images/edit-sign.png
   :height: 18
   :width: 18

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

As discussed in the section on :ref:`entity types <entity-types>`,
:term:`Rights records <rights record>` provide rights related restrictions
that can be linked to :term:`accession records <accession record>`,
:term:`archival descriptions <archival description>` and their related
:term:`digital objects <digital object>`. AtoM Rights metadata elements use
`PREMIS rights elements <http://www.loc.gov/standards/premis/>`__. In AtoM
restrictions can be based on Copyright(s), License, Statute(s) and Policy.
You can also include rights restrictions based on guidelines set by the
Donor of the records. Rights can be set to be inherited in AtoM, which means
that rights added at a higher level (e.g., fonds level) can be inherited by the
lower levels (e.g., item level). See
:ref:`Manage rights inheritance <rights-inheritance>`, below.

If you add rights to an :term:`accession record`, all
:term:`archival descriptions <archival description>` created from that
accession will inherit the same rights.

AtoM also allows you to choose one PREMIS rights :term:`act` (such as Display,
Disseminate, etc) to use as an action for your digital objects. See
:ref:`Make rights actionable on digital objects <rights-digital-object>`, below.

Add a new rights record
=======================

This section describes how to add a new :term:`rights record` by using the
rights dialog provided through the add/edit template. You must add rights to
an existing accession record or archival description. To create an accession
record or archival description first, please see:
:ref:`Add new accession record <add-new-accession>` or
:ref:`Add new archival description <add-archival-description>`.

.. NOTE::

   You must be logged in and have the appropriate privileges, such as
   :term:`editors <editor>` and :term:`administrators <administrator>` to be
   able to add/edit content in AtoM, which includes creating a
   :term:`rights record`. See: :ref:`Log in <log-in>`.

.. _add-rights-accession:

Add rights to an Accession record
---------------------------------

1. Navigate to the :term:`accession record` you want to edit. You can do this
   via the :term:`main menu` in the AtoM :term:`header bar`, by clicking on
   **Manage > Accessions**. For more information on navigation in AtoM,
   see: :ref:`Access content <access-content>`.

.. image:: images/manage-accessions.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu

2. AtoM will redirect you to the accession record :ref:`browse page
   <page-type-browse>`. Select the record you want by clicking on the
   hyperlink Identifier. You can also search for an :term:`accession record`
   with the accession records :term:`search box` located at the bottom of the
   browse page. For more information on searching for :term:`accession records
   <accession record>` in AtoM, see: :ref:`Searching for accession records
   <dedicated-search-accessions>`.

.. image:: images/accession-search-wildcard.*
   :align: center
   :width: 65%
   :alt: An image of searching for an accession

3. When you have arrived at the record to which you wish to add rights, click
   on "Create new rights" in the :term:`button bar`. The PREMIS rights entry form
   will appear.

.. image:: images/rights-button-block.*
   :align: center
   :width: 70%
   :alt: Access Create New Rights link through the button block

4. The Rights entry page allows you to establish the basis for which rights are
   granted or disallowed as well as describing the rights themselves.

a. Rights basis:

AtoM provides a drop-down menu to select the basis for the rights associated
with the description. You can select: Copyright, License, Statute, Policy, or
Donor.

.. figure:: images/rights-entry-basis.*
   :align: center
   :width: 100%
   :figwidth: 80%
   :alt: Rights entry page with copyright as the basis

   The Rights entry page with Copyright set as the basis.

The fields below the rights basis will differ depending on the basis chosen.
Compare for  example the figure above, showing Copyright as the basis, and the
figure below,  showing Statute as the basis:

.. figure:: images/rights-basis-statute.*
   :align: center
   :width: 100%
   :figwidth: 80%
   :alt: Rights entry page with statute as the basis

   The Rights entry page with Statute set as the basis.

As you complete the Rights basis fields, :term:`tooltips` will appear to explain
the purpose of the field.

When adding the Rights holder, can add a new Rights holder name, or select an
existing one using the auto-complete action provided by AtoM.

b. Act/Granted rights:

Once you have established the basis for the rights you need to grant, fill in
the Act/Granted rights fields:

i. The "Act" data entry field is a drop-down list. You can select: Delete,
   Discover, Display, Disseminate, Migrate, Modify, and Replicate.

ii. The "Restriction" data entry field provides three choices: Allow,
    Disallow or Conditional.

iii. Add Start and End dates for the right. Leave the end date blank if it is
     unknown or open.

iv. You can add notes related to the granted right.

If you are finished adding granted rights related to this basis, click Save. If
you have more granted rights to add related to this basis, click Add granted
right and fill in the fields again. Click Save when you are finished.

.. TIP::

   You may have granted rights to record that are related to more than one basis.
   For example, you may want to record a granted right related to Copyright, and
   another granted right related to Policy. After you click Save, you can return
   to the accession and add more rights related to another basis by
   clicking More -> Create new rights again.

After rights are created for an accession, they can be edited or
deleted by logged in users with the correct permissions by clicking the links
from the archival description in view mode:

.. image:: images/rights-edit-delete.*
   :align: center
   :width: 75%
   :alt: Edit and delete links for rights records.

.. important::

   When you click delete, AtoM deletes the rights record without asking for
   confirmation, so be sure to click only when you are positive you wish to
   delete the rights information!

5. Once you complete adding information to the rights record, click on the
   click Save.

.. _rights-archival-description:

Add rights to an Archival description
-------------------------------------

1. First, navigate to the :term:`archival description` you wish to add rights to.
   You can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.

2. In the :term:`button block`, click on "More," then on "Create new rights".

3. The Rights entry page allows you to establish the basis for which rights are
   granted or disallowed as well as describing the rights themselves.

a. Rights basis:

AtoM provides a drop-down menu to select the basis for the rights associated
with the description. You can select: Copyright, License, Statute, Policy, or
Donor.

.. figure:: images/rights-entry-basis.*
   :align: center
   :width: 100%
   :figwidth: 80%
   :alt: Rights entry page with copyright as the basis

   The Rights entry page with Copyright set as the basis.

The fields below the rights basis will differ depending on the basis chosen.
Compare for  example the figure above, showing Copyright as the basis, and the
figure below,  showing Statute as the basis:

.. figure:: images/rights-basis-statute.*
   :align: center
   :width: 100%
   :figwidth: 80%
   :alt: Rights entry page with statute as the basis

   The Rights entry page with Statute set as the basis.

As you complete the Rights basis fields, :term:`tooltips` will appear to explain
the purpose of the field.

When adding the Rights holder, can add a new Rights holder name, or select an
existing one using the auto-complete action provided by AtoM.

b. Act/Granted rights:

Once you have established the basis for the rights you need to grant, fill in
the Act/Granted rights fields:

i. The "Act" data entry field is a drop-down list. You can select: Delete,
   Discover, Display, Disseminate, Migrate, Modify, and Replicate.

ii. The "Restriction" data entry field provides three choices: Allow,
    Disallow or Conditional.

iii. Add Start and End dates for the right. Leave the end date blank if it is
     unknown or open.

iv. You can add notes related to the granted right.

If you are finished adding granted rights related to this basis, click Save. If
you have more granted rights to add related to this basis, click Add granted
right and fill in the fields again. Click Save when you are finished.

.. TIP::

   You may have granted rights to record that are related to more than one basis.
   For example, you may want to record a granted right related to Copyright, and
   another granted right related to Policy. After you click Save, you can return
   to the archival description and add more rights related to another basis by
   clicking More -> Create new rights again.

After rights are created for an archival description, they can be edited or
deleted by logged in users with the correct permissions by clicking the links
from the archival description in view mode:

.. image:: images/rights-edit-delete.*
   :align: center
   :width: 75%
   :alt: Edit and delete links for rights records.

.. important::

   When you click delete, AtoM deletes the rights record without asking for
   confirmation, so be sure to click only when you are positive you wish to
   delete the rights information!


.. _rights-inheritance:

Manage rights inheritance
-------------------------

AtoM will allow you to add a rights record to a :term:`parent record` and choose
whether or not the same rights record should be applied to that parent's
:term:`child records <child record>`.

After creating a rights record at a parent-level, in edit mode click on "More"
then "Manage rights inheritance" in the :term:`button block` of the parent record.

.. image:: images/manage-rights-inheritance.*
   :align: center
   :width: 80%
   :alt: Manage rights inheritance, available in the button block in edit mode.

On the next screen, decide:

1. If you want the rights record(s) inherited by all descendants (children) or
only descendants with digital objects associated with them (see Make rights
actionalable on digital objects, below) and,

2. Whether you would like to delete any rights which pre-exist in the child
records and replace with the parent rights (option 1) or combine the parent
rights with any existing rights in the child records (option 2).

.. image:: images/rights-inheritance-options.*
   :align: center
   :width: 80%
   :alt: Rights inheritance options in AtoM.

Click Apply. The child records will now reflect the rights inheritance from the
parent record as you indicated.

.. note::

   AtoM will only allow you to manage rights inheritance from the top down- you
   will not be able to modify the rights of a child record and have them
   passed up to the parent record.

.. _rights-digital-object:

Make rights actionable on digital objects
-----------------------------------------

:term:`Administrators <administrator>` can choose an act/granted right for which
digital object permissions are set. This means that digital object
:term:`thumbnails <thumbnail>`,
:term:`reference display copies <reference display copy>` and
:term:`master digital objects <master digital object>` can be made visible or
invisible to non-authenticated users by changing the rights record in
conjunction with the appropriate administrative settings.

To access the settings, click on the
|gears| :ref:`Admin menu <main-menu-admin>` in the :term:`main menu` and
select "Settings" from the :term:`drop-down menu`. Then click on "Permissions."

.. image:: images/rights-digital-permissions.*
   :align: center
   :width: 80%
   :alt: Permission settings for digital objects based on granted rights.

First, choose from the :term:`drop-down menu` the act/granted right you
would like to apply to digital objects. You can choose from: Delete, Discover,
Display, Disseminate, Migrate, Modify and Replicate. For many institutions,
either Display or Disseminate will be the logical choice since this functionality
relates to the display of digital objects.

Next, use the drop-down menus to indicate whether viewing/downloading digital
objects should be allowed or disallowed. You will set these permissions for
each of the three possible restrictions (Allow, Conditional, and Disallow). For
each restriction you will also indicate whether viewing and downloading
:term:`masters <master digital object>`, :term:`reference representations
<reference display copy>` and :term:`thumbnails <thumbnail>` are allowed or
disallowed.

You can only make rights actionable based on one act/granted right. Other
acts and granted rights can be added to the archival description, but they
will have no effect on the visibility of digital objects to your users.

.. tip::

   Here is an example use case:

   Suppose an institution has determined that their digital objects fall into
   3 categories: those that are in the public domain, those that are definitely
   still under copyright, and those that have an unknown copyright status.
   The institution does a risk assessment and determines that:

   - Public domain digital objects can be accessed by anyone in any format
   - Items under copyright can only be viewed online in their thumbnail version
   - Items with unknown or uncertain copyright status can be viewed online, but
     only in smaller resolution. It is determined to be too risky to allow online
     access to the master copies.

   The institution has created rights records for their archival descriptions
   using the act "Display".

   This institution would set their Permissions as such:

   .. image:: images/example-rights.*
      :align: center
      :width: 70%
      :alt: Example permissions settings

   Example rights records in the related archival descriptions could look like
   this:

   Public domain items: Display - Allow

   .. image:: images/example-allow.*
      :align: center
      :width: 60%
      :alt: Example rights records when displayed is Allowed

   Copyrighted items: Display - Disallow

   .. image:: images/example-disallow.*
      :align: center
      :width: 60%
      :alt: Example rights records when displayed is Disallowed

   Uncertain copyright: Display - Conditional

   .. image:: images/example-conditional.*
      :align: center
      :width: 60%
      :alt: Example rights records when displayed is Conditional


Manage Rights holders records
-----------------------------

1. Users with :term:`editor` and :term:`administrator` access permissions can
   navigate to the :term:`main menu` located in the AtoM :term:`header bar` and
   click on the |edit| :ref:`Manage <main-menu-manage>` menu, then select
   Rights holders from the drop-down list. AtoM will take you to a browse page
   for Rights holders.

.. image:: images/manage-rightsholders.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu in the AtoM header bar

.. TIP::

   For general information on navigation in AtoM, see:
   :ref:`Access content <access-content>`. For general information on browse
   menus in AtoM, see: :ref:`browse`. See also our section on the
   :ref:`Manage menu <main-menu-manage>`

   An :term:`administrator` can also customize the elements that appear in
   the :ref:`main-menu` via **Admin > Menus**. For more information, see:
   :ref:`manage-menus`.

2. When you have arrived at the Rights holders records browse page, AtoM
   provides a dedicated search box for searching existing rights holders in the
   system. For more information on using the Rights holders dedicated search
   box, see: :ref:`dedicated-search-rights`. The list of rights holders can be
   browsed by "most recent" or "alphabetic" via the :ref:`recurring-sort-button`
   on the page.

.. image:: images/browse-rightsholders.*
   :align: center
   :width: 75%
   :alt: An image of the Rights holders browse page

3. If you click on the hyper-link name of a rights holder, AtoM takes you to
   the View rights holder page.

.. image:: images/rightsholder-view-page.*
   :align: center
   :width: 75%
   :alt: An image of a Rights holder view page

4. The View rights holder page lets the authorized user edit and delete the
   existing rights holder record, or add a new rights holder.

5. If you click on the edit button, AtoM takes you to the Edit rights holder
   template. There are two areas: the Identity area and the Contact area. In
   the Identity area there is one data entry field, authorized form of name.
   In the Contact area there is add new button, which allows you to add a new
   contact person. If you click on the add new button, AtoM opens a contact
   information dialogue with three tabs, Main, Physical location and Other
   details. Add as much information into the Related contact information
   dialogue and click on the Submit button.

.. image:: images/edit-rights-holder.*
   :align: center
   :width: 75%
   :alt: An image of editing a Rights holder record

6. Remember to click on the Save button at the bottom of the rights holder
   page to save all the new information you have added to the rights holder
   record. AtoM will reload the Rights holder record in :term:`view mode`.

.. image:: images/button-block-save.*
   :align: center
   :width: 65%
   :alt: An image of button block when in edit mode

7. If you click on the :term:`Delete button` located at the bottom of the
   Rights holder record when in :term:`view mode`, AtoM will ask you to confirm
   that you want to delete the Rights holder record. Click the "Delete" button
   to delete, or the "Cancel" button to return to Rights holder record
   :term:`view page`. If you click "Delete," the Rights holder record will be
   permanently deleted.

.. image:: images/rightsholder-delete-confirm.*
   :align: center
   :width: 75%
   :alt: An image of a deletion confirmation message on a Rights holder record

:ref:`Back to top <rights>`
