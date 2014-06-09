.. _archival-institutions:

=====================
Archival Institutions
=====================

:term:`Archival institutions <archival institution>` are one of the core
:doc:`entity types <../overview/entity-types>` in AtoM and provide users with
the means of managing information about :term:`repositories <repository>`
and other institutions and organizations that hold archival materials or
other cultural heritage items and artifacts.

In AtoM, :term:`archival institution` descriptions are structured into
:term:`information areas <information area>` based on the `ICA's
<http://www.ica.org/>`__ *International Standard for
Describing Institutions with Archival Holdings* (:ref:`ISDIAH
<isdiah-template>`). The ISDIAH glossary describes an archival institution as:
*"An organization which keeps and preserves archival material and makes it
accessible to the public."* While generally targeted at institutions whose
primary function is to collect and keep archives and make them publicly
available, the ISDIAH introduction goes on to note that:


    *...other entities such as cultural institutions (libraries, museums),
    businesses, families or individuals may hold archives. This standard, or
    an appropriate subset of its elements, can be applied to all entities
    which provide access to the records they hold.*

Information captured in the :term:`archival institution` description template
is comprehensive, but relates specifically to the :term:`repository's
<repository>` role collecting and providing access to cultural heritage
materials. In addition to capturing identity and history information, the
ISDIAH standard provides information areas to record information about
collection policies,services offered, buildings, accessibility, and more.
Consequently, the :term:`archival institution` record should be considered
distinct from, but complementary to, that of an :term:`authority record`. The
ISDIAH Introduction notes that:

    *As corporate bodies, persons or families, the holders of archival
    materials may be described in ISAAR(CPF) compliant authority records
    including the appropriate elements of description as indicated in ISDIAH.
    Otherwise, the description of holders may be included in separate
    authority files.*

In **AtoM**, :term:`archival descriptions <archival description>` can be linked
to :term:`archival institutions <archival institution>` and the holdings of an
institution can be browsed even when AtoM is used as a :term:`multi-repository
system`. On all related :term:`archival description` :term:`view pages <view
page>`, the institition's name and logo will appear as hyperlinks to the
:term:`archival institution` record; similarly, an archival institution's page
will list its holdings as hyperlinks to related archival descriptions.
Institutions can also be themed in AtoM - when a background color is added to
the :term:`archival institution`, the same background color will appear behind
all related :term:`archival descriptions <archival description>` to highlight
the relationship.

.. image:: images/sample-themed-institution.*
   :align: center
   :width: 80%
   :alt: An example of a themed archival institution page

**Below are instructions for using the Archival institution module in AtoM
to:**

* :ref:`Add a new archival institution <add-archival-institution>`
* :ref:`Edit an existing archival institution <edit-archival-institution>`
* :ref:`Link an archival description to an archival institution
  <link-archival-institution>`
* :ref:`Edit the theme of an archival institution page <edit-institution-theme>`

  * :ref:`Change the background color <change-institution-background>`

  * :ref:`Add/Edit a logo <add-institution-logo>`

  * :ref:`Add/edit a banner <add-institution-banner>`

  * :ref:`Add/edit a custom description of the institution <add-institution-custom-content>`

  * :ref:`Add a Google map <add-map>`

* :ref:`Browse the holdings of an archival institution <browse-holdings>`
* :ref:`Set a digital object upload limit for an archival institution <upload-limit>`
* :ref:`Delete an archival institution <delete-archival-institution>`

For information on working with specific fields with AtoM's archival
institution :term:`edit page`, see:

* International Standard for Describing Institutions with Archival Holdings
  (:ref:`ISDIAH <isdiah-template>`)

.. seealso::

   * :ref:`Archival descriptions <archival-descriptions>`
   * :ref:`Authority records <authority-records>`
   * :ref:`Access content <access-content>`
   * :ref:`Browse holdings of an archival institution <browse-holdings>`
   * :ref:`User roles <user-roles>`
   * :ref:`Entity types <entity-types>`
   * :ref:`Log in <log-in>`
   * :ref:`Exit edit mode <exit-edit-mode>`

.. NOTE::

   By default, only an authenticated (i.e. logged in) :term:`administrator`
   can add, edit, update or delete an :term:`archival institution`. For more
   information on edit privileges and user roles see: :ref:`User roles
   <user-roles>`. For information on logging in, see: :ref:`Log in <log-in>`.
   Administrators can also change the :term:`access privleges <access
   privilege>` associated with a :term:`user account` - for more information,
   see: :ref:`Edit user permissions <edit-user-permissions>`.

:ref:`Back to top <archival-institutions>`

.. _add-archival-institution:

Add a new archival institution
==============================

This section contains instructions on how to Add a new :term:`archival
institution` in AtoM. There are three
main ways to add an archival institution record in AtoM - doing so via the
|plus| :ref:`"Add" <main-menu-add>` menu is the easiest, but to accommodate
different workflows, archival institution records can also be added from an
:term:`archival description` or from the :term:`view page` of another archival
institution. Below are instructions to add a new archival institution:

* :ref:`From the Add menu <add-institution-main>`
* :ref:`From the archival description edit page
  <add-institution-description-edit>`
* :ref:`From the archival institution view page <add-institution-view>`.

For specific information on the :term:`fields <field>` in the archival
institution's :term:`edit page`, see: :ref:`ISDIAH template
<isdiah-template>`

.. _add-institution-main:

Add a new archival institution from the main menu
-------------------------------------------------

.. |plus| image:: images/plus-sign.png
   :height: 18
   :width: 18

A new archival institution can be added at any time, from anywhere in the
application, via the :term:`main menu`.

.. NOTE::

   :term:`Administrators <administrator>` must be logged-in in order to add
   a new :term:`archival institution`. For more information on logging in,
   see: :ref:`Log in <log-in>`. See :ref:`User roles <user-roles>` for more
   information on groups and default permissions in AtoM.

**To create a new archival institution:**

1. In the :term:`main menu` located in the :term:`header bar`, click the |plus|
   :ref:`"Add" <main-menu-add>` menu and select "Archival institution" from the
   :term:`drop-down menu`.
2. AtoM takes you to a blank :term:`edit page` for data entry.

.. image:: images/new-archival-institution.*
   :align: center
   :width: 70%
   :alt: An image of a new archival institution edit page

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   :term:`information area` to access the :term:`fields <field>` grouped under
   it. Enter data as required.
4. You can quit the process at any time by clicking the "Cancel" button in the
   :term:`button block`; any data already entered will not be saved and no new
   record will be added. Note that simply navigating away from the page by any
   other means, **without first clicking "Create"** will also result in no new
   record being created.
5. To save a new record, click the :term:`"Create" button <Create button>`
   in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 60%
   :alt: Click create to save your new archival institution

Once the new :term:`archival institution` is saved, you will be redirected to
the record’s :term:`view page`, where you can review your work. Clicking "Edit"
in the :term:`button block` at the bottom of the record will re-open the
archival institution in :term:`edit mode`.

.. _add-institution-description-edit:

Add a new archival instituion from an archival description edit page
--------------------------------------------------------------------

A new archival institution can be generated from an :term:`archival description`
record at any time; it does not first have to be created separately.

An :term:`archival institution` can be added via a value list that appears in a
:term:`drop-down menu` - as you type data into the "Repository" :term:`field`,
the value list will narrow its options to present related suggestions. If the
archival institution already exists, you can select the name from the values and
a link will be created.

If the archival institution does not already exist, however, new names can be
added "on the fly" by typing and entering the name of the archival institution
in the designated :term:`field`; an archival institution record will be
automatically created once you click the :term:`"Create" button <Create button>`
in the :term:`button block` at the bottom of the record.

Whenever a new :term:`archival institution` is added to an :term:`archival
description`, a new record for that name will be generated when the archival
description is saved. Because each edit template uses different labels for the
:term:`field` to add a new archival institution, template specific instructions
have been included below.

**ISAD(G) edit template**

* In the "Context area" :term:`information area` of the :ref:`ISAD(G) template
  <isad-template>`, navigate to the "Repository" :term:`field` and enter a new
  name.
* The name will be saved as a new archival institution when you save the
  archival description.

**Rules for Archival Description (RAD) edit template**

* In the "Title and statement of responsibility area" :term:`information area`
  of the :ref:`RAD template <rad-template>`, navigate to the "Repository"
  :term:`field` and enter a new institution name.
* The name will be saved as a new archival institution when you save the
  archival description.

**Describing Archives: A Content Standard (DACS) edit template**

* In the "Identity elements" :term:`information area` of the :ref:`DACS template
  <dacs-template>`, navigate to the "Name and location of repository"
  :term:`field` and enter a new name.
* The name will be saved as a new archival institution when you save the
  archival description.

**Dublin Core Version 1.1 (DC) edit template**

* In the "Elements area" :term:`information area` of the :ref:`Dublin Core
  template <dc-template>`, navigate to the "Relation(isLocatedAt)" :term:`field`
  and enter a new name.
* The name will be saved as a new archival institution when you save the
  archival description.

**Metadata Object Description Schema (MODS) edit template**

* In the "Elements area" :term:`information area` of the :ref:`MODS template
  <mods-template>`, navigate to the "Repository" :term:`field` and enter a new
  name.
* The name will be saved as a new archival institution when you save the
  archival description.

The newly created archival institution will then have to be edited to include
necessary data. To edit the archival institution record, see the :ref:`Edit an
existing archival institution <edit-archival-institution>` section of this page.


.. _add-institution-view:

Add a new archival institution from the view page
-------------------------------------------------

A new :term:`archival institution` can also be added to AtoM from the
:term:`view page` of any other archival institution via the :term:`Add new
button` in the :term:`button block`. To do so:

1.  Navigate to an existing :term:`archival institution` in AtoM. You can do
    this by :doc:`browsing <../access-content/browse>` or by
    :doc:`searching <../access-content/search-atom>` for a specific archival
    institution - see :ref:`Access content <access-content>` for
    more information on navigation in AtoM.
2.  At the bottom of the archival institution :term:`view page`, you will see
    the :term:`button block` with several options (Edit, Delete, and Add new).
    Click the :term:`Add new button`.

.. image:: images/button-block-institution.*
   :align: center
   :width: 60%
   :alt: Click Add new to create a new repository

3.  AtoM takes you to a blank :term:`edit page` for data entry. On loading, the
    edit page displays the record with all :term:`information areas
    <information area>` closed; click on an information area to access the
    :term:`fields<field>` grouped under it. Enter data as required.

.. image:: images/new-archival-institution.*
   :align: center
   :width: 70%
   :alt: An image of a new archival institution edit page

4.  You can quit the creation process at any time by clicking the "Cancel"
    button in the :term:`button block`; any data already entered will not be
    saved, and no new record will be created. Note that simply navigating away
    from the page by any other means, **without first clicking "Create"** will
    also result in no new record being created.
5.  To save the new record, click the :term:`"Create" button <Create button>`
    located in the :term:`button block` at the bottom of the record.

.. image:: images/button-block-create.*
   :align: center
   :width: 60%
   :alt: Click create to save your new archival institution

Once the new :term:`archival institution` is saved, you will be redirected to
the record’s :term:`view page`, where you can review your work. Clicking "Edit"
in the :term:`button block` at the bottom of the record will re-open the
archival institution in :term:`edit mode`.

:ref:`Back to top <archival-institutions>`

.. _edit-archival-institution:

Edit an existing archival institution
=====================================

This section contains instructions on how to edit an existing :term:`archival
institution`, after it has been :ref:`created <add-archival-institution>`.
For information on how to theme your archival institution, see :ref:`below
<edit-institution-theme>`.

.. NOTE::
   Only an authenticated (i.e. logged in) :term:`administrator` user can edit or
   update an archival institution. For more information on edit privileges and
   user roles see: :ref:`User roles <user-roles>`.

An archival institution's description can be edited at any time.

**To edit an existing archival institution:**

1. First, navigate to the :term:`archival institution` you wish to edit. You can
   do this by :doc:`browsing <../access-content/browse>` or :doc:`searching
   <../access-content/search-atom>` for the :term:`archival institution`
   by name. See :ref:`access content <access-content>` for more information
   on navigation in AtoM.
2. Switch from :term:`view mode` to :term:`edit mode` by clicking the
   :term:`"Edit" button <Edit button>` in the :term:`button block` located at
   the bottom of the record, or by clicking on one of the :term:`information
   area` headings; this takes you to the record's :term:`edit page`.

.. image:: images/button-block-institution.*
   :align: center
   :width: 60%
   :alt: Click create to save your new archival institution

3. On loading, the :term:`edit page` displays the record with all
   :term:`information areas <information area>` closed; click on an
   information area to access the :term:`fields <field>` grouped under it.

.. image:: images/new-archival-institution.*
   :align: center
   :width: 70%
   :alt: On loading, all information areas are closed; click one to expand

4. Add and/or revise data as required. See :ref:`ISDIAH template
   <isdiah-template>` for field-specific guidance.
5. You can quit the create process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no changes being saved to the
   archival institution.
6. To save your edits, click the "Save" button located in the :term:`button
   block` at the bottom of the record.

.. image:: images/button-block-save.*
   :align: center
   :width: 60%
   :alt: Click to save your new archival institution

You will be redirected to the :term:`view page` for the edited :term:`archival
institution`, where you can review your work.

:ref:`Back to top <archival-institutions>`

.. _link-archival-institution:

Link an archival description to an archival institution
=======================================================

Links between existing archival institution and existing archival descriptions
can be added at any time by an authenticated (i.e. logged in)
:term:`administrator` with sufficient edit permissions. For more information on
types of users and edit permissions, see :ref:`User roles <user-roles>`. You
will need to create the link from the :term:`archival description` you wish
to link.

**To link an archival description to an archival institution:**

1. First, navigate to the :term:`archival description` you wish to edit. You
   can do this by :doc:`browsing <../access-content/browse>` or
   :doc:`searching <../access-content/search-atom>` for the :term:`archival
   description` - see :ref:`Access content <access-content>` for more
   information on navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking :term:`"Edit"
    button <edit button>` in the :term:`button block`, or by clicking on one of
    the :term:`information area` headings; this takes you to the record’s
    :term:`edit page`.

.. image:: images/button-block-description.*
   :align: center
   :width: 60%
   :alt: Click edit to enter edit mode and link your repository

3.  To create a link to an archival institution, follow the steps above for
    :ref:`"adding a new archival institution" <add-institution-main>` - however,
    instead of entering a new name, begin typing the name of the
    :term:`archival institution` to which you would like to create a link. The
    name :term:`field` is an auto-complete - as you type, matching results will
    load in a :term:`drop-down menu` below the field. When you see the
    :term:`archival institution` you would like to link, click on it to select
    it.

.. image:: images/link-repository-autocomplete.*
   :align: center
   :width: 70%
   :alt: An example of using the autocomplete to link a repository

.. IMPORTANT::

   This method makes use of  an `auto-complete <https://en.wikipedia.org/wiki
   /Auto-complete>`__ field to find the right :term:`archival institution` as
   you begin to type its name/title. **Be sure** to pick the record from the
   :term:`drop-down <drop-down menu>` when it appears - if you type the full
   name and press enter, a new archival institution will be generated
   instead of a link being created to an existing one! If, however, you wish
   to add a new archival institution from the archival description's
   :term:`edit page`, see :ref:`above <add-institution-description-edit>`.

4.  When you are done editing the record, save the :term:`archival
    description` by scrolling down and pressing "Save" in the :term:`button
    block`.

.. image:: images/button-block-save.*
   :align: center
   :width: 60%
   :alt: Click to save your edited archival description

5.  The :term:`archival description` will reload in :term:`view mode`. You
    should be able to see the archival institution as a hyperlink on the
    archival description. Follow the link to ensure you have linked to the
    proper :term:`archival institution`. The linked archival description will
    also appear in the "Holdings" section of the :ref:`Context menu
    <recurring-context-menu>` of the archival institution’s :term:`view page`.

:ref:`Back to top <archival-institutions>`

.. _edit-institution-theme:

Edit the theme for an existing archival institution
===================================================

AtoM 2.0 introduces a new design feature for users that allows them to customize
their archival institution's page by adding/editing an institution logo and/or
banner, as well as choose a specific background color for their institution's
page. Once added, the background color and logo will appear on all of the
institution's related :term:`archival descriptions <archival description>` (see
:ref:`above <link-archival-institution>` for information on how to create a link
between an :term:`archival description` and an :term:`archival institution`).

Additionally, users can add custom `HTML
<https://en.wikipedia.org/wiki/Html>`__ and inline `CSS
<https://en.wikipedia.org/wiki/CSS>`__ to a description area for specific
highlighted content. These features can be especially useful in a
:term:`multi-repository system` as they help users visually identify where
:term:`archival descriptions <archival description>` are held, and allow for
an institution in a multi-repository system such a network or
provincial/state portal to better match their institution's local branding.
Editing the theme of your :term:`archival institution` is
comprised of four main elements:

* :ref:`Change the background color <change-institution-background>`
* :ref:`Add/edit a logo <add-institution-logo>`
* :ref:`Add/edit a banner <add-institution-banner>`
* :ref:`Add/edit a custom description <add-institution-custom-content>`
* :ref:`Add a Google map <add-map>`

:ref:`Back to top <archival-institutions>`

.. _change-institution-background:

Change the background color of an archival institution
------------------------------------------------------

This new design feature allows authenticated (i.e. logged in)
:term:`administrators <administrator>` to customize their archival institution
record by changing the background color of the page. Users can choose and
modify (i.e. hue, tint) a color from a pre-determined color pallette.
Changing the background color in an archival institution :term:`edit page`
will automatically change the background color of all the :term:`archival
description` pages linked to that specific institution.

**To change the background color of an archival institution page:**

1. First, navigate to the :term:`archival institution` whose theme you wish to
   edit. You can do this by :doc:`browsing <../access-content/browse>` or
   :doc:`searching <../access-content/search-atom>` for the :term:`archival
   institution` by name. See :ref:`access content <access-content>` for more
   information on navigation in AtoM.
2. Click on the "Edit theme" button in the :term:`button block` at the bottom
   of the archival institution's :term:`edit page`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3. AtoM will reload load the institutions theme :term:`edit page`. From here,
   authenticated users can change the background color, upload a logo
   and/or banner, and add custom content.

.. image:: images/edit-theme-overview.*
   :align: center
   :width: 70%
   :alt: An image of the theme edit page in AtoM

4. In the "Style" area, click on the Background color (you can click on the
   title, the color swatch, or text box showing the :term:`hex color code`).
   A :term:`color picker` will appear as a :term:`drop-down menu`.

.. image:: images/theme-colorpicker.*
   :align: center
   :width: 70%
   :alt: An image of the color picker in the Edit Theme page

.. image:: images/theme-colorpicker2.*
   :align: right
   :width: 25%
   :alt: An closeup of the color picker in the Edit Theme page

5. Select the color that you would like to use as the background for your
   :term:`archival institution` record. This color will appear as the
   background for all related :term:`archival descriptions
   <archival description>` as well. Use the slider on the right of the
   :term:`color picker` drop-down to select a **hue** - you can click or drag
   the slider bar to dynamically change the color in the pallette. Use the
   pallette to select a **tint** - you can click or drag in the pallette to
   dynamically change the color. There is also a text-box provided where you
   can manually enter a :term:`hex color code` if you with. The selected
   color will be displayed in the small preview box next to the
   :term:`hex color code` text-box. You can click anywhere outside of the the
   :term:`color picker` to hide the :term:`drop-down <drop-down menu>`.
6. You can quit the theming process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no changes being saved to the
   archival institution.
7. When you have selected your new background color, click "Save" in the
   :term:`button block` at the bottom of the page. AtoM will reload the
   :term:`archival institution` in :term:`view mode`, where you can review how
   the new color looks. If needed, you can repeat steps 2-6 until you are
   happy with the selection.

.. image:: images/repository-theme-color.*
   :align: center
   :width: 70%
   :alt: An image of an archival institution with a custom color

.. IMPORTANT::

   Be sure to check the appearance of titles, text, and hyperlinks on your
   :term:`archival institution` page and on any related :term:`archival
   descriptions <archival description>`. Some color choices make decrease
   accessibility, and make titles, text, and hyperlinks harder for users to
   read.

.. _add-institution-logo:

Add/edit a logo to an existing archival institution
---------------------------------------------------

Authenticated (i.e. logged in) :term:`administrators <administrator>` also have
the option to customize the :term:`archival institution` record by adding a logo
to the institution's page. Below are instructions to :ref:`add a logo
<add-logo>` and :ref:`edit and/or delete an exisiting logo <edit-logo>` for an
archival institution.

.. _add-logo:

Add a logo for an archival institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1.  First, navigate to the :term:`archival institution` you wish to edit. You
    can do this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival
    institution - see :ref:`Access content <access-content>` for more
    information on navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3.  From here, authenticated users can upload a logo. In the "Style" area, under
    the "Logo" :term:`field`, click the "Browse" button.

.. image:: images/upload-logo-area.*
   :align: center
   :width: 70%
   :alt: An image of the logo upload in the Style area

4.  A separate window will open; select the image on your computer that you'd
    like to add as the logo for the institution. Note that AtoM supports only
    specific sizing requirements with regards to the logo images (:ref:`See
    below <logo-size-requirements>`).

.. _logo-size-requirements:

.. NOTE::

   AtoM requires that the image uploaded as the institution logo be in **PNG
   format**. The image cannot exceed **256k in size**. If the image selected for
   upload does not meet these requirements, you will receive an error message
   below the "Logo" :term:`field` after clicking the "Save" button, and your
   upload will **not** be saved.

   Ideally, the image size should be between **200x200** and **270x270 pixels
   square**. If the image you upload does not meet these sizing specifications,
   it will be automatically cropped by :ref:`ImageMagick <other-dependencies>`
   to meet the requirements listed above.

5.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved. Note that
    simply navigating away from the page by any other means, **without first
    clicking "Save"** will also result in no changes being saved to the archival
    institution.
6.  When you have selected your logo, click "Save" in the :term:`button block`
    at the bottom of the page. AtoM will reload the :term:`archival institution`
    in :term:`view mode`, where you can review the logo. If needed, you can
    repeat step 2 through 4 until you are happy with the selection.

.. image:: images/upload-logo.*
   :align: center
   :width: 70%
   :alt: An image of a user uploading a logo

Once uploaded, the logo will appear above the "Upload limit" section of the
:ref:`Context menu <recurring-context-menu>`, in the top left-hand corner of
the archival institution’s :term:`view page`. This logo will also appear when
:doc:`browsing <../access-content/browse>` archival institutions in AtoM,
appearing above the name of the archival institution, as well as on any
:term:`archival description` page linked to the archival institution.

.. image:: images/logo-uploaded.*
   :align: center
   :width: 70%
   :alt: An image of an archival institution with an uploaded logo

.. _edit-logo:

Edit/remove an exisiting logo for an archival institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**To edit an exisiting logo:**

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival
    institution - see :ref:`Access content <access-content>` for more
    information on navigation in AtoM.

.. image:: images/edit-logo-bell.*
   :align: center
   :width: 70%
   :alt: An image of an archival institution with an uploaded logo

2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3.  From here, navigate to the "Style" area, under the "Logo" :term:`field`,
    click the "Browse" button under the exisiting logo.

.. image:: images/upload-new-logo.*
   :align: center
   :width: 70%
   :alt: Selecting the "Browse" button to upload a new logo

4.  A separate window will open; select the image on your computer that you'd
    like to replace the existing logo with. See the :ref:`previous section
    <logo-size-requirements>` for direction on AtoM **sizing requirements** for
    logo images.
5.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved and the
    existing logo will remain as such. Note that simply navigating away from the
    page by any other means, **without first clicking "Save"** will also result
    in no changes being saved to the archival institution.
6.  Once you've selected your logo, **check the box** next to "Remove the
    current file", located below the existing logo, and click "Save" in
    the :term:`button block` at the bottom of the page. AtoM will reload the
    :term:`archival institution` in :term:`view mode`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: A image of the institution after a successful logo change

.. IMPORTANT::

    You must **refresh your browser** in order to see the changes made to
    archival institution's logo!

7.  If needed, you can repeat step 2 through 4 until you are happy with the
    selection of your logo.

**To remove an existing logo:**

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival
    institution - see :ref:`Access content <access-content>` for more
    information on navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3.  From here, navigate to the "Logo" :term:`field` under the "Style" area;
    **check the box** next to "Remove the current file", located under the
    current logo image.

.. image:: images/remove-current-logo.*
   :align: center
   :width: 70%
   :alt: An image of the checkbox to remove a logo

4.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved and the
    existing logo will remain as such. Note that simply navigating away from the
    page by any other means, **without first clicking "Save"** will also result
    in no changes being saved to the archival institution.
5.  Once you've checked the box, click "Save" in the :term:`button
    block` at the bottom of the page. AtoM will reload the :term:`archival
    institution` in :term:`view mode`, where the logo will have been removed.

A new logo can be added again at any time. See :ref:`Add a new logo
<add-institution-logo>`.

.. _add-institution-banner:

Add/edit a banner to an existing archival institution
------------------------------------------------------

Authenticated (i.e. logged in) :term:`administrators <administrator>` can
further customize their :term:`archival institution` page by adding a banner.
Once uploaded, the banner will appear on the archival institution's :term:`view
page`, below the institution's name. Unlike the institution's logo, the banner
will *not* appear on any :term:`archival description` pages linked to the
archival institution. Below are instructions to :ref:`add a banner <add-banner>`
and :ref:`edit and/or delete an exisiting banner <edit-banner>` for an archival
institution.

.. _add-banner:

Add a banner for an archival institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival
    institution - see :ref:`Access content <access-content>` for more
    information on navigation in AtoM.

.. image:: images/institution-add-banner-1.*
   :align: center
   :width: 70%
   :alt: An example of an institution without a banner

2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3.  From here, authenticated users can upload a banner. In the "Style" area,
    under the "Banner" :term:`field`, click the "Choose file" button.

.. image:: images/upload-banner.*
   :align: center
   :width: 70%
   :alt: An image of the upload banner area in the edit theme page

4.  A separate window will open; select the image on your computer that you'd
    like to add as the banner for the institution. Note that AtoM supports only
    specific sizing requirements with regards to the banner images (:ref:`See
    below <banner-size-requirements>`).

.. _banner-size-requirements:

.. NOTE::

   AtoM requires that the image uploaded as the banner be in **PNG format**. The
   image cannot exceed **256k in size**. If the image selected for upload does
   not meet these requirements, you will receive an error message reading
   *"Invalid mime type"* will appear below the "Banner" :term:`field` after
   clicking the "Save" button.

   Ideally, the image size should be between **100 and 300 pixels** in
   height, and should not exceed a **800 pixels** width. If the image you upload
   does not meet these sizing specifications, it will be automatically cropped
   by :ref:`ImageMagick <other-dependencies>` to meet the requirements listed
   above.

5.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved. Note that
    simply navigating away from the page by any other means, **without first
    clicking "Save"** will also result in no changes being saved to the archival
    institution.
6.  When you have selected your banner, click "Save" in the :term:`button block`
    at the bottom of the page. AtoM will reload the :term:`archival institution`
    in :term:`view mode`, where you can review the banner. If needed, you can
    repeat step 2 through 4 until you are happy with the selection.

.. image:: images/institution-add-banner-2.*
   :align: center
   :width: 70%
   :alt: An image of an institution with a banner added

.. _edit-banner:

Edit/remove an existing banner for an archival institution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**To edit an existing banner:**

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival institution -
    see :ref:`Access content <access-content>` for more information on
    navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3.  From here, navigate to the "Style" area, under the "Logo" :term:`field`,
    click the "Choose file" button under the exisiting logo.
4.  A separate window will open; select the image on your computer that you'd
    like to replace the existing banner with. See the :ref:`previous section
    <banner-size-requirements>` for direction on AtoM **sizing requirements**
    for banner images.
5.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved and the
    existing banner will remain as such. Note that simply navigating away from
    the page by any other means, **without first clicking "Save"** will also
    result in no changes being saved to the archival institution.
6.  Once you've selected your banner, **check the box** next to "Remove the
    current file", located below the existing banner, and click "Save" in the
    :term:`button block` at the bottom of the page. AtoM will reload the
    :term:`archival institution` in :term:`view mode`.

.. image:: images/remove-current-banner.*
   :align: center
   :width: 70%
   :alt: An image of the checkbox to remove the current banner

.. IMPORTANT::

    You must **refresh your browser** in order to see the changes made to
    archival institution's banner!

7.  If needed, you can repeat step 2 through 4 until you are happy with the
    selection of your banner.

**To remove an existing banner:**

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival institution -
    see :ref:`Access content <access-content>` for more information on
    navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.
3.  From here, navigate to the "Banner" :term:`field` under the "Style" area;
    **check the box** next to "Remove the current file", located under the
    current banner image.

.. image:: images/remove-current-banner.*
   :align: center
   :width: 70%
   :alt: An image of the checkbox to remove the current banner

4.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved and the
    existing logo will remain as such. Note that simply navigating away from the
    page by any other means, **without first clicking "Save"** will also result
    in no changes being saved to the archival institution.
5.  Once you've checked the box, click "Save" in the :term:`button
    block` at the bottom of the page. AtoM will reload the :term:`archival
    institution` in :term:`view mode`, where the banner will have been removed.

.. image:: images/button-block-save.*
   :align: center
   :width: 70%
   :alt: An image of the save button in the button block

A new banner can be added again at any time. See
:ref:`Add a new banner <add-institution-banner>`.

.. _add-institution-custom-content:

Add a custom description to an archival institution
---------------------------------------------------

Users can also add custom HTML and inline CSS to an archival institution page,
to further customize its content and display. This can be used to add
important information (e.g. holiday hours; emergency closures) either
temporarily or permanently; to embed external content such as a YouTube video
or a locally hosted image; to add shortcuts to custom searches (especially in
a :term:`multi-repository system` such as a network or portal site); and
more.

.. figure:: images/guelph-custom-content.*
   :align: center
   :figwidth: 70%
   :width: 100%
   :alt: An example of customized content on a repository page

   The Guelph Public Library Archives has extensively customized their content
   in *Archeion*, the Archives Association of Ontario's portal site. See it
   `here <http://www.archeion.ca/guelph-public-library-archives>`__.

**To add a custom description to an archival institution**

1.  Navigate to the :term:`archival institution` you wish to edit. You can do
    this by :doc:`browsing <../access-content/browse>` or
    :doc:`searching <../access-content/search-atom>` for the archival
    institution - see :ref:`Access content <access-content>` for more
    information on navigation in AtoM.
2.  Switch from :term:`view mode` to :term:`edit mode` by clicking "Edit theme"
    button in the :term:`button block`.

.. image:: images/edit-theme-button.*
   :align: center
   :width: 70%
   :alt: An image of the edit theme button in the button block

3. From here, users can add custom HTML and in-line CSS to personalize their
   archival institution page. Scroll down to the :term:`information area`
   named "Page content", where you will find a field named "Description."

.. image:: images/edit-theme-description.*
   :align: center
   :width: 70%
   :alt: An image of the edit field for adding custom content to a repository

4.  Begin adding you custom HTML and in-line CSS. Content that is added to
    this area will appear, when saved, **below** an uploaded banner, and
    **above** the institution's description
    :term:`information areas <information area>`.

.. image:: images/edit-theme-description-2.*
   :align: center
   :width: 70%
   :alt: An image of adding content to the description field

5.  You can quit the theming process at any time by clicking the "Cancel" button
    in the :term:`button block`; any changes made will not be saved and the
    existing logo will remain as such. Note that simply navigating away from the
    page by any other means, **without first clicking "Save"** will also result
    in no changes being saved to the archival institution.
6.  When you have finished adding your custom content, click "Save" in the
    :term:`button block` at the bottom of the page. AtoM will reload the
    :term:`archival institution` in :term:`view mode`, where you can review your
    work. If needed, you can repeat steps 2 through 4 until you are happy with
    the outcome.

.. image:: images/example-custom-content.*
   :align: center
   :width: 70%
   :alt: An example of custom content added to a repository view page


.. _add-map:

Add a Google map to an archival institution
-------------------------------------------

.. figure:: images/institution-map.*
   :align: right
   :figwidth: 30%
   :width: 100%
   :alt: Institution view page with Google map

   Institution view page with Google map

Users can add a Google map to the :term:`view page` for an archival
institution showing the location of the institution. These instructions do
require a systems administrator who can edit AtoM's files from the server.


1. First, you will need to set up a
   `Google account <https://wwww.accounts.google.com>`_ if you do not already
   have one.

2. Next, request an
   `API key <https://developers.google.com/maps/documentation/javascript/tutorial#api_key>`_
   from Google.

3. Add the API key to AtoM's code in the :file:`apps.yml` file (view code on
   Github `here <https://github.com/artefactual/atom/blob/2.x/config/app.yml>`_).
   Uncomment the :file:`google_maps_api_key` value and add the API key.

4. Save the changes to :file:`apps.yml` and
   :ref:`clear the cache <maintenance-clear-cache>`.

5. The map will appear on an institution page only if the latitude and
   longitude coordinates are added to the Contact information for the
   repository. See
   :ref:`Edit an existing archival institution <edit-archival-institution>`.

6. When the institution record is saved the map will appear at the top of the
   view page.

To populate the latitude and longitude values to all institutions in a
:term:`multi-repository installation <multi-repository system>` run in the
command line:

.. code-block:: bash

   tools:find-repository-latlng

This command will use Google to find the latitude and longitude based on the
institutions' addresses as found in the Contact information.

:ref:`Back to top <archival-institutions>`

.. _browse-holdings:

Browse the holdings of an archival institution
==============================================

When viewing an :term:`archival institution` in AtoM, a list of :term:`holdings`
is displayed in the :ref:`context menu <recurring-context-menu>` on the the
left-hand side of the institution's :term:`view pages <view page>`. The list
that appears will be of holdings, or :term:`archival descriptions
<archival description>` that have been linked to that institution. If you click
on a holding, you will be redirected to that description's :term:`view page`.

.. figure:: images/institution-holdings-list.*
   :align: center
   :figwidth: 70%
   :width: 100%
   :alt: An example of an institution's holdings list

   In this example, the holdings list for the Regional Municipality of
   Waterloo has been outlined in red


.. TIP::

   For more information on linking an :term:`archival description` to an :
   term:`archival institution`, see :ref:`link-archival-institution`.

Only a maximum of 10 :term:`archival descriptions <archival description>` will
appear at once; they will be listed alphabetically. If the archival institution
has more than 10 holdings linked to its repository, a "Browse ## holdings" link
will appear below the list, indicating the total number of :term:`holdings` (in
place of "##") linked to that archival institution. Click on the link to be
redirected to a browse page where all the holdings that have been linked to that
institution will be listed. The results can be  sorted by "Most recent" or
"Alphabetical"; hover above the visible option next to the :ref:`"Sort button"
<recurring-sort-button>`, on the right-hand corner above the results, to select
the alternative from a :term:`drop-down menu`. For more information, see:
:ref:`Facet filters <recurring-facet-filters>`.

.. image:: images/browse-holdings-page.*
   :align: center
   :width: 70%
   :alt: An example of an institution's holdings browse page

:ref:`Back to top <archival-institutions>`

.. _upload-limit:

Set digital object upload limit for an archival institution
===========================================================

When viewing an :term:`archival institution` in AtoM, an "Upload limit" bar
is displayed in the :ref:`context menu <recurring-context-menu>` on the the
left-hand side of the institution's page.

.. NOTE::

   By default, only authenticated (i.e. logged in) users can *view* the
   "Upload limit" bar, and only an authenticated :term:`administrator` can
   *edit* the upload limit. For more information on edit privileges and user
   roles see: :ref:`User roles <user-roles>`. For information on logging in,
   see: :ref:`Log in <log-in>`.

**To set the digital object upload limit for an archival institution:**

1. Navigate to the :term:`archival institution` you wish to edit. You can do
   this by :doc:`browsing <../access-content/browse>` or
   :doc:`searching <../access-content/search-atom>` for the archival
   institution - see :ref:`Access content <access-content>` for more
   information on navigation in AtoM.
2. Click the "Edit" link located below the "Upload limit" bar on the left-hand
   side of the page.

.. image:: images/upload-limit.*
   :align: center
   :width: 50%
   :alt: An image of the archival institution upload limit settings

3. A dialogue box will apear that will allow for 1 of 3 options:

   * **Disable uploads** will prevent users from uploading any
     :term:`digital objects <digital object>`.
   * **Limit uploads to _____ GB** will allow an administrator to set a specific
     upload limit per :term:`archival institution`.
   * **Allow unlimited uploads** is the default setting in AtoM that places no
     restrictions on an authenticated user's digital object uploads.

.. image:: images/edit-upload-limit.*
   :align: center
   :width: 65%
   :alt: An image of the upload limit dialog

4. You can quit the process at any time by clicking the "Cancel" button, or the
   exiting (i.e. clicking "X") the window. Any changes made will not be saved.
5. When you've made your selection, click the "Save" button. The :term:`archival
   institution's <archival institution>` :term:`view page` will display your
   changes made according to :

   * If you selected **Disable uploads**, the Upload limit bar will
     automatically be removed and the Upload limit section will indicate that
     the uploads have been disabled.
   * If you selected **Allow unlimited uploads**, the Upload limit bar will
     automatically be removed and the Upload limit section will indicate the
     institution's current uploaded amount, as well as the limit, which will be
     *Unlimited* (e.g. "2.65 GB of *Unlimited*").
   * If you selected a specific number of GB as an upload limit, that number
     will appear below the Upload limit bar, alongside the institution's current
     uploaded amount (e.g. "2.56 of 10 GB").

6. Additional changes to the Upload limit can be made at any time by following
   the steps 2 through 5.

.. IMPORTANT::

   The limits set here are different than the execution limits set by your
   system administrator. For more information, see: :ref:`Execution limits
   <installation-execution-limits>`.

**For more information on managing digital objects, see also:**

* :ref:`Upload digital objects <upload-digital-object>`
* :ref:`Manage digital object storage <manage-digital-object-storage>`

:ref:`Back to top <archival-institutions>`

.. _delete-archival-institution:

Delete an archival institution
==============================

Follow the instructions below to delete an archival institution in AtoM:

1.  Navigate to the :term:`archival institution` record you want to delete. You
    can do this by :doc:`browsing <../access-content/browse>` or :doc:`Search
    <../access-content/search-atom>` for the :term:`archival description` - see
    :ref:`Access content <access-content>` for more information on navigation in
    AtoM.
2.  Scroll to the bottom of the institution’s :term:`view page` and click the
    :term:`Delete button` in the :term:`button block`.

.. image:: images/button-block-institution.*
   :align: center
   :width: 60%
   :alt: An example of the archival institution button block

3.  AtoM will provide a warning and prompts you to confirm that you really wish
    to delete the institution. To delete the record, click the
    :term:`Delete button`.

.. image:: images/institution-delete-confirm.*
   :align: center
   :width: 70%
   :alt: An example of a delete confirmation request

4.  AtoM deletes the record and opens the :term:`archival institution` browse
    results page.

.. NOTE::

   Deleting the :term:`archival institution` record removes the :term:`archival
   institution` from the repository :term:`field` in linked :term:`archival
   descriptions <archival description>` but does not remove the archival
   descriptions themselves.

:ref:`Back to top <archival-institutions>`


