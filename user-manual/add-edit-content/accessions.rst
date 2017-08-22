.. _accession-records:

==========
Accessions
==========

.. |manage| image:: images/edit-sign.png
   :height: 17
   :width: 17

.. |gears| image:: images/gears.png
   :height: 17
   :width: 17

Accessions form an important first step in gaining physical and intellectual
control over the resources held by an :term:`archival institution` or other
form of :term:`repository`. "Accession" tends to be used as both a noun and a
verb - here are some definitions adapted from the `SAA Glossary
<http://www2.archivists.org/glossary/terms/a/accession>`__:

* *An accession* is made up of materials physically and legally transferred
  to a :term:`repository` as a unit, which will be processed by staff and added
  to the institutions' holdings. In AtoM, an accession implies the first
  deposit of materials - accessions added to an existing :term:`fonds` or
  :term:`collection` are known as :term:`accruals <accrual>`.
* *To accession* something is to take legal and physical custody of a group of
  :term:`records <record>` or other materials and to formally document their
  receipt. This helps maintain the chain of custody over the records required
  to maintain their authenticity over time.

The :term:`accession record` is the means by which the accessioning process is
documented - an accession record is an administrative and descriptive document
that summarizes standard information about the process of transferring
materials to a repository, including information about the provenance,
contents and legal and physical transfer of the records such as, rights and
restrictions. It often precedes arrangement and description, and can be used
as the basis for the creation of an :term:`archival description` once the
materials have been arranged.

**Below are instructions for using the Accessions module in AtoM to:**

* :ref:`Add a new accession record <add-new-accession>`

  * :ref:`Add a donor <add-accession-donor>`
  * :ref:`Add rights to an accession record <add-accession-rights>`
  * :ref:`Link an accession record to an archival description
    <link-accession-description>`
  * :ref:`View the accession record <view-accession>`

* :ref:`Edit an existing accession record <edit-accession-record>`
* :ref:`Add an accrual <add-accession-accrual>`
* :ref:`Add a legacy accession record <add-legacy-accession>`
* :ref:`Create an archival description from an accession record
  <create-accession-description>`
* :ref:`Delete an accession record <delete-accession-record>`

.. NOTE::

   You must have a :term:`user account` with sufficient edit
   permissions to access the accessions module of AtoM, such as an
   :term:`administrator` or :term:`editor`. For more information on types of
   users and edit permissions, see :ref:`User roles <user-roles>`.

.. seealso::

   * :ref:`Searching for accession records <dedicated-search-accessions>`
   * :ref:`Add a new deaccession record <add-deaccession-record>`
   * :ref:`Edit an existing deaccession record <edit-deaccession-record>`
   * :ref:`Delete a deaccession record <delete-deaccession-record>`
   * :ref:`archival-descriptions`
   * :ref:`settings`
   * :ref:`donors`

.. _add-new-accession:

Add a new accession record
==========================

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

1. In the :term:`main menu` located in the :term:`header bar`, click the |plus|
   :ref:`"Add" <main-menu-add>` menu and select "Accession records" from the
   :term:`drop-down menu`.

.. image:: images/add-accession.*
   :align: center
   :width: 30%
   :alt: An image of of the Add menu in AtoM

2. AtoM takes you to an accession record :term:`edit page` screen for data
   entry. If you have the Accession mask enabled, then the Accession number
   field will be automatically assigned a Unique ID based on the mask settings
   - for more information, see: :ref:`accession-mask`. If the mask setting is
   turned off, the field will be empty. Add a unique value to the Accession
   number field or make edits to the pre-populated one as needed.

.. image:: images/new-accession-edit.*
   :align: center
   :width: 90%
   :alt: An image of the accessions edit page

.. TIP::

   :term:`Administrators <administrator>` can turn the accession mask on
   or off, and alter the default accession mask and counter (from which the
   accession number is generated) by navigating to |gears| **Admin > Settings
   > Accession mask**. For more information, see: :ref:`accession-mask` in
   :ref:`settings` - see also the example provided in the section on altering
   the accessions mask for legacy accessions, :ref:`below <alter-accession-mask>`.

   .. image:: images/accession-mask.*
      :align: center
      :width: 90%
      :alt: An image of the accessions mask in Global settings

3. If you attempt to use a value for the Accession number that is not unique
   (i.e. is already in use by another :term:`accession record`), AtoM will
   provide a warning, and will not allow the record to be saved until the
   Accession number is edited and a unique value is added.

.. image:: images/accession-id-warning.*
   :align: center
   :width: 80%
   :alt: An image of the accession number warning

4. The accession record edit template provides a variety of field types for
   data entry (e.g., calendar, free-text, pop-up dialogs and :term:`drop-downs
   <drop-down menu>`). Remember to click on each :term:`information area` to
   access the data entry fields grouped under it. Enter data as required
   (further information on filling out specific parts of the accession record
   is included below).
5. Click the "Create" button in the :term:`button block` to create and save
   the new :term:`accession record`. If you do not want to keep the record you
   can click the "Cancel" button and remove the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 75%
   :alt: An image of the accession button block

:ref:`Back to top <accession-records>`

.. _add-accession-donor:

Add a donor
-----------

In the Edit accession record screen, under the Donor/Transferring body area
you can enter the names and contact information for related donors using the
:term:`donor dialog`. Click the "Add new" button to open the Donor dialog and
add a new donor.

.. image:: images/accession-donor-add.*
   :align: center
   :width: 70%
   :alt: An image of the donor Area in the Accessions edit template

In the :term:`donor dialog` that will pop-up, the Name :term:`field` at the
top of the dialog is an autocomplete field. To link to an existing donor
record, begin typing the name of the related Donor into the Name field - as
you type, matches will appear in a :term:`drop-down menu` below the field and
you can click on a name there to select it. Alternatively, you can create a
new donor record by typing a new name, and completing the other related fields
in the Donor dialog.

.. image:: images/accession-donor-dialog.*
   :align: center
   :width: 90%
   :alt: An image of the donor dialog in the accession edit template

Fields in the donor dialog are organized into 3 tabs - Main, Physical
location, and Other details. Be sure to click on each tab and
complete the related fields in the dialog as needed. Fields available in the
:term:`donor dialog` include:

* **Name** - an autcomplete field where you can link to an existing donor
  record or enter a new name to create a new donor record.
* **Main tab:**

  * Contact person
  * Telephone
  * Fax
  * Email
  * URL

* **Physical location tab:**

  * Street address
  * Region/province
  * Country
  * Postal code
  * City
  * Latitude
  * Longitude

* **Other details tab:**

  * Contact type
  * Note

When new information is entered into the :term:`donor dialog`, a new Donor
record is created. Alternatively, if you have selected an existing donor
using the autcomplete values in the Name field, you can edit the existing
contact information.

Donor records can be accessed via the :term:`main menu` by navigating to
|manage| **Manage > Donors**.

.. TIP::

   Donor records can be created and managed separately from :term:`accession
   records <accession record>`. For a full explanation of donors, go to the
   :ref:`donors` page

:ref:`Back to top <accession-records>`

.. _add-accession-rights:

Add rights to an accession record
---------------------------------

After an accession record is created, you may add a rights record to it by clicking
"More" then "Create new rights in the :term:`button block`.

.. image:: images/accessions-rights-add.*
   :align: center
   :width: 70%
   :alt: Rights entry form accessed in the button block

The rights entry page will appear. Multiple rights basis and granted rights can
be added. For a full explanation of rights, go to the :ref:`rights` page.

.. image:: images/accession-rights-dialog.*
   :align: center
   :width: 70%
   :alt: An image of the rights entry page accessed from the accessions edit page

:ref:`Back to top <accession-records>`

.. _link-accession-description:

Link an accession record to an archival description
---------------------------------------------------

Users have the option of linking a new :term:`accession record` with an
existing :term:`archival description` in the AtoM database. The  Archival
description :term:`information area` is located at the bottom of the accession
record :term:`edit page`.

.. image:: images/accession-link-description.*
   :align: center
   :width: 70%
   :alt: The link archival description area in the accession template

Placing the cursor in the data :term:`field` will activate a drop-down list of
all archival descriptions entered into the database. The User selects the
appropriate :term:`archival description` by moving through the list (a blue
highlight will indicate which record you are selecting). Then Save the record
by clicking "Save" in the :term:`button block` at the bottom of the accession
:term:`edit page`.

.. image:: images/accession-link-description2.*
   :align: center
   :width: 70%
   :alt: The link archival description area in the accession template

.. TIP::

   Users can link an :term:`accession record` to a
   :term:`fonds`/:term:`collection` level :term:`archival description` or
   lower :term:`levels of description <level of description>` including sous-
   fonds, series, sub-series, and files. You can link to multiple archival
   descriptions as needed by repeating the steps above.

:ref:`Back to top <accession-records>`

.. _view-accession:

View the accession record
-------------------------

After creating an :term:`accession record`, save your new data by clicking
"Save" in the :term:`button block` at the bottom of the accession record
:term:`edit page` (A user also has the option of clicking "Cancel", but all
data entered will be lost), you can review the data in the accession record
:term:`view page`.

Notice that the linked :term:`archival description` is now presented as a
hyperlink in the :term:`accession record`.

.. image:: images/accession-description-link.*
   :align: center
   :width: 70%
   :alt: A link to a description generated from an accession

In the :term:`button block` at the bottom of the screen you have the option(s)
to:

* :ref:`Edit the accession record <edit-accession-record>`
* :ref:`Add an accrual to the accession <add-accession-accrual>`
* :ref:`Create an archival description from the accession
  <create-accession-description>`
* :ref:`Delete an accession record <delete-accession-record>`
* Under the "More button" you have the option to :ref:`add-rights-accession`

.. image:: images/accession-button-block.*
   :align: center
   :width: 70%
   :alt: The button block on an accession view page

.. TIP::

   You can always return to your :term:`accession record` later via the
   :term:`main menu`, by navigating to |manage| **Manage > Acessions** and
   selecting a record from the accessions :ref:`browse page <page-type-browse>`

:ref:`Back to top <accession-records>`

.. _edit-accession-record:

Edit an existing accession record
=================================

Existing :term:`accession records <accession record>` can be upated at any
time by a logged-in user with edit privileges.

1. Navigate to the record you want to edit. You can do this via the
   :term:`main menu` in the AtoM :term:`header bar`, by clicking on |manage|
   **Manage > Accessions**. For more information on navigation in AtoM, see:
   :ref:`Access content <access-content>`

2. AtoM will redirect you to the accession record :ref:`browse page
   <page-type-browse>`. Select the record you want by clicking on the
   hyperlink Identifier. You can also search for an :term:`accession record`
   with the accession records :term:`search box` located at the bottom of the
   browse page. For more information on searching for :term:`accession records
   <accession record>` in AtoM, see: :ref:`Searching for accession records
   <dedicated-search-accessions>`.

.. image:: images/accession-browse.*
   :align: center
   :width: 70%
   :alt: The accession record browse page

.. TIP::

   :term:`Archival descriptions <archival description>` that are created from
   an :term:`accession record` will have a hyperlink to their related
   accession record. The hyperlink is located in the "Accession"
   :term:`information area` at the bottom of the archival description
   :term:`view page`.

   .. image:: images/accession-area.*
      :align: center
      :width: 70%
      :alt: A link to a related accession in an archival description

   Logged-in users with permissions can select the hyperlink accession record
   identifier and AtoM will take them to the related accession record
   :term:`view page`. Unauthenticated users (i.e. those who are not logged in)
   will not be able to see the Accessions area; logged-in Users without
   permissions can see the hyperlink but cannot access the :term:`accession
   record`.

3. Once you have selected an :term:`accession record`, you will be redirected
   to the selected record's :term:`view page`. To enter edit mode, you can
   either click the "Edit" button in the :term:`button block` at the bottom of
   the :term:`view page`, or click on any of the :term:`information area`
   headings in the accession record. The accession record will reload in edit
   mode.

.. image:: images/accession-button-block.*
   :align: center
   :width: 70%
   :alt: The button block on an accession view page

4. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it.

5. Add or edit data as required

6. To **discard** all changes, click the "Cancel" button in the :term:`button
   block`; AtoM returns you to the :term:`view page`, with no changes saved.

7. To **save** your changes, click the "Save" button in the :term:`button
   block`. AtoM will reload the page in view mode, with all changes saved, so
   you can review your work.

:ref:`Back to top <accession-records>`

.. _add-accession-accrual:

Add an accrual
==============

An accrual is "an acquisition additional to a unit of description  already
held by a :term:`repository`" (ISAD glossary). AtoM users with edit
permissions can add an accrual to an existing :term:`accession record`. To do
so:

1. Navigate to the :term:`accession record` to which you would like to add an
   :term:`accrual`. Instructions on how to do so are outlined above in
   :ref:`Edit an existing accession record <edit-accession-record>`.

2. When you have selected the :term:`accession record`, scroll to the bottom
   of the :term:`view page` and click the "Add accrual" button in the
   :term:`button block`.

.. image:: images/accession-button-block.*
   :align: center
   :width: 70%
   :alt: The button block on an accession view page

3. You will be redirected to an accession record :term:`edit page`, but but at
   the top of the edit template a message will read: **"You are creating an
   accrual of the accession YYY-MM-DD/#."** (where YYYY-MM-DD/# represents the
   Accession number to which you are adding an accrual)

.. image:: images/add-accrual-message.*
   :align: center
   :width: 70%
   :alt: The message at the top of a new accrual record

4. The edit template provided for the :term:`accrual` is the same as that of a
   new :term:`accession record`. Add data as required. See :ref:`Add a new
   accession record <add-new-accession>` above for more information on working
   with the accession record template.

5. After completing the new :term:`accrual` information in the :term:`edit
   page`, click on "Create" in the :term:`button block` at the bottom of the
   page. Your new data will be saved, and you will be redirected to a
   :term:`view page` where you can review your work.

6. When viewing the :term:`accession record` for the :term:`accrual`, you will
   notice that in the Administrative :term:`information area` an "Accrual to"
   data field shows the related original accession record. The data is a
   hyperlink that can be clicked to navigate to the original :term:`accession
   record`.

.. image:: images/accession-accrual-to.*
   :align: center
   :width: 70%
   :alt: A link to the original accession on an accrual

7. Alternatively, if a User views the original :term:`accession record`, in
   the Administrative area an "Accruals" data field shows the related
   :term:`accrual`.

.. image:: images/accession-accruals.*
   :align: center
   :width: 70%
   :alt: A link to related accruals on an accession

.. NOTE::

   An :term:`accrual` cannot be added to an accrual - it must belong to the
   original accession record. Therefore, If a User views the accession record
   of an accrual, the "Add accrual" button is not available in the
   :term:`button block`. If the accession record is an original however, the
   "Add accrual" button is available in the :term:`button block`. There is no
   limit to how many accruals can be added to an original
   :term:`accession record`.

:ref:`Back to top <accession-records>`

.. _add-legacy-accession:

Add a legacy accession record
=============================

Users who have recently migrated to AtoM, or are catching up on a backlog of
accessions, may need to add new :term:`accession records <accession record>`
that have older dates encoded in the accession number. There are several ways
this can be done in AtoM - however, the first two require that a user have
:term:`administrator` access to the application.

Method 1: CSV Import
--------------------

AtoM offers :term:`administrators <administrator>` the ability to import data
in multiple formats including CSV (comma separated value) import. Accession
records can be imported via CSV using the Accession record CSV template
provided for users on the AtoM wiki; further instructions are included on the
:ref:`CSV import <csv-import>` page. The accessions CSV import method has no
restrictions on the accession number formatting - consequently,
users can import multiple legacy accession records at once using this method.

* For more information on importing descriptions and terms via CSV in this
  manual, see: :ref:`CSV import <csv-import>`

.. _alter-accession-mask:

Method 2: Altering the Accessions mask
--------------------------------------

Users interested in creating an :term:`accession record` that has a legacy
accession number associated with it via the AtoM :term:`user interface`, can
do so by first editing the  Accessions mask in the **Admin > Settings >
Global** area, and then creating a :ref:`new accession record
<add-new-accession>`.

.. image:: images/accession-mask.*
   :align: center
   :width: 70%
   :alt: An image of the accessions mask in Global settings

By default, AtoM creates the accession record identifier as a unique number
compiled from [**YEAR MONTH DAY Incremental#**] - this is denoted in the
Global settings "Accession mask" as *%Y-%m-%d/#i*. A fixed value can be
entered for any of the date variables (year, month, day) used in the accession
mask, to create a number of legacy accessions from the same year and month,
for example.

**EXAMPLE**

To create a number of accessions from October 1998, an :term:`administrator`
could edit the Accession mask like so: **1998-10/#i**

If the changes are saved in |gears| **Admin > Settings > Global**, then when a
user next creates a :ref:`new accession record <add-new-accession>`, the
accession number will read:

* 1998-10/1

And the following accession record's identifier (accession number) will read:

* 1998-10/2

.. warning::

   These changes will stay in effect until an :term:`administrator` returns
   to the global settings menu via |gears| **Admin > Settings > Global** and
   returns the Accession mask to the default setting. Don't forget to do
   this, or all your new accessions will appear to be legacy accessions!

.. _disable-accession-mask:

Method 3: Disabling the Accessions mask
---------------------------------------

The accessions mask is provided to help users apply consistent and unique
identifiers to accessions. Users always have the ability to edit the
pre-populated values provided by the accessions mask when creating a
:ref:`new accession record <add-new-accession>`.

However, when working with legacy accessions, it may be easier to simply
disable the accessions mask, and manually populate the Accession number field.
An :term:`administrator` can do this via |gears| **Admin > Settings** - for
more information, see: :ref:`accession-mask` in :ref:`settings`.

.. image:: images/accession-mask.*
   :align: center
   :width: 90%
   :alt: An image of the accessions mask in Global settings

Note that, even with the Accessions mask disabled, AtoM will still attempt
to enforce unique Accession number values. If you attempt to use a value for
the Accession number that is not unique (i.e. is already in use by another
:term:`accession record`), AtoM will provide a warning, and will not allow the
record to be saved until the Accession number is edited and a unique value is
added.

.. image:: images/accession-id-warning.*
   :align: center
   :width: 80%
   :alt: An image of the accession number warning

:ref:`Back to top <accession-records>`

.. _create-accession-description:

Create an archival description from an accession record
=======================================================

After you create a :ref:`new accession record <add-new-accession>`, you can
create an :term:`archival description` by clicking on the button "Create
Archival description" in the :term:`button block`.

Archival descriptions can be generated from an :term:`accession record` at
any time; it does not have to be at the time of creation. To create an
:term:`archival description` from an existing accession record, follow the
first steps outlined in :ref:`Edit an existing accession record
<edit-accession-record>` to browse existing accession records and select the
one that you would like to use.

The accession record is not aimed at end-user description, but AtoM provides
the option to create an archival description from an accession record to
prevent uneccessary re-entry of existing data an improve a user's workflow.
The following archival description :term:`fields <field>` inherit the data
entered into the :term:`accession record`:

* Title
* Name of creator(s)
* Archival/custodial history
* Scope & content
* Physical condition

Name access points (drawn from creators) and Rights added to the accession
record are also inherited into the archival description.

When you navigate to the :term:`accession record` you want to work with:

1. Scroll to the bottom of the accession record's :term:`view page`.
2. Click the "Create archival description" button located in the
   :term:`button block`.

.. image:: images/accession-button-block.*
   :align: center
   :width: 70%
   :alt: The button block on an accession view page

3. AtoM will generate an :term:`archival description` using the fields listed
   above, and then will take you to the new description's :term:`view page`.
   You can see that the data you entered into the accession record fields:
   title, name of creator, archival/custodial history, scope & content and
   physical condition are all inherited into the archival description. If you
   added rights to the accession they are also inherited.
4. The new :term:`archival description` is saved as a :term:`draft record` -
   the title of the new description is derived from the data entered into the
   title :term:`field` of the originating :term:`accession record`.
5. The :term:`archival description` can now be edited by clicking on the
   "Edit" button in the :term:`button block` at the bottom of the
   description's :term:`view page`. For more information on editing an
   archival description, see: :ref:`edit-archival-description`.
6. A link to the original :term:`accession record` is maintained in the
   Accession :term:`information area` in the archival description. Similarly,
   a link to the archival description is added to the related :term:`accession
   record`. These are hyperlinks; clicking them in either record will take the
   user to the related record.

.. image:: images/accession-area.*
   :align: center
   :width: 70%
   :alt: A link to the related accession on an archival description

.. NOTE::

   Logged-in users with permissions can select the hyperlink accession record
   identifier and AtoM will take them to the related accession record
   :term:`view page`. Unauthenticated users (i.e. those who are not logged in)
   will not be able to see the Accessions area in the archival
   description, and they will not be able to access the Accessions module;
   logged-in Users without permissions can see the hyperlink but cannot
   access the :term:`accession record`.

:ref:`Back to top <accession-records>`

.. _delete-accession-record:

Delete an accession record
==========================

To delete an :term:`accession record` in AtoM:

1. Navigate to the accession record you want to delete. You can locate all
   accessions in AtoM by clicking on "Manage" in the :term:`main menu`
   (located in the AtoM :term:`header bar`) and selecting "Accessions" from
   the :term:`drop-down menu`. For more information on navigation in AtoM, see
   :ref:`Access content <access-content>`. For more information on locating
   :term:`accession records <accession record>` in AtoM, see the :ref:`Edit an
   existing accession record <edit-accession-record>` section above.
2. Scroll to the bottom of the selected accession record's :term:`view page`,
   where the :term:`button block` is located.

.. image:: images/accession-button-block.*
   :align: center
   :width: 70%
   :alt: The button block on an accession view page

3. If you click on the "Delete" button, AtoM will offer a warning. If the
   accession has accruals associated with it this will be noted in the warning
   message - accruals will not be deleted with an accession, and must be
   deleted separately
4. If you choose to proceed and click "Confirm" the entire accession record
   will be **permanently deleted**. Clicking "Cancel" will return a user to
   the :term:`accession record` :term:`view page`.

.. NOTE::

   Instead of permanently deleting an :term:`accession record` we recommend
   creating a :term:`deaccession record`. This way all records created by the
   :term:`archival institution` or :term:`repository` can be preserved for
   future reference.

   For more information on creating a deaccession record, see:
   :ref:`Add a new deaccession record <add-deaccession-record>`


:ref:`Back to top <accession-records>`
