.. _cli-import-export:

=======================================
Import and export from the command-line
=======================================

AtoM supports import and export via the :term:`user interface`, and these
tasks are executed as :term:`jobs <job>` and performed asynchronously in the
background to avoid timeouts in the browser. Jobs in AtoM are handled by
`Gearman <http://gearman.org>`__, and the status of AtoM jobs can be seen
in the :term:`user interface` via the **Manage > Jobs** page. For more
information, see: :ref:`manage-jobs` and :ref:`installation-asynchronous-jobs`.

However, there may be occasions where it is more efficient to import directly
from the command-line. For example, XML files can only be imported one at a
time via the user interface, but the command-line task supports bulk XML
import. Also, the user interface only supports the import of the basic
:term:`authority record` CSV - though additional CSVs for relationships and
alternate forms of name can be imported via the command-line to further
supplement your data. As a final example, the Digital object load task
(described :ref:`below <digital-object-load-task>`) is only available via the
command-line.

The following will outline the options available for command-line imports and
exports in AtoM.

.. SEEALSO::

   The following pages in the User Manual relate to import and export. We
   strongly recommend reviewing the CSV preparation recommendations found on
   the :ref:`csv-import` page prior to import CSV data.

   * :ref:`csv-import`
   * :ref:`csv-before-you-import`
   * :ref:`import-xml`
   * :ref:`import-export-skos`
   * :ref:`csv-export`

.. _cli-bulk-import-xml:

Bulk import of XML files
========================

While XML files can be imported individually via the :term:`user interface`
(see: :ref:`import-xml`), it may be desireable to import multiple
XML files through the command line. The ``import:bulk`` command-line task can
be used to import the following types of XML data:

* MODS and EAD 2002 (for :term:`archival description` data)
* SKOS RDF XML (for :term:`term` data import into a :term:`taxonomy`)
* EAC-CPF XML (for :term:`authority record` data)

The primary documentation on preparing for XML imports, and on how matching
behavior is handled for some of the import options, is maintained in the User
Manual. See:

* :ref:`import-xml`
* :ref:`import-export-skos`

.. WARNING::

   You can only import one type of XML at a time with this task. For example,
   do not attempt to import EAC CPF and EAD 2002 XML at the same time.
   Instead, you should import one :term:`entity` type first, and then the
   other with a separate ``import:bulk`` command

Below is the basic syntax for the bulk XML import task:

.. code:: bash

   php symfony import:bulk /path/to/my/xmlFolder

Using the import:bulk command
-----------------------------

.. image:: images/bulk-import-cli-options.*
   :align: center
   :width: 90%
   :alt: An image of the options available in the import:bulk command

By typing ``php symfony help import:bulk`` into the command-line without
specifying the path to a directory of XML files, you can see the options
available on the ``import:bulk`` command, as pictured above.

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--index`` option is used to enable the rebuilding of the search index as
part of the import task. When using the :ref:`user interface <import-xml>` to
import XML files, the import is indexed automatically - but when running
an import via the command-line interface, indexing is **disabled** by default.
This is because indexing during import can be incredibly slow, and the
command-line is generally used for larger imports. Generally, we recommend a
user simply clear the cache and rebuild the search index following an import -
from AtoM's root directory, run:

.. code-block:: bash

   php symfony cc & php symfony search:populate

However, if you would like to index the import as it progresses, the
``--index`` option can be used to enable this.

The ``--taxonomy`` option is used to assist in the import of SKOS xml files,
such as :term:`places <place>` and :term:`subjects <subject>`, ensuring that
the :term:`terms <term>` are imported to the correct :term:`taxonomy`. As
input, the ``--taxonomy`` option takes a taxonomy ID - these are permanent
identifiers used internally in AtoM to manage the various taxonomies, which
can be found in AtoM in ``/lib/model/QubitTaxonomy.php`` (see on GitHub
:at-gh:`here <lib/model/QubitTaxonomy.php#L20>`).

.. TIP::

   SKOS imports can also be completed via the user interface from a remote URL
   or a local file. In the user interface, multiple SKOS serializations can be
   used, while only SKOS XML can be imported with this task. See the primary
   SKOS import documentation in the User Manual:

   * :ref:`import-export-skos`

**Example use:** Importing terms to the Places taxonomy

.. code-block:: bash

   php symfony import:bulk --taxonomy="42" /path/to/mySKOSfiles

**Example use:** Importing terms to the Subjects taxonomy

.. code-block:: bash

   php symfony import:bulk --taxonomy="35" /path/to/mySKOSfiles

Below is a list of some of the more commonly used taxonomies in AtoM, and
their IDs. This list is NOT comprehensive - to see the full list, navigate to
``/lib/model/QubitTaxonomy.php``, or visit the Github link above.

=================================== ===
Taxonomy name                       ID
=================================== ===
 Places                             42
 Subjects                           35
 Genres                             78
 Level of description               34
 Actor entity type (ISAAR)          32
 Thematic area (repository)         72
 Geographic subregion (repository)  73
=================================== ===

The ``--completed-dir`` option is used to automatically move files (e.g. XML
files during an import) into a completed directory after they have imported.
This can be useful during troubleshooting, to determine which files have
imported and which have failed. The option takes a file path to the chosen
directory as its parameter. You must manually create the directory first - the
task will not automatically generate one at the specified location. Example
use:

.. code-block:: bash

   php symfony import:bulk --completed-dir="/path/to/my/completed-directory" /path/to/my/importFolder

The ``--schema`` option is deprecated and should not be used.

The ``--output`` option will generate a simple CSV file containing details of
the import process, including the time elapsed and memory used during each
import. To use the option, you mush specify both a path and a filename for the
CSV file to output. For example:

.. code-block:: bash

   php symfony import:bulk --output="/path/to/output-results.csv" /path/to/my/importFolder

The CSV contains 3 columns. The first (titled "File" in the first row) will
list the path and filename of each imported file. The second column (titled
"Time elapsed (secs)" in the first row) indicates the time elapsed during the
import of that XML file, in seconds, while the third column (titled "Memory
used") indicates the memory used during the XML import of that file, in bytes.
Also included, at the bottom of the CSV, are two summary rows: Total time
elapsed (in seconds), and Peak memory usage (in megabytes).

.. image:: images/bulk-import-output-example.*
   :align: center
   :width: 60%
   :alt: an example of the CSV output after an import using the output option

The ``--verbose`` option will return a more verbose output as each import is
completed. Normally, after the import completes, a summary of the number of
files imported, the time elapsed, and the memory used:

.. code-block:: bash

   Successfully imported [x] XML/CSV files in [y] s. [z] bytes used."

... where [x] is the number of files imported, [y] is a count of the time
elapsed in seconds, and [z] is the memory used in bytes.

.. image:: images/import-bulk-summary-msg.*
   :align: center
   :width: 80%
   :alt: an example of the summary output after an import

If the ``--verbose`` command-line option is used (or just ``-v`` for short),
the task will output summary information for each XML file imported, rather
than a total summary. The summary information per file includes file name,
time elapsed during import ( in seconds), and its position in the total count
of documents to import. For example:

.. code-block:: bash

   [filename] imported.  [x]s  [y]/[z] total

... where [x] is the time elapsed in seconds, [y] is the current file's
number and [z] is the total number of files to be imported.

.. image:: images/import-bulk-verbose-output.*
   :align: center
   :width: 80%
   :alt: an example of the verbose output after an import via the CLI

The ``--update`` option can be used when you want to use an XML import to
update existing archival descriptions, instead of creating new records. There
are 2 modes, but only the ``--update="delete-and-replace`` mode is supported
for XML imports. When used, AtoM will attempt to identify matching records,
and then delete the match before proceeding with the XML import as a new
record. For more information on how AtoM attempts to match incoming XML
imports to existing records, see:

* :ref:`xml-description-matching`
* :ref:`actor-xml-matching`

.. IMPORTANT::

   The ``--update`` option will **only** work with EAC-CPF and EAD 2002 XML
   imports. It cannot be used for MODS or SKOS XML imports via the
   command-line. Only the "Delete and replace" mode will work with the update
   option.

   Related :term:`enities <entity>` that were linked to the matched and
   deleted records are **not** also deleted - if you want them removed, they
   must be manually deleted separately. Simliarly, on import of the
   replacement record(s), recreating the previous links to other related
   entities is not guaranteed - AtoM proceeds with the replacement import as
   if it were new, and uses the matching and linking criteria described in the
   links above to determine if it should link to existing related entities or
   create new ones.

   We strongly recommend you review the User Manual documentation, as it
   contains further details:

   * :ref:`ead-delete-replace`
   * :ref:`delete-replace-actor-xml`

The ``--limit`` option can be used with ``--update`` to increase the
likelihood of a successful match by limiting the match criteria to either
records belonging to a specific repository, or matching a specific existing
top-level description (for :term:`archival description` imports). For more
information on how entities can be linked to a repository, see:

* :ref:`link-archival-institution`
* :ref:`link-repo-actor`

The ``--limit`` option takes the :term:`slug` of the related :term:`repository`
or top-level :term:`archival description` as its value. For example, to
import a folder of EAD 2002 XML descriptions called "*my-updates*", deleting
any existing matches but limit the matching criteria to those descriptions
linked to a repository with the slug "*my-repository*", your command might
look like this:


.. code-block:: bash

   php symfony import:bulk --update="delete-and-replace" --limit="my-repository" /path/to/my-updates

.. IMPORTANT::

   The ``--limit`` option can only be used in conjunction with the
   ``--update="delete-and-replace"`` option. This means it can only be used
   for EAD 2002 and EAC-CPF XML. When importing EAC-CPF
   :term:`authority record` data, you can only use a repository slug as the
   limiter. See the links above to the primary User Manual documentation for
   more information.

Normally, when attempting to match records, if AtoM fails to find a match
candidate, it will proceed to import the row as a new record. However, you can
use the ``--skip-unmatched`` option with ``--update`` to change this default
behavior. When ``--skip-unmatched`` is used, then any records that do not
match will be ignored during the import, and reported in the console log shown
on the :ref:`Job details <job-details>` page of the related import job (see:
:ref:`manage-jobs` for more information). This is recommended if you are
intending to only import updates to existing records. Note that
``--skip-unmatched`` will not work if it is not used in conjunction with the
``--update`` option.

Similarly, with new imports, you can use the ``--skip-matched`` option to skip
any records that AtoM identifies as matching those you have already imported.
This can be useful if you are uncertain if some of the XML records
have been previously imported - such as when passing records to a portal site
or union catalogue. Any XML data that appear to match records will be ignored
during the import, and reported in the console log shown on the
:ref:`Job details <job-details>` page of the related import job. For more
information on how AtoM attempts to match incoming imports to
existing records, see:

* :ref:`xml-description-matching`
* :ref:`actor-xml-matching`

:ref:`Back to top <cli-import-export>`

.. _cli-bulk-export:

Bulk export of XML files
========================

While XML files can be exported individually via the :term:`user interface`
(see: :ref:`export-xml`), it may be desireable to export multiple
XML files, or large files (typically larger than 1 MB) through the command line.
This can avoid browser-timeout issues when trying to export large files, and
it can be useful for extracting several descriptions at the same time. XML
files will be exported to a directory; you must first create the target
directory, and then you will specify the path to it when invoking the export
command:

.. code:: bash

   php symfony export:bulk /path/to/my/xmlExportFolder

.. NOTE::

   There is also a separate bulk export command for EAC-CPF XML files (e.g. for
   exporting :term:`authority records <authority record>` via the command-line.
   It uses the same CLI options as the EAD XML export task. See
   :ref:`below <cli-bulk-export-eac>` below for syntax; see the EAD
   :ref:`usage <cli-bulk-export-usage>` guidelines for how to use the available
   options.

.. IMPORTANT::

   The :ref:`inherit-reference-code` setting also determines how the
   ``<unitid>`` element in the EAD XML is populated. If the inheritance is
   turned on, then AtoM will populate all descendant records in the EAD XML
   with the full inherited reference code. If inheritance is turned off, AtoM
   will only add the identifier for that record in the ``<unitid>`` on export.
   This allows users exporting to a different source system that does not have
   a reference code inheritance setting to maintain a full reference code at
   all levels in the target system. **However, if you are exporting from one
   AtoM instance to another** (for example, from a local institution to a
   portal site), you might want to consider how this will impact your record
   display in the target system - if you have reference code inheritance
   turned on when you export, and the target AtoM instance *also* has the
   setting turned on, you may end up with duplication in the display!

.. _cli-bulk-export-usage:

Using the export:bulk command
-----------------------------

.. image:: images/export-bulk-cli-options.*
   :align: center
   :width: 85%
   :alt: An image of the options available in the export:bulk command

By typing ``php symfony help export:bulk`` into the command-line without
specifying the path to the target directory of exported XML files, you can see
the options available on the ``export:bulk`` command, as pictured above.

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--items-until-update`` option can be used for a simple visual
representation of progress in the command-line. Enter a whole integer, to
represent the number of XML files that should be exported before the
command-line prints a period (e.g. ``.`` ) in the console, as a sort of
crude progress bar. For example, entering ``--items-until-update=5`` would
mean that the import progresses, another period will be printed every 5 XML
exports. This is a simple way to allow the command-line to provide a visual
output of progress.

Example use reporting progress every 5 rows:

.. code-block:: bash

   php symfony export:bulk --items-until-update=5 /path/to/my/exportFolder

This can be useful for large bulk exports, to ensure the export is still
progressing, and to try to roughly determine how far the task has progressed
and how long it will take to complete.

The ``--format`` option will determine whether the target export uses EAD XML,
or MODS XML. When not set, the default is to export using EAD. Example use:

.. code-block:: bash

   php symfony export:bulk --format="mods" /path/to/my/exportFolder

The ``--criteria`` option can be added if you would like to use raw SQL to
target specific descriptions.

**Example 1: exporting all draft descriptions**

.. code-block:: bash

   php symfony export:bulk --criteria="i.id IN (SELECT object_id FROM status WHERE status_id = 159 AND type_id = 158)" /path/to/my/exportFolder

If you wanted to export all published descriptions instead, you could simply
change the value of the ``status_id`` in the query from 159 (draft) to 160
(published).

**Example 2: exporting all descriptions from a specific repository**

To export all descriptions associated with a particular
:term:`archival institution`, you simply need to know the :term:`slug` of the
institution's record in AtoM. In this example, the slug is
"example-repo-slug":

.. code-block:: bash

   php symfony export:bulk --criteria="i.repository_id = (SELECT object_id FROM slug WHERE slug='example-repo-slug')" /path/to/my/exportFolder

**Example 3: exporting specific descriptions by title**

To export 3 fonds titled: "779 King Street, Fredericton deeds," "1991 Canada
Winter Games fonds," and "A history of Kincardine," You can issue the
following command:

.. code-block:: bash

   sudo php symfony export:bulk --criteria="i18n.title in ('779 King Street, Fredericton deeds', '1991 Canada Winter Games fonds', 'A history of Kincardine')" path/to/my/exportFolder

You could add additional archival descriptions of any level of description into
the query by adding a comma then another title in quotes within the ()s.

The ``--current-level-only`` option can be used to prevent AtoM from exporting
any :term:`children <child record>` associated with the target descriptions.
If you are exporting :term:`fonds`, then only the fonds-level description
would be exported, and no lower-level records such as series, sub-series,
files, etc. This might be useful for bulk exports when the intent is to submit
the exported descriptions to a union catalogue or regional portal that only
accepts collection/fonds-level descriptions. If a lower-level description
(e.g. a series, file, or item) is the target of the export, it's
:term:`parents <parent record>` will not be exported either.

The ``--single-slug`` option can be used to to target a single :term:`archival unit`
(e.g. fonds, collection, etc) for export, if you know the :term:`slug` of the
target description.

**Example use**

.. code-block:: bash

   php symfony export:bulk --single-slug="test-export" /path/to/my/directory/test-export.xml

.. IMPORTANT::

   For the export task to succeed when using the ``--single-slug`` option, you
   **must** specify not just a target output directory, but a target output file
   name. Exporting to ``path/to/my/directory/`` will result in nothing being
   exported - you will be given a warning that the path should be a file -
   while exporting to ``path/to/my/directory/some-filename.xml`` will succeed.
   Note that the task **cannot** create new directories - but you can give the
   target file any name you wish (ending in ``.xml``); it doesn't need to be
   based on the target :term:`slug`.

   .. image:: images/single-slug-warning.*
      :align: center
      :width: 90%
      :alt: An example of using the single-slug option

The  ``--public`` option is useful for excluding draft records from an export.
Normally, all records in a hierarchical tree will be exported regardless of
:term:`publication status`. Note that if a published record is the child of a
draft record, it will **not** be included when this option is used - when the
parent is skipped (as a draft record), the children are also skipped, so as not
to break the established hierarchy.


.. SEEALSO::

   * :ref:`export-xml`

.. _cli-bulk-export-eac:

Exporting EAC-CPF XML for authority records
-------------------------------------------

In addition to the bulk export CLI tool for archival descriptions described above,
AtoM also has a separate command-line task for the bulk export of
:term:`authority records <authority record>` in EAC-CPF XML format.

The EAC-CPF XML standard is prepared and maintained by the Technical Subcommittee
for Encoded Archival Context of the Society of American Archivists and the
Staatsbibliothek zu Berlin, and a version of the Tag Library is available at:

* http://eac.staatsbibliothek-berlin.de/fileadmin/user_upload/schema/cpfTagLibrary.html

When using the task, EAC-CPF XML files will be exported to a directory; you must
first create the target directory, and then you will specify the path to it when
invoking the export command:

.. code:: bash

   php symfony export:auth-recs /path/to/my/xmlExportFolder

The authority record bulk export task has the same options available as the
archival description export task described :ref:`above <cli-bulk-export-usage>`.
Some of these options will not be relevant to EAC-CPF exports (e.g. the
``--current-level-only`` option, as authority records are not hierarchical; and
the ``--public`` option, as currently authority records do not have a publication
status), but otherwise they can be used with this task in the same way as
described for the archival description export options
:ref:`above <cli-bulk-export-usage>`. Please refer there for more detailed usage
notes. Below is an example application, using the ``--criteria`` option:

**Example: using the --criteria option to select only authority records linked
to descriptions from one repository**

First, you will need to know the repository ID of the target
:term:`archival institution`. See the section :ref:`below <common-atom-queries>`
for basic instructions on how to access MySQL from the command-line, so you can
enter the following SQL query. You will first need to know the :term:`slug` of
the archival institution whose ID you would like to know:

.. code:: bash

   SELECT object_id FROM slug WHERE slug=`your-institution-slug`;

Now with the repository ID, you can use the ``--criteria`` option to export only
authority records that have been linked to descriptions related to the target
archival institution, like so (assuming the repository ID returned is ``12345``):

.. code:: bash

   php symfony export:auth-recs --criteria='i.repository_id=12345' path/to/my/export-folder

:ref:`Back to top <cli-import-export>`

.. _csv-import-cli:

Import CSV files via the command-line
=====================================

As of AtoM 2.4, the import and export functionality in the
:term:`user interface` is supported by the job scheduler, meaning that large
CSV files can be imported via the user interface without timing out as in
previous versions. However, there are some options available via the
command-line that do not have equivalents in the user interface. For this
reason, there may be times when it is preferable to import a CSV records via
the CLI. Below are basic instructions for each available import type.

**Jump to:**

* :ref:`csv-import-descriptions-cli`
* :ref:`csv-import-events-cli`
* :ref:`csv-repository-import-cli`
* :ref:`csv-actor-import-cli`
* :ref:`csv-import-accessions-cli`
* :ref:`csv-import-progress`
* :ref:`digital-object-load-task`

You can find all of the CSV templates on the AtoM wiki, at:

* https://wiki.accesstomemory.org/Resources/CSV_templates

Examples are also stored directly in the AtoM codebase - see:
``lib/task/import/example``

.. IMPORTANT::

   Please carefully review the information included on the :ref:`csv-import`
   page prior to attempting a CSV import via the command-line! Here is a basic
   checklist of things to review  before importing a CSV:

   * You are using the correct CSV template for both the type of record you
     want to import, and for the version of AtoM you have installed. You can
   * CSV file is saved with UTF-8 encodings
   * CSV file uses Linux/Unix style end-of-line characters (``/n``)
   * All :term:`parent <parent record>` descriptions appear in rows **above**
     their children if you are importing hierarchicla data (such as
     descriptions)

The :ref:`csv-import` User manual documentation also includes more specific
guidance for preparing a CSV for each entity type - ensure you have reviewed
it carefully prior to import.

All CSV import command-line tasks should be run from the root AtoM directory.

.. _csv-import-descriptions-cli:

Importing archival descriptions
-------------------------------

Example syntax use (with the RAD CSV template):

.. code-block:: bash

   php symfony csv:import lib/task/import/example/rad/example_information_objects_rad.csv

.. image:: images/cliopts.*
  :align: center
  :width: 85%
  :alt: An image of the command-line options for CSV import

By typing ``php symfony help csv:import`` into the command-line from your root
directory, without specifying the location of a CSV, you will able able to
see the CSV import options available (pictured above). A brief explanation of
each is included below. For full :term:`archival description` CSV import
documentation, please see:

* :ref:`csv-import-descriptions`
* :ref:`csv-import-descriptions-gui`
* :ref:`csv-descriptions-updates`

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--rows-until-update`` option can be used for a simple visual
representation of progress in the command-line. Enter a whole integer, to
represent the number of rows should be imported from the CSV before the
command-line prints a period (e.g. `` . `` ) in the console, as a sort of
crude progress bar. For example, entering ``--rows-until-update=5`` would
mean that the import progresses, another period will be printed every 5 rows.
This is a simple way to allow the command-line to provide a visual output of
progress. For further information on the ``--rows-until-update`` option and an
example of the command-line option in use, see also the section below,
:ref:`csv-import-progress`.

You can use the ``--skip-rows`` option to skip **X** amount of rows in the CSV
before beginning the import. This can be useful if you have interrupted the
import, and wish to re-run it without duplicating the records already
imported. ``--skip-rows=10`` would skip the first 10 rows in the CSV file,
for example. Note that this count does **not** include the header column, so
in fact, the above example would skip the header column, and rows 2-11 in
your CSV file.

The ``--error-log`` option can be used to specify a directory where errors
should be logged. **Note that this option has not been tested by Artefactual
developers**.

Use the ``--source-name`` option (described  in the CSV import
documentation :ref:`here <csv-legacy-id-mapping>`) to specify a source when
importing information objects from multiple sources (with possibly conflicting
legacy IDs), or when importing updates, to match the previous import's source
name. This will ensure that multiple related CSV files will remain related -
so, for example, if you import an :term:`archival description` CSV, and then
supplement the :term:`authority records <authority record>` created (from
the *eventActors* field in the description CSV templates) with an authority
record CSV import, using the ``--source-name`` option will help to make sure
that matching names are linked and related, instead of duplicate authority
records being created. You can also use this option to relate a large import
that is broken up into multiple CSV files, or when importing updates to existing
descriptions. See the :ref:`csv-legacy-id-mapping` section in the User manual
for further tips and details on the uses of this option.

.. TIP::

   When no ``--source-name`` is set during import, the filename of the CSV
   will be used by default instead.

   You can always check what source name was used for records created via an
   import by entering into :term:`edit mode` and navigating to the
   Administration :term:` area <information area>` of the :term:`edit page` -
   the source name used will be diplayed there:

   .. image:: images/source-name-ui.*
      :align: center
      :width: 90%
      :alt: An image of the source name used during import, shown in the
            Administration area of the AtoM edit page.

The ``--default-legacy-parent-id`` option will allow the user to set a default
*parentID* value - for any row in the CSV where no *parentID* value is
included and no *qubitParentSlug* is present, this default value will be
inserted as the *parentID*.

Similarly, the ``--default-parent-slug`` option allows a user to set a
default *qubitParentSlug* value - wherever no slug value or *parentID* /
*legacyID*  is included, AtoM will populate the *qubitParentSlug* with the
default value. If you are importing **all** rows in a CSV file to one parent
description already in AtoM, you could use the ``--default-parent-slug`` option
to specify the target :term:`slug` of the parent, and then leave the *legacyID*,
*parentID*, and *qubitParentSlug* columns blank in your CSV. **Note** that this
example will affect ALL rows in a CSV - so use this **only** if you are
importing all descriptions to a single parent!

By default, AtoM will build the `nested set <http://en.wikipedia.org/wiki/Nested_set_model>`__
after an import task. The nested set is a way to manage hierarchical data
stored in the flat tables of a relational database. However, as Wikipedia
notes, "Nested sets are very slow for inserts because it requires updating
left and right domain values for all records in the table after the insert.
This can cause a lot of database thrash as many rows are rewritten and indexes
rebuilt." When performing a large import, it can therefore sometimes be
desirable to disable the building of the nested set during the import process,
and then run it as a separate command-line task following the completion of
the import. To achieve this, the ``--skip-nested-set-build`` option can be
used to disable the default behavior.

**NOTE** that the nested set WILL need to be built for AtoM to behave as
expected. You can use the following command-line task, from the AtoM root
directory, to rebuild the nested set if you have disabled it during import:

.. code-block:: bash

   php symfony propel:build-nested-set

The task is further outlined on the :ref:`maintenance-cli-tools` page - see:
:ref:`cli-rebuild-nested-set`.

.. TIP::

   Want to learn more about why and how nested sets are used? Here are a few
   great resources:

   * Mike Hyllier's article on
     `Managing Hierarchical data in MySQL <http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/>`__
   * Evan Petersen's discussion of `nested sets <http://www.evanpetersen.com/item/nested-sets.html>`__
   * Wikipedia's `Nested set model <http://en.wikipedia.org/wiki/Nested_set_model>`__

Similarly, when using the :ref:`user interface <csv-import-descriptions-gui>`
to perform an import, the import is indexed automatically - but when running
an import via the command-line interface, indexing is **disabled by default.**
This is because indexing during import can be incredibly slow, and the
command-line is generally used for larger imports. Generally, we recommend a
user simply clear the cache and rebuild the search index following an import -
from AtoM's root directory, run:

.. code-block:: bash

   php symfony cc && php symfony search:populate

However, if you would like to index the import as it progresses, the
``--index`` option can be used to enable this. This is useful if you have a
large database, and don't want to have to re-index everything. For more
information on indexing options, see: :ref:`maintenance-populate-search-index`.

The ``--update`` option can be used when you want to use a CSV import to
update existing archival descriptions, instead of creating new records. There
are 2 modes: ``--update="match-and-update"`` and
``--update="delete-and-replace``. When used, AtoM will attempt to identify
matching archival descriptions and, depending on which option is used, either
update them in place, or delete the match and replace it with the new
description in the CSV. For more information on how AtoM attempts to match
incoming imports to existing descriptions, see:
:ref:`csv-descriptions-match-criteria`.

For the "*match-and-update*" option, AtoM will update any information object
related columns that have new data. Columns in the related CSV row that are
left blank will **not** delete existing data - instead, they will be ignored
and any existing data in the related field will be preserved.

.. IMPORTANT::

   AtoM can only update description fields that are stored in the primary
   information object database table using this method. This means that
   related entities (such as :term:`events <event>`,
   :term:`creators <creator>`, :term:`access points <access point>`, etc.)
   **cannot be deleted or updated with this method**. You can add additional
   related entities, but the old ones will be left in place. There is code to
   prevent duplication however - so if you have left the same creator/event
   information as previously, it will be ignored.

   The one exception to this is updating the biographical or administrative
   history of a related :term:`authority record`, which requires specifc
   criteria. See scenario **2B** in the following section of the User manual:
   :ref:`csv-actor-matching`.

   Additionally, in AtoM notes are stored in a different database table - this
   includes the General note, Archivist's note, and the RAD- and DACS-specific
   note type fields in AtoM's archival description templates. This means that
   in addition to related entities, **notes cannot be deleted or updated with
   this method**

   If you wish to make updates to these entitites or fields, consider using
   the "Delete and replace" update option instead - though be sure to read up
   on the behavior and limitations of that method as well!

With the "*delete-and-replace*" option, the matched archival description and
any descendants (i.e. :term:`children <child record>`) will be deleted prior
to import. Note that **related entities are not deleted** - such as linked
authority records, :term:`terms <term>` such as subject, place, or genre
:term:`access points <access point>`, :term:`accessions <accession record>`,
etc. If you want these removed as well, you will need to manually delete them
from the user interface following the delete-and-replace import. On import of
the replacement record, AtoM will also **not** automatically link to the same
entities. Instead, it will use the existing matching logic to determine if it
should link to an existing linked record, or create a new one. For more
information on how AtoM determines whether or not to link to an existing
authority record, see: :ref:`csv-actor-matching`.

.. SEEALSO::

   The AtoM user manual further explains these options, as they are available
   on the Import page in the :term:`user interface`. See:

   * :ref:`csv-descriptions-updates`

The ``--limit`` option can be used with ``--update`` to increase the
likelihood of a successful match by limiting the match criteria to either
records belonging to a specific repository, or matching a specific existing
top-level description. It takes the slug of the related :term:`repository` or
top-level :term:`archival description` as its value. For example, to import a
CSV called "*my-updates.csv*" and update the descriptions of the John Smith
Fonds, your command might look like this:

.. code-block:: bash

   php symfony csv:import --update="match-and-update" --limit="john-smith-fonds" /path/to/my-updates.csv

Normally, when attempting to match records, if AtoM fails to find a match
candidate, it will proceed to import the row as a new record. However, you can
use the ``--skip-unmatched`` option with ``--update`` to change this default
behavior. When ``--skip-unmatched`` is used, then any records that do not
match will be ignored during the import, and reported in the console log shown
on the :ref:`Job details <job-details>` page of the related import job (see:
:ref:`manage-jobs` for more information). This is recommended if you are
intending to only import updates to existing records. Note that
``--skip-unmatched`` will not work if it is not used in conjunction with the
``--update`` option.

.. WARNING::

   It is very difficult to use the ``--skip-unmatched`` option with a
   ``--update="delete-and-replace`` when working with hierarchical data. Once a
   match is found for the top-level description (e.g. the root
   :term:`parent record`), AtoM will then proceed to delete the original
   description and all of its :term:`children <child record>` (e.g.
   lower level records). This means that when AtoM gets to the next child row
   in the CSV, it will find no match in the database - because it has already
   deleted the children - and the records will therefore be skipped and not
   imported.

   Unless you are **only** updating standalone descriptions (e.g. descriptions
   with no children), we do not recommend using the ``--skip-unmatched``
   with ``--update="delete-and-replace``.

Similarly, with new imports, you can use the ``--skip-matched`` option to skip
any records that AtoM identifies as matching those you have already imported.
This can be useful if you are uncertain if some of the records in your CSV
have been previously imported - such as when passing records to a portal site
or union catalogue. Any records that appear to match existing archival
descriptions will be ignored during the import, and reported in the console
log shown on the :ref:`Job details <job-details>` page of the related import
job. For more information on how AtoM attempts to match incoming imports to
existing descriptions, see: :ref:`csv-descriptions-match-criteria`.

Normally during an update import when using ``match-and-update``, the digital
object will be deleted and re-imported as part of the update, even if the path
or URI provided is the same - this is in case the digital object itself has
changed at the source. However, there are 2 ways users can avoid this. The
first is to include a ``digitalObjectChecksum`` column in the import CSV, and
to populate the row with the exact same checksum used by AtoM when uploading
the digital object (this can be seen in the file path to the
:term:`master digital object`). If you export a CSV with a digital object from
AtoM, the checksum column and value is included in the export (see:
:ref:`csv-export`). However, if you do not have the checksum value handy and
you **don't** want or need the digital object to be deleted and re-imported,
then the other way to skip this process is to use the
``--keep-digital-objects`` option. When this option is used with
``--update="match-and-update"``, then the deletion of the existing digital
object and its derivatives will be skipped.

Finally, the ``--skip-derivatives`` option can be used if you are using the
:ref:`csv-descriptions-digital-objects` to import a digital object attached to
your description(s). For every digital object uploaded, AtoM creates two
derivative objects from the :term:`master digital object`: a :term:`thumbnail`
image (used in search and browse results) and a :term:`reference display copy`
(used on the :term:`view page` of the related archival description). The
master digital object is the unaltered version of a :term:`digital object`
that has been uploaded to AtoM. When the ``--skip-derivatives`` option is
used, then the thumbnail and reference display copy of your linked digital
object will **not** be created during the import process. You can use the
digital object derivative regeneration task to create them later, if desired -
see: :ref:`cli-regenerate-derivatives`.

:ref:`Back to top <cli-import-export>`

.. _csv-import-events-cli:

Importing events
----------------

Read more about importing events in the AtoM User manual documentation, here:

* :ref:`csv-import-events`
* :ref:`csv-import-events-gui`

Example use - run from AtoM's root directory:

.. code-block:: bash

   php symfony csv:event-import lib/task/import/example/example_events.csv

There are also various command-line options that can be used, as illustrated in
the options depicted in the image below:

.. image:: images/csv-event-options.*
   :align: center
   :width: 85%
   :alt: An image of the command-line options for events imports

By typing ``php symfony help csv:event-import`` into the command-line from your
root directory, without specifying the location of a CSV, you will able able to
see the CSV import options available (pictured above). A brief explanation of
each is included below.

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--rows-until-update``, ``--skip-rows``, and ``--error-log`` options can
be used the same was as described in the section
:ref:`above <csv-import-descriptions-cli>` on importing descriptions. For more
information on the ``--rows-until-update`` option, see also the section below,
:ref:`csv-import-progress`.

Use the ``--source-name`` to specify a source importing to a AtoM installation
in which information objects from multiple sources have been imported, and/or
to associate it explicitly with a previously-imported CSV file that used the
same ``--source-name`` value. Further information is provided in the section on
legacy ID mapping in the User Manual - see: :ref:`csv-legacy-id-mapping`.

The ``--event-types`` option is deprecated, and no longer supported in AtoM.

:ref:`Back to top <cli-import-export>`

.. _csv-repository-import-cli:

Importing repository records
----------------------------

Example use - run from AtoM's root directory:

.. code-block:: bash

   php symfony csv:repository-import lib/task/import/example/example_repositories.csv

There are also various command-line options that can be used, as illustrated in
the options depicted in the image below:

.. image:: images/csv-repo-options.*
   :align: center
   :width: 85%
   :alt: An image of the command-line options for repository imports

By typing ``php symfony help csv:repository-import`` into the command-line from
your root directory, without specifying the location of a CSV, you will able
able to see the CSV import options available (pictured above). A brief
explanation of each is included below. For full details on
:term:`archival institution` CSV imports, please see:

* :ref:`csv-import-repositories`
* :ref:`csv-import-repos-ui`
* :ref:`csv-repo-update`

   * :ref:`csv-repo-update-match`
   * :ref:`csv-repo-delete-replace`

.. SEEALSO::

   * :ref:`archival-institutions`
   * :ref:`csv-repo-updates-ui`
   * :ref:`csv-before-you-import`


The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--rows-until-update``, ``--skip-rows``, and ``--error-log`` options can
be used the same was as described in the section
:ref:`above <csv-import-descriptions-cli>` on importing descriptions. For more
information on the ``--rows-until-update`` option, see also the section below,
:ref:`csv-import-progress`.

Use the ``--source-name`` option (described  in the CSV import
documentation :ref:`here <csv-legacy-id-mapping>`) to specify the source name
that will be added to the keymap table. This can be useful for improving the
matching logic when importing updates - you can specify the same source name
used as the was used during the original import for greater matching. By
default in AtoM, when no source name is specified during import, the CSV
filename will be stored in the keymap table as the source name.

The ``--index`` option will progressively add your imported repository
records to AtoM's search index as the import progresses. Normally when using
the :ref:`user interface <csv-import-repos-ui>` to perform an import, the
import is indexed automatically - but when running an import via the command-line
interface, indexing is **disabled by default.** This is because indexing during
import can sometimes be incredibly slow, and the command-line is generally used
for larger imports. Generally, we recommend a user simply clear the cache and
rebuild the search index following an import - from AtoM's root directory, run:

.. code-block:: bash

   php symfony cc && php symfony search:populate

However, if you would like to index the import as it progresses, the
``--index`` option can be used to enable this. This is useful if you have a
large database, and don't want to have to re-index everything. For more
information on indexing options, see: :ref:`maintenance-populate-search-index`.

The ``--update`` option can be used when you want to use a CSV import to
update existing archival institutions, instead of creating new records. There
are 2 modes: ``--update="match-and-update"`` and
``--update="delete-and-replace``. When used, AtoM will attempt to identify
matching archival institution records and, depending on which option is used,
either update them in place, or delete the match and replace it with the new
repository record in the CSV. The matching criteria for repository records is
based on an **exact** match on the authorized form of name of the existing
repository. This means that you cannot use the ``--update`` option to update
the name of your existing repositories, or AtoM will fail to find the correct
match on import.

.. TIP::

   You can read more about each update option in the User Manual:

   * :ref:`csv-repo-update-match`
   * :ref:`csv-repo-delete-replace`

For the "*match-and-update*" option, AtoM will update any repository record
related columns that have new data. Columns in the related CSV row that are
left blank will **not** delete existing data - instead, they will be ignored
and any existing data in the related field will be preserved.

.. IMPORTANT::

   At this time, not all fields in the :term:`archival institution` record can
   be updated. Primarily, these are fields that are found in other tables in
   the AtoM database than the primary repository record table. For further
   details, see: :ref:`csv-repo-update-match`.

With the "*delete-and-replace*" update option, AtoM will delete the matches
prior to importing the CSV data as a new record to replace it.

Note that **only** the matched :term:`repository` record is deleted during this
process. Any related/linked :term:`entities <entity>` (such as an
:term:`authority record` linked as being maintained by the repository,
Thematic area or other repository :term:`access points <access point>`, and
linked :term:`archival descriptions <archival description>`) **are not
automatically deleted**. If you also want these fully removed, you will have to
find them and manually delete them via the user interface after the import.

Once the original matched repository record has been deleted, the CSV
import proceeds as if the record is new. That is to say, just as AtoM does not
automatically delete entities related to the original archival institution,
it *also* not automatically re-link previously related entities.

.. WARNING::

   This means that if your :term:`archival institution` record is linked to
   descriptions, using the "Delete and replace" method will **unlink all
   descriptions** - these will not be automatically re-linked with the new
   import!

   We recommend you **only** use the "Delete and replace" method with
   repository records that are not currently linked to other entities.

Normally, when attempting to match records, if AtoM fails to find a match
candidate, it will proceed to import the row as a new record. However, you can
use the ``--skip-unmatched`` option with ``--update`` to change this default
behavior. When ``--skip-unmatched`` is used, then any records that do not
match will be ignored during the import, and reported in the console log shown
on the :ref:`Job details <job-details>` page of the related import job (see:
:ref:`manage-jobs` for more information). This is recommended if you are
intending to only import updates to existing records. Note that
``--skip-unmatched`` will not work if it is not used in conjunction with the
``--update`` option.

Similarly, with new imports, you can use the ``--skip-matched`` option to skip
any records that AtoM identifies as matching those you have already imported.
This can be useful if you are uncertain if some of the records in your CSV
have been previously imported - such as when passing records to a portal site
or union catalogue. Any records that appear to match existing repository
records (based on the authorized form of name) will be ignored during the
import, and reported in the console log shown on the
:ref:`Job details <job-details>` page of the related import job.

You can use the ``--upload-limit`` option to specify the default upload limit for
repositories which don't specify their *uploadLimit* in the CSV file. That is,
if for example you performed a CSV import with the command-line option of
``--upload-limit=5``, then for every repository in the CSV that does NOT have
a value in the *uploadLimit* column, the default value of 5 GBs will be
assigned. For more information on this functionality in the
:term:`user interface`, see: :ref:`upload-limit`.

:ref:`Back to top <cli-import-export>`


.. _csv-actor-import-cli:

Importing authority records
---------------------------

The :term:`authority record` import tool allows you to import data about
people, familiies, and organizations. A typical authority record import can
be conducted via the :term:`user interface` - for more information, see:
:ref:`csv-import-authority-records-gui`. However, inn addition to importing
data detailing these entities, the command-line tool also allows the
simultaneous import of supplementary data (in separate CSV files) on how these
entities relate to each other and alternate names by which these entities are
known.

You can view the example CSV files for authority records in the AtoM code (at
``lib/task/import/example/authority_records/``) or they can be downloaded
directly here:

* https://wiki.accesstomemory.org/Resources/CSV_templates#Other_CSV_templates

The primary documentation for preparing the main authority record CSV template
can be found in the User Manual, here:

* :ref:`csv-import-authority-records`

However, the basic information on preparing the supplementary Actor
Relationships CSV and the Actor Aliases will be described below.

.. SEEALSO::

   * :ref:`authority-records`
   * :ref:`csv-before-you-import`
   * :ref:`csv-import-authority-records-gui`

.. _csv-authority-alternate-names:

Alternate names CSV
^^^^^^^^^^^^^^^^^^^

This CSV template, also known as the Aliases CSV template, can be imported at
the same time as the Authority record CSV template to supply addtional forms
of name. The :ref:`ISAAR-CPF standard <isaar-template>` upon which the AtoM
authority record template is based includes 3 fields for alternate forms of name:

* Parallel form(s) of name
* Standardized form(s) of name according to other rules
* Other form(s) of name

Consult the related standard for more information. For guidance on data entry
and a link to the related standard, see
:ref:`ISAAR-CPF template <isaar-template>`.

The Alternate names CSV is very simple, comprised of just 4 columns:

* The ``parentAuthorizedFormOfName`` should match exactly a target name in the
  related authority record CSV being imported. The aliases (or alternate
  names) included in the Aliases CSV will be associated with that actor's
  :term:`authority record` following import.
* The ``alternateForm`` should include the alternate name or alias you wish to
  import.
* The ``formType`` column contains data about what kind of alternate is being
  created. Each alias can be one of three forms: a parallel form, a standardized
  form according to other descriptive practices, or an "other" form. Enter
  either "parallel", "standardized", or "other" as a value in this the cells
  of this column. For more information on the distinction between these three
  types of alternate names, please consult the International Council
  on Archives' ISAAR-CPF standard - specifically sections 5.1.3 to 5.1.5.
* The ``culture`` column indicates to AtoM the language of the descriptions
  being uploaded. This column expects two-letter ISO 639-1 language code
  values - for example, "en" for English; "fr" for French, "it" for Italian,
  etc. See `Wikipedia <http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`__
  for a full list of ISO 639-1 language codes.

.. _csv-authority-relationships:

Relationships CSV
^^^^^^^^^^^^^^^^^

The Relationships CSV template can be imported at the same time as the
Authority record CSV template to create relationships between actors (i.e.
:term:`authority records <authority record>`. For more information on this
functionality as seen in the :term:`user interface`, see:
:ref:`link-two-authority-records`.

The Relationships CSV contains 8 columns:

* The ``sourceAuthorizedFormOfName`` is used to specify one of the actors
  included in the Authority record CSV upload. This field should match
  exactly one of the actors listed in the ``authorizedFormOfName`` column of
  the Authority record CSV.
* The ``targetAuthorizedFormOfName`` is also used to specify another one of
  the actors in the Authority record CSV upload - the actor with which you
  intend to create a relationship. The values entered into this column should
  match exactly one of the actors listed in the ``authorizedFormOfName``
  column of the Authority record CSV.
* The ``category`` column contains data about the type of relationship you are
  creating, and maps to ISAAR 5.3.2 Category of Relationship. The terms
  recommended in the ISAAR standard are maintained in the Actor Relation Type
  :term:`taxonomy` in AtoM. Values entered should be either "associative",
  "family", "hierarchical", or "temporal". For more information on the
  distinction between these terms, please consult the International Council
  on Archives' ISAAR-CPF standard - specifically, section  5.3.2.
* The ``date`` field is a free-text string field that will allow a user to
  enter a date or date range for the relationship. It allows the use of special
  characters and typographical marks to indicate approximation (e.g. [ca.
  1900]) and/or uncertainty (e.g. [199-?]). Use the ``startDate`` and
  ``endDate`` fields to enter ISO-formated date values (e.g. YYYY-MM-DD,
  YYYY-MM, or YYYY) that correspond to the free-text *date* field. Public users
  in the interface will see the ``date`` field values when viewing
  relationships; the ``startDate`` and ``endDate`` values are not visible, and
  are used for date range searching in the application.
* The ``culture`` column indicates to AtoM the language of the descriptions
  being uploaded. This column expects two-letter ISO 639-1 language code
  values - for example, "en" for English; "fr" for French, "it" for Italian,
  etc. See `Wikipedia <http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`__
  for a full list of ISO 639-1 language codes.


.. _csv-import-authority-records-cli:

Importing authority records
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Example use - run from AtoM's root directory:

.. code-block:: bash

   php symfony csv:authority-import lib/task/import/example/authority_records/example_authority_records.csv

There are also various command-line options that can be used, as illustrated in
the options depicted in the image below:

.. image:: images/csv-authority-options.*
   :align: center
   :width: 85%
   :alt: An image of the command-line options for authority record CSV imports

By typing ``php symfony help csv:authority-import`` into the command-line from
your root directory, **without** specifying the location of a CSV, you will
able able to see the CSV import options available (pictured above). A brief
explanation of each is included below.

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

The ``--rows-until-update``, ``--skip-rows``, ``--error-log``, and ``--index``
options can be used the same was as described in the section
:ref:`above <csv-import-descriptions-cli>` on importing descriptions. For more
information on the ``--rows-until-update`` option, see also the section below,
:ref:`csv-import-progress`.

The ``--alias-file`` and ``--relation-file`` options are used to import
accompanying alternate name (aka Alias data) and relationship CSV files at
the same time as the authority record CSV import. An example of each will be
given below, though they can be used together. Jump to:

* :ref:`csv-import-aliases-cli`
* :ref:`csv-import-relations-cli`

Use the ``--source-name`` option (described  in the CSV import
documentation :ref:`here <csv-legacy-id-mapping>`) to specify the source name
that will be added to the keymap table. This can be useful for improving the
matching logic when importing updates - you can specify the same source name
used as the was used during the original import for greater matching. By
default in AtoM, when no source name is specified during import, the CSV
filename will be stored in the keymap table as the source name.

The ``--index`` option will progressively add your imported authority records
to AtoM's search index as the import progresses. Normally when using the
:ref:`user interface <csv-import-authority-records-gui>` to perform an import,
the import is indexed automatically - but when running an import via the
command-line interface, indexing is **disabled by default.** This is because
indexing during import can sometimes be incredibly slow, and the command-line
is generally used for larger imports. Generally, we recommend a user simply
clear the cache and rebuild the search index following an import - from AtoM's
root directory, run:

.. code-block:: bash

   php symfony cc && php symfony search:populate

However, if you would like to index the import as it progresses, the
``--index`` option can be used to enable this. This is useful if you have a
large database, and don't want to have to re-index everything. For more
information on indexing options, see: :ref:`maintenance-populate-search-index`.

The ``--update`` option can be used when you want to use a CSV import to
update existing authority records, instead of creating new records. There
are 2 modes: ``--update="match-and-update"`` and
``--update="delete-and-replace``. When used, AtoM will attempt to identify
matching authority records and, depending on which option is used,
either update them in place, or delete the match and replace it with the new
repository record in the CSV. The matching criteria for authority records is
based on an **exact** match on the authorized form of name of the existing
authority record. This means that you cannot use the ``--update`` option to
update the authorized form of name of your existing authority records, or AtoM
will fail to find the correct match on import. Note that at this time, the
update options **only** work with the data found in the primary Authority
record CSV template - ``--update`` cannot update Relations and Alias data.

.. TIP::

   You can read more about each update option in the User Manual:

   * :ref:`csv-actors-match-update`
   * :ref:`csv-actors-delete-replace`

For the "*match-and-update*" option, AtoM will update any authority record
related columns that have new data. Columns in the related CSV row that are
left blank will **not** delete existing data - instead, they will be ignored
and any existing data in the related field will be preserved.

.. IMPORTANT::

   At this time, not all fields in the :term:`authority record` template can
   be updated. Primarily, these are fields that are found in other tables in
   the AtoM database than the primary authority record table. For further
   details, see: :ref:`csv-actors-match-update`.

With the "*delete-and-replace*" update option, AtoM will delete the matches
prior to importing the CSV data as a new record to replace it.

Note that **only** the matched :term:`authority record` is deleted during this
process. Any related/linked :term:`entities <entity>` (such as a
:term:`repository` linked as the authority record's maintainer, other
authority records linked via a relationship, Occupation
:term:`access points <access point>`, and linked
:term:`archival descriptions <archival description>`) **are not also
automatically deleted**. If you also want these fully removed, you will have to
find them and manually delete them via the user interface after the import.

Once the original matched authority record has been deleted, the CSV
import proceeds as if the record is new. That is to say, just as AtoM does not
automatically delete entities related to the original archival institution,
it *also* not automatically re-link previously related entities.

.. WARNING::

   This means that if your :term:`authority record` is linked to
   descriptions, a repository, or other authority records, using the "Delete
   and replace"method will **unlink all descriptions, repositories,
   and authority records** - these will not be automatically re-linked with
   the new import!

   We recommend you **only** use the "Delete and replace" method with
   authority records that are not currently linked to other entities.

   For more information on linking authority records, see:

   * :ref:`link-authority-to-description`
   * :ref:`link-two-authority-records`
   * :ref:`link-repo-actor`

The ``--limit`` option can be used with ``--update`` to increase the
likelihood of a successful match by limiting the match criteria to records
linked to a specific repository as its :ref:`maintainer <link-repo-actor>`.
This option takes the slug of the related :term:`repository` as its value. For
example, to import a CSV called "*my-updates.csv*" and update an authority
record for Jane Doe belonging to the Example Archives, your command might look
something like this example:

.. code-block:: bash

   php symfony csv:authority-import --update="match-and-update" --limit="example-archives" /path/to/my-updates.csv

Normally, when attempting to match records, if AtoM fails to find a match
candidate, it will proceed to import the row as a new record. However, you can
use the ``--skip-unmatched`` option with ``--update`` to change this default
behavior. When ``--skip-unmatched`` is used, then any records that do not
match will be ignored during the import, and reported in the console log shown
on the :ref:`Job details <job-details>` page of the related import job (see:
:ref:`manage-jobs` for more information). This is recommended if you are
intending to only import updates to existing records. Note that
``--skip-unmatched`` will not work if it is not used in conjunction with the
``--update`` option.

Similarly, with new imports, you can use the ``--skip-matched`` option to skip
any records that AtoM identifies as matching those you have already imported.
This can be useful if you are uncertain if some of the records in your CSV
have been previously imported - such as when passing records to a portal site
or union catalogue. Any records that appear to match existing authority
records (based on the authorized form of name) will be ignored during the
import, and reported in the console log shown on the
:ref:`Job details <job-details>` page of the related import job.

.. _csv-import-aliases-cli:

Importing alternate names (Alias data)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Alternate names are defined in a separate CSV file. Each alias can be one of
three forms: a parallel form, a standardized form, or "other" form. See the
section on data entry :ref:`above <csv-authority-alternate-names>` for further
guidance.

An example CSV template file of supplementary alias data is available in the
AtoM source code ( at ``lib/task/import/example/authority_records/example_authority_
record_aliases.csv``) or can be downloaded here:

* https://wiki.accesstomemory.org/Resources/CSV_templates#Other_CSV_templates

The Alternate names CSV file must be imported at the same time as its related
Authority record CSV file. The ``--alias-file`` command-line option is used
to specify a separate path to the Alternate names CSV, with a back slash
( ``\`` ) used to separate it from the path of the original authority record
CSV, as shown below.

**Example import of authority records and corresponding aliases:**

.. code-block:: bash

   php symfony csv:authority-import lib/task/import/example/authority_records/example_authority_records.csv \
   --alias-file=lib/task/import/example/authority_records/example_authority_record_aliases.csv


.. _csv-import-relations-cli:

Importing Relations data
^^^^^^^^^^^^^^^^^^^^^^^^

Relations between authority records are also defined in a separate CSV file.
Each relationship can be either hierarchical, temporal, family, or
associative. See the section on data entry
:ref:`above <csv-authority-relationships>` for further guidance.

An example CSV template file of relation data is available in the AtoM source
code ( at ``lib/task/import/example/authority_records/example_authority_record_relat
ionships.csv``) or can be downloaded here:

* https://wiki.accesstomemory.org/Resources/CSV_templates#Other_CSV_templates

The Relationships CSV file must be imported at the same time as its related
Authority record CSV file. The ``--relation-file`` command-line option is used
to specify a separate path to the Relationships names CSV, with a back slash
( ``\`` ) used to separate it from the path of the original authority record
CSV, as shown below.

**Example import of authority records and corresponding relationships:**

.. code-block:: bash

   php symfony csv:authority-import lib/task/import/example/authority_records/example_authority_records.csv \
   --relation-file=lib/task/import/example/authority_records/example_authority_record_relationships.csv


:ref:`Back to top <cli-import-export>`

.. _csv-import-accessions-cli:

Import accession records
------------------------

The :term:`accession record` import tool allows you to import data about your
accessions. Additionally, when importing descriptions as well, you can use the
subsequent :term:`archival description` CSV import to create a link between
your accession records and your descriptions, by adding an ``accessionNumber``
column in the archival description CSV and populating it with the exact
accession number(s) used during your accessions data import.

Alternatively, you can use the ``qubitParentSlug`` column to link existing
descriptions in AtoM to new or updated accessions records via your import -
for more details see the User Manual: :ref:`csv-import-accessions`.

An example CSV template file is available in the
``lib/task/import/example/example_accessions.csv`` directory of AtoM, or it
can be downloaded here:

* https://wiki.accesstomemory.org/Resources/CSV_templates#Other_CSV_templates

The primary documentation for preparing your accession record data in a CSV
file for import can be found in the User Manual:

* :ref:`csv-import-accessions`

Please review the guidance provided there carefully prior to running a command
line import. The use of the command-line task and its options are outlined
below.

**Example use** - run from AtoM's root directory:

.. code-block:: bash

   php symfony csv:accession-import /path/to/my/example_accessions.csv

There are also a number of options available with this command-line task.

.. image:: images/csv-accession-options.*
   :align: center
   :width: 85%
   :alt: An image of the command-line options for accession record imports

By typing ``php symfony help csv:accession-import`` into the command-line from
your root directory, **without** specifying the location of a CSV, you will
able able to see the CSV import options available (pictured above). A brief
explanation of each is included below.

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

Use the ``--source-name`` to specify a source importing to a AtoM installation
in which accessions and information objects from multiple sources have been
imported, and/or to associate it explicitly with a previously-imported CSV
file that used the same ``--source-name`` value. An example is provided in the
section on legacy ID mapping in the User Manual - see:
:ref:`Legacy ID Mapping <csv-legacy-id-mapping>`.

The ``--rows-until-update``, ``--skip-rows``, ``--error-log``, and ``--index``
options can be used the same was as described in the section
:ref:`above <csv-import-descriptions-cli>` on importing descriptions. For more
information on the ``--rows-until-update`` option, see also the section below,
:ref:`csv-import-progress`.

The ``--index`` option will progressively add your imported accession records
to AtoM's search index as the import progresses. Normally when using the
:ref:`user interface <csv-import-accessions-gui>` to perform an import,
the import is indexed automatically - but when running an import via the
command-line interface, indexing is **disabled by default.** This is because
indexing during import can sometimes be incredibly slow, and the command-line
is generally used for larger imports. Generally for very large imports we
recommend a user simply clear the cache and rebuild the search index following
an import - from AtoM's root directory, run:

.. code-block:: bash

   php symfony cc && php symfony search:populate

However, if you would like to index the import as it progresses, the
``--index`` option can be used to enable this. This is useful if you have a
large database, and don't want to have to re-index everything. For more
information on indexing options, see: :ref:`maintenance-populate-search-index`.

:ref:`Back to top <cli-import-export>`

.. _csv-import-progress:

Display the progress of an upload via the command-line interface (CLI)
----------------------------------------------------------------------

The various CSV import tools allow the use of the ``--rows-until-update``
command-line option to display the current row of CSV data being imported.
This is an extremely simplified way to indicate progress graphically via the
command-line - the user sets a numerical value for the number of rows the task
will progress before an update, and then the task will output a dot (or period
) in the command-line every time the indicated number of rows has been
processed in the current CSV.

Example use reporting progress every 5 rows:

.. code-block:: bash

   php symfony csv:import lib/task/import/example/rad/example_information_objects_rad.csv --rows-until-update=5

This can be useful for large imports, to ensure the import is still progressing,
and to try to roughly determine how far the task has progressed and how long
it will take to complete.

:ref:`Back to top <cli-import-export>`

.. _digital-object-load-task:

Load digital objects via the command line
=========================================

Known as the **Digital object load task**, this command-line tool will allow a
user to bulk attach digital objects to existing information objects (e.g.
:term:`archival descriptions <archival description>`) through the use of a
simple CSV file.

This task will take a CSV file as input, which contains two columns: ``filename``
and **EITHER** ``information_object_id`` **OR** ``identifier`` as the second
column; the script will fail if these column headers are not
present in the first row of the CSV file, and it will fail if there are more
than 2 columns - you must choose which variable you prefer to work with (
identifier or object ID) for the second column. Each will be explained below.

The ``filename`` column contains the full (current) path to the digital asset
(file). The ``information_object_id`` or ``identifier`` column identifies the
linked information object. AtoM does not allow more than one digital object
per information object (with the exception of derivatives), and each digital
object must have a corresponding information object to describe it, so this
one-to-one relationship must be respected in the CSV import file.

The ``information_object_id`` is a unique internal value assigned to each
:term:`information object` in AtoM's database - it is not visible via the
:term:`user interface` and you will have to perform a SQL query to find it out
- a sample SQL query with basic instructions has been included below.

The ``identifier`` can be used instead if preferred. A
:term:`description's <archival description>` identifier is visible in the
:term:`user interface`, which can make it less difficult to discover. **
However,**, if the target description's identifier is not unique throughout
your AtoM instance, the digital object may not be attached to the correct
description - AtoM will attach it to the first matching identifier it finds.

.. _digital-object-load-sql-object-id:

Finding the information_object_id
---------------------------------

The ``information_object_id`` is not a value that is accessible via the
:term:`user interface` - it is a unique value used in AtoM's database. You can,
however, use SQL in the command-line to determine the ID of an information
object. The following example will show you how to use a SQL query to find the
``information_object_id``, if you know the :term:`slug` of the description:

1. First, you will need to access mysqlCLI to be able to input a SQL query. To
   do this, you will need to know the database name, user name, and password you
   used when creating your database during installation. If your database is
   on a different server (e.g. if you are trying to SSH in to access your
   database server), you will also need to know the hostname - that is, the IP
   address or domain name of the server where your database is located.
2. The following is an example of the CLI command to enter to access mysqlCLI:

   .. code-block:: bash

      mysql -u root -pMYSECRETPASSWORD atom

   * ``-u`` = user. If you followed our :ref:`installation instructions
     <installation-linux>`, this will be ``root``
   * ``-p`` = password. Enter the password you used during installation right
     after the ``-p``. If you did not enter a password, include the ``-p``
     on its own. If you are prompted later for a password and didn't use one,
     just press enter.
   * ``-h`` = hostname. If your database is on a different server, supply either
     an IP address, or the domain name, where it is located.
   * ``atom`` = your database name. If you followed our
     :ref:`installation instructions <installation-linux>`, this will be
     ``atom``; otherwise enter the database name you used when installing AtoM.

3. You may be prompted for your password again. If so, enter it. If you did
   not use a password during installation, simply press enter.
4. Your command prompt should now say something like ``mysql>``. You can now
   enter a SQL query directly.
5. The following example SQL command will return the information_object_id for
   a desription, when the information object's :term:`slug` is known:

   .. code-block:: bash

      SELECT object_id FROM slug WHERE slug='your-slug-here';

6. The query should return the object_id for the description. Here is an
   example:

.. image:: images/digi-object-load-mysql-select.*
   :align: center
   :width: 70%
   :alt: An image of a successful SELECT statement in mysqlCLI

7. Enter ``quit`` to exit mysqlCLI.

Using the digital object load task
----------------------------------

Before using this task, you will need to prepare:

* A CSV file with 2 columns -  **EITHER** ``information_object_id`` and
  ``filename``, **OR** ``identifier`` and ``filename``
* A directory with your digital objects inside of it

.. IMPORTANT::

   You cannot use both ``information_object_id`` and ``identifier`` in the
   same CSV - it must be one or the other. If you use the ``identifier``, make
   sure your target description identifiers are **unique** in AtoM - otherwise
   your digital objects may not upload to the right description!

Here is a sample image of what the CSV looks like when the identifier is used,
and the CSV is prepared in a spreadsheet application:

.. image:: images/digital-object-load-identifier.*
   :align: center
   :width: 60%
   :alt: Example CSV for digitalobject:load task using identifier

.. TIP::

   Before proceeding, make sure that you have reviewed the instructions
   :ref:`above <csv-encoding-newline>`, to ensure that your CSV will work when
   used with the ``digitalobject:load`` task. The key point when creating a
   CSV is to ensure the following:

   * CSV file is saved with UTF-8 encodings
   * CSV file uses Linux/Unix style end-of-line characters (``/n``)

You can see the options available on the CLI task by typing in the following
command:

.. code-block:: bash

   php symfony help digitalobject:load


.. image:: images/digital-object-load-options.*
   :align: center
   :width: 85%
   :alt: An image of the command-line options for digitalobject:load

The ``--application``, ``--env``, and ``--connection`` options **should not be
used** - AtoM requires the uses of the pre-set defaults for symfony to be
able to execute the import.

By default, the digital object load task will **not index** the collection as
it runs. This means that normally, you will need to manually repopulate the
search index after running the task. Running without indexing allows the task
to complete much more quickly - however, if you're only uploading a small set
of digital objects, you can choose to have the task index the collection as it
progresses, using the ``--index`` (or ``-i``) option

The ``--path`` option will allow you to simplify the ``filename`` column in
your CSV, to avoid repetition. If all the digital objects you intend to upload
are stored in the same folder, then adding /path/to/my/folder/ to each object
filename seems tedious - your ``filename`` column will need to look something
like this:

.. code-block:: bash

   filename
   /path/to/my/folder/image1.png
   /path/to/my/folder/image2.jpg
   /path/to/my/folder/text1.pdf
   etc...

To avoid this when all digital objects are in the same directory, you can use
the ``--path`` option to pre-supply the path to the digital objects - for each
filename, the path supplied will be appended. **Note** that you will need to
use a trailing slash to finish your path prefix - e.g.:

.. code-block:: bash

   php symfony digitalobject:load --path="/path/to/my/folder/" /path/to/my/spreadsheet.csv


**TO RUN THE DIGITAL OBJECT LOAD TASK**

.. code-block:: bash

   php symfony digitalobject:load /path/to/your/loadfile.csv

**NOTES ON USE**

* If an information object already has a :term:`digital object` attached to it,
  it will be skipped during the import
* Remember to repopulate the search index afterwards if you haven't used the
  ``--index`` option! For more information, see:
  :ref:`maintenance-populate-search-index`.


  .. code-block:: bash

     php symfony search:populate


Regenerating derivatives
------------------------

Sometimes the ``digitalobject:load`` task won't generate the :term:`thumbnail`
and :term:`reference <reference display copy>` images properly for digital
objects that were loaded (e.g. due to a crash or absence of convert installed,
etc.). In this case, you can regenerate these thumbsnail/reference images using
the following command:

.. code-block:: bash

   php symfony digitalobject:regen-derivatives

.. WARNING::

   All of your current derivatives will be deleted! They will be replaced
   with new derivatives after the task has finished running. If you have
   manually changed the :term:`thumbnail` or :term:`reference display copy`
   of a digital object via the user interface (see:
   :ref:`edit-digital-object`), these two will be replaced with digital
   object derivatives created from the :term:`master digital object`.

For more information on this task and the options available, see:
:ref:`cli-regenerate-derivatives`.

:ref:`Back to top <cli-import-export>`

.. _csv-search-indexing:

Index your content after an import
==================================

After any kind of import, you'll want to index your content so it can be
searched by users. To do so, enter the following into the command-line:

.. code-block:: bash

   php symfony search:populate

.. TIP::

   If you have used the ``--index`` option while running your command-line
   imports, then you will not need to reindex - when used, the ``--index``
   option will progressively add records to the search index as they are
   created during the import process.

For more information on search index population in AtoM, see:
:ref:`maintenance-populate-search-index`.

:ref:`Back to top <cli-import-export>`
