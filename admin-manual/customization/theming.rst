.. _customization-theming:

=======
Theming
=======

AtoM themes can be customized by editing the appropriate CSS/SCSS and .php files,
or you can create a custom theme.

Please note AtoM 2.7 introduced a new version of the Bootstrap (“BS5”) web
framework, and shipped with a theme based on BS5.

.. SEEALSO::

   * :ref:`Change theme <themes-change-theme>`
   * :ref:`Create a custom theme <customization-custom-theme>`

Customize how an AtoM theme looks
---------------------------------

1. Revise website name, tagline and logo in apps/qubit/templates/layout.php.

2. Add new logo image to web/images.

3. Revise website name & logo section in graphic.css to style new website
   name, tagline and logo

4. Replace favicon.ico in /web.

5. Change website meta tags (e.g. title, description, keywords) in
   apps/qubit/config/view.yml.

6. Change the homepage and about page content in staticPages.yml or in
   the user interface- see :ref:`manage-static-pages`.

7. Change default user interface labels in siteSettings.yml or in the
   user interface- see :ref:`user-interface-labels`.

8. Change the default templates for each module in siteSettings.yml or in
   the user interface- see :ref:`default-templates`.

9. Revise default drop-down/picklist values as well as menu options and labels
   in the user interface- see :ref:`manage-menus`.


.. _customization-custom-theme:

Create a custom theme
---------------------

In most cases, it's probably enough to build a custom theme upon an existing
one and preferably to use one that relies on our base theme Dominion, so you
don't have to get your hands too dirty. It's in the details where most of the
complexities are found. Dominion is the result of a cyclic process of testing
and refining by a large community of users, try not to underestimate that!

AtoM bundles three themes: arDominionPlugin, arDominionB5Plugin and arArchivesCanadaPlugin.
Their names follow the naming convention of Symfony 1.x plugins, because that is
how themes are implemented in AtoM. You may want to read more about Symfony plugins
later following `one of their guides <http://symfony.com/legacy/doc/gentle-introduction/1_4/en/17-Extending-Symfony#chapter_17_plug_ins>`_.

arDominionB5Plugin is the default theme, i.e. the theme that will be used in a
fresh installation. arArchivesCanadaPlugin was developed as an extension of the
former and the following instructions will show you how to create your custom
theme as we did with arArchivesCanadaPlugin.

.. TIP::

   The following instructions assume you already have an AtoM development environment set up
   locally. If not, we have two development-friendly environments for AtoM - see:

   * :ref:`dev-env-vagrant`
   * :ref:`dev-env-compose`

++++++++++++++++++++++++
Custom Bootstrap 5 Theme
++++++++++++++++++++++++

With the new BS5 framework, creating a custom theme that is an extension
of the default arDominionB5Plugin theme has become significantly easier. A
skeleton for an empty AtoM theme plugin that extends arDominionB5Plugin without
any modifications can be found in this `arThemeB5Plugin repository
<https://github.com/artefactual-labs/arThemeB5Plugin>`_.

Additional steps for tarball installations:
*******************************************

If not already installed, first `download the node.js binary distributuion
<https://nodejs.org/en/download>`_ and export the PATH variable. AtoM requires
the latest LTS version of node, v22 or above is required for AtoM 2.9+.

The tarball is missing three required files for this:

* :version-ref:`package.json<https://github.com/artefactual/atom/blob/stable/{version}.x/package.json>`
* :version-ref:`package-lock.json<https://github.com/artefactual/atom/blob/stable/{version}.x/package-lock.json>`
* :version-ref:`webpack.config.js <https://github.com/artefactual/atom/blob/stable/{version}.x/webpack.config.js>`

Copy the above files from the *correct stable branch*
(stable/|version|.x for AtoM |version|) of our `AtoM repo <https://github.com/artefactual/atom/>`_.

Test that everything has been installed correctly:

.. code-block:: bash

   $ npm install
   $ npm run build

If you encounter any issues at this point, we recommend resolving any issues by
consulting the :ref:`maintenance-troubleshooting` documentation before continuing.

Let's begin creating our new BS5 Theme:
***************************************

.. code-block:: bash

   $ cd ~/atom
   $ git clone --depth=1 https://github.com/artefactual-labs/arThemeB5Plugin.git plugins/arCustomThemeB5Plugin
   $ rm -rf plugins/arCustomThemeB5Plugin/.git plugins/arCustomThemeB5Plugin/README.md

Here, we've cloned the repo directly into the `atom/plugins` directory, renaming
the theme to `arCustomThemeB5Plugin`, and removed the git related files.

.. code-block:: bash

   $ cd plugins/arCustomThemeB5Plugin/config/
   $ mv arThemeB5PluginConfiguration.class.php arCustomThemeB5PluginConfiguration.class.php

To configure the theme plugin, we've renamed the config filename to match the
plugin name. Next, we need to change the `class name <https://github.com/artefactual-labs/arThemeB5Plugin/blob/main/config/arThemeB5PluginConfiguration.class.php#L23>`_
to match the new config filename (`arCustomThemeB5PluginConfiguration` for this
example).

.. image:: images/theme-config.*
   :align: center
   :width: 80%
   :alt: Example theme confiuration


Optionally, you can update the theme summary and version within the config file
and change the theme image thumbnail by replacing `arCustomThemeB5Plugin/images/image.png`.

To change the logo for BS5 themes, add the logo to `plugins/arCustomThemeB5Plugin/images/logo.png`.
Style changes can be made directly to, or linked in, the `main SCSS file <https://github.com/artefactual-labs/arThemeB5Plugin/blob/main/scss/main.scss>`_.
Custom javascripts can be added to the js directory and linked in the `main js file <https://github.com/artefactual-labs/arThemeB5Plugin/blob/main/js/main.js>`_.

For additional functionality modifications, copy files required into the new `plugins/arCustomThemeB5Plugin`
directory for overwriting. Due to file precedence, when copying files, first
check the `plugins/arDominionB5Plugin` for the required file, and only copy from
`apps/qubit` when the file is not found in `plugins/arDominionB5Plugin`. Files
copied should have the same file path with `plugin/arCustomThemeB5Plugin` replacing
`apps/qubit` or `plugins/arDominionB5Plugin`.

.. code-block:: bash

   cd ~/atom
   npm install
   npm run build

Once you've made all the required changes to your theme, build the theme assets,
and you should now be able to use your new theme!

.. TIP::

   If you are still not seeing your changes take effect, remember to
   :ref:`clear the Symfony cache <maintenance-clear-cache>` and your
   web browser's cache as well!

:ref:`Back to the top <customization-theming>`
