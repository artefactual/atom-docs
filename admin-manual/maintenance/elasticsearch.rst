.. _maintenance-elasticsearch:

=============
Elasticsearch
=============

`Elasticsearch <http://www.elasticsearch.org/>`_ (0.90.11), a distributed search
server based on Apache Lucene, which acts as the application’s search and
analytic engine. Some solutions to common problems with Elasticsearch and
AtoM are below.

Disable auto-discovery
======================

To prevent Elasticsearch from auto-discovering other nodes on the network, add
the following to /etc/elasticsearch/config/elasticsearch.yml

.. code:: bash

   node.local: true # disable network


Check cluster health
====================

See:
http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/cluster-health.html

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
of an index. This happens when you have indexes with 'number_of_replicas' >
(the number of ES nodes you are running - 1). For instance if you only have 1
ES node, number_of_replicas should be set to 0. To reduce (or increase) the
number of replicas on an existing index, you can use:

.. code:: bash

   curl -XPUT 'localhost:9200/my_index/_settings' -d '
   {
       "index" : {
           "number_of_replicas" : 0
      }
   }

:ref:`Back to the top <maintenance-elasticsearch>`
