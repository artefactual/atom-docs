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
restrictions can be based on Copyright(s), License, Statute(s), Policy, or
Donor (as in an agreement established with a donor). Rights can be set to be
inherited in AtoM, which means that rights added at a higher level (e.g., fonds
level) can be inherited by the lower levels (e.g., item level). See
:ref:`Manage rights inheritance <rights-inheritance>`, below.

If you add rights to an :term:`accession record`, all
:term:`archival descriptions <archival description>` created from that
accession will inherit the same rights.

AtoM also allows you to choose one PREMIS rights :term:`act` (such as Display,
Disseminate, etc) to use as an action for your digital objects - though you
can configure different digital object access permissions for each PREMIS
rights Basis. See :ref:`rights-digital-object`, below.

**Jump to:**

* :ref:`add-rights`
* :ref:`rights-inheritance`
* :ref:`rights-digital-object`
* :ref:`disallow-statements`
* :ref:`preservation-access-statement`
* :ref:`copyright-pop-up`
* :ref:`manage-rights-holders`

.. SEEALSO::

   * :ref:`permissions` (settings)
   * :ref:`upload-digital-object`
   * :ref:`archival-descriptions`
   * :ref:`accession-records`

.. _add-rights:

Add a new rights record
=======================

This section describes how to add a new :term:`rights record` by using the
rights dialog provided through the add/edit template. You must add rights to
an existing accession record or archival description. To create an accession
record or archival description first, please see:

* :ref:`Add new accession record <add-new-accession>`
* :ref:`Add new archival description <add-archival-description>`

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
   on "Create new rights" in the :term:`button block`. The PREMIS rights entry form
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

:ref:`Back to top <rights>`

.. _rights-inheritance:

Manage rights inheritance
=========================

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

.. tip::

   Rights inheritance is a task that AtoM performs asynchronously, via the Jobs
   Scheduler. If the parent description has many children, it may take some time
   for all of the children to inherit the rights. See :ref:`Manage Jobs <manage-jobs>`
   for more information.

:ref:`Back to top <rights>`

.. _rights-digital-object:

Make rights actionable on digital objects
=========================================

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

.. image:: images/permissions-select-act.*
   :align: center
   :width: 80%
   :alt: Selecting which PREMIS act will be actionable on digital objects

.. TIP::

   The PREMIS acts are maintained in the "Rights act" :term:`taxonomy`, and
   can be customized by users with the proper edit permissions. If you add a
   new :term:`term` to the Rights act taxonomy, it will appear in the PREMIS
   Access permissions table when you return to the Settings page. You can then
   configure its settings.

   The default terms are mostly derived from the PREMIS 2.2 standard - here
   are their definitions as found in the PREMIS Data Dictionary
   (`v2.2, 2012 <http://www.loc.gov/standards/premis/v2/premis-2-2.pdf>`__),
   p. 225:

   * replicate = make an exact copy
   * migrate = make a copy identical in content in a different file format
   * modify = make a version different in content
   * disseminate = create a copy or version for use outside of the preservation repository
   * delete = remove from the repository

   AtoM includes 2 other default basis terms: discover, and display. These
   were added because PREMIS is intended to support digital preservation, and
   its rights module does not get very granular, especially when applied to
   digital object permissions management in an access system.

   * discover = based on "Resource discovery", i.e. exposing metadata through searches
   * display = display a digital object in a public access system

   Users can use these terms as originally defined, or based on local
   interpretations. New terms can be added to the Rights act taxonomy as need,
   and unnecessary terms can be altered or deleted. For more information on
   managing terms and taxonomies, see: :ref:`terms`.

Next, use the permissions table to indicate whether viewing/downloading
digital objects should be allowed or disallowed. You will set these permissions for
each of possible Rights bases (Copyright, License, Statute, Policy, and
Donor), covering each of the three possible restrictions (Allow, Conditional,
and Disallow). For each restriction you will also indicate whether viewing and
downloading :term:`masters <master digital object>`,
:term:`reference representations <reference display copy>` and
:term:`thumbnails <thumbnail>` are allowed or disallowed.

.. NOTE::

   You can only make rights actionable based on one act/granted right,
   determined by the PREMIS act :term:`drop-down menu` above the permissions
   table. Other acts and granted rights can be added to an
   :term:`archival description`, but they will have no effect on the visibility
   of digital objects to your users.

When a check-box in the permissions table is **checked** (and the area
surrounding it is green), it means that access is allowed for that particular
rights configuration. When a check-box is **unchecked** (and the area
surrounding it is red), it means that access is disallowed for that particular
rights configuration.

You can use the "Master," "Reference," and "Thumb" buttons above each row to
check or uncheck all basis rows in a particular column. You can also use the
"All / none" link below the table to check or uncheck all values in the
permissions table:

.. image:: images/permissions-select.*
   :align: center
   :width: 80%
   :alt: Using the select buttons to toggle values for an entire permissions column

Don't forget to **save** your changes with the "Save" button in the
:term:`button block` at the bottom of the page.

Remember, for your rights to have an effect on a :term:`digital object`
attached to an :term:`archival description`:

* A Rights statement must be associated with the description (see above,
  :ref:`rights-archival-description`)
* The associated rights must have the same :term:`act` as the one set in the
  PREMIS act :term:`drop-down menu` above the permissions table in |gears|
  **Admin > Settings > Permissions**
* The basis of the rights on your archival description must be configured to
  disallow access in the permissions table in  |gears| **Admin > Settings >
  Permissions**
* The user must be a public user (e.g. not logged in; also known as a
  :term:`researcher`) - the rights do not apply to authenticated (e.g. logged
  in) users

For a public user, when access to the :term:`thumbnail` is disallowed based on
an attached rights statement, AtoM will instead display a default generic
media type icon:

.. image:: images/restricted-thumbnails.*
   :align: center
   :width: 80%
   :alt: Example of default icons shown in place of thumbnails

When access to the :term:`reference display copy` is disallowed based on an
attached rights statement, users will instead be shown the related Access
statement, depending on the Basis of your PREMIS right. Access statements are
intended to be user-friendly messages explaining the restriction, and can be
configured by an :term:`administrator` - see below for more information:
:ref:`disallow-statements`.

.. image:: images/access-statement.*
   :align: center
   :width: 80%
   :alt: Example of an access statement shown when access to a reference
         display copy is restricted via PREMIS rights

If access to the :term:`reference display copy` is allowed, but access to the
:term:`master digital object` (e.g. the original) is disallowed, the users
will be able to view the reference copy, but they will not be able to click on
it to view/download the original.

.. _rights-digital-object-example:

Example: Configuring copyright permissions
------------------------------------------

Here is an example use case: 

Suppose an institution has determined that their digital objects fall into
3 categories: those that are in the public domain, those that are definitely
still under copyright, and those that have an unknown copyright status.
The institution does a risk assessment and determines that:

* Public domain digital objects can be accessed by anyone in any format
* Items under copyright can only be viewed online in their thumbnail version
* Items with unknown or uncertain copyright status can be viewed online, but
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


The digital object would display, and would also be "clickable" to access
the master copy:

.. image:: images/image-allowed.*
  :align: center
  :width: 60%
  :alt: Example of digital object for which display is allowed.

Copyrighted items: Display - Disallow

.. image:: images/example-disallow.*
  :align: center
  :width: 60%
  :alt: Example rights records when displayed is Disallowed

The digital object would not display, and is replaced by a statement
explaining why it is not visible:

.. image:: images/image-disallow.*
  :align: center
  :width: 60%
  :alt: Example of digital object for which display is disallowed.

Uncertain copyright: Display - Conditional

.. image:: images/example-conditional.*
  :align: center
  :width: 60%
  :alt: Example rights records when displayed is Conditional

The image will display in its reference representation, but will not be
"clickable", preventing the user from using the master image:

.. image:: images/image-conditional.*
  :align: center
  :width: 60%
  :alt: Example of digital object for which display is conditional.

.. TIP::

   For another possible way of dealing with access to digital objects with
   conditional copyright restrictions, see below, :ref:`copyright-pop-up`.

:ref:`Back to top <rights>`

.. _disallow-statements:

Configure Disallowed and Conditional access statements
======================================================

When access to the :term:`reference display copy` of a digital object is
restricted to public users via a PREMIS right, AtoM will display a
customizable access statement in its place:

.. image:: images/access-statement.*
   :align: center
   :width: 80%
   :alt: Example of an access statement shown when access to a reference
         display copy is restricted via PREMIS rights

Depending on how you have configured the permissions (see above, 
:ref:`rights-digital-object`), the access statement will also display in the 
:term:`digital object` metadata :term:`information area` for relevant versions
of the digital object that are restricted by rights: 

.. image:: images/access-statement-do.*
   :align: center
   :width: 80%
   :alt: Example of an access statement shown in the digital object metadata 
         area when access to both the master and reference display copy are 
         restricted via PREMIS rights

.. SEEALSO::

   * :ref:`digital-object-metadata`

Access statements are intended to be user-friendly explanations of why access
is restricted, and what the user can do (if anything) to gain access (for
example, contact the Reference Archivist, etc).

These access statements can be individually configured for each Rights basis
by an :term:`administrator`, in |gears| **Admin > Settings > Permissions**.
Scroll down to the section labelled "PREMIS access statements":

.. image:: images/example-access-copyright.*
   :align: center
   :width: 80%
   :alt: An image of the PREMIS access statements in Settings

The different Rights basis terms along the left act as tabs - click on one to
flip the view and display the current accesss statement text for that basis.
Each basis has a Conditional access statement (when the associated rights
restriction is set to "Conditional" and the permissions table setting for
the :term:`reference display copy` is set to "Disallow"), and A Disallow access
statement (when the rights restriction is "Disallow" and the associated
permission for the reference copy is also "Disallow"). You can add custom text
for each.

.. TIP::

   The PREMIS Rights basis :term:`terms <term>` are all maintained in a
   :term:`taxonomy`. The terms can be edited or deleted, and new terms can be
   added by logged-in users with appropriate
   :term:`access privileges <access privilege>`. If a new term is added to the
   Right basis taxonomy, then a new tab will be added to the PREMIS access
   statements section in |gears| **Admin > Settings > Permissions**. An
   :term:`administrator` can then add custom Conditional and Disallow access
   statements for the new PREMIS basis.

You can customize the access statements for each Rights basis, as needed based
on local practice. When you have made the edits you want to each Basis tab,
remember to scroll down and click "Save" in the :term:`button block` at the
bottom of the page.

:ref:`Back to top <rights>`

.. _preservation-access-statement:

Configure a preservation system access statement
================================================

.. _Archivematica: https://www.archivematica.org/

In addition to supporting the local upload or linking of 
:term:`digital objects <digital object>`, Atom also supports basic integration
with `Archivematica`_, a digital preservation workflow system. When used 
together, Archivematica can generate access derivatives from preservation files
to be uploaded in AtoM. For more information, consult the Archivematica 
documentation:

* :ref:`archivematica:upload-atom`

Since access to preservation files is frequently not publicly available by 
default, an :term:`administrator` can configure a custom preservation access 
statement to appear next to preservation metadata displayed in AtoM's digital 
object metadata :term:`information area`. For more information on the display
of preservation file metadata in AtoM, see: 

* :ref:`digital-object-preservation`

Access statements are intended to be user-friendly explanations of why access
is restricted, and what the user can do (if anything) to gain access (for
example, contact the Reference Archivist, etc). Preservation access statements
can be configured by an :term:`administrator` separately from the 
:ref:`Conditional and Disallow access statements <disallow-statements>` via
AtoM's :ref:`permissions` settings. 

When enabled, this setting will display customizable text about any access
conditions that might be placed on linked files that are held in an integrated
preservation system such as `Archivematica`_. Note that these statement only
appear in the metadata section for original files and preservation copies.

**Using the preservation access statement**

The setting can be accessed by an :term:`administrator` via |gears| **Admin > 
Settings > Permissions**. See: 

* :ref:`permissions`

To use the access statement, write the notice that applies to your 
institution in the text field. For example, you may not distribute original 
files and preservation copies over the Internet but do provide access to them 
on a dedicated machine in your  reference room. So your preservation system 
access statement may read: "Access only provided on reference room computer.". 

Toggle the "Enable access statement" option to "yes" and press "Save".

.. image:: images/preservation-system-access-statement.*
   :align: center
   :width: 90%
   :alt: Preservation system access statement

The statement now appears next to a "Permissions" label in the **Digital 
object metadata > Preservation Copies** section on your archival description 
view pages.

.. image:: images/preservation-system-access-statement-display.*
   :align: center
   :width: 90%
   :alt: Display of preservation system access statement

:ref:`Back to top <rights>`

.. _copyright-pop-up:

Add a Copyright statement before allowing access to a master digital object
===========================================================================

There may be use cases where you wish to allow users access to the
:term:`master digital object` (i.e. the original :term:`digital object` you
have uploaded), but want to remind users of the copyright terms involved in
the digital object's usage and/or dissemination. For example, perhaps the
terms of the copyright do not permit commercial use, or require attribution.

In these cases, AtoM includes the ability to configure a customizable
copyright pop-up notice, that will appear for all users when they try to
access the :term:`master digital object`. The copyright pop-up must be viewed,
and an "Accept" button clicked (acknowledging the terms in the pop-up), before
access to the master digital object is granted. 

.. IMPORTANT::

   The copyright statment will **only** work when it is applied to digital
   objects that are uploaded locally - not to those linked via URL to an
   external web address! This is because the pop-up relates to the
   :term:`master digital object`. When you upload locally, then the master
   digital object is stored in AtoM. When you link to an external digital
   object, AtoM will generate local derivatives (ie the
   :term:`reference display copy` and the :term:`thumbnail`), but the master
   is still external!

   We suggest using a different (perhaps custom) Basis, and applying rights
   with the settings configured to deny access to the master digital object,
   if you wish to restrict access to external digital objects. You can also
   hide the source URL from the Digital object metadata
   :term:`area <information area>` via the Visible elements module.

   For more information on configuring PREMIS settings, see
   :ref:`above <rights-digital-object>`. For information on uploading digital
   objects, see: :ref:`upload-digital-object`. For information on the Visible
   elements module, see: :ref:`visible-elements`.

There are two ways the copyright pop-up can be configured - either it can be
set globally to apply to **all** locally uploaded digital objects (even if no
Rights statement is applied), or else it can be configured to show only
under certain conditions, including the presence of a related Rights record. 
In this second case, the pop-up will come into effect when:

* The copyright pop-up is enabled in |gears| **Admin > Settings >
  Permissions**
* Users are granted sufficient :term:`access privileges <access privilege>` to
  access the :term:`master digital object`
* A Rights statement with a Copyright basis and the Restriction set to
  "Conditional" is attached to the associated :term:`archival description`
* The :term:`digital object` is uploaded locally, **not** linked via a web
  address (i.e. from an external site).

More on each of these points will be included below.

.. _copyright-pop-up-configure:

Configuring the copyright pop-up
--------------------------------

1. To enable and configure the copyright pop-up, click on the |gears|
   :ref:`Admin menu <main-menu-admin>` in the AtoM :term:`header bar`, and
   select "Settings". AtoM will redirect you to the settings page. Choose
   "Permissions" in the left-hand navigation menu, and scroll down to the
   section entitled "Copyright statement":

.. image:: images/copyright-pop-up.*
   :align: center
   :width: 80%
   :alt: An image of the Copyright statement section of the Permissions settings

2. To activate the copyright statement, make sure that the "Enable copyright
   statement" :term:`radio button` is toggled to "Yes"

.. image:: images/enable-pop-up.*
   :align: center
   :width: 80%
   :alt: An image of the radio button enabling the Copyright statement

3. Now, in the text-box below, you can add the content you would like to see
   appear in your copyright statement. Content added here will be rendered
   similar to a :term:`static page` - that is, you can add HTML to style and
   structure the content. For tips on working with HTML in static pages, see:
   :ref:`styling-static-page`. You can also drag the bottom of the text-box
   down to expand it, if you need more room to work.

.. image:: images/copyright-pop-up-configured.*
   :align: center
   :width: 80%
   :alt: An image of the Copyright statement, with user-added text and HTML

4. As you add your custom content, you can preview your work at any time to
   see how it will be rendered in the copyright pop-up page. Click the
   "Preview" button below the text-box: AtoM will open a new tab in your
   browser, with a preview of the rendered Copyright statement. It will differ
   from an actual copyright statement in 3 ways:

   * At the top of the preview tab, a message in a blue box indicates this is
     the "Copyright statement preview"
   * Where the title of the related :term:`archival description` would
     normally appear, the preview tab will only say "Untitled"
   * The "Agree" button in the :term:`button block` on the preview page will
     be disabled - normally users who click "Agree" will be taken to the
     related :term:`master digital object`.

.. image:: images/copyright-pop-up-preview.*
   :align: center
   :width: 80%
   :alt: An example of the Copyright statement preview page

5. Clicking "Close" in the copyright statement preview tab will close the tab.
6. If you want the copyright pop-up to apply globally to all digital objects, 
   there is an additional setting below - Set the "Apply to gevery digital 
   object" radio button to "Yes":

.. image:: images/copyright-pop-up-global.*
   :align: center
   :width: 80%
   :alt: The setting to make the copyright pop-up apply globally

7. When you are done configuring your copyright statement, don't forget to
   scroll down and click the "Save" button in the :term:`button block` at the
   bottom of the page.

There are some additional configuration steps required for the copyright 
pop-up to be properly applied - see below for more information. 

.. _copyright-pop-up-apply:

Applying the Copyright statement pop-up
---------------------------------------

Now that you have enabled and configured the Copyright statement, there are
still other conditions that must be met before your copyright statement will
be seen:

* Users must be granted sufficient :term:`access privileges <access
  privilege>` to access the :term:`master digital object`.
* The :term:`digital object` must be uploaded locally, **not** linked via a web
  address or URL (i.e. from an external site).
* If you are not using the "Apply to every digital object" setting, then there
  there is also an additional condition: a Rights statement with a Copyright 
  basis and the Restriction set to "Conditional" must be attached to the 
  associated :term:`archival description.`

**Step 1: Granting sufficient access**

For users to be able to see the Copyright statement, they must first have
access to the :term:`master digital object`. By default, the "anonymous" group
in AtoM's permissions module (e.g. a :term:`researcher` or public user who is
not logged into the application) does **not** allow public users to view the
master digital object - so you must change this setting from "Inherit" to
"Allow" in |gears| **Admin > Groups > Anonymous > Archival description
permissions**:

.. image:: images/copyright-pop-up-acl.*
   :align: center
   :width: 80%
   :alt: Changing the default permissions for public users to allow access to
         the master digital object via Admin > Groups

.. TIP::

   For more information on working with Users and Groups in AtoM, see:
   :ref:`manage-user-accounts`. For more information on configuring the
   permissions for Users and Groups, see: :ref:`edit-user-permissions`.

If you are using the "Apply to every digital object" setting for the copyright 
pop-up, then nothing else needs to be done. Otherwise, there are additional
steps to configure so that the copyright pop-up will only be selectively 
applied: 

You will also need to ensure that the PREMIS Rights permissions you have
configured in |gears| **Admin > Settings > Permissions** will allow your users
to access the :term:`master digital object` when the Basis is "Copyright" and
the Restriction is "Conditional":

.. image:: images/copyright-pop-up-permissions.*
   :align: center
   :width: 80%
   :alt: Changing the default PREMIS permissions for Copyright

.. TIP::

   For more information on configuring the PREMIS permissions, see above,
   :ref:`rights-digital-object`.

Now public users will have enough rights to access the master digital objects.
If there are some masters to which you do not wish to grant access, you can
always apply a PREMIS right with the Restriction "Disallow", and configure the
permissions settings accordingly (see :ref:`above <rights-digital-object>` for
further details on configuration). For the copyright pop-up statement to be
presented, we still have to apply the appropriate Rights to related
:term:`archival descriptions <archival description>`.

**Step 2 - Applying the appropriate PREMIS rights (selective copyright pop-up)**

.. NOTE::

   These requirements only apply when using the copyright pop-up selectively. 
   If you have used the "Apply to every digital object" setting, then no
   associated Rights statement is required - the copyright pop-up will always
   be displayed before users are granted access to locally stored 
   :term:`master digital objects <master digital object>`.

Unless the global setting is used, the Copyright statement is only triggered 
when specific PREMIS rights have been associated with the 
:term:`archival description` to which the :term:`digital object` is attached:

* **Act**: Whichever act you have chosen to be actionable in |gears| **Admin >
  Settings > Permissions**. See :ref:`above <rights-digital-object>` for
  further details on configuration.
* **Basis**: Must be "Copyright"
* **Restriction:** Must be "Conditional"

For example, if you have set "Display" as the Act in the Permissions settings,
then the following rights statement, when applied to an
:term:`archival description` with a :term:`digital object` attached, will
trigger the copyright statement:

.. image:: images/example-conditional.*
  :align: center
  :width: 60%
  :alt: Example rights records when displayed is Conditional

For further guidance in applying actionable PREMIS rights to archival
descriptions with associated digital objects, see the section above,
:ref:`rights-archival-description`. For an example use case, see:
:ref:`rights-digital-object-example`.

:ref:`Back to top <rights>`

.. _manage-rights-holders:

Manage Rights holders records
=============================

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
