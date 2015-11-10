.. _formatting:

==========
Formatting
==========

This page will capture custom methods for formatting content added to
:term:`edit pages <edit page>` or :term:`static pages <static page>`. Since
the 2.2 release, AtoM has included additional security measures that escape
HTML content added to edit pages - so inline HTML cannot be used in the forms to
create external hyperlinks, or for stylistic changes such as bolding, italics,
etc.

However, AtoM does include some custom methods for achieving the same effect
in a way that will not compromise the security of the application.

.. SEEALSO::

   * :ref:`styling-static-page`
   * :ref:`add-edit-content`

.. _add-custom-links:

Add custom hyperlinks to text fields
====================================

In many cases, users may wish to add a hyperlink to an external site to the
:term:`edit page` of an :term:`archival description` or other :term:`entity`
in AtoM - for example, a link to an external finding aid in the "Finding aids"
field; a link to an external holdings list on a :term:`repository` page, etc.

The following custom syntax can be used to add hyperlinks in edit templates
and static pages:

.. code-block:: bash

   "my presentation text":http://www.my-link.example.com

The above example will lead to "my presentation text" appearing as a hyperlink
in the :term:`view page` of the :term:`entity` when saved.

The format can be used for http, https, and ftp links.

Below is an an example image, depicting an edit page with an example link
added to a text field, and the corresponding outcome on the view page once
saved:

.. image:: images/linking-example.*
   :align: center
   :width: 70%
   :alt: An example of the linking format compared in an edit and view page

.. IMPORTANT::

   The hyperlink custom syntax can **not** be used in any controlled value
   fields (i.e. fields with autocomplete or drop-down menus, such as the
   subject and place access point fields, the related descriptions field, the
   creator(s) field, or the repository field).

   As well, the syntax is **not** currently supported in the
   :ref:`RAD <rad-template>` Title notes fields (e.g. Source of title proper
   note, Attributions and conjecture note, etc) or the
   :ref:`DACS <dacs-template>` Specialized notes fields (e.g. Citation note,
   Processing information note, etc).

:ref:`Back to top <formatting>`
