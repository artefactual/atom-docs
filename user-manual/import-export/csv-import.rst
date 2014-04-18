.. _csv-import:

===========
CSV import
===========

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

For the **character encoding**:  if you have used a Windows or Mac spreadsheet
application (such as Excel, for example), it's possible that the default
character encoding will **not** be UTF-8. For example, Excel uses  machine-
specific ANSI encoding as its defaults during install, so an EN-US
installation might use Windows-1252 encoding by default, rather than something
more universal such as UTF-8 (the default encoding in AtoM). This can cause
problems on import into AtoM with special characters and diacritics. Make sure
that if you are using Excel or another spreadsheet application, you are
setting the character encoding to UTF-8. Many open source spreadsheet
programs, such as LibreOffice Calc, use UTF-8 by default.

For the **line endings**: "In computing, a newline, also known as a line
ending, end of line (EOL), or line break, is a special character or sequence
of characters signifying the end of a line of text. The actual codes
representing a newline vary across operating systems, which can be a problem
when exchanging text files between systems with different newline
representations." (`Wikipedia <http://en.wikipedia.org/wiki/Newline>`__)

Here are some of the differences:

* Unix / Linux / FreeBSD / OS X use LF (line feed, ``\n``, 0x0A)
* Macs prior to OS X use CR (carriage return, ``\r``, 0x0D)
* Windows / DOS use CR+LF (carriage return followed by line feed, ``\r\n``,
  0x0D0A)

AtoM's CSV import will expect Unix-style line breaks ( ``\n`` ). If you have
been using a spreadsheet application on a Mac or Windows, you may encounter
import issues. There are many command-line utilities and free software
options out there to convert newline characters.

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
AtoM-compatible CSV column names you can perform a test import.

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

Once you've worked out an import, you may want to clone your AtoM site and
test your import on the clone before importing to your production AtoM
installation. This prevents you from having to delete any improperly imported
data. During import testing if you want to delete all imported data you can
use the command-line purge tool.

:ref:`Back to top <csv-import>`


.. _csv-legacy-id-mapping:

Legacy ID mapping: dealing with hierarchical data in a CSV
==========================================================

content

.. _csv-import-descriptions:

Import archival descriptions via CSV
====================================

content

.. _csv-import-descriptions-gui:

Using the user interface
------------------------

content

.. _csv-import-descriptions-cli:

Using the command-line interface (CLI)
--------------------------------------

content

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
