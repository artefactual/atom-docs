.. _technical-requirements:

=======================
Technical Requirements
=======================

Server-side requirements (for installation, hosting, etc.)
==========================================================

Details for the hardware and server environment, and the software
dependencies (both required and recommended) have been documented in our
:ref:`Administator Manual <admin-manual-home>`. For further details, see:
:ref:`installation-requirements`.


Client-side requirements (for end users)
========================================

AtoM has been designed with minimal assumptions about the technology
available to users and contributors. All that is required is access to the
internet and a web browser (any web browser will do, though use of a modern
web browser is strongly encouraged). AtoM does, however, rely on "client-side"
JavaScript to achieve certain effects when displaying content:

* on :term:`edit pages <edit page>`, :term:`fields <field>` are grouped into
  :term:`information areas <information area>` that are "collapsible" (i.e.,
  fields can be displayed or hidden)
* Some :term:`drop-down menus <drop-down menu>` are collapsible (i.e. options
  in the list can be expanded to display more options or collapsed to hide them)

Older browsers that do not support JavaScript will not be able to view these
effects. They are still able to access AtoM unimpaired; it just won't look as
nice. It is recommended, therefore, that users employ modern web browsers
that support JavaScript (such as `Firefox
<http://www.mozilla.org/firefox>`_, `Chrome
<https://www.google.com/intl/en_uk/chrome/browser/>`_, `Opera
<http://www.opera.com/browser/>`_, or `Safari
<http://www.apple.com/safari/>`_.)

The digital object multi-uploader requires Flash. This is a requirement that we
are hoping to eliminate in future releases.
