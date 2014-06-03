.. _customization-theming:

=======
Theming
=======

AtoM themes can be customized by editing the appropriate css and .php files, or
you can create a custom theme for your AtoM database.

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


Theme your own version of AtoM
------------------------------

1. Make changes to the global layout of the website in
   apps/qubit/templates/layout.php.

2. Make css style changes to layout.css, graphic.css, form.css and menu.css

3. Make changes to the templates in individual modules (found in the
   apps/qubit/modules/xxx/templates directory)

See
`Symfony framework <http://symfony.com/legacy/doc/book/1_0/en/07-Inside-the-View-Layer>`_
documentation for more assistance.


:ref:`Back to the top <customization-theming>`

