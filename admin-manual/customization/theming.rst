.. _customization-theming:

=======
Theming
=======

AtoM themes can be customized by editing the appropriate css/scss and .php files,
or you can create a custom theme.

Please note AtoM 2.7 introduced a new version of the Bootstrap (“BS5”) web
framework, and shipped with a theme based on BS5.

Bootstrap 2 Deprecation Notice
------------------------------

Bootstrap 2 themes have been deprecated and will be removed in a future release.
Please consider switching to a Bootstrap 5 theme.

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
<https://nodejs.org/en/download>`_ and export the PATH variable.

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

For additional functionlity modifications, copy files required into the new `plugins/arCustomThemeB5Plugin`
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

++++++++++++++++++++++++
Custom Bootstrap 2 Theme
++++++++++++++++++++++++

.. NOTE::

   Bootstrap 2 themes have been deprecated and will be removed in a future
   release. Please consider switching to a Bootstrap 5 theme.

Let's start building the plugin structure from the command line. Our theme is
going to be called Corcovado (arCorcovadoPlugin). We are going to track its
contents with git and publish them in a remote repository hosted by GitHub so we
can enable others to contribute in the development. The repository is open source
so you can use it for your own reference, see https://github.com/artefactual-labs/atom-theme-corcovado.
You can also `create your own repository <https://help.github.com/articles/create-a-repo/>`_.

Let's begin to do some real work:

.. code-block:: bash

   $ cd ~/atom/plugins
   $ mkdir arCorcovadoPlugin
   $ git init
   $ echo "# Corcovado theme" > README.md
   $ git add README.md
   $ git commit -m "Initial commit"
   $ git remote add origin git@github.com:artefactual-labs/atom-theme-corcovado.git
   $ git push

We've created an empty directory where our plugin is going to be contained,
made a git repository of it, tracked our first file and published our work to
GitHub! However, our plugin does not meet the needed requirements for AtoM to
recognize it and allow us to enable it. Let's make that happen:

.. code-block:: bash

   $ cd ~/atom/plugins/arCorcovadoPlugin
   $ mkdir config
   $ cd config

Create a new file :file:`arCorcovadoPluginConfiguration.class.php` with the
following contents:

.. code-block:: php

   <?php

   class arCorcovadoPluginConfiguration extends sfPluginConfiguration
   {
     // Summary and version. AtoM recognizes any plugin as a theme as long as
     // the $summary string contains the word "theme" in it (case-insensitive).
     public static
       $summary = 'Theme plugin, extension of arDominionPlugin.',
       $version = '0.0.1';

     public function contextLoadFactories(sfEvent $event)
     {
       // Here we are including the CSS stylesheet build in our pages.
       $context = $event->getSubject();
       $context->response->addStylesheet('/plugins/arCorcovadoPlugin/css/min.css', 'last', array('media' => 'all'));
     }

     public function initialize()
     {
       // Run the class method contextLoadFactories defined above once Symfony
       // is done loading the internal framework factories.
       $this->dispatcher->connect('context.load_factories', array($this, 'contextLoadFactories'));

       // This allows us to override the application decorators.
       $decoratorDirs = sfConfig::get('sf_decorator_dirs');
       $decoratorDirs[] = $this->rootDir.'/templates';
       sfConfig::set('sf_decorator_dirs', $decoratorDirs);

       // This allows us to override the contents of the application modules.
       $moduleDirs = sfConfig::get('sf_module_dirs');
       $moduleDirs[$this->rootDir.'/modules'] = false;
       sfConfig::set('sf_module_dirs', $moduleDirs);
     }
   }

You may also have to :ref:`clear the Symfony cache <maintenance-clear-cache>`,
depending on the configuration of your environment but it's not necessary in
our Vagrant box. Now open the theme manager in AtoM found under the Admin menu.
The new arCorcovadoPlugin should appear and you can enable it now. We have not
defined our stylesheets yet so you will basically see a bunch of text and links
on a blank page. We are going to fix that now.

Download the reference stylesheet and compile it:

.. code-block:: bash

   $ cd ~/atom/plugins/arCorcovadoPlugin
   $ mkdir css
   $ cd css
   $ wget https://raw.githubusercontent.com/artefactual-labs/atom-theme-corcovado/master/css/main.less
   $ lessc --compress --relative-urls main.less > min.css

Now try to visit your AtoM site again from your browser. The aspect of
Corcovado is a bit unusual and buggy but you can have an idea of how much you
can achieve with just a small number of CSS selectors and expressions.
Additionally, you can take advantage of the extra sugar supported by the `Less CSS pre-processor <http://lesscss.org>`_,
e.g. variables, functions, includes, etc...

The `arCorcovadoPlugin repository <https://github.com/artefactual-labs/atom-theme-corcovado>`_
includes a Makefile that simplifies the compilation of the final stylesheet
artifact which you could track in your git repository or build when needed. We
prefer the latter but you may prefer to avoid having to install Less and its
dependencies in production.

In `Dominion <https://github.com/artefactual/atom/tree/stable/2.7.x/plugins/arDominionPlugin>`_,
we use the `Gulp build system <http://gulpjs.com/>`_ in order to automatically
build the final CSS file when we make changes in our stylesheets, saving us
from running that extra step. It's a tiny improvement that really counts when
you spend hours building a theme. Gulp can do much more than that, like
refreshing our browser or doing live reload each time we make a change, but
that's something that we haven't tried yet.

Symfony plugins allow you to do much more. For example, you could include and
use custom images, add your own templates or override the original ones provided
by AtoM, inject new controllers, filters, or signal callbacks, and much more.
Take a look at our
`arArchivesCanadaPlugin <https://github.com/artefactual/atom/tree/stable/2.7.x/plugins/arArchivesCanadaPlugin>`_.
This theme overrides the original homepage template as well as the search box
and the main header template. Other plugins in the same repository may give you
more ideas of what's possible - we've built much more than simple application
themes through plugins, e.g. our metadata templates or our initial HTTP API
work are Symfony plugins too.

:ref:`Back to the top <customization-theming>`
