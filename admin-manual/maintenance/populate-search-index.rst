.. _maintenance-populate-search-index:

=====================
Populate search index
=====================

AtoM maintains an `Elasticsearch <http://www.elasticsearch.org/>`__ search
index to provide fast, full-text search results with
:term:`faceting <Facet filter>`.

Occasionaly it is necessary to repopulate the Elasticsearch index from the
primary database, especially after operations that affect many records, e.g.

* Importing data (CSV or EAD import)
* Moving a large series to a new :term:`parent record`
* Moving a :term:`Fonds` or :term:`Collection` to a different
  :term:`archival institution`
* Doing any bulk search and replace operation

Populating the search index requires running a Symfony command line task,
which is located in the root directory of the application. By default, running
this task will delete the current index, then repopulate and optimize the
index - though an option exists that will allow you to update the index in
place, without first deleting the existing index. Depending on the number of
records in your installation, this task can take a while to run - for
production sites, we recommend running this task after regular business hours.

To run the task without any of the available options, enter the following in
the command-line interface, in the root AtoM directory:

.. code-block:: bash

   php symfony search:populate

You can also run ``php symfony help search:populate`` to see the available
options for this command-line task:

.. image:: images/cli-search-pop.*
   :align: center
   :width: 90%
   :alt: An image of the description and options for the search:populate task

The ``--application`` and ``--env`` options **should not be used** - AtoM
requires the uses of the pre-set defaults for Symfony to be able to execute
the task.

The ``--slug`` option can be used to specify a specifc resource to be 
re-indexed. If the target resource is hierarchical (i.e. an 
:term:`archival description` with lower-level :term:`children <child record>`), 
the descendant records will also be indexed. If you **don't** want lower-level
records to be indexed when using this option, you can also use the 
``--ignore-descendants`` option - in this case, any lower-level records below
the target resource will not be re-indexed as part of the process. 

.. NOTE::

   * When used the ``--slug`` option will ignore any parameters set by the 
     ``--exclude types`` option
   * The ``--ignore-descendants`` option will **only** work when used in 
     conjunction with the ``--slug`` option

The ``--exclude-types`` option can be used if you do not want to re-index
certain record types. When this option is used, the existing index is not
completely flushed - the current part of the index for the excluded types will
be maintained, while other entities will be flushed and re-indexed. This can
be useful if, for example, you have many archival descriptions (which would
take a long time to re-index), but only need to re-index your authority
records and/or other entities - you could then use the command with
``--exclude-types="informationobject`` and the existing index for descriptions
would be maintained.

Below is a list of the types that can be excluded using this option:

* :term:`accession <accession record>`
* actor (i.e. :term:`authority record`)
* aip (indexed during a DIP upload from `Archivematica <https://www.archivematica.org/>`__)
* :term:`function`
* informationobject (i.e. :term:`archival description`)
* repository (i.e. :term:`archival institution`)
* :term:`term` (such as :term:`subjects <subject>` and :term:`places <place>`,
  etc)

You can exclude multiple types at once, by separating them with commas -
**don't leave spaces** between the commas. For example, to re-index your site
but skip indexing terms (such as subject and place
:term:`access points <access point>`), authority records, and archival
descriptions, you could enter the command like so:

.. code-block:: bash

   php symfony search:populate --exclude-types="term,actor,informationobject"

The command will indicate at the beginning which types are being re-indexed,
and then will output the results of indexing the remaining entities:

.. image:: images/cli-exclude-types.*
   :align: center
   :width: 90%
   :alt: An image of the console output when excluding actors, terms, and
         information objects during a search index repopulation

You can also use the ``--show-types`` option to display the available index
types prior to indexing. When run, the task will display a list of available
types in your AtoM instance:

.. image:: images/cli-search-show-types.*
   :align: center
   :width: 90%
   :alt: An image of the console output when showing available record types

Pressing enter will continue and run the ``search:populate`` task (with no
types), or alternatively, you can exit the task by entering ``CTRL+C`` and
then re-enter your parameters, using ``--exclude-types`` as needed.

Finally, the ``--update`` option can be used to update the index in place,
**without** first deleting the existing index. The process may take slightly
longer, but it can be useful for indexing on production sites, as there is no
downtime for end users - without this option, no records will display in the
search/browse results until indexing has completed.

Example use: 

.. code-block:: bash

   php symfony search:populate --update

.. SEEALSO::

   * :ref:`cli-search-status`
   * :ref:`maintenance-clear-cache`
   * :ref:`maintenance-cli-tools`
   * :ref:`maintenance-troubleshooting`
   * :ref:`maintenance-webserver`
   * :ref:`maintenance-elasticsearch`

:ref:`Back to top <maintenance-populate-search-index>`