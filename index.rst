.. _home:

==================
AtoM documentation
==================

.. toctree::
   :hidden:

   index
   /user-manual/index
   /admin-manual/index

.. _user-manual-home:

User manual
===========

User guide to creating, editing, accessing, importing, exporting, and
translating content in AtoM; includes administering the system via the
:term:`user interface`.

.. _overview:

Overview
--------

This section provides an overview of the technical architecture and
requirements.

* :doc:`What is AtoM? <user-manual/overview/intro>`
* :doc:`Technical requirements <user-manual/overview/technical-requirements>`
* :doc:`Entity types <user-manual/overview/entity-types>`
* :doc:`Descriptive standards <user-manual/overview/descriptive-standards>`

.. _getting-started:

Getting started
----------------

This section describes how to start using AtoM once it has been installed. It
provides a quick orientation to the home page, how to log in and log out, the
various user roles in the system, the main page types a user will encounter, and
how to switch languages.

* :ref:`Home page <home-page>`
* :ref:`Log in <log-in>`
* :ref:`User roles <user-roles>`
* :ref:`Page types <page-types>`
* :ref:`Choose language <choose-language>`
* :ref:`Change password <change-password>`

.. _add-edit-content:

Add/edit content
----------------

This section describes how to add, edit, and delete content in AtoM.

* :ref:`Accession records <accession-records>`
* :ref:`Archival descriptions <archival-descriptions>`
* :ref:`Authority records <authority-records>`
* :ref:`Archival institutions <archival-institutions>`
* :ref:`Deaccession records <deaccessions>`
* :ref:`Donors <donors>`
* :ref:`Functions <functions>`
* :ref:`Rights <rights>`
* :ref:`Control area <control-area>`
* :ref:`Terms <terms>`
* :ref:`Physical storage <physical-storage>`
* :ref:`Exit edit mode <exit-edit-mode>`

.. _access-content:

Access content
--------------

This section provides guidelines for searching, browsing, and navigating. Most
of the functions discussed are available to all :ref:`user roles <user-roles>`,
including :ref:`researchers <user-researcher>` with read only access. However,
some navigation features (e.g. edit mode), are only available to users with
edit :term:`access privileges <access privilege>`.

* :ref:`Search <search-atom>`
* :ref:`Advanced search <advanced-search>`
* :ref:`Browse <browse>`
* :ref:`Navigate <navigate>`
* Context menu

.. _translate:

Translate
---------

This section describes how to translate both database content and
:term:`user interface` elements in AtoM.

* Multilingual design principles in AtoM
* Translate content
* Translate interface
* Translate static pages


.. _reports-printing:

Reports/printing
----------------

This section describes how to create and print different types of reports using
AtoM:

* Create file list report & print
* Create item list report & print
* Create physical storage locations report & print
* Print search results
* Print finding aid

.. _import-export:

Import/export
-------------

This section describes automated methods for getting data in and out of an AtoM
application.

* :ref:`Upload digital objects <upload-digital-object>`
* Import descriptions and terms
* Export descriptions and terms
* :ref:`CSV import <csv-import>`

.. _administer:

Administer
----------

This section describes how to administer AtoM, whether for a single institution
or for a :term:`network`.

* Install
* :ref:`Manage user accounts and user groups <manage-user-accounts>`
* :ref:`Manage digital object storage <manage-digital-object-storage>`
* :ref:`Edit user permissions <edit-user-permissions>`
* :ref:`Manage static pages <manage-static-pages>`
* :ref:`Manage menus <manage-menus>`
* Manage plugins
* :ref:`Settings <settings>`
* Themes and theming
* Default language
* :ref:`Site logo <site-logo>`
* Back up
* :ref:`Search for updates <search-updates>`
* Global search and replace
* :ref:`Visible elements <visible-elements>`

.. _data-entry:

Data entry / templates
-----------------------

This section includes specific instructions on working with AtoM's
standards-based edit templates. Data entry guidance is provided based on
guidance from the relevant standard, notes on each :term:`field's <field>` use
in AtoM, and more.

* **Archival description templates**

  * :ref:`ISAD(G) template <isad-template>`
  * :ref:`RAD template <rad-template>`
  * :ref:`DACS template <dacs-template>`
  * :ref:`Dublin Core template <dc-template>`
  * :ref:`MODS template <mods-template>`

* **Authority record templates**

  * :ref:`ISAAR-CPF template <isaar-template>`

* **Archival institution templates**

  * :ref:`ISDIAH template <isdiah-template>`

Glossary
--------

Glossary of terms used throughout this user manual.

* :doc:`Glossary <user-manual/glossary/glossary>`

.. _admin-manual-home:

Administrator manual
====================

Instructions for installing, upgrading, importing and more; includes
administering the system via the command-line interface.

.. _admin-installation:

Installation
------------

* :ref:`installation-intended-audience`
* :ref:`installation-requirements`
* :ref:`installation-linux`
* :ref:`installation-windows`
* :ref:`installation-macosx`
* :ref:`installation-virtual-appliance`
* :ref:`installation-vagrant`
* :ref:`installation-multi-node`
* :ref:`installation-upgrading`
* :ref:`installation-execution-limits`

Maintenance
-----------

* :ref:`maintenance-cli-tools`
* :ref:`maintenance-clear-cache`
* :ref:`maintenance-web-analytics`
* :ref:`maintenance-logging`
* :ref:`maintenance-monitoring`
* :ref:`maintenance-populate-search-index`
* :ref:`maintenance-tuning`
* :ref:`maintenance-troubleshooting`

Customization
-------------

* :ref:`customization-theming`
* :ref:`customization-localization`

Security
--------

* :ref:`security-firewall`
* :ref:`security-backups`

