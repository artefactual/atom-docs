.. _formatting:

==========
Formatting
==========

.. _htmlpurifier: http://htmlpurifier.org/
.. _Markdown: https://daringfireball.net/projects/markdown/
.. _Parsedown: https://parsedown.org/
.. _GitHub: https://guides.github.com/features/mastering-markdown/
.. _Reddit: https://www.reddit.com/wiki/markdown
.. _Wordpress: https://en.support.wordpress.com/markdown/
.. _Grav: https://learn.getgrav.org/15/content/markdown

This page will capture custom methods for formatting content added to
:term:`edit pages <edit page>` or :term:`static pages <static page>`. Since
the 2.2 release, AtoM has included additional security measures that escape
HTML content added to edit pages - so inline HTML cannot be used in the forms to
create external hyperlinks, or for stylistic changes such as bolding, italics,
etc. 

.. NOTE::

   HTML *can* be added to static pages, but the following custom formatting
   syntax will work as well. Note that if htmlpurifier_ is enabled in AtoM,
   then the supported HTML elements on static pages will be limited by the
   htmlpurifier settings - for more information, see:
   :ref:`security-static-pages`.

However, as of the 2.5 release, AtoM supports the use of Markdown_ in both
edit pages and static pages, via a PHP library known as Parsedown_. Markdown
is a lightweight markup syntax for text formatting, originally created by John
Gruber. It is now widely used on the web - example uses include styling README
files on GitHub_ and other code repositories, formatting text in online forums
such as Reddit_, and in content management systems such as Wordpress_ or
Grav_. 

Markdown uses a series of reserved special characters and specific line
breaks to indicate styling on user-added raw text in edit pages. When parsed
by the Parsedown library, these elements are then rendered as styled content
in view pages. For example, adding text ``**inside two asterisks**`` in an
edit page will be rendered as **bolded text** when saved in AtoM.

The following documentation will outline how Markdown can be used in AtoM. In 
each example, the syntax to be used in edit pages will be shown in an escaped 
block. Below that, an image of the escaped block, and how it will look when 
parsed and rendered on an AtoM view page, will also be shown. We encourage you
to play around with it yourself to better understand the examples provided. 

Please note that not all available styling elements in the Markdown specification 
are currently supported in AtoM. In edit pages, formatting can be added to 
free-text edit :term:`fields <field>` - however, we do not recommend attempting 
to add it in any controlled value fields (i.e. fields with autocomplete or 
drop-down menus, such as the subject and place access point fields, the related 
descriptions field, the creator(s) field, or the repository field) when first 
creating new entities. 

.. SEEALSO::

   * :ref:`styling-static-page`
   * :ref:`add-edit-content`

**Jump to:**

* :ref:`formatting-settings`
* :ref:`formatting-headers`
* :ref:`formatting-emphasis`
* :ref:`formatting-lists`
* :ref:`formatting-links`
* :ref:`formatting-images`
* :ref:`formatting-raw`
* :ref:`formatting-blockquotes`
* :ref:`formatting-hr`

.. _formatting-settings:

Enabling Markdown in AtoM
=========================

For AtoM to parse your content and render Markdown syntax, you will first need 
to ensure that the Markdown setting is enabled in AtoM - it can be found in 
**Admin > Settings > Markdown**. For more information, see: 

* :ref:`markdown-settings`

.. IMPORTANT::

   After enabling or disabling this setting, a system administrator **must** 
   rebuild the search index for the changes to take effect. For more information 
   on how to rebuild AtoM's search index, see: 
   :ref:`maintenance-populate-search-index`.

Once enabled, AtoM will render any user-added content with Markdown syntax as 
formatted content in :term:`view pages <view page>`. Note that any incomplete 
elements (e.g. an attempt to bold content by putting it inside double asterisk 
characters, but forgetting to add the closing asterisks like so: 
``**my content``) will be ignored and will remain rendered as plain text. 

.. _formatting-headers:

Headers
=======

Headers can be used to add section titles when organizing long text-based 
content. Once parsed by the Markdown library in AtoM, these are rendered for 
display as ``<h1>`` to ``<h6>`` HTML headings. 

You can add headers to AtoM by adding pound signs before text on its own line, 
like so: 

.. code-block:: none

   # Header1
   ## Header2
   ### Header3
   #### Header4
   ##### Header5
   ###### Header6

An image of how these will render in AtoM: 

.. image:: images/formatting-headers.*
   :align: center
   :width: 90%
   :alt: An example of markdown headers rendered in AtoM

:ref:`Back to top <formatting>`

.. _formatting-emphasis:

Emphasis and text styling
=========================

You can add bold, italics, strikethrough, and a combination of these elements
to text, like so:

.. code-block:: none

   Emphasis, aka italics, with *asterisks* or _underscores_.
   
   Strong emphasis, aka bold, with **asterisks** or __ double underscores__.

   Combined bold and italics emphasis with **asterisks and _underscores_**.

   Strikethrough uses two tildes. ~~Scratch this.~~ 

An image of how these will render in AtoM: 

.. image:: images/formatting-emphasis.*
   :align: center
   :width: 90%
   :alt: An example of markdown text emphasis formatting rendered in AtoM

:ref:`Back to top <formatting>`

.. _formatting-lists:

Lists
=====

Lists in AtoM using Markdown can be ordered (e.g. sequential numbering) or 
unordered (e.g. bullets). These generally need to be found at the start of a new
line, with space above and below them for them to render properly. 

The basic syntax for an unordered list is an asterisk followed by a space, and 
then the list item. Ordered lists require a number and a period, followed by a 
space before the list item: 

.. code-block:: none

   Here's an unordered list of numbers: 

   * one 
   * two
   * three
   * four

   Here's an ordered list: 

   1. one
   2. two
   3. three
   4. four

You can insert properly indented paragraphs in the middle of a list while
maintaining the list formatting, you can mix ordered and unordered list
elements, and you can nest list elements as needed. To indent a list and add a
nested list element, add 2 spaces before your next list character, like so: 

.. code-block:: none

   Here's a nested unordered list of numbers: 

   * one 
     * two
       * three
         * four

           this is still part of four

   Here's a partially nested ordered list of numbers:

   1. one
     2. two
   3. three
     4. four

        this is still part of four

Here is how the above nested lists would display in AtoM:

.. image:: images/formatting-lists-1.*
   :align: center
   :width: 90%
   :alt: An example of markdown list formatting rendered in AtoM

Note that spacing is very important to get right with nested lists. Note as
well how the numbering resets in ordered list screenshot example - the actual
number you add does not matter. Markdown will maintain the numbering order of
the primary list based on the level of indentation and will continue the
number after nesting.

Below are some more detailed examples with a mix of list elements: 

.. IMPORTANT:: 

   In the escaped part of this example below, leading and trailing spaces are
   shown with with dots: ``⋅``. This is **just** to illustrate the number of
   spaces required for proper rendering - you do not need to use dot
   characters to indent lists - in fact, it won't work if you do! In the
   rendered version shown in the screenshot below, the dots have been removed, 
   and spaces are used instead, as AtoM expects for proper rendering. 

.. code-block:: none

   1. First ordered list item
   2. Another item
   ⋅⋅* Unordered sub-list.
   1. Actual numbers don't matter, just that it's a number
   ⋅⋅1. Ordered sub-list
   4. And another item.   

   ⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).   

   ⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
   ⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
   ⋅⋅⋅(This is different from the typical GitHub-flavored Markdown line break behavior, where trailing spaces are not required.)   

   * Unordered list can use asterisks
   - Or minuses
   + Or pluses

An image of how these will render in AtoM: 

.. image:: images/formatting-lists-2.*
   :align: center
   :width: 90%
   :alt: An example of markdown list formatting rendered in AtoM

:ref:`Back to top <formatting>`

.. _formatting-links:

Hyperlinks
==========

In many cases, users may wish to add a hyperlink to an external site to the
:term:`edit page` of an :term:`archival description` or other :term:`entity`
in AtoM - for example, a link to an external finding aid in the "Finding aids"
field; a link to an external holdings list on a :term:`repository` page, etc.

There are 2 main methods this can be accomplished - either in-line, or by adding
a reference link. Inline links look like this: 

.. code-block:: none

   [display text in square brackets](http://www.my-hyperlink-example.com)

The above example will lead to "display text in square brackets" appearing as a 
hyperlink in the :term:`view page` of the :term:`entity` when saved.

You can also separate the display text from the link, using the reference method, 
like so: 

.. code-block:: none

   This is my [hyperlink]. I can add more content after it. 

   [hyperlink]: http://www.my-hyperlink-example.com

In the above example, the word "hyperlink" in the first sentence would appear 
as an external link. The reference text below, which tells AtoM the URL of the 
hyperlink, would not be displayed in the view page upon save. 

Below is a summary of some of the different linking options and formats 
available:

.. code-block:: none

   [I'm an inline-style link](https://www.accesstomemory.org)
   
   [I'm an inline-style link with title](https://www.acccesstomemory.org "AtoM's Homepage")
   
   [I'm a reference-style link][Arbitrary case-insensitive reference text]
   
   [You can use numbers for reference-style link definitions][1]
   
   Or leave it empty and use the [link text itself].
   
   URLs and URLs in angle brackets will automatically get turned into links.
   http://www.example.com or <http://www.example.com>.
   
   Some text to show that the reference links can follow later.
   
   [arbitrary case-insensitive reference text]: https://www.artefactual.com
   [1]: https://www.slideshare.net/accesstomemory
   [link text itself]: https://twitter.com/accesstomemory

An image of how these will render in AtoM: 

.. image:: images/formatting-links.*
   :align: center
   :width: 90%
   :alt: An example of markdown link formatting rendered in AtoM

.. TIP:: 

   You can also link to existing pages in AtoM by simply providing the unique
   part of the path in the link. For example, if my AtoM site is located at 
   ``http://www.example.com``, and the URL for my global Settings page is 
   normally found at ``http://www.example.com/settings/global``, then I could 
   create a link directly to that page (for authenticated users with sufficient
   :term:`access permissions <access privilege>` to reach it) with the following:

   .. code-block:: none

      Go to the [global settings page](/settings/global) with this link.

   When rendered, "global settings page" would appear as a hyperlink. When 
   clicked, users would be redirected to ``http://www.example.com/settings/global``.


:ref:`Back to top <formatting>`

.. _formatting-images:

Images
======

You can also use Markdown to include images available on the web inside 
user-editable AtoM fields. Much like when you 
:ref:`link external web-based digital objects <link-digital-object>` to an 
:term:`archival description`, the following conditions must be met for the display
of the image to succeed: 

* They must be available on the public web - any login requirements, firewalls, 
  VPN restrictions, etc. will cause the link to fail. 
* You must provide a link directly to the :term:`digital object` - that is, the 
  link must end in the file extension (e.g. ``.jpg``, ``.png``, etc). This is 
  often achieved by right-clicking on an image in a webpage and selecting 
  "view image", and then using the URL provided on the resulting page. 
* Your image URLs must be HTTP or HTTPS based - FTP links or internal 
  network shares not available on the public web will not work. 

Additionally, some formats (such as ``.svg``) will not render. We recommend 
JPEG and PNG formats for the best results. 

The syntax is similar to that for creating :ref:`hyperlinks <formatting-links>`, 
but is preceded by an exclamation mark. You can use the in-line style, or you can
separate the target hyperlink to the image from the place where it is called, 
using the reference-style image link. 

The basic format for inline image linking is like so: 

.. code-block:: none

   ![alt text](http://www.my-example-image.com/cat.png "title text"){.optional-css-class}

Some examples of both formats: 

.. code-block:: none

   Here's Artefactual's logo (hover to see the title text):

   Inline-style:
   ![alt text](https://static.accesstomemory.org/images/artefactual.png "Logo Title Text 1")   

   Reference-style:
   ![alt text][logo]   

   [logo]: https://static.accesstomemory.org/images/artefactual.png "Logo Title Text 2"

An image of how these will render in AtoM: 

.. image:: images/formatting-images.*
   :align: center
   :width: 90%
   :alt: An example of markdown image formatting rendered in AtoM


:ref:`Back to top <formatting>`

.. _formatting-raw:

Escaped content (code blocks and raw text)
==========================================

Because Markdown is often used to help document programming code  (where spacing 
and proper indentation etc. can matter), it also includes a method to display 
individual strings, or whole blocks of text, in a raw or escaped format. 

To escape text inline in a paragraph you can add back-ticks around it like so: 

.. code-block:: none
  
   Inline `code` has `back-ticks around` it

This will display in AtoM as: 

.. image:: images/formatting-inline-text.*
   :align: center
   :width: 90%
   :alt: An example of markdown inline escaping formatting rendered in AtoM

You can also escape a whole block of text, by "fencing" it with three back-ticks
on the lines above and below the content you want to escape. The escaped text
is typically referred to as a code block in Markdown. An example: 

.. code-block:: none

   Blocks of code are  "fenced" by  new lines with three back-ticks, like so:    

   ```
   This whole block will be escaped. So let's throw in a <b>tag</b>. and some
   **markdown** emphasis to show how it doesn't render
   ```

   You can then add more content after. 

This will display in AtoM as: 

.. image:: images/formatting-codeblock.*
   :align: center
   :width: 90%
   :alt: An example of markdown codeb formatting rendered in AtoM

Note that within an escaped code block, all content is skipped by the parser - 
meaning both Markdown and HTML inside the block will not render. 

.. _formatting-blockquotes:

Block quotes
============

Block quotes can be a useful way of quoting content from other sources. On a new 
line, they can be created by adding a ``>`` character and a space before the 
content. For multiple paragraphs within a block quote, simply keep adding the ``>`` 
character on each new line, including any spaces. 

Note that other markdown added in a block quote will still render properly. 

An example: 

.. code-block:: none

   > Block quotes are very handy in email to emulate reply text.
   > 
   > This line is part of the same quote.   

   Quote break. Your regular text can continue here   

   > This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you`can` *put* **Markdown** into a block quote.

An image of how these will render in AtoM: 

.. image:: images/formatting-blockquote.*
   :align: center
   :width: 90%
   :alt: An example of markdown block quote formatting rendered in AtoM

:ref:`Back to top <formatting>`

.. _formatting-hr:

Horizontal rules
================

A horizontal rule is simply a horizontal line, that can be used to separate 
sections of content. You can add these by simply adding 3 or more special 
characters (hyphens, asterisks, or underscores) on their own line. For example:

.. code-block:: none

   Three or more...

   ---

   Hyphens

   ***

   Asterisks

   ___

   Underscores

   ...will all create a horizontal rule.

An image of how these will render in AtoM: 

.. image:: images/formatting-hr.*
   :align: center
   :width: 90%
   :alt: An example of markdown horizontal rule formatting rendered in AtoM

:ref:`Back to top <formatting>`
