.. _manage-static-pages:

===================
Manage static pages
===================

In AtoM, :term:`static pages <static page>` are pages that are designed to look
the same each time they are accessed; this is in contrast to dynamic pages,
which can vary according to your network or institution and according to the
content that is uploaded into AtoM. Examples of dynamic pages include:
search results pages; :term:`view pages <view page>`;
and :term:`edit pages <edit page>`. By default, AtoM has two :term:`static pages
<static page>`: the :term:`Home page` and the :term:`About page`.

A default welcome message appears on the :term:`Home page` when first logging
into AtoM.

.. image:: images/welcome-page.*
   :align: center
   :width: 70%
   :alt: An image of the Home page

The :term:`About page` provides additional information about the application and
the project. To access the :term:`About page`, click on the |info| :ref:`Quick
links menu <quick-links-menu>` in the :term:`main menu` located in the
:term:`header bar` and select "About".

.. image:: images/about-page.*
   :align: center
   :width: 70%
   :alt: An image of the About page

.. |info| image:: images/info-sign.png
   :height: 18
   :width: 18

For more information on navigating in AtoM, see :ref:`access content
<access-content>`.

**Below are instructions on how to edit and add static pages in AtoM:**

* :ref:`Edit and existing static page <edit-static-page>`

  * :ref:`Edit the "Home page" <edit-home-page>`
  * :ref:`Edit the "About page" <edit-about-page>`

* :ref:`Add a new static page <add-static-page>`
* :ref:`Add links to a new static page <add-links-static>`
* :ref:`Styling static pages <styling-static-page>`

.. NOTE::

   :term:`Static pages <static page>` can only be edited and added by an
   authenticated (i.e. logged-in) :term:`administrator` or :term:`editor`.
   For more information on user permissions, see :ref:`edit-user-permissions`.


.. _edit-static-page:

Edit an existing static page
============================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

In AtoM, :term:`static pages <static page>`, that is both the :term:`Home page`
and the :term:`About page` can be edited by authenticated (i.e. logged-in)
:term:`aministrators <administrator>` or :term:`editors <editor>` to reflect
your own institution's or :term:`network's <network>` requirements.

This section contains instructions on how to edit :term:`static
pages <static page>` in AtoM. There are two ways to edit :term:`static pages
<static page>` - doing so via the |info| :ref:`Quick links menu
<quick-links-menu>` in the :term:`main menu` and selecting either "Home" or
"About" from the :term:`drop-down menu` is the easiest, but to accommodate
different workflows, these :term:`static pages <static page>` can also
be edited by clicking the the |gears| :ref:`Admin <main-menu-admin>` and
selecting "Static pages" from the :term:`drop-down menu`. This second option
will route you to a "List" page, where all :term:`static pages <static page>`
in the application will be listed. Navigate to the :term:`static page` you wish
to edit by clicking on the blue menu name. Below are instructions to edit to
the :ref:`Home page <edit-home-page>` and the :ref:`About page
<edit-about-page>`.

For more information on navigating in AtoM, see :ref:`Navigation in AtoM
<navigate>`.

.. _edit-home-page:

Edit the "Home page"
--------------------

To edit the "Home page" in AtoM:

#. Start by navigating to the :term:`Home page`. Do this by either:

   * Clicking on the AtoM :term:`site logo` located in the top-left corner of
     the AtoM :term:`header bar`;
   * Clicking the |info| :ref:`Quick links menu <quick-links-menu>` in the
     :term:`main menu` of the :term:`header bar` and selecting  "Home" from the
     :term:`drop-down menu`; **or**
   * Clicking the |gears| :ref:`Admin <main-menu-admin>` of the
     :term:`header bar` and selecting "Static pages" from the
     :term:`drop-down menu`. Once you are directed to the "List page" for
     :term:`static pages <static page>`, click on the "Welcome" blue menu.

   All three options will direct you to the :term:`Home page` :term:`view page`.

   .. NOTE::

      Editing the "Title" :term:`field` of the :term:`Home page` will edit the
      blue menu that you will select in the :term:`static page` "List page"
      (i.e. if you change "Welcome" to say "Bienvenue", the blue menu in the
      "List page", as well as the main header of the :term:`Home page` will
      change to "Bienvenue").

#. To switch from the main :term:`view page` to :term:`edit mode`, click on the
   :term:`edit button` in the :term:`button block`.
#. On loading, the `edit page` will display a "Title" :term:`field`, a
   :term:`Slug` :term:`field` and a "Content" :term:`field`.

   .. IMPORTANT::

      The :term:`Slug` :term:`field` is a page title referenced by AtoM
      code to manage URLs; it **cannot be changed** for the :term:`Home page` or
      the :term:`About page`. However, it can be edited in any static pages that
      you :ref:`add yourself <add-static-page>`.

#. Add and/or revise data as required.

   .. TIP::

      Users can include `HTML <https://en.wikipedia.org/wiki/Html>`__ and inline
      `CSS <https://en.wikipedia.org/wiki/CSS>`__ code to the "Content"
      :term:`field` to include any links and special styling. See :ref:`below
      <styling-static-page>` for information on how to style :term:`static
      pages <static page>`.

#. You can quit the edit process at any time by clicking the "Cancel" button
   in the :term:`button block`; any data already entered will not be saved. Note
   that simply navigating away from the page by any other means, **without first
   clicking "Create"** will also result in no edits being saved.
#. To save the changes made to the :term:`Home page`, click the
   :term:`"Create" button <create button>` located in the :term:`button block`
   at the bottom of the record.

.. _edit-about-page:

Edit from About page
--------------------

To edit the :term:`About page` in AtoM:

#. Navigating to the :term:`About page`. You can do this by either:

   * Clicking the |info| :ref:`Quick links menu <quick-links-menu>` in the
     :term:`main menu` of the :term:`header bar` and selecting  "About" from the
     :term:`drop-down menu`; **or**
   * Clicking the |gears| :ref:`Admin <main-menu-admin>` of the
     :term:`header bar` and selecting "Static pages" from the
     :term:`drop-down menu`. Once you are directed to the "List page" for
     :term:`static pages <static page>`, click on the "About" blue menu.

   Both options will direct you to the :term:`About page` :term:`view page`.

   .. NOTE::

      Editing the "Title" :term:`field` of the :term:`About page` will edit the
      blue menu that you will select in the :term:`static page` "List page"
      (i.e. if you change "Welcome" to say "Bienvenue", the blue menu in the
      "List page", as well as the main header of the :term:`About page` will
      change to "Bienvenue").

#. To switch from the main :term:`view page` to :term:`edit mode`, click on the
   :term:`edit button` in the :term:`button block`.
#. On loading, the `edit page` will display a "Title" :term:`field`, a
   :term:`Slug` :term:`field` and a "Content" :term:`field`.

   .. IMPORTANT::

      The "Slug" :term:`field` is a page title referenced by AtoM code
      to manage URLs; it **cannot be changed** for the :term:`Home page` or the
      :term:`About page`. However, it can be edited in any static pages that you
      :ref:`add yourself <add-static-page>`.

#. Add and/or revise data as required.

   .. TIP::

      Users can include `HTML <https://en.wikipedia.org/wiki/Html>`__ and
      inline `CSS <https://en.wikipedia.org/wiki/CSS>`__ code to the "Content"
      :term:`field` to include any links and special styling. See :ref:`below
      <styling-static-page>` for information on how to style :term:`static
      pages <static page>`.

#. You can quit the edit process at any time by clicking the "Cancel" button
   in the :term:`button block`; any data already entered will not be saved. Note
   that simply navigating away from the page by any other means, **without first
   clicking "Create"** will also result in no edits being saved.
#. To save the changes made to the :term:`Home page`, click the
   :term:`"Create" button <create button>` located in the :term:`button block`
   at the bottom of the record.

:ref:`Back to top <manage-static-pages>`

.. _add-static-page:

Add a new static page
=====================

In AtoM, new :term:`static pages <static page>` can be added at any time by any
authenticated (i.e. logged-in) :term:`administrator`. Similar to both the
:term:`Home page` and the :term:`About page`, you may wish to add a new static
page in order to include permanent, or "timeless" content to your webpage.
:term:`Static pages <static page>` may be customized to offers users
instructions or help in navigating the site (i.e. a "Help" page),
provide contact information (i.e. a "Contact Us" page), or feature website
content, categories, and/or contributors.

To add a new static page in AtoM:

#. Click the the |gears| :ref:`Admin <main-menu-admin>` in the
   :term:`header bar` and select "Static pages" from the :term:`drop-down menu`.
#. You will be directed to a "List pages" page, where all :term:`static pages
   <static page>`, including the :term:`Home page` and the :term:`About page`
   will be listed.
#. Click on the :term:`Add new button` in the :term:`button block` to be
   directed to the :term:`edit page` for your new static page.
#. On loading, the `edit page` will display blank "Title", :term:`Slug` and
   "Content" :term:`fields <field>`. Add data as required.

   .. TIP::

      The :term:`slug` indicates the word, or sequence of words that will be
      visible to users in the URL link when they are navigating on a specific
      :term:`static page` (e.g.: the slug in the URL *www.artefactual.com/help*
      is */help*). The slug should be indicative of the content of that
      specific static page.

   When creating a new :term:`static page`, the :term:`slug` :term:`field` can
   either be customized or left blank. If you choose to customize the
   :term:`slug`, make the slug all lowercase, keep it short, and avoid accented
   characters (e.g.: "é"; "ñ"; "û") and punctuation (e.g.: "!"; ";"; "..."). If
   you leave the :term:`field` blank, AtoM will automatically generate a slug
   based on the "Title" you have indicated for your page (e.g.: If your "Title"
   is *About Us*, the slug for that static page will automatically be generated
   as *.../about-us*). Note that AtoM will automatically replace all accented
   characters with letters from the English alphabet and punctuation will either
   be removed or replaced by a dash "-" or percent-encoding (e.g.: If your
   "Title" is *Instructions & More*, the slug for that static page will
   automatically be generated as *.../instructions%26more* or
   *.../instructions-more*, unless otherwise indicated). The :term:`slug` will
   also appear in the once blank "Slug" :term:`field` and can be viewed when
   switching from the :term:`view page` to the :term:`edit page` of that
   :term:`static page`.

   .. WARNING::

      A :term:`slug` cannot be duplicated once it has been generated in AtoM. If
      you duplicate a slug, AtoM will automatically generate a "-2 (or the next
      subsequent number) at the end of the slug to distinguish it from the other
      one in the same name (e.g.: Two slugs titled *information* will result in
      the second of the two becoming *information-2*). If you remove an AtoM
      automatically generated :term:`slug` from the slug :term:`field` of a
      :term:`static page` you've created, AtoM will not re-generate the original
      slug, regardless of whether or not the "Title" of your page has
      changed; rather, it will generate a new slug in the form of a series
      of letters and numbers. **This should be avoided**, as it creates
      confusion because it does not accurately indicate the content of that
      :term:`static page`. To avoid this, simply enter a custom :term:`slug`.

#. You can quit the creation process at any time by clicking the "Cancel" button
   in the :term:`button block`; any changes made will not be saved. Note that
   simply navigating away from the page by any other means, **without first
   clicking "Save"** will also result in no new :term:`static page` being
   created.
#. When you are finished creating your new :term:`static page`, click the "Save"
   button in the :term:`button block`.

You will be directed to the :term:`view page` of the new :term:`static page`
where you can view your changes. The page can be :ref:`edited
<edit-static-page>` again at any time.

:ref:`Back to top <manage-static-pages>`

.. _add-links-static:

Add links to a new static page
==============================

Once a new :term:`static page` has been created, a new link must also be
created in order to allow users to navigate to the new static page. You can do
this by either creating a link within one of the default :term:`static pages
<static page>` or by clicking Admin > Menus and clicking the
:term:`Add new button` in the :term:`button block` or by linking the new
:term:`static page` to an existing menu.

This example shows a newly created "Contact Us" :term:`static page` that has
been added as a menu under the |info| :ref:`Quick links <quick-links-menu>`
parent menu:

.. image:: images/add-new-menu.*
   :align: center
   :width: 70%
   :alt: An image of Contact Us menu linked under Quick Links menu

Here is the result of the above:

.. image:: images/new-contact-us.*
   :align: center
   :width: 70%
   :alt: An image of new Contact Us menu

The information which will be needed when linking a new static page:

1. Name: an internal name which is not visible to users.

2. Label: how you wish the name of the page to appear in the menu.

3. Parent: which menu you wish the page to be linked from.

4. Path: in the format ``staticpage/index?slug=yourSlug``. yourSlug is the
   slug you either created or had AtoM generate automatically for you when the
   page was created.

5. Description: an optional area to describe the purpose of the page.

For more information on managing menus in AtoM, see: :ref:`manage-menus`.

:ref:`Back to top <manage-static-pages>`

.. _styling-static-page:

Styling static pages
====================

Basic styling of :term:`static pages <static page>` can be achieved by including
`HTML <https://en.wikipedia.org/wiki/Html>`__ and inline
`CSS <https://en.wikipedia.org/wiki/CSS>`__ code
to the "Content" :term:`field`. There are plenty of online tutorials
and resources out there for instruction on HTML and inline CSS use, but a few
basic examples commonly employed by AtoM users have been included here as an
example.

See below for instructions on how to create and edit:

* :ref:`Headers and subtitles <static-headers-subtitles>`
* :ref:`Hyperlinks <static-hyperlinks>`
* :ref:`Images <static-image>`
* :ref:`Boxes and dividers <static-boxes-dividers>`

.. _static-headers-subtitles:

Headers and subtitles
---------------------

To increase the size of a heading or subtitle, wrap the relevant text in
``<h3> </h3>`` tags, like so:

.. code-block:: bash

   <h3>For more information, please contact</h3>.

This will produce the following results:

.. image:: images/larger-headings.*
   :align: center
   :width: 70%
   :alt: An image of a larger heading

For larger headings, use smaller numbers, such as <h2> or <h1>. Similarly, for
smaller headers, use ``<h4>`` or ``<h5>``. To bold, italicize or underline
headers and subtitles, simply wrap the relevant text in
``<b></b>`` for **bold**, ``<i> </i>`` for *italics*, or ``<u> </u>`` for
underline. Typing ``<b>Artefactual Systems Inc.</b>`` will produce the following
results:

.. image:: images/headings-subtitles.*
   :align: center
   :width: 70%
   :alt: An image of a bolded subtitle

.. _static-hyperlinks:

Hyperlinks
----------

To create external links on an AtoM static page, wrap the text you would like to
act as a link in a hyperlink ``<a> </a>`` tag, and include the web
address to which you would like the link to point, using the ``href=" "``
attribute - the http address would go in the quotations. Remember to close the
element after the text you want to link.

For example, to include a link in the "Contact Us" page, the code would
appear as such:

.. code-block:: bash

   Website: <a href="https://www.accesstomemory.org/en/">AtoM : Open Source
   Archival Description Software</a>

The above code would appear like this on the static page:

.. image:: images/hyperlinks.*
   :align: center
   :width: 70%
   :alt: An image of a hyperlink

.. _static-image:

Images
------

If you have access to the server on which your AtoM instance is located (i.e.,
if you are hosting it yourself, or can ask the host provider to include a file
for you), you can place images in a directory on the host server, and use a
local URL to point to them. Images can then be used via the HTML ``<img>``
image element, where the ``src=" "`` attribute points to the
path of the image, similar to how the hyperlinks are used above. For example, if
you wanted an image of email, named "contact-image.jpg" included on your static
"Contact Us" page, the code might look like this:

.. code-block:: bash

   ``<img src=".../path/to/contact-image.jpg">``, where "/path/to" represents
   the internal URL path to the location of contact-image.jpg on your host
   server.

To center the image, you can wrap the ``<img>`` image element in ``<center>``
tags, like this:

.. code-block:: bash

   <center><img src=".../path/to/contact-image.jpg"></center>

.. _static-boxes-dividers:

Boxes and dividers
------------------

You can add styled boxes around text by wrapping content in the HTML ``<div>``
element, and then using inline CSS to modify the
appearance of the box. For colors, use the HTML or RGB values for the color you
would like to use, rather than generic names such as "red," "blue," etc. - most
browsers support a limited pallette of colors using names such as this, and the
results may be inconsistent across browsers. There are many free HTML color
wheels available that allow you to choose a color and copy its HTML# or RGB
values; for example: http://www.colorpicker.com/

For a small centered box with a green color, you might use code such as
this:

.. code-block:: bash

   <div style="width:600px; margin-left:right; margin-right:right; padding: 5px;
   background-color:#39BF34; border:none;">Here is a list of ways that we can be
   contacted with any questions or concerns you may have:</div>

This is how the box will appear:

.. image:: images/boxes.*
   :align: center
   :width: 70%
   :alt: An image of a box

Another example of this is the light yellow box that appears on AtoM's "Welcome"
static page warning users that the data will reset every hour.

.. code-block:: bash

   <div style="padding: 8px; border-style: solid; border-width: 1px; background-
   color: #fdf5d9; border-color: #eedc94 #eedc94 #e4c652; border-color: rgba(0,
   0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);">Welcome message appears
   here</div>

And here is the result:

.. image:: images/welcome-box.*
   :align: center
   :width: 70%
   :alt: An image of a box

:ref:`Back to top <manage-static-pages>`
