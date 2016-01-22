.. _customization-theming:

=======
Theming
=======

AtoM themes can be customized by editing the appropriate css and .php files, or
you can create a custom theme.


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


Create a custom theme
---------------------

In most cases, it's probably enough to build a custom theme upon an existing
one and preferably to use one that relies on our base theme Dominion, so you
don't have to get your hands too dirty. It's in the details where most of the
complexities are found. Dominion is the result of a cyclic process of testing
and refining by a large community of users, try not to underestimate that!

AtoM bundles two themes: arDominionPlugin and arArchivesCanadaPlugin. Their
names follow the naming convention of Symfony 1.x plugins, because that is how
themes are implemented in AtoM. You may want to read more about Symfony plugins
later following `one of their guides <http://symfony.com/legacy/doc/gentle-introduction/1_4/en/17-Extending-Symfony#chapter_17_plug_ins>`_.

arDominionPlugin is the default theme, i.e. the theme that will be used in a
fresh installation. arArchivesCanadaPlugin was developed as an extension of the
former and the following instructions will show you how to create your custom
theme as we did with arArchivesCanadaPlugin.

Assuming that you already have AtoM installed in your development environment
(you can use our :ref:`Vagrant box <installation-vagrant>`), let's start
building the plugin structure from the command line. Our theme is going to be
called Corcovado (arCorcovadoPlugin). We are going to track its contents with
git and publish them in a remote repository hosted by GitHub so we can enable
others to contribute in the development. The repository is open source so you
can use it for your own reference, see https://github.com/artefactual-labs/atom-theme-corcovado.
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
made a git repository of it, track our first file and publish our work to
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
     public static
       $summary = 'Theme plugin, extension of arCorcovadoPlugin.',
       $version = '0.0.1';

     public function contextLoadFactories(sfEvent $event)
     {
       $context = $event->getSubject();
       $context->response->addStylesheet('/plugins/arCorcovadoPlugin/css/min.css', 'last', array('media' => 'all'));
     }

     public function initialize()
     {
       $this->dispatcher->connect('context.load_factories', array($this, 'contextLoadFactories'));

       $decoratorDirs = sfConfig::get('sf_decorator_dirs');
       $decoratorDirs[] = $this->rootDir.'/templates';
       sfConfig::set('sf_decorator_dirs', $decoratorDirs);

       $moduleDirs = sfConfig::get('sf_module_dirs');
       $moduleDirs[$this->rootDir.'/modules'] = false;
       sfConfig::set('sf_module_dirs', $moduleDirs);
     }
   }

You may also have to clear the Symfony cache, depending on the configuration of
your environment but it's not necessary in our Vagrant box. Now open the theme
manager in AtoM found under the Admin menu. The new arCorcovadoPlugin should
appear and you can enable it now. We have not defined our stylesheets yet so
you will basically see a bunch of text and links on a blank page. We are going
to fix that now.

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

In `Dominion <https://github.com/artefactual/atom/tree/qa/2.3.x/plugins/arDominionPlugin>`_,
we use the `Gulp build system <http://gulpjs.com/>`_ in order to automatically
build the final CSS file when we make changes in our stylesheets, saving us
from running that extra step. It's a tiny improvement that really counts when
you spend hours building a theme. Gulp can do much more than that, like
refreshing our browser or doing live reload each time we make a change, but
that's something that we haven't tried yet.

Symfony plugins allow you to do much more, e.g. you could include our own images,
override the original templates provided by AtoM or add your owns, inject new
controllers, filters, signal callbacks and much more. Take a look at our
`arArchivesCanadaPlugin <https://github.com/artefactual/atom/tree/qa/2.3.x/plugins/arArchivesCanadaPlugin>`_.
This theme overrides the original homepage template as well as the search box
and the main header template. Other plugins in the same repository may give you
more ideas on what are the possibilities - we've built much more than simple
application themes through plugins, e.g. our metadata templates or our initial
HTTP API work are Symfony plugins too.

:ref:`Back to the top <customization-theming>`
