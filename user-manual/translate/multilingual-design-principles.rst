.. _multilingual-design-principles:

==============================
Multilingual design principles
==============================

.. |globe2| image:: images/globe.png
   :height: 18
   :width: 18

AtoM is a multilingual application, which incorporates the following design
principles:

* Both the :term:`user interface` and the :term:`database content` should
  exist in multiple languages.

* Users should be able to switch the :term:`user interface` to their
  preferred language by navigating to the |globe2|
  :ref:`language menu <language-menu>` in the :term:`header bar` and
  selecting the language they  wish to translate content into.

* When switching the :term:`user interface` to a preferred language,
  :term:`database content` should also switch, if a translation is available;
  if not, the content remains in the original source language.

* Users with :term:`translator` :term:`access privilege` should be able to
  contribute translations of content (e.g., archival descriptions) from the
  source language to their assigned languages using the translation interface
  available in AtoM.

* The :term:`administrator` should be able to remove languages that are
  not needed in their application.

* The :term:`administrator` should be able to add back
  :term:`supported language` that were removed.

* The :term:`administrator` should be able to add new languages (that have an
  existing translation) from selecting the language from the drop-down list in
  the I18n languages section of the Admin Settings.

* When installing AtoM, the :term:`administrator` specifies the
  :term:`default language`. Any user can switch the :term:`current language`
  to display the :term:`user interface` and :term:`database content` in any
  of the other supported languages.


.. WARNING::

   AtoM does not automatically generate translations of content from one
   language to another. It is up to the individual translators to create the
   translations of the content and the :term:`user interface` with the tools
   provided through the AtoM translation interface.

.. TIP::

   For information about how to translate the AtoM application into your
   language, or improve an existing translation of the AtoM application and
   submit it to Artefactual for inclusion in our next major release,
   please visit our
   `wiki instructions <https://wiki.accesstomemory.org/Resources/Translation>`__.

**For more information, see the following sections in our User Manual:**

* :ref:`default-language`
* :ref:`The language menu <language-menu>`
* :ref:`Add/Remove languages <add-remove-languages>`
* :ref:`User roles: Translator <user-translator>`
* :ref:`Manage users and groups <manage-user-accounts>`
* :ref:`translate-content`
* :ref:`translate-interface`
* :ref:`translate-static-pages`

:ref:`Back to top <multilingual-design-principles>`

