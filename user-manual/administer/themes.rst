.. _themes:

==================
Themes and theming
==================

This section describes how to change the theme, :term:`site title`,
:term:`site description`, and :term:`site base URL` in your AtoM application.

.. NOTE::

   Customizations beyond what can be achieved in the :term:`user interface` are
   covered in the Administrator manual under
   :ref:`Theming <customization-theming>`.

.. _themes-change-theme:

.. IMPORTANT::

   Bootstrap 2 themes have been deprecated and will be removed in a future
   release. Please consider switching to a Bootstrap 5 theme.

Change theme
============

AtoM 2.7 and up ships with 3 themes: the default :term:`Dominion theme`
(arDominionB5Plugin) and the Archives Canada theme (arArchivesCanadaPlugin).

The Dominion themes are grey, white and black with the AtoM logo. The Archives
Canada theme is yellow, blue and white with the ArchivesCanada logo (see images
below).

The default version of the Dominion theme is based on Bootstrap 5 (“BS5”), a
framework for developing websites. BS5 provides a number of improvements over
the previous version (“BS2”) such as better security, responsiveness and
accessibility.

If you’re a brand new AtoM user, please use the default BS5 theme. If you
are performing an upgrade from an older version, and you have a custom
theme, we recommend upgrading that theme to use BS5.


.. figure:: images/dominionB5-theme.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: Dominion theme homepage

   Dominion Canada theme homepage

.. figure:: images/archives-canada-theme.*
   :align: center
   :figwidth: 60%
   :width: 100%
   :alt: Archives Canada theme homepage

   Archives Canada theme homepage

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

To change the theme:

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select Themes.

.. image:: images/change-theme.*
   :align: center
   :width: 80%
   :alt: List themes page

2. Click on the :term:`radio button` in the "Enabled" column for the theme
   you wish to have enabled and click "Save."

.. SEEALSO::

   * :ref:`Create a custom theme <customization-custom-theme>`

.. _themes-add-remove-elements:

Add or remove elements
======================

To add or remove the :term:`site title`, :term:`site description`,
:term:`site logo`, or :term:`language menu` from the AtoM header bar, or to
hide the digital object :term:`carousel` that appears when there are multiple
:term:`digital objects <digital object>` attached to lower-level descriptions:

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select Settings.

2. Click on or scroll down to Default page elements. Check or uncheck the
   boxes beside the elements you would like to add or remove and click Save.

.. image:: images/default-page-elements.*
   :align: center
   :width: 60%
   :alt: Settings for default page elements.

.. SEEALSO::

   * :ref:`Carousel <recurring-carousel>`
   * :ref:`The language menu <language-menu>`
   * :ref:`The AtoM header bar <atom-header-bar>`
   * :ref:`default-page-elements`

.. _themes-change-title:

Change site title, description, and base URL
============================================

To change the :term:`site title`, :term:`site description`, and/or
:term:`site base URL`:

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select Settings.

2. Click on or scroll down to Site information. Update the text in Site title,
   Site description, and Site base URL as desired, and click Save.

.. image:: images/change-site-info.*
   :align: center
   :width: 60%
   :alt: Settings for site information

.. SEEALSO::

   * :ref:`Settings - site information <site-information>`
   * :ref:`The AtoM header bar <atom-header-bar>`

Edit theme for an archival institution
======================================

In :term:`multi-repository systems <multi-repository system>` institutions
can change the appearance of individual institution pages and results pages
by uploading an institution logo, banner and changing the background colour.
For instructions, see
:ref:`Archival institutions- Edit theme <edit-institution-theme>`

:ref:`Back to the top <themes>`
