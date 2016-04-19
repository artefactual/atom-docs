.. _isdf-template:

======================================================
International Standard for Describing Functions (ISDF)
======================================================

On this page you will find guidance for data entry in AtoM, using the ISDF
template for describing functions.

The ISDF template is based on the guidelines found in the *International Standard
For Describing Functions* (ISDF). ISDF is maintained by the International Council
on Archives (`ICA <http://www.ica.org/>`__), and is available at:

* http://www.ica.org/en/isdf-international-standard-describing-functions

.. SEEALSO::

   * :ref:`functions`

**Skip to:**

* :ref:`isdf-identity-area`
* :ref:`isdf-context-area`
* :ref:`isdf-relationships-area`
* :ref:`isdf-control-area`

.. _isdf-identity-area:

Identity area
=============

.. figure:: images/isdf-identity-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the ISDF Identity area.

   The data entry fields for the Identity area of the ISDF edit template.

Type
----

**Rule:** "Specify whether the description is a function or one of its
subdivisions." (ISDF 5.1.1) Select the type from the drop-down menu; these
values are drawn from the ISDF Function Types :term:`taxonomy`.

.. NOTE::

   Like nearly all :term:`terms <term>` used throughout AtoM in
   :term:`drop-down menus <drop-down menu>`, the default terms are maintained in
   a :term:`taxonomy` (ISDF Function Types), which can be managed by users with
   sufficient :term:`edit privileges <access privilege>`. See: :ref:`terms` for
   more information. To learn more about default edit privileges, see:
   :ref:`user-roles`. To change default permissions, see:
   :ref:`edit-user-permissions`. However, note that the existing terms are drawn
   directly from ISDF recommended terms - if you want your function description
   to remain standards-compliant, we don't recommend editing these terms or
   adding new ones!

Authorized form of name
-----------------------

**Rule:** "Record the authorised form(s) of name of the function. Use the
territorial or administrative scope of the function, the name of the
institution which performed it and other qualifiers as appropriate to
distinguish the function from other functions with similar names. This element
is to be used in conjunction with the Function description identifier element
(5.4.1). (ISDF 5.1.2)

.. NOTE::

   Authorized form of name is a required field in the ISDF standard, though AtoM
   will allow you to save the record without including one. However, once saved,
   the :term:`slug` (e.g. the unique part of the URL leading to the function
   description) will be created based on the Authorized form of name. If you do
   not include one, AtoM will auto-generate an alpha-numeric slug for the
   description, and editing the authorized form of name will not change the slug.

   For more information on slugs in AtoM, see: :ref:`slugs-in-atom`. A system
   administrator with access to the command-line interface can regenerate slugs
   in AtoM - see: :ref:`cli-generate-slugs`.

Parallel form(s) of name
------------------------

**Rule:** "*Purpose:* To indicate the various forms in which the authorised
form(s) of name occurs in other languages or scripts. *Rule:* Record the
parallel form(s) of name in accordance with any relevant national or
international conventions or rules applied by the archival institution that
created the description, including any necessary subelements and/or qualifiers
required by those conventions or rules. Specify in the Rules and/or
conventions used element (5.4.3.) which rules have been applied." (ISDF 5.1.3)

.. NOTE::

   This is a repeatable :term:`field` in AtoM. As you exit the field (by either
   pressing the Tab key, or clicking out of the field with your mouse), AtoM will
   add a new field below, so you can enter multiple parallel names if required.

:ref:`Back to top <isdf-template>`

.. _isdf-context-area:

Context area
============

.. figure:: images/isdf-context-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the ISDF Context area.

   The data entry fields for the Context area of the ISDF edit template.

TO DO

:ref:`Back to top <isdf-template>`

.. _isdf-relationships-area:

Relationships area
==================

.. figure:: images/isdf-relationships-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the ISDF Relationships area.

   The data entry fields for the Relationships area of the ISDF edit template.

TO DO

:ref:`Back to top <isdf-template>`

.. _isdf-control-area:

Control area
============

.. figure:: images/isdf-control-area.*
   :align: center
   :figwidth: 50%
   :width: 100%
   :alt: An image of the data entry fields in the ISDF Control area.

   The data entry fields for the Control area of the ISDF edit template.

TO DO

:ref:`Back to top <isdf-template>`
