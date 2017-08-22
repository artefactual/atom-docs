.. _donors:

=============
Donor records
=============

The `SAA Glossary <http://www2.archivists.org/glossary>`__ defines a donor as
"*An individual or organization who gives property or money to another without
reciprocal compensation,*" adding that in many instances, "*individuals who
donate collections are not the provenance of the collection.*" This implies
that a donor is not nessarily the :term:`creator` of the materials being
donated to a :term:`repository` - rather, they are the last legal custodian of
the records before they are passed to a :term:`repository` for long-term
preservation.

In AtoM, donor records can be used more generically than the SAA Glossary
defintion - they can be used to manage records of all individuals who supply
records and other materials to a repository, whether freely or with the
expectation of compensation. Donor records are a way to maintain a record of
the provenance of :ref:`accessions <accession-records>`, so that donors can be
contacted in the future if necessary. Donor records can be created
independently; more often they are added while creating an :term:`accession
record` via the :term:`donor dialog` that is available in the accession record
edit template.

.. image:: images/view-donor.*
   :align: center
   :width: 75%
   :alt: An image of an example Donor record

**Below are instructions for using the Donors module in AtoM to:**

* :ref:`Add a new donor record <add-donor-record>`
* :ref:`Edit an existing donor record <edit-donor-record>`
* :ref:`Link a donor record to an accession <link-donor-accession>`
* :ref:`Delete a donor record <delete-donor-record>`

.. seealso::

   * :ref:`Accessions <accession-records>`

.. _add-donor-record:

Add a new donor record
======================

In AtoM, there are currently 2 ways to add a new Donor record:

* :ref:`Using the donor dialog in the accessions template
  <add-donor-via-accession>`
* :ref:`From another donor record <add-donor-via-donor>`

.. TIP::

   Want a quicker way to add a new donor? AtoM menus are customizable; you
   can add a link to Donors in the :term:`main menu` under **Add > Donor**.
   To do so, you will require an :term:`administrator` account - navigate to
   **Admin > Menus**, and click the "Add new" button at the bottom of the
   page. Add the following information to each field in the menu template:

   * **Name:** addDonor
   * **Label:** Donor
   * **Parent:** --add
   * **Path:** donor/add

   A link to a new Donor record edit template will now appear in the
   :term:`main menu` under **Add > Donor**. For more information on working
   with menus in AtoM, see: :ref:`Manage menus <manage-menus>`.


.. _add-donor-via-accession:

Using the donor dialog in the accessions template
-------------------------------------------------

1. Begin creating a new :term:`accession record`, or navigate to an existing
   accession record and enter :term:`edit mode`. Please see the
   :ref:`Accession records <accession-records>` page for more information on
   :ref:`creating a new accession <add-new-accession>` or
   :ref:`editing an existing accession record <edit-accession-record>`.

.. image:: images/manage-accessions.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu

2. In the :term:`accession record` :term:`edit page`, Navigate to the
   "Donor/Trasferring body" :term:`information area` and click the "Add new"
   button.

.. image:: images/add-new-donor.*
   :align: center
   :width: 75%
   :alt: An image of the Donor/Transferring body area in an accession

3. A dialog will pop up and you can enter the names and contact information
   for related donors using the :term:`donor dialog`. The dialog allows you
   to include the donor name and give an alternative contact person. Enter
   data as required.

.. image:: images/accession-donor-dialog.*
   :align: center
   :width: 90%
   :alt: An image of the donor dialog in the accession edit template


4. Fields in the donor dialog are organized into 3 tabs - Main, Physical
   location, and Other details. Be sure to click on each tab and
   complete the related fields in the dialog as needed. Fields available in
   the :term:`donor dialog` include:

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

5. Once you have completed entering the donor information, click on the
   "Submit" button to save and return to the :term:`accession record` edit
   template.

.. image:: images/donor-dialog-submit.*
   :align: center
   :width: 65%
   :alt: An image of the Submit button in the donor dialog

5. You can add multiple donors to a single accession record by repeating steps
   2-4 if desired. If you need to edit the donor information, click the
   pencil icon next to the donor name in the "Donor/Transferring body area"
   of the accession record's :term:`edit page`; the :term:`donor dialog` will
   re-open and you can make changes. Clicking the "**X**" icon next to a
   donor name in the "Donor/Transferring body area" will remove the Donor
   from the :term:`accession record`.

.. image:: images/donor-area-populated.*
   :align: center
   :width: 75%
   :alt: An image of the Donor/Transferring body area in the accession record

6. Continue adding and/or editing data in the accession record as needed. When
   you are finished, click the "Create" (if you are creating a new accession
   record) or "Save" (if editing an existing accession record) button in the
   :term:`button block` of the accession record to complete adding the new
   donor.

.. image:: images/button-block-create.*
   :align: center
   :width: 65%
   :alt: An image of the button block

7. AtoM will exit :term:`edit mode` and take you to the :term:`accession
   record` :term:`view page`. The related Donor's name will appear as a
   hyperlink in the "Donor/Transferring body" :term:`information area` of the
   :term:`accession record`. You can click the hyperlink to navigate to the
   related Donor record. Alternately, you can view all donor records via the
   :term:`main menu` by navigating to **Manage > Donors**.

.. _add-donor-via-donor:

From another donor record
-------------------------

Depending upon your workflow, you might want to add donors to AtoM during the
accession process or you might want to add donors to AtoM as a separate
process. The first approach (:ref:`above <add-donor-via-accession>`) is the
easiest and most logical. This second approach requires you to create the
donor and then add the donor to the accession record - this approach also
requires that you have donors existing in the database, otherwise you cannot
browse the list and "add a new" donor.

1. In the :term:`main menu` (located in AtoM's :term:`header bar`), navigate
   to **Manage > Donors**.
2. AtoM takes you to a Browse menu listing all Donor records. Click on the
   hyperlink of an existing Donor name.

.. image:: images/browse-donors.*
   :align: center
   :width: 75%
   :alt: An image of the Donors browse page

3. AtoM takes you to the Donor record :term:`view page`. At the bottom of the
   record, click on the "Add new" button in the :term:`button block`.

.. image:: images/donor-example.*
   :align: center
   :width: 75%
   :alt: An image of a Donor view page

4. AtoM will redirect you to a blank Donor record in :term:`edit mode`. Enter
   the new donor name and select "Add new" under the contact area to enter
   contact information about your new donor. Click "Submit" to close the
   contact information dialog and return to the donor record. When you are
   finished adding data, click on the :term:`Create button` in the
   :term:`button block` to save the new Donor record.

.. image:: images/new-donor.*
   :align: center
   :width: 75%
   :alt: An image of a new blank Donor record in edit mode

5. If you want to link the new Donor record to an accession record, see below,
   :ref:`Link a donor record to an accession <link-donor-accession>`.

:ref:`Back to top <donors>`

.. _edit-donor-record:

Edit an existing donor record
=============================

1. Using the :term:`main menu` located in the AtoM :term:`header bar`,
   navigate to **Manage > Donors**.
2. AtoM takes you to a Browse menu listing all Donor records. With a long list
   (multiple pages) of donors, you can type the donor name into the
   dedicated search box, to locate a name quickly and avoid scrolling through
   numerous pages. You can also sort the list of Donors alphabetically, or by
   most recently updated.

.. image:: images/browse-donors.*
   :align: center
   :width: 75%
   :alt: An image of the Donors browse page

3. When you have located the Donor record you wish to edit in the Browse page,
   click on the hyperlinked Donor name.
4. AtoM takes you to the Donor record :term:`view page`. Click the "Edit"
   button in the :term:`button block` located at the bottom of the record.

.. image:: images/donor-example.*
   :align: center
   :width: 75%
   :alt: An image of a Donor view page

5. AtoM will open the Donor record in :term:`edit mode`. Add/revise data as
   required. You can edit existing information in the Contact
   :term:`information area` by clicking on the pencil icon - AtoM will open
   the contact dialog. ***Note that there are three tabs** in the Contact
   dialog for data entry - make changes or additions as required. To close the
   Contact dialog and save your changes, click the "Submit" button. Note that
   your changes will not be saved until you save the Donor record.

.. image:: images/edit-donor.*
   :align: center
   :width: 75%
   :alt: An image of a Donor edit page

6. When you have made all necessary changes, click "Save" in the
   :term:`button block`.

.. image:: images/button-block-save.*
   :align: center
   :width: 65%
   :alt: An image of the button block in edit mode

7. After saving the Donor record, AtoM takes you to the Donor record
   :term:`view page` where you can review your changes.

.. TIP::

   If your Donor record is linked to an :term:`accession record`, you can also
   arrive at a Donor record for editing by navigating to the related
   :term:`accession record` and clicking on the Donor name in the
   "Donor/Transferring body" :term:`information area` - AtoM will redirect
   you to the related Donor record. Follow steps 4-7 above. For more
   information on locating accession records see: :ref:`Edit an existing
   accession record <edit-accession-record>` and :ref:`access-content`.

:ref:`Back to top <donors>`

.. _link-donor-accession:

Link a donor record to an accession
===================================

Donor records created independently of accessions can be linked to an
accession at a later date; a single donor can also be related to multiple
accessions, and multiple donors can be related to a single accession.
At this time, however, **this linking cannot be done from the Donor record**
- instead, you will have to create the link from the :term:`accession record`
that you would like to associate with the donor. To do so:

1. Navigate to the :term:`accession record` you want to link to a donor
   record. You can do this via the :term:`main menu` in the AtoM :term:`header
   bar`, by clicking on **Manage > Accessions**. For more information on
   navigation in AtoM, see: :ref:`Access content <access-content>`

.. image:: images/manage-accessions.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu

2. AtoM will redirect you to the accession record :ref:`browse page
   <page-type-browse>`. Select the record you want by clicking on the
   hyperlink Identifier. You can also search for an :term:`accession record`
   with the accession records :term:`search box` located at the top of the
   browse page. For more information on searching for :term:`accession records
   <accession record>` in AtoM, see: :ref:`Searching for accession records
   <dedicated-search-accessions>`

.. image:: images/accession-search-wildcard.*
   :align: center
   :width: 75%
   :alt: An image of searching for an accession record

3. Once you have selected an :term:`accession record`, you will be redirected
   to the selected record's :term:`view page`. To enter :term:`edit mode`, you
   can either click the "Edit" button in the :term:`button block` at the
   bottom of the :term:`view page`, or click on any of the :term:`information
   area` headings in the accession record. The accession record will reload in
   edit mode.

.. image:: images/accession-button-block.*
   :align: center
   :width: 65%
   :alt: An image of the button block on an acccession record

4. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it.
5. In the :term:`accession record` :term:`edit page`, Navigate to the
   "Donor/Trasferring body" :term:`information area` and click the "Add new"
   button.

.. image:: images/add-new-donor.*
   :align: center
   :width: 75%
   :alt: An image of the Donor/Transferring body area in an accession

6. The :term:`donor dialog` will appear. Place your cursor in the "Name"
   :term:`field` of the donor dialog, and begin typing the name of the related
   donor. The name :term:`field` is an auto-complete - as you type, matching
   results will load in a :term:`drop-down menu` below the field. When you see
   the donor name you would like to link, click on it to select it.

.. image:: images/accession-donor-dialog.*
   :align: center
   :width: 90%
   :alt: An image of the donor dialog in the accession edit template

.. IMPORTANT::

   This method makes use of  an `auto-complete <https://en.wikipedia.org/wiki
   /Auto-complete>`__ field to find the related donor record as
   you begin to type its name/title. **Be sure** to pick the record from the
   :term:`drop-down <drop-down menu>` when it appears - if you type the full
   name and press enter, a new donor record will be generated
   instead of a link being created to an existing one!

   .. image:: images/donor-autocomplete.*
      :align: center
      :width: 55%
      :alt: An image of the Donor dialog using autocomplete

7. If the related Donor record already has the correct contact information,
   you do not need to add it to the remaining fields in the
   :term:`donor dialog` - it will appear in the related fields when you select
   the Donor name from the autocomplete :term:`field` for the related Name.
   Alternatively, if you need to make edits to the existing contact
   information, you can do so now. When you're ready, click "Submit"in the
   donor dialog.

.. image:: images/donor-dialog-submit.*
   :align: center
   :width: 55%
   :alt: An image of the Donor dialog submit button

8. To create links to multiple donor records, you can repeat this process
   as needed. When you are done editing the record, save the
   :term:`accession record` by scrolling down and pressing "Save" in the
   :term:`button block`.

.. image:: images/donor-area-populated.*
   :align: center
   :width: 75%
   :alt: An image of the Donor/transferring body area in an accession

9. AtoM will reload the :term:`accession record` in :term:`view mode` - the
   related Donor's name will now appear as a hyperlink in the
   "Donor/Transferring body" :term:`information area` of the :term:`accession
   record`. Clicking on the hyperlink donor name will take you to the related
   donor.

.. image:: images/accession-donor-area.*
   :align: center
   :width: 75%
   :alt: An image of the Donor information area in an Accession record

:ref:`Back to top <donors>`

.. _delete-donor-record:

Delete a donor record
=====================

1. Navigate to the Donor record you would like to delete. You can do this by
   using the :term:`main menu` located in the AtoM :term:`header bar` and
   navigating to **Manage > Donors** and then selecting Donor record from the
   browse list (or searching for it with the dedicated search bar for Donor
   records provided on the Browse page). Alternately, if your donor record is
   linked to an :term:`accession record`, you can navigate to the related
   accession record and use the hyperlinked Donor name to redirect AtoM to the
   desired Donor record.

.. image:: images/browse-donors.*
   :align: center
   :width: 75%
   :alt: An image of the Donors browse page

.. TIP::

   For more information on locating Donor records, see above, :ref:`Edit an
   existing donor record <edit-donor-record>`. For information on locating
   :term:`accession records <accession record>`, see: :ref:`Edit an existing
   accession record <edit-accession-record>`. For general information on
   navigation in AtoM, see: :ref:`Access content <access-content>`

2. When you have arrived at the Donor record's :term:`view page`, click on the
   :term:`Delete button` located in the :term:`button block` located at the
   bottom of the record.

.. image:: images/donor-example.*
   :align: center
   :width: 75%
   :alt: An image of a Donor view page

3. AtoM will ask you to confirm that you want to delete the Donor record.
   Click the "Delete" button to delete, or the "Cancel" button to return to
   the Donor record :term:`view page`. If you click "Delete," the Donor
   record will be permanently deleted.

.. image:: images/donor-delete-confirm.*
   :align: center
   :width: 75%
   :alt: An image of the confirmation page for a Donor deletion

:ref:`Back to top <donors>`
