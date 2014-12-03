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
:ref:`Make rights actionable on Digital objects <rights-digital-object>`, below.

Add a new rights record
=======================

This section describes how to add a new :term:`rights record` by using the
rights dialog provided through the add/edit template. You can add rights to
an existing record, or create a new record and add rights as you proceed. The
following instructions will cover both scenarios.

.. NOTE::

   You must be logged in and have the appropriate privileges, such as
   :term:`editors <editor>` and :term:`administrators <administrator>` to be
   able to add/edit content in AtoM, which includes creating a
   :term:`rights record`. See: :ref:`Log in <log-in>`.

.. _add-rights-accession:

Add rights to an Accession record
---------------------------------

**IF YOU ARE ADDING RIGHTS TO A NEW ACCESSION RECORD**

1. Navigate to the :term:`main menu` located in the :term:`header bar`, click
   the |plus| :ref:`"Add" <main-menu-add>` menu and select
   :term:`accession record` from the :term:`drop-down menu`. AtoM takes you to
   a blank :term:`edit page` for data entry for an :term:`accession record`.

.. image:: images/manage-accessions.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu

2. On loading, the :term:`edit page` displays the accession record with the
   first :term:`information area` open, Basic info.
3. You can begin entering information about your new accession. For more
   information on working with :term:`accession records <accession record>` in
   AtoM, see: :ref:`accession-records` When you are ready to add a related
   rights record to your new accession, proceed to **step 4**, below.

-------

**IF YOU ARE ADDING RIGHTS TO AN EXISTING ACCESSION RECORD**

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

3. When you have arrived at the record to which you wish to add rights, Click
   on the "Edit" button located in the :term:`button block` located at the
   bottom of the page to enter :term:`edit mode`; alternately, you can click
   on on of the :term:`information area` headers to open the :term:`edit page`
   directly in that section. Proceed to **step 4** below.

-------

4. To enter Rights information, scroll down the page until you see the
   :term:`information area` titled, "Rights area". If the section is collapsed,
   click on area header to expand and access the :term:`rights record` dialogue.

.. image:: images/rights-area.*
   :align: center
   :width: 75%
   :alt: An image of the Rights area in an accession record

5. Click on the "Add new" button and the default :term:`rights record`
   dialogue box will pop up.

.. figure:: images/accession-rights.png
   :align: center
   :figwidth: 80%
   :width: 100%
   :alt: Rights record dialogue box in edit accession record page

   Rights record dialogue box in edit accession record page.

6. The "Act" data entry field is a drop-down list. You can select: Delete,
   Discover, Display, Disseminate, Migrate, Modify, and Replicate.

7. The "Restriction" data entry field provides two choices: Allow or
   Disallow.

8. You can add a Rights holder name, or select an existing one using the
   auto-complete action provided by AtoM.

9. You can add a Rights note, describing any additional information about the
   Rights holder that might not already exist in their Rights holder record.

10. The "Basis" data entry field is a drop-down list. You can select:
    Copyright, License, Statute, Policy, or Donor.

.. TIP::

   Depending upon your selection, the AtoM Right record dialogue may provide
   additonal data entry fields. Be sure you scroll down in the dialogue to
   see all of the available fields!

   .. figure:: images/rights-dialog-more-fields.*
      :align: center
      :figwidth: 60%
      :width: 100%
      :alt: Rights record dialogue box in edit accession record page

      In this example, a user has selected "Statute" as the Rights basis,
      and more fields have appeared in the rights dialog.

11. Once you complete adding information to the rights record, click on the
    blue Submit button and then click on the blue Create button to save the
    new accession record. If you have already created the accession record,
    and you are editing the rights information, you will click on the blue
    Save button.

.. image:: images/donor-dialog-submit.*
   :align: center
   :width: 65%
   :alt: An image of the submit button in the Rights dialog

.. _rights-archival-description:

Add rights to an Archival description
-------------------------------------

**TO ADD RIGHTS TO A NEW ARCHIVAL DESCRIPTION:**

1. Navigate to the :term:`main menu` located in the :term:`header bar`,
   click the |plus| :ref:`"Add" <main-menu-add>` menu and select
   :term:`archival description` from the :term:`drop-down menu`.

.. image:: images/add-description.*
   :align: center
   :width: 30%
   :alt: An image of the Add menu in the AtoM header bar

2. AtoM takes you to a blank :term:`edit page` for data entry for an
   :term:`archival description`.

.. image:: images/description-collapsed.*
   :align: center
   :width: 75%
   :alt: An image of a blank Archival description in the ISAD template

3. On loading, the :term:`edit page` displays the archival description with
   all the :term:`information areas <information area>`, closed. The name of
   the first :term:`information area` will vary according to the archival
   content standard you are using. In the example above, ISAD(G) is shown.
   You can begin entering information about your archival description. For
   more information on working with archival descriptions in AtoM, see:
   :ref:`archival-descriptions`. When you are ready to add rights to your new
   :term:`archival description`, proceed to **step 4** below.

-------

**TO ADD RIGHTS TO AN EXISTING ARCHIVAL DESCRIPTION:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :ref:`browsing <browse>` or :ref:`searching <search-atom>`
   for the :term:`archival description` - see :ref:`access-content` for more
   information on navigation in AtoM.

2. Switch from :term:`view mode` to :term:`edit mode` by clicking the
   :term:`"Edit" button <Edit button>` in the :term:`button block`, or by
   clicking on one of the :term:`information area` headings; this takes you
   to the record's :term:`edit page`.

.. image:: images/button-block-description.*
   :align: center
   :width: 75%
   :alt: An image of the button block on an archival description

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it.
   You can edit any data as required; when you are ready to add a new rights
   statement to your :term:`archival description`, proceed to **step 4**
   below.

.. image:: images/description-collapsed.*
   :align: center
   :width: 75%
   :alt: An image of an Archival description in the ISAD template

-------

4. You can navigate to the Rights entry page in one of two ways:

a. In Edit mode, scroll down the page until you see the
   :term:`information area` titled "Rights area". Click on it to expand and
   click on the link "Create new rights":

.. image:: images/rights-area-link.*
   :align: center
   :width: 75&
   :alt: The link to the rights entry page from the Rights area in an
   archival description

b. In View mode, as a logged in user, you can also access the Rights entry page
   in the :term:`button block`. Click on "More," then on "Create new rights".

5. The Rights entry page allows you to establish the basis for which rights are
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
   delete them!


.. _rights-inheritance:

Manage rights inheritance
-------------------------



.. _rights-digital-object:

Make rights actionable on Digital objects
-----------------------------------------





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
