.. _maintenance-elasticsearch:

=============
Elasticsearch
=============

`Elasticsearch <http://www.elasticsearch.org/>`_ is a distributed search server
based on Apache Lucene, which acts as the application’s search and analytic
engine. Some solutions to common problems with Elasticsearch and AtoM are below.

.. SEEALSO::

   * :ref:`maintenance-populate-search-index`
   * :ref:`maintenance-troubleshooting`

Disable auto-discovery
======================

To prevent Elasticsearch from auto-discovering other nodes on the network, add
the following to /etc/elasticsearch/config/elasticsearch.yml

.. code:: bash

   transport.type: local # disable network

Check the status of your Elasticsearch index
============================================

AtoM includes a command-line task that will allow a system administrator to
review the status of AtoM's Elasticsearch index without having to access any
configuration files. The task output will include:

* Search host
* Port
* Index name
* Document index status for all primary :term:`entity` types in AtoM (including 
  Accession, Actor, AIP, Function, Information object, Repository, and Term)

The task should be run from AtoM's root installation directory. It will not
make any changes, but can provide useful information when troubleshooting
issues or seeking support. To run the task:

.. code-block:: bash

   php symfony search:status

Sample response: 

.. image:: images/cli-search-status-response.*
   :align: center
   :width: 90%
   :alt: An image of a typical response to the search:status task

Check cluster health
====================

See:
https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html

.. code:: bash

   curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'

Sample output:

.. code:: bash

   {
     "cluster_name" : "testcluster",
     "status" : "green",
     "timed_out" : false,
     "number_of_nodes" : 2,
     "number_of_data_nodes" : 2,
     "active_primary_shards" : 5,
     "active_shards" : 10,
     "relocating_shards" : 0,
     "initializing_shards" : 0,
     "unassigned_shards" : 0
   }

Find problem shards
===================

If the Cluster health returns as "red" or "yellow" you can find problem shards
with:

.. code:: bash

   curl -XGET 'http://localhost:9200/_cluster/health/?level=shards&pretty=true'


You can redirect the STDOUT to a text file and search for "red" or "yellow" to
find the problem indexes/shards.

Cluster health is yellow
========================

If Cluster health returns as yellow, it "means that the primary shard is
allocated but replicas are not"
`[1] <http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/cluster-health.html#cluster-health>`_.
This often means that you have do not
have enough ES nodes in your cluster to support the desired number of replicas
of an index. This happens when you have indexes with ``number_of_replicas`` >
(the number of ES nodes you are running - 1). For instance if you only have 1
ES node, ``number_of_replicas`` should be set to 0. 

In the default AtoM installation instructions, we only configure one node with
no replicas, so the yellow cluster health is not surprising - and if the
search index is lost, it can easily be repopulated from the database using the
:ref:`maintenance-populate-search-index` task.

However, to reduce (or increase) the number of replicas on an existing index, 
you can use:

.. code:: bash

   curl -XPUT 'localhost:9200/my_index/_settings' -d '
   {
       "index" : {
           "number_of_replicas" : 0
      }
   }'

:ref:`Back to the top <maintenance-elasticsearch>`
