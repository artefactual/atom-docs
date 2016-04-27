.. _dev-env-compose:

==============
Docker Compose
==============

Linux containers and Docker are radically changing the way that applications
are developed, built, distributed and deployed. The AtoM team is experimenting
with new workflows that make use of containers. This document introduces our
new development workflow based on Docker and `Docker Compose <https://docs.docker.com/compose/>`_.
The latter is a tool that help us to run multi-container applications like AtoM
and it is suitable for both development and production environments.

If this is the first time that you have heard about containers you may find
`The New Stack eBook Series <http://thenewstack.io/ebookseries/>`_ a useful
resource to get up to speed quickly.


Install Docker and Docker Compose
=================================

If you're a Mac on Windows user, the `Docker Toolbox <https://www.docker.com/products/docker-toolbox>`_
will install everything you need. Docker Toolbox incorporates a tool called
Docker Machine that lets you provision Docker machines anywhere you need,
including local VirtualBox machines running boot2docker, a lightweight Linux
distribution with Docker Engine, so you can run your Linux containers locally
on non-Linux platforms with a native feeling.

Docker is also working on `Docker for Mac and Docker for Windows <https://blog.docker.com/2016/03/docker-for-mac-windows-beta/>`_,
an alternative to Docker Toolbox, but it is currently in private beta.

If you are on Linux, install `Docker <https://docs.docker.com/engine/installation/>`_
and `Docker Compose <https://docs.docker.com/compose/install/>`_ following the
instructions in the links.


Spin it up
==========

Let's make sure that the Docker client can reach the engine. The following
command will list the currently running containers:

.. code-block:: bash

   docker ps

You should see an empty list. Now using git, check out the sources of AtoM and
change your current directory.

.. code-block:: bash

   git clone -b qa/2.3.x https://github.com/artefactual/atom.git atom
   cd atom

Now set the environment variable ``COMPOSE_FILE`` so we don't have to do this
every time we invoke docker-compose (or use the ``-f`` flag):

.. code-block:: bash

   # For bash users
   export COMPOSE_FILE="$PWD/docker/docker-compose.dev.yml"

   # For fish users
   set -lx COMPOSE_FILE (pwd)/docker/docker-compose.dev.yml

It's time to use Docker Compose in order to provision our containers:

.. code-block:: bash

   docker-compose up -d
   docker-compose exec atom php symfony tools:purge --demo
   docker-compose exec atom make -C plugins/arDominionPlugin

That's it! You have started the containers and put them in the background,
populated the database and compile the CSS stylesheet of the Dominion plugin.
You can start developing right away. Changes made in the source code will take
effect immediately.

Due to a bug that has not been solved yet, the AtoM worker needs to be
restarted after the database is populated for the first time:

.. code-block:: bash

   docker-compose restart atom_worker

Docker Compose lets you perform many different actions. Please refer to the
`documentation <https://docs.docker.com/compose/overview/>`_ for more help.
For example, you can monitor the output of some of your containers as follows:

.. code-block:: bash

   docker-compose logs -f atom atom_worker nginx

You can also scale the cluster as needed. In the following example we are going
to add extra AtoM workers and Elasticsearch nodes.

.. code-block:: bash

   docker-compose scale atom_worker=2 elasticsearch=3

Let's verify that the Elasticsearch cluster has indeed three nodes in place:

.. code-block:: bash

   docker-compose exec atom curl elasticsearch:9200/_cat/nodes

   cdec404af617 172.18.0.7 6 65 0.26 d m Huntara
   366a7817864f 172.18.0.3 5 65 0.26 d * Vance Astro
   0e52024208fe 172.18.0.6 4 65 0.26 d m Bloodstorm

You can also verify that two workers have subscribed to Gearman:

.. code-block:: bash

   docker-compose exec atom bash -c "echo STATUS | nc gearmand 4730"

   fdd4764376d2f763-arGenerateFindingAidJob            0   0   2
   fdd4764376d2f763-arUpdatePublicationStatusJob       0   0   2
   fdd4764376d2f763-arInformationObjectCsvExportJob    0   0   2
   fdd4764376d2f763-arInheritRightsJob                 0   0   2

You could temporarily stop all the services with ``docker-compose stop`` (which
will need ``docker-compose up -d`` later to start the services again) or both
stop and remove related containers, networks, images and volumes by running:

.. code-block:: bash

   docker-compose down --volumes


Connect to AtoM
===============

AtoM should be now accessible from your browser. If you want to find the
address run the following:

.. code-block:: bash

   $ docker-compose ps

   Name                       Command               State             Ports
   -------------------------------------------------------------------------------------------
   docker_atom_1            /atom/src/docker/entrypoin ...   Up
   docker_atom_worker_1     /atom/src/docker/entrypoin ...   Up
   docker_elasticsearch_1   /docker-entrypoint.sh bash ...   Up
   docker_gearmand_1        gearmand --queue-type=libm ...   Up
   docker_memcached_1       /entrypoint.sh -p 11211 -m ...   Up
   docker_nginx_1           nginx -g daemon off;             Up      192.168.64.2:8000->80/tcp
   docker_percona_1         /docker-entrypoint.sh mysqld     Up

As you can see in the right column, Nginx has published a TCP port. It may be
different in your environment. In this example, we will put the following
address in our browser: http://192.168.4.2:8000.

The default login details are:

* Username: ``demo@example.com``
* Password: ``demo``

Please be aware that this process is new and it may have some unknown issues.
Let us know if you have some feedback!
