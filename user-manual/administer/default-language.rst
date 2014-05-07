.. _default-language:

================
Default language
================

:term:`Administrators <administrator>` can easily change the available
languages in the :term:`Language menu <language menu>` in the  :ref:`Site
settings <settings>`. When a user visits your AtoM site it will load the
English interface by default. However, you may wish to have the site load in
another language.

This is done by making a change in the :file:`/apps/qubit/config/settings.yml`
file. This will have to be done by a system administrator who has access to the
AtoM application files on your web server.

.. code-block:: bash

   apps/qubit/config/settings.yml

   all:
    .settings:
     default_culture: en

If you cannot find the setting :file:`default_culture`, add it under the section
:file:`.settings`. The default value is "en", which can be replaced with any
other `RFC 5646 code <https://tools.ietf.org/html/rfc5646>`_ for your preferred
default language, e.g. "fr" for French, "nl" for Dutch, "pt" for Portuguese, "es"
for Spanish, etc.

The AtoM configuration files use the YAML format, where the data structure
hierarchy is maintained by outline indentation. The specific number of spaces
in the indentation is unimportant as long as parallel elements have the same
left justification and the hierarchically nested elements are indented
further. Notice that strings do not require enclosure in quotations.

Once you make this change and save the settings.yml file, you will have to
:ref:`clear the cache <maintenance-clear-cache>` for this setting to take effect.

:ref:`Back to top <default-language>`

