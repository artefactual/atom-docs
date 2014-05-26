.. _csv-import:

===========
CSV import
===========

.. |import| image:: images/download-alt.png
   :height: 18
   :width: 18
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

Most often understood as an acronym for "comma-separated values" (though
sometimes called "character-separated values" because the separator character
does not have to be a comma), CSV is a file format that stores tabular data in
plain-text form. Information with common properties that can be expressed as a
sequence of fields sharing a common header can be stored in plain-text using
the CSV format, making it application agnostic and highly transportable.

A CSV file consists of a number of records (rows), that have identical fields,
separated by commas (or in some cases, another separator). Often a header
column (i.e. the cell values in first or top row of a CSV file) is included,
naming each column and indicating what kind of data the column contains. Data
is then entered using a separator or delimitor (such as a comma) to indicate a
separation of fields (or cells), and a line break or carriage return to
indicate rows (i.e. different records). Most spreadsheet applications (such as
OpenOffice Calc or MS Excel) can open CSV files and express them as a
spreadsheet. See
`Wikipedia <http://en.wikipedia.org/wiki/Comma-separated_values>`__ for more
information on CSV.

**In AtoM**, the CSV import function allows user to import data from a
spreadsheet, or another database (so long as the export from the database is
in CSV format). Artefactual has created a number of
:ref:`CSV templates <csv-column-mapping>` that can be used to import

For **small data imports** (i.e. CSV files with less than 1,000 rows), CSV files
that have been mapped to the sample templates provided
(:ref:`below <csv-column-mapping>`) can be imported via the :term:`user
interface`.

For **large data imports** (i.e. CSV files with 1,000 or more rows), the
import will need to be performed using the Command-line interface (CLI) -
meaning you will need access to your installation environment and some basic
familiarity with using the command line.

**Below are instructions for using the CSV import module in AtoM to:**

* :ref:`Prepare for your import <csv-before-you-import>`
* :ref:`Map legacy IDs to express hierarchical data <csv-legacy-id-mapping>`
* :ref:`Import archival descriptions <csv-import-descriptions>`
* :ref:`Import events <csv-import-events>`
* :ref:`Import archival institutions <csv-import-repositories>`
* :ref:`Import authority records <csv-import-authority-records>`
* :ref:`Import accessions <csv-import-accessions>`
* :ref:`Display progress during a command-line import <csv-import-progress>`
* :ref:`Load digital objects via the command line <digital-object-load-task>`
* :ref:`Index your content after an upload <csv-search-indexing>`

.. _csv-before-you-import:

Before you import
=================

Before you start importing records, there are a number of things you'll need
to do to prepare. You'll likely want to determine import complexity to see how
much technical resources need to be allocated and you'll want to make
modifications to your import data to ensure that it imports properly. Below
are some guidelines to help you prepare your data for import into AtoM via
CSV.

.. IMPORTANT::

   We strongly recommend that imports never be carried out in your production
   environment, if possible. Instead, consider deploying a development/test
   version of your AtoM instance, performing the import(s) there, reviewing the
   data for any problems and making any required edits via the user interface,
   and then migrating this data to your production server. For more information,
   please see our section on :ref:`Server migration <server-migration>` in the
   Administrators manual.

.. _csv-determine-import-complexity:

Determining import complexity
-----------------------------

To quickly gauge the complexity of CSV data you wish to import, the
``csv:check-import`` command can be used in the command-line. This command
displays the following:

* The number of rows of data (useful when estimating the amount of processing
  time needed to perform the import, and whether or not you can use the
  :term:`user interface` to perform the import)
* The number of columns (useful when estimating the amount of developer time
  needed to map the columns to AtoM data - see: :ref:`csv-column-mapping`
  below)
* How many instances of pipe (|) characters are found in each column (pipe
  characters are used by some systems to put multiple values in a single cell
  of data)
* Sample column values

You will need access to the command-line of the server on which AtoM is
installed, and you will need to know the file path where your CSV is currently
located.

**Example use:**

.. code-block:: bash

   php symfony csv:check-import lib/task/import/example/rad/example_information_objects_rad.csv

.. _csv-column-mapping:

CSV Column mapping
------------------

AtoM was originally built to encourage broad adoption and use of the
`ICA <http://www.ica.org/>`__'s international standards, and expanded to support
other recognized standards. Consequently, all of
the description templates in AtoM correspond to a recognized content or
metadata exchange standard, and many of the fields in our underlying database
model are also inspired by ICA standards. For your data to import
successfully into AtoM, you will first need to map it to one of our existing
CSV templates, which are derived from the various standards-based templates
available in AtoM for description.

Mapping your data to the supplied CSV templates below implies a familiarity
with the standards used in AtoM, so you can make appropriate decisions on
which fields in your data map to which fields in AtoM, and how to proceed if
your data does not easily map 1:1 with the standard upon which our templates
are based.

**For further information and source links to the standards used in AtoM,
see:**

* :ref:`descriptive-standards`
* :ref:`data-entry`

The cell values in the top row of a CSV data file conventionally name each
column. The name indicates what kind of data the column contains. If the CSV
data you wish to import doesn't include a row like this, you should insert
one. You should then make the names correspond to AtoM-friendly names using
the top row of data in the example CSV file(s) appropriate to your import.

Available example files are:

* ISAD archival description CSV template
* RAD archival description CSV template
* Authority record CSV template

  * Authority record aliases CSV template
  * Authority record relationships CSV template

* Accessions CSV template
* Events CSV template

The order of the columns in the example CSV files is the same as the order in
the AtoM interface, and should be maintained. Having the correct names in the
cell values of the first row of your CSV data enables AtoM to import values in
each column to the correct AtoM fields.

.. TIP::

   A good way to make sure your column mapping is correct is to create a
   blank row after the top row and populate this with test values. You can
   then do an import, stop it after the first row (using CTRL-C), and make
   sure that all the values from the CSV row are present in AtoM. Including,
   in each field of a row, the letter corresponding to the corresponding
   spreadsheet column (including, for example, the text "(A)" for data in
   spreadsheet column A) makes it easy to quickly determine if a field is
   showing up on the AtoM side after import.

.. _csv-encoding-newline:

Verify character encoding and line endings
------------------------------------------

For your CSV files to import properly, you will need to ensure two things
prior to importing: that the
`character encoding <http://en.wikipedia.org/wiki/Character_encoding>`__ of
your CSV file is set to `UTF-8 <http://en.wikipedia.org/wiki/UTF-8>`__, and
that the end-of-line characters used in your CSV conform to the Unix/Linux
style of newline character.

.. IMPORTANT::

   Your import will likely **fail** if you don't ensure these two things are
   are correctly set prior to import! Please review the sub-sections below
   for further details.

.. _csv-utf8-encoding:

Character encoding (UTF-8)
^^^^^^^^^^^^^^^^^^^^^^^^^^

For a CSV file to upload properly into AtoM (and display any special
characters such as accents contained in the data), your CSV file must use a
`UTF-8 <http://en.wikipedia.org/wiki/UTF-8>`__ character encoding. If you have
used a Windows or Mac spreadsheet application (such as Excel, for example),
it's possible that the default character encoding will **not** be UTF-8. For
example, Excel uses  machine-specific ANSI encoding as its defaults during
install, so an EN-US installation might use Windows-1252 encoding by default,
rather than something more universal such as UTF-8 (the default encoding in
AtoM). This can cause problems on import into AtoM with special characters and
diacritics. Make sure that if you are using Excel or another spreadsheet
application, you are setting the character encoding to UTF-8. Many open source
spreadsheet programs, such as LibreOffice Calc, use UTF-8 by default, and
include an easy means for users to change the default encoding.

.. TIP::

   For Excel users, here is an eHow guide on converting CSV files to UTF-8:
   http://www.ehow.com/how_8387439_save-csv-utf8.html

.. _csv-line-endings:

Line endings
^^^^^^^^^^^^

"In computing, a newline, also known as a line ending, end of line (EOL), or
line break, is a special character or sequence of characters signifying the
end of a line of text. The actual codes representing a newline vary across
operating systems, which can be a problem when exchanging text files between
systems with different newline representations." (`Wikipedia
<http://en.wikipedia.org/wiki/Newline>`__)

Here are some of the differences:

* Unix / Linux / FreeBSD / OS X use LF (line feed, ``\n``, 0x0A)
* Macs prior to OS X use CR (carriage return, ``\r``, 0x0D)
* Windows / DOS use CR+LF (carriage return followed by line feed, ``\r\n``,
  0x0D0A)

AtoM's CSV import will expect Unix-style line breaks ( ``\n`` ). If you have
been using a spreadsheet application (such as Excel) on a Mac or Windows, you
may encounter import issues. There are many command-line utilities and free
software options out there to convert newline characters. Please ensure that
your spreadsheet is using the correct line endings prior to upload, otherwise
the upload will fail.

.. _csv-data-transformation:

Data transformation
-------------------

If you are working with a CSV export from another system (such a different
database), you may need to do further pre-processing to prepare your CSV. If
your previous system was designed for standards-compliance to a standard that
AtoM supports (see: :ref:`descriptive-standards`), the mapping process might
be simple - but if your system used custom data fields, mapping to one of the
supported standards could be trickier.

You may, for example, want to combine multiple CSV column values, that don't
cleanly map conceptually to AtoM-compatible CSV columns, into single columns
so they can be put into AtoM as notes. So *ColumnA* and *ColumnB* could be
combined into a *generalNote* column. This requires you to transform the data
before importing.

Depending on the size of your import data, this work can be done manually
using a spreadsheet program - simply cut and paste your data into the
corresponding cell in the provided import templates. However, for larger data
sets, data transformation can be done with custom programming (for example, a
Python script written by a :term:`developer`),  existing tools such as
the open source Pentaho
`Data Integration <http://community.pentaho.com/projects/data-integration/>`__
application, or by use of a CSV transformation script.

We have included some guidelines for creating custom CSV transformation
scripts. See:

* :ref:`csv-transformation`

.. NOTE::

   Creating custom CSV scripts is an activity generally performed by a
   :term:`developer`.

.. _csv-estimate-import-duration:

Estimating import duration
--------------------------

Once you've mapped the columns names in your CSV export to the corresponding
AtoM-compatible CSV column names you may wish to perform a test import.

A test import gives you an idea how long the import will take to complete on
your hardware. To estimate how long it will take to import 20,000 rows of CSV
data, for example, you could time the import of the first 1000 records and
multiply that by 20.

If your test import proves to be too slow on your hardware, or you don't have
hardware to spare, you can consider using cloud computing resources, such as
Open Hosting, Amazon EC2, or Rackspace Cloud.

.. _csv-testing-import:

Testing your import
-------------------

Once you've prepared your import, you may want to clone your AtoM site and
test your import on the clone before importing to your production AtoM
installation. This prevents you from having to delete any improperly imported
data. During import testing if you want to delete all imported data you can
use the command-line purge tool.

:ref:`Back to top <csv-import>`


.. _csv-legacy-id-mapping:

Legacy ID mapping: dealing with hierarchical data in a CSV
==========================================================

The *legacyId* column in imports is used to associate specific legacy data to
AtoM data using ID columns. Why would you need to associate this data? Let's
say you're importing a CSV file of description data you've exported from a
non-AtoM system. If the imported descriptions are in any way hierarchical --
with a fond containing items for example -- a column in a child description
will have to specify the legacy ID of its parent. The parent's legacy ID can
then be used to look up the AtoM ID of the parent that was imported earlier.
With the AtoM ID discovered, the parent/child relationship can then be
created. In addition to hierarchical description data, supplementary data such
as events must specify a legacy parent ID when imported.

.. figure:: images/keymap-table.*
   :align: right
   :figwidth: 20%
   :width: 100%
   :alt: Image of the the keymap table in AtoM's database

   A representation of the keymap table in AtoM, from an Entity Relationship
   Diagram of AtoM's MySQL database.

When CSV data is imported into AtoM, values in the *legacyID* column are
stored in AtoM's keymap table, in a column named *source_id*. A system
administrator or :term:`developer` can access this information, either via
the command-line, or by using a graphical application such as
`phpMyAdmin <http://www.phpmyadmin.net>`__ to look up exising legacy ID values
in the *source_id* column of the MySQL keymap table.

In cases where data is being imported from multiple sources, legacy IDs may
conflict. Two datasets, for example, may have objects with an ID of 3. When
importing, you can use the command-line option ``--source-name`` to only record
or reference mappings for a specific data source. This will add a value in
the *source_name* column of AtoM's keymap table, which can then be used for
mapping subsequent imports.

The following example shows an import of information objects that records a
specific source name when mapping legacy IDs to AtoM IDs:

.. code-block:: bash

    php symfony csv:import information_objects_rad.csv --source-name=collection_name

In the above example, `collection_name` represents the value added by the user
during import - now `collection_name` will be added to the *source_name* column
of the keymap table for all records imported. Given the above example, the
subsequent import of :ref:`events <csv-import-events>` using the following
command would make sure that they get associated with information objects from
the specific source identified as `collection_name`:

.. code-block:: bash

  php symfony csv:event-import events.csv --source-name=collection_name

.. TIP::

   If you use the ``--source-name`` command-line option during your CSV
   import and you want to use spaces in the source name you add, you will
   need to enclose it in quotation marks. For example, both of the following
   are valid:

   `php symfony csv:import information_objects_rad.csv --source-name=collection_name`

   or:

   `php symfony csv:import information_objects_rad.csv --source-name="collection name"`



.. _csv-import-descriptions:

Import archival descriptions via CSV
====================================

The information object import tool allows you to map CSV columns to AtoM data.
Example RAD and ISAD CSV template files are available in AtoM source code
(``lib/task/import/example/rad/example_information_objects_rad.csv``` and
``lib/task/import/example/isad/example_information_objects_isad.csv``) or you
can download the files here:

* RAD archival description CSV template [zip archive]
* ISAD(G) archival description CSV template [zip archive]

Hierarchical relationships
--------------------------

Information objects often have parent-child relationships - for example, a
series is a child of the fonds to which it belongs; it has a parent fonds. If
you want to import a :term:`fonds` or :term:`collection` into AtoM along with
its lower levels of description (i.e. its children - series, files, items,
etc.), you will need a way to specify which rows in your CSV file belong to
which parent description.

There are two basic ways to specify which information object is the parent of
an information object being imported in your CSV - either through the use of
the *legacyID* and *parentID* columns (generally used for new descriptions being
imported, or from descriptions being migrated from another access system), or
by using the *qubitParentSlug* column to import new child descriptions to an
existing description in AtoM.

.. WARNING::

   Note that setting both the *parentId* and *qubitParentSlug* in a single row
   will create an error during import. Only one type of parent specification
   should be used for a single imported information object.

You **can** use a mix of *legacyId/parentId* and *qubitParentSlug* in the
same CSV, just not in the same row. So, for example, if you wanted to import
a series description as a child of a description already in AtoM, as well as
several files as children of the series description, you could set a *legacyID*
for the series, use the *qubitParentSlug* to point to the parent fonds or
collection already in AtoM, and then use the *parentID* column for all your
lower-level file descriptions. However, using both *parentID* and
*qubitParentSlug* in the same row will cause an error.

Both methods of establishing hierarchical relationships are described below.

LegacyID and parentID
^^^^^^^^^^^^^^^^^^^^^

One way  to establish hierarchical relationships during a CSV import involves
the use of the *parentId* column to specify a legacy ID (referencing the
*legacyId* column of a previously imported information object). This way is
most often used for migrations from other access systems. Using this method,
:term:`parent <parent record>` descriptions (e.g. :term:`fonds`,
:term:`collections <collection>`, etc) must appear **first** (i.e. above) in
your CSV and must include a legacyID - while  :term:`child records <child
record>` must appear **after** (i.e. below) their parent records in your CSV,
and must include the legacyID of the parent record in the *parentID* column.

Here is an example of the first three columns of a CSV file (shown in a
spreadsheet application), importing a **Fonds > Series > Item** hierarchy:

.. image:: images/csv-parentID-example.*
   :align: center
   :width: 80%
   :alt: example CSV parentID rows


.. IMPORTANT::

   When the CSV is imported, it progresses row by row - meaning, if your CSV
   is not properly ordered with parent records appearing **before** their
   children, your import will fail!

qubitParentSlug
^^^^^^^^^^^^^^^

The other method of importing hierarchical data into AtoM enables you to
specify an existing :term:`archival description` that doesn't have a legacyID
(one, for example, that has been manually created using the AtoM web
interface), and import descriptions as children of the target description(s).

To specify a parent that exists in AtoM, you must first take note of the
parent information object's :term:`slug`. The "slug" is a textual identifier
that is included in the URL used to view the parent description. If the URL,
for example, is `http://myarchive.com/AtoM/index.php/example-fonds` then
the slug will be `example-fonds`. This slug value would then be included in
your import in the *qubitParentSlug* column in the rows of children of the
parent description.

Alternately, if you are using the command-line to perform your import, you can
use the `--parent-slug` option in the command-line to indicate **all**
descriptions imported should be given a specific parent. The use of `
--parent-slug` will override parent specification using the *parentId* or
*qubitParentSlug* columns.

Here is an example of the first few columns of a CSV file (shown in a
spreadsheet application), importing a new series to an existing
:term:`fonds`, and importing two new file-level descriptions to an existing
series:

.. image:: images/csv-qubitParentSlug-example.*
   :align: center
   :width: 85%
   :alt: example CSV qubitParentSlug rows

If desired, you can mix the use of the *qubitParentSlug* column with the use
of the *parentID* column in the same CSV - for example, you could attach a
new series to an existing fonds by giving it a *legacyID* and the slug for the
existing fonds in the *qubitParentSlug* column, and then including
lower-level files attached to the new series by adding the *legacyID* of the
new series to the *parentID* column of the new files.

.. IMPORTANT::

   You **cannot** add a *parentID* and a *qubitParentSlug* to the **same row**,
   or your import will fail. Each row must have **only** one or the other -
   either a parent slug, or a parent ID.

Creator-related import columns
------------------------------

The *creators*, *creatorHistories*, *creatorDates*, *creatorDatesStart*, and
*creatorDatesEnd* columns are related to the creation of creators. If multiple
creators exist for an information object, the values in these fields should be
pipe-separated (e.g. using the | pipe separator between values).

.. image:: images/csv-creatorDates.*
   :align: center
   :width: 85%
   :alt: example CSV creatorDates rows

Note that *creatorDates*, *creatorDatesStart*, and *creatorDatesEnd* fields
relate to **dates of creation** for the related description, and **not** to
the dates of existence for the related creators. The *creatorDates* field
will map to the free-text date field in AtoM, where users can use special
characters to express approximation, uncertainty, etc. (e.g. [190-?]; [ca.
1885]), while *creatorDatesStart* and *creatorDatesEnd* should include
ISO-formatted date values (YYYY-MM-DD, YYYY-MM, or YYYY).

*creatorHistories* is equivalent to ISAD(G) 3.2.2, RAD 1.7B, and/or DACS 2.7 -
Administrative/Biographical history.

.. NOTE::

   Upon import, AtoM will create a new :term:`authority record` for any creator
   who does not already exist in AtoM, and will map the *creatorHistories* data
   for each creator to the "History" field in the related authority record. This
   information will be linked and visible in the related archival description.
   For more information on how AtoM handles authority records, see
   :ref:`authority-records`.

Physical object-related import columns
--------------------------------------

The *physicalObjectName*, *physicalObjectLocation*, and *physicalObjectType*
columns are related to the creation of physical objects and physical storage
locations related to an :term:`archival description`.

.. image:: images/csv-physical-object.*
   :align: center
   :width: 75%
   :alt: example CSV physicalObject rows

For more information on working with physical storage in AtoM, see:
:ref:`physical-storage`.

.. IMPORTANT::

   .. image:: images/object-type-terms.*
      :align: right
      :width: 10%
      :alt: terms in the physical object type taxonomy

   We have discovered a bug in AtoM 2.0 related to the `physicalObjectType`
   column in our CSV import - if physical location data is included in your CSV,
   values in this field **must** conform to the default AtoM values for the
   import to succeed. We have included a diagram of the default terms (shown
   at right - click to enlarge) for reference. You can also view more
   information about the default terms on our :ref:`physical-storage` page.

   We hope to fix this bug in a future release of AtoM, and have filed an issue
   (`#6755 <https://projects.artefactual.com/issues/6755>`__) to track work
   done to resolve the issue.

.. _csv-import-descriptions-gui:

Using the user interface
------------------------

For small imports (i.e. CSV files with less than 1,000 rows), imports can be
performed via the user interface.

.. IMPORTANT::

   Before proceeding, make sure that you have reviewed the instructions
   above, to ensure that your CSV import will work. Here is a basic checklist
   of things to check for importing a CSV of archival descriptions via the
   user interface:

   * CSV file is saved with UTF-8 encodings
   * CSV file uses Linux/Unix style end-of-line characters (``/n``)
   * CSV file is less than 1,000 rows
   * All :term:`parent <parent record>` descriptions appear in rows **above**
     their children
   * All new parent records have a *legacyID* value, and all
     :term:`children <child record>` include the parent's *legacyID* value in
     their *parentID* column
   * No row uses both *parentID* and *qubitParentSlug* (only one may be used)
   * Any records to be imported as children of an existing record in AtoM use
     the proper *qubitParentSlug* of the existing parent record

If you have double-checked the above, you should be ready to import your
descriptions.

**To import a CSV file via the user interface:**

1. Click on the |import| :ref:`Import <main-menu-import>` menu, located in
   the AtoM :ref:`header bar <atom-header-bar>`, and select "CSV".

.. image:: images/import-menu-csv.*
   :align: center
   :width: 30%
   :alt: The import menu

2. AtoM will redirect you to the CSV import page. Make sure that the "Type"
   :term:`drop-down menu` is set to "Archival description".

.. image:: images/csv-import-page.*
   :align: center
   :width: 85%
   :alt: The CSV import page in AtoM

3. Click the "Browse" button to open a window on your local computer. Select
   the CSV file that you would like to import.

.. image:: images/csv-import-browse.*
   :align: center
   :width: 25%
   :alt: Clicking the "Browse" button in the CSV import page

4. When you have selected the file from your device, its name will appear
   next to the "Browse" button. Click the "Import" button located in the
   :term:`button block` to begin your import.

.. image:: images/csv-import-start.*
   :align: center
   :width: 85%
   :alt: Starting a CSV import in AtoM

.. NOTE::

   Depending on the size of your CSV import, this can take some time to
   complete. Be patient! Remember, uploads performed via the user interface
   are limited by the browser's timeout limits - this is one of the reasons
   we recommend importing only smaller CSV files via the user interface.

5. After your import is complete, AtoM will list the amount of time the
   import took, and provide a link to the :term:`archival description` browse
   page. Unlike the XML import, a link directly to your import is not
   provided, because a CSV upload may contain multiple descriptions; instead,
   a link to the browse page is given, so users can locate their
   descriptions.

.. image:: images/csv-import-completed.*
   :align: center
   :width: 85%
   :alt: Starting a CSV import in AtoM

.. TIP::

   Use the :ref:`sort button <recurring-sort-button>` located in the
   top-right hand side of the browse page to change the results display to be
   ordered by "Most recent" if it is not already - that way, the most
   recently added or edited descriptions will appear at the top of the
   results. If you have come directly here after importing your descriptions,
   they should appear at the top of the results.

   .. image:: images/csv-import-browse-page.*
      :align: center
      :width: 85%
      :alt: The browse page following a CSV import

6. If any warnings or errors are encountered, AtoM will also display them on
   the import page. Some warnings will cause an import to fail (and some will
   not - they will alert the user, but the import will still complete), while
   all error messages mean that the import has failed, and a link to the
   :term:`archival description` browse page will not be provided. - instead,
   the CSV upload page will reappear below the error message. Errors can
   occur for many reasons - please review the checklist
   :ref:`above <csv-import-descriptions-gui>` for suggestions on resolving
   the most common reasons that CSV imports fail.

.. image:: images/csv-import-error.*
  :align: center
  :width: 85%
  :alt: An error message from a failed CSV import

.. _csv-import-descriptions-cli:

Using the command-line interface (CLI)
--------------------------------------

For larger CSV imports (e.g. those with 1,000 or more rows), we recommend
using the Command-line interface to import your descriptions.

Example use (with the RAD CSV template):

.. code-block:: bash

   php symfony csv:import lib/task/import/example/rad/example_information_objects_rad.csv

Use the ``source-name`` option (described :ref:`above <csv-legacy-id-mapping>`
to specify a source when importing information objects from multiple sources
(with possibly conflicting legacy IDs).

If you'd like to import all rows in a CSV file to a given legacy ID, you can
use the ``--legacy-parent-id`` command-line option to specify the desired ID,
rather than including this ID in each row's *parentId* column. Note that this
will affect ALL rows in a CSV - so use this **only** if you are importing all
descriptions to a single parent!

:ref:`Back to top <csv-import>`

.. _csv-import-events:

Import events via CSV
=====================

content

.. _csv-import-events-gui:

Using the user interface
------------------------

content

.. _csv-import-events-cli:

Using the command-line interface (CLI)
--------------------------------------

content

:ref:`Back to top <csv-import>`

.. _csv-import-repositories:

Import archival institutions via CSV
====================================

content

.. _csv-import-repositories-gui:

Using the user interface
------------------------

content

.. _csv-import-repositories-cli:

Using the command-line interface (CLI)
--------------------------------------

content

:ref:`Back to top <csv-import>`

.. _csv-import-authority-records:

Import authority records via CSV
================================

content

content

.. _csv-import-authority-records-gui:

Using the user interface
------------------------

content

.. _csv-import-authority-records-cli:

Using the command-line interface (CLI)
--------------------------------------

content

.. _csv-import-aliases-cli:

Importing alternate names (Alias data)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

content

.. _csv-import-relations-cli:

Importing related corporate bodies, persons, or families
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

content

:ref:`Back to top <csv-import>`

.. _csv-import-accessions:

Import accessions via CSV
=========================

content

.. _csv-import-accessions-gui:

Using the user interface
------------------------

content

.. _csv-import-accessions-cli:

Using the command-line interface (CLI)
--------------------------------------

content

:ref:`Back to top <csv-import>`

.. _csv-import-progress:

Display the progress of an upload via the command-line interface (CLI)
======================================================================

content

.. _digital-object-load-task:

Load digital objects via the command line
=========================================

content

:ref:`Back to top <csv-import>`

.. _csv-search-indexing:

Index your content after an upload
==================================

content

:ref:`Back to top <csv-import>`
