.. _site-logo:

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

=========
Site logo
=========

In AtoM, the site logo is the graphic that appears at the top of all pages in
the left-hand corner of the :term:`header bar`. Clicking on the logo will take
the user to the :term:`home page`.

It is important to note that the logo must be in "Portable Network Graphics" (`PNG 
<http://en.wikipedia.org/wiki/Portable_Network_Graphics>`__) format, with a 
recommended **maximum height** of **50px**. A logo exceeding 50px may break the
page layout, unless a developer has altered the theme of the page.

AtoM ships with a default logo that can be replaced in **Admin > Settings > Header
customizations**.

.. image:: images/header-customizations-logo-upload.*
   :align: center
   :width: 90%
   :alt: An image of the uploading a new logo in Header customizations settings.

Use the 'Resotre Default AtoM Logo' radio to restore logo to AtoM's default logo,
stored as **plugins/arDominionB5Plugin/images/default_atom_logo.png**.

.. image:: images/header-customizations-logo-restore.*
   :align: center
   :width: 90%
   :alt: An image of the Upload logo section of Header customizations settings.

.. TIP::

   Users who do **not** wish to have a logo can remove it by clicking on the
   |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main menu` located
   in the :term:`header bar` and selecting "Settings" from the
   :term:`drop-down menu`. Scroll down to the "Default page elements" and
   unselect the "Logo" value. This will remove the AtoM logo (or your own logo)
   from the AtoM header bar. For more information, see :ref:`Settings`.

For more information on themes and general header customizations, see
:ref:`header-customizations`, :ref:`navigate`, :ref:`settings`, :ref:`themes`,
or :ref:`archival-descriptions`.

:ref:`Back to top <site-logo>`
