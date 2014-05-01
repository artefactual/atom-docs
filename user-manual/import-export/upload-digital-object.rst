.. _upload-digital-object:

======================
Upload digital objects
======================

:term:`Digital objects <digital object>` objects are computer files that can be
uploaded into and displayed by AtoM; they can include scanned images,
digital photographs, sound and moving image files, and other scanned or
born-digital items. AtoM allows the user to link a single :term:`digital object`
and import multiple digital objects. Every digital object must be associated
with an :term:`archival description`, typically at the file or item level (see
:term:`level of description`).

For every object uploaded, AtoM creates two derivative objects from the
:term:`master <master digital object>`, a :term:`thumbnail` image and a
:term:`reference display copy` of the object. The master digital object is the
unaltered version of a :term:`digital object` that has been uploaded to
AtoM. Note that only authenticated (i.e. logged-in) users may view master
digital objects.

.. NOTE::

   At higher :term:`levels of description <level of description>`, the
   :term:`context menu` includes :term:`thumbnails <thumbnail>` of all files
   registered at lower levels. The thumbnails are displayed using a
   :term:`carousel viewer <carousel>` so you can easily scroll through the set
   using your mouse or keyboard's arrow keys.

See below for more information on:

* :ref:`Linking single files <link-single-file>`
* :ref:`Uploading multiple files <upload-multiple-files>`
* :ref:`Uploading PDFs <upload-pdf>`
* :ref:`Editing digital objects <edit-digital-object>`
* :ref:`Deleting digital objects <delete-digital-object>`
* :ref:`Digital object storage <digital-object-storage>`

.. seealso::

   * :ref:`rights`
   * :ref:`manage-digital-object-storage`
   * :ref:`upload-limit`

.. _link-single-file:

Link single file
================

.. image:: images/link-digital-object.*
   :align: center
   :width: 70%
   :alt: A image of the link digital object edit page

To link a single :term:`digital object`:

#. Navigate to the :term:`view page` of an existing :term:`archival description`
   in AtoM. You can do this by :doc:`browsing <../access-content/browse>` or by
   :doc:`searching <../access-content/search-atom>` for a specific archival
   description - see :ref:`Access content <access-content>` for more information
   on navigation in AtoM.
#. Click on the "More" button in the :term:`button block`; from the menu that
   appears, select "Link digital object".
#. Click the "Choose File" button to navigate to and select a file. Click "Open"
   once item has been selected from the window that will appear.
#. Link your :term:`digital object` by including the URL to the external site
   you wish to link your object to.
#. Click the "Create" button in the :term:`button block`. When you return to the
   :term:`view page`, the :term:`reference display copy` will be displayed in
   the digital object field, above the other fields linked to that
   :term:`archival description`.

   .. NOTE::

      Users can view or play the :term:`reference display copy` (depending on
      the type of digital object). Authenticated (i.e. logged-in) users can also
      download the :term:`master digital object`.

#. Objects with multiple pages, such as multi-page TIFFs or PDF files, will by
   default be displayed with single-page reference display copies. To have them
   viewed with a pager to allow the user to browse through the pages, go to
   **Admin > Settings > Global > Upload multi-page files as multiple
   descriptions** and select "Yes"; this will also cause all pages of a multi-
   page object to appear individually as child records of the description to
   which the object was uploaded.

You can upload any file format, but only supported formats can be viewed or
played directly in AtoM. For a list of formats, see
:ref:`File formats <file-formats>`. Formats that are not supported can still be
uploaded: clicking the object will download it to the user's desktop where
(assuming the user has the required software) it can be viewed or played.

See :ref:`below <edit-digital-object>` for more information on making changes to
your :term:`digital object`.

:ref:`Back to top <upload-digital-object>`

.. _upload-multiple-files:

Upload multiple files
=====================

A user can import multiple files at once, attaching them all to the same
archival description.

.. image:: images/upload-multiple-images.*
   :align: center
   :width: 70%
   :alt: A image of the upload multiple images edit page

To upload multiple files in AtoM:

1. Navigate to the :term:`view page` of an existing :term:`archival description`
   in AtoM. You can do this by :doc:`browsing <../access-content/browse>` or by
   :doc:`searching <../access-content/search-atom>` for a specific archival
   description - see :ref:`Access content <access-content>` for more information
   on navigation in AtoM.
2. Click on the "More" button in the :term:`button block`; from the menu that
   appears, select "Import digital objects".
3. Select a title for the objects; all the objects will have the title plus a
   number. Currently the default is image 01, image 02, etc. (which will appear
   as a placeholder (i.e. image %dd%) in the "Title field").
4. Choose a :term:`level of description`. Unlike the :ref:`link-single-file`
   option, which attaches the :term:`digital object` directly to the
   :term:`archival description` at that level, the "Import multiple objects"
   option requires the user to designate a level of description (e.g.: Fonds,
   Sous-fonds, Collection, Series, Subseries, File, Item, Record group,
   subfonds, work, or subsubseries).
5. Click the blue "Select files" link and select multiple files to upload.
6. Once selected, the page will show previews of all the objects. If you like,
   you can edit the title for each object under to the preview.
7. You can quit the upload process at any time by clicking the "Cancel" button
   in the :term:`button block`; any digital objects already uploaded will not be
   saved. Note that simply navigating away from the page by any other means,
   **without first clicking "Import"** will also result in no new digital
   objects being uploaded.
8. Click the "Import" button in the :term:`button block` when you are satisfied
   with your changes. When you return to the :term:`view page`, you will see
   that the objects have all been attached to the :term:`archival description`
   as :term:`child records <child record>` of that description.

:ref:`Back to top <upload-digital-object>`

.. _upload-pdf:

Upload PDF
==========

A user can link a single PDF and import multiple PDFs into AtoM. A full-text
search of the content of the PDF is available through the main search box. PDFs
that have a text layer will work, including all OCR PDFs and born-digital PDFs
that include a text layer (e.g., exported Word documents) will work. Search
results will refer users to the PDF that contains the search term(s), but will
not reveal the location of the term(s) within the PDF.

Currently, AtoM 2.0 truncates PDF text after the first 65,535 bytes.


:ref:`Back to top <upload-digital-object>`

.. _edit-digital-object:

Edit digital objects
====================

Any :term:`digital object` that has been uploaded and linked to an
:term:`archival description` can be edited at any time by an authenticated
(i.e. logged-in) user. To do this:

.. |pencil| image:: images/pencil.png
   :height: 18
   :width: 18

1. Navigate to the :term:`view page` of an existing :term:`archival
   description` that has an existing :term:`digital object`.
2. Click on the "More" button in the :term:`button block`; from the menu that
   appears, select "Edit digital object".
3. You will be redirected to the digital object's :term:`edit page`. On this
   page, all representations (i.e. :term:`master <master digital object>`
   representation, :term:`reference <reference display copy>` representation and
   :term:`thumbnail` representation) of the :term:`digital object` will be
   listed, along with information on their Filename, Filesize and Media Type.

Edit digital object rights
--------------------------

.. image:: images/object-rights.*
   :align: center
   :width: 70%
   :alt: A image of the permission rights of digital objects

4. The rights permissions for all versions can be edited. Actions can be
   permitted or restrictted (i.e. added or removed) as needed. To do this,
   select the "Add new" button that appears at the end of each representation
   section, below the "Rights records" table:

   * Select the **Act** (i.e. Delete, Discover, Display, Disseminate, Migrate,
     Modify, or Replicate).
   * Set the **Restriction** (i.e. Allow or Disallow).
   * Select a timeline by including a **Start** date and **End** designate.
   * Include a **Rights holder**. A drop-down menu will appear as you begin to
     type.
   * Include **Rights note(s)** as needed.
   * Select a **Basis** for the permission (i.e. Copyright, License, Statute,
     Policy or Donor)

5. When the permission has been created and all fields filled, click "Submit".
   The new entry will appear in the Rights records table.
6. Permissions can be edited by clicking the |pencil| pencil at the end of the
   entry. They can be deleted by clicking the "X" next to the pencil.

Edit reference and thumbnail representations
--------------------------------------------

7. If you wish to use a different image as the :term:`thumbnail` or
   :term:`reference <reference display copy>` version this is also performed
   from the Edit digital object screen. First click delete in Reference
   representation or Thumbnail area.

.. image:: images/edit-thumbnail.*
   :align: center
   :width: 70%
   :alt: Deleting a thumbnail or reference image

8. AtoM will ask the user to confirm that they would like to delete the
   thumbnail/reference image. After confirming, the Edit digital object
   screen will allow the user to upload a new reference representation by
   clicking Browse and selecting a file from their computer, or auto-generate a
   new representation from the master image.

.. image:: images/upload-thumbnail.*
   :align: center
   :width: 70%
   :alt: Upload or create a new thumbnail or reference image.

Save changes
------------

9. You can quit the edit process at any time by clicking the "Cancel" button in
   the :term:`button block`; any edits made to digital objects will not be
   saved. Note that simply navigating away from the page by any other means,
   **without first clicking "Save"** will also result in no new digital objects
   being uploaded.

#. Once all your changes have been made, click the "Save" button in the
   :term:`button block`. You will be redirected back to the
   :term:`archival description's <archival description>` :term:`view page`.

All changes made can be edited once again, at any time, by following the steps
outlined above.


:ref:`Back to top <upload-digital-object>`

.. _delete-digital-object:

Delete digital objects
======================

To delete a :term:`digital object` that has been uploaded and linked to an
:term:`archival description`:

1. Navigate to the :term:`view page` of an existing :term:`archival
   description` that has an existing :term:`digital object`.
2. Click on the "More" button in the :term:`button block`; from the menu that
   appears, select "Edit digital object". You will be redirected to the digital
   object's :term:`edit page`.
3. Scroll to the bottom of the page and click "Delete". You will be prompted to
   confirm that you wish to "Delete" the digital object; click "Delete" once
   again. You will be redirected to the :term:`archival institution's <archival
   institution>` :term:`view page`.

:ref:`Back to top <upload-digital-object>`

.. _digital-object-storage:

Digital object storage
======================

In AtoM, administrators can track digital object storage per :term:`repository`.
Storage limits may be placed on individual repositories by in-house server
capacity or on hosted server agreements.

If you are utilizing a multi-institutional / portal instance of AtoM, you will
need to check with the site administrator to learn the digital object storage
limitations.

For more information, see :ref:`Managing digital object storage
<manage-digital-object-storage>`.

:ref:`Back to top <upload-digital-object>`
