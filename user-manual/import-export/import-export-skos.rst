.. _import-export-skos:

=================================
Import and export terms with SKOS
=================================

.. |import| image:: images/download-alt.png
   :height: 18
   :width: 18

.. |pencil| image:: images/edit-sign.png
   :height: 18
   :width: 18

A :term:`term` in AtoM is generally understood as a word or phrase making up
part of a :term:`controlled vocabulary`, which are grouped into
:term:`taxonomies <taxonomy>` for use throughout the application, as either
:term:`value lists <value list>`, or :term:`access points <access point>`. To
learn more about terms and taxonomies in AtoM, see:

* :ref:`terms`

You can import and export terms in AtoM using the Simple Knowledge
Organization System (SKOS) format, described as a "*W3C recommendation
designed for representation of thesauri, classification schemes, taxonomies,
subject-heading systems, or any other type of structured controlled vocabulary*"
(`Wikipedia <https://en.wikipedia.org/wiki/Simple_Knowledge_Organization_System>`__).

The following documentation will introduce term import and export via the
:term:`user interface`.

**Jump to:**

* :ref:`import-skos`
* :ref:`export-skos`

.. TIP::

   A system administrator can also import SKOS XML via the command-line, and
   generate a list of terms currently linked to descriptions in a given
   taxonomy. For more information, see:

   * :ref:`cli-bulk-import-xml`
   * :ref:`cli-count-terms`

.. _import-skos:

Import terms with SKOS files
============================

AtoM supports SKOS RDF imports via the :term:`user interface` for the import
of :term:`terms <term>`, to be used in :term:`taxonomies <taxonomy>` in AtoM.
The most common reason terms are imported are to add a list of controlled
values to the taxonomies used as :term:`access points <access point>` in AtoM,
such as Places, Subjects, Genres, Actor occupations, etc.

.. SEEALSO::

   * :ref:`terms`

Term import in the :term:`user interface` is managed by the AtoM job scheduler
and run asynchronously in the background as a job. To be able to import terms
via the user interface, you must have the AtoM job scheduler properly
installed and configured. For more information see:

* :ref:`installation-asynchronous-jobs`
* :ref:`manage-jobs`

You must be logged in with sufficient
:term:`access privileges <access privilege>` to be able to import terms.
Access privileges are based on defined :term:`user roles <user role>` in AtoM
- for more information, see the following:

* :ref:`User roles <user-roles>`
* :ref:`manage-user-accounts`
* :ref:`edit-user-permissions`.

SKOS RDF data can be serialized into many different formats. On import, AtoM
uses a third-party library called `EasyRDF <http://www.easyrdf.org/>`__ to
parse and consume the SKOS data - so multiple different serializations are
supported for term import. Examples include SKOS RDF XML, Turtle, N3, etc.

SKOS files can be uploaded locally, or if you have a URL to the ``.rdf`` SKOS
file of your terms available online, then AtoM can fetch the terms from the
web directly.

.. IMPORTANT::

   To be able to import terms remotely from a URL, the URL must point directly
   to the SKOS RDF file - generally, this means the URL **must** end in
   ``.rdf``. An HTML landing page for terms, made for easier human
   readability, will not work!

Because the AtoM job scheduler manages SKOS imports, an administrator can
always review the status of any SKOS import on the Jobs page - the console
output of the import task will be captured in the
:ref:`Job details <job-details>` page of the related import job - see:
:ref:`manage-jobs` for more information. This can be useful for
troubleshooting as well - any warnings and errors generated on import will be
captured in the console output.

**To import terms using SKOS**:

1. Click on the |import| import menu, then click on SKOS.

.. image:: images/import-menu-csv.*
   :align: center
   :width: 30%
   :alt: The import menu

.. TIP::

   There is also a link to the SKOS import page on the XML import page, in the
   blue notification below the Type of import :term:`drop-down menu`:

   .. image:: images/import-menu-skos.*
      :align: center
      :width: 80%
      :alt: Import menu showing link to SKOS import page.

2. AtoM will redirect you to the SKOS import page.

.. image:: images/skos-import-page.*
   :align: center
   :width: 80%
   :alt: The SKOS import page

3. The "Taxonomy" :term:`field` on the SKOS import page determines the
   :term:`taxonomy` into which your SKOS terms will be imported. This
   field is an auto-complete - as you begin to type the name of the target
   taxonomy, matching results will appear in a :term:`drop-down menu` beneath
   the field. When you see the target taxonomy, click on it in the drop-down
   menu to select it.

.. TIP::

   AtoM currently defaults to "Places" in the taxonomy field. Users can
   replace this with the name of any taxonomy by typing it into the field.

4. To upload a local SKOS file for import, click the "Browse" button to
   open a window on your local computer. Select the SKOS file that you would
   like to import.

   .. image:: images/csv-import-browse.*
      :align: center
      :width: 25%
      :alt: Clicking the "Browse" button in the SKOS import page

   When you have selected the file from your device, its name will appear
   next to the "Browse" button.

5. To upload remote SKOS RDF resource from an online source, enter the URL
   into the Remote resource field. Remember, valid URLs must begin with
   ``http://`` or ``https://``, and end in a ``.rdf`` file extension.

.. image:: images/skos-remote-resource.*
   :align: center
   :width: 80%
   :alt: The SKOS import page's Remote resource field

6. When you have configured all the options, click the "Import" button in the
   :term:`button block` at the bottom of the SKOS import page to begin your
   import.

.. image:: images/import-button-block.*
   :align: center
   :width: 80%
   :alt: The import button on the SKOS import page.

.. NOTE::

   Depending on the size of your SKOS import, this can take some time to
   complete. Be patient! Remember, you can always check on the status of an
   import by reviewing the :ref:`Job details <job-details>` page of the related
   import job - see: :ref:`manage-jobs` for more information.

7. After your import has begun, AtoM will reload the SKOS import page
   and indicate that the import has been initiated with a notification at
   the top of the page. This notification will also provide you with
   a link to the :ref:`Job details <job-details>` page of the related import
   job, where you can check on the status of the import. You can begin another
   SKOS import at this time, or navigate elsewhere in the application.

:ref:`Back to top <import-export-skos>`

.. _export-skos:

Export terms as SKOS XML
========================

AtoM supports SKOS RDF XML exports from the :term:`term` view page. When
exported, the term currently being viewed, as well as any
:term:`child <child record>` terms, will be captured in the SKOS XML
generated. SKOS XML exports are available all users on the term
:term:`view pages <view page>` accessible to public users (such as Subjects
and Places). Some taxonomies in AtoM are not publicly accessible, and
therefore only authenticated (i.e. logged in) users will be able to export
them.

SKOS XML term exports are not currently supported by the job scheduler,
meaning they are generated on-request. This means that very large hierarchies
may not be able to be exported via the :term:`user interface`, as the
browser's built-in time out limits (to prevent long-running requests from
consuming all available resources - usually about 1 minute in most modern
browsers) may be reached before the SKOS file can be generated.

At this time it is not possible to export an entire taxonomy - exports must be
initiated from the top-level term view page.

For more information on working with terms and navigation in AtoM, see:

* :ref:`terms`
* :ref:`browse-subjects-places`
* :ref:`navigate`

**To export terms in SKOS RDF XML:**

1. Navigate to the term(s) you wish to export. You can access terms by
   navigating to |pencil| **Manage > Taxonomies**, selecting the
   :term:`taxonomy` that contains the terms you wish to export, and then
   finding the term and clicking on it. Alternatively, if your term is part of
   the :term:`Subjects <subject>` or :term:`Places <place>` taxonomy, you can
   use the :term:`Browse menu` located in the AtoM header bar to access those
   taxonomies. Click through to the term's :term:`view page`.

.. image:: images/manage-term.*
   :align: center
   :width: 80%
   :alt: The view page for a term in the Subjects taxonomy


2. In the right-hand :term:`context menu` of the term :term:`view page`, click
   on the SKOS button under the "Export" heading.

.. image:: images/export-skos.*
   :align: center
   :width: 25%
   :alt: Export SKOS button on the term view page

3. AtoM will reload the page to display your SKOS XML. You should be able to
   right-click in your browser to save the page.

.. TIP::

   Be aware that some browsers (e.g., Safari) may only allow you to save the
   Exported SKOS file as HTML. Firefox and Chrome provide the ability to Save
   page as XML, which enables Importing as XML into another program or into
   another version of AtoM.

   If you have problems with the save options provided by one browser, we
   suggest trying another if possible.

:ref:`Back to top <import-export-skos>`
