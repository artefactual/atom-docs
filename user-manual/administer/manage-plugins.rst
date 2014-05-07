.. _manage-plugins:

==============
Manage plugins
==============

AtoM uses a number of plugins to install :term:`archival description`,
:term:`authority record` and :term:`archival institution` templates, as well
as perform other functions.

Enable plugins
==============
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

To enable or disable a plugin:

1. Click on the |gears| :ref:`Admin <main-menu-admin>` menu in the :term:`main
   menu` located in the :term:`header bar` and select Plugins.

.. image:: images/list-plugins.*
   :align: center
   :width: 70%
   :alt: List and enable plugins screen

2. Check or uncheck the plugins you wish to enable or disable. Click Save.

.. NOTE::

   Plugins based on `ICA <http://www.ica.org/>`_ standards are permanently
   enabled in AtoM. These include the  International Standard Archival
   Authority Record for Corporate Bodies, Persons and Families (ISAAR (CPF)),
   the  International Standard Archival Description (ISAD) and the
   International Standard for Describing Institutions with Archival Holdings
   (ISDIAH).

Enabling a metadata standard plugin means that the description template can
be enabled by an :term:`administrator`. See
:ref:`Settings - Default templates <default-templates>`.

List of plugins
===============

Below is a list of plugins by category:

**Metadata standard plugins**

============== ==============================================================
Name           Standard
============== ==============================================================
arDacsPlugin   Describing Archives: A Content Standard (DACS).
sfIsaarPlugin  International Standard Archival Authority Record for Corporate
               Bodies, Persons and Families (ISAAR (CPF)).
sfIsdfPlugin   International Standard for Describing Functions (ISDF).
sfDcPlugin     Simple Dubin Core (DC).
sfEacPlugin    Encoded Archival Context (EAC).
sfEadPlugin    Encoded Archival Description (EAD).
sfRadPlugin    Rules for Archival Description (RAD).
sfModsPlugin   Metadata Object Description Schema (MODS).
sfIsadPlugin   International Standard Archival Description (ISAD).
sfIsdiahPlugin International Standard for Describing Institutions with
               Archival Holdings (ISDIAH).
============== ==============================================================

**Other plugins**

============= ===============================================================
Name          Purpose
============= ===============================================================
qtSwordPlugin SWORD plugin.
sfSkosPlugin  Data transform plugin. Enables XML import and export of Simple
              Knowledge Organization System (SKOS) data.
arOaiPlugin   OAI plugin.
============= ===============================================================

:ref:`Back to the top <manage-plugins>`
