.. _installation-asynchronous-jobs:

=======================================
Asynchronous jobs and worker management
=======================================

AtoM relies on `Gearman <http://gearman.org>`__ in order to execute certain
long-running tasks asynchronously to guarantee that web requests are handled
promptly and work loads can be distributed across multiple machines.

You'll need a good understanding of all the components involved to find out what
the best configuration and arrangement of services will be for you. You could
configure it so every service runs in the same machine, or scale up to many
machines across the network. You can always start small in a single-node
environment and add more hardware later.


Gearman Job Server
==================

The first thing that you need to do is to install the job server (Gearman Job
Server):

.. code-block:: bash

   sudo apt-get install gearman-job-server

It's up to you to install the job server in the same machine where you are
running AtoM or in another machine in the same network. If you are doing the
latter, make sure that you update :file:`/etc/defaults/gearman` accordingly:

.. code-block:: bash

   PARAMS="--listen=* --port=4730"

.. note::

   By default, Gearman's job queues are stored in
   `memcache <http://memcached.org/>`__. In Ubuntu, the memcache package is
   installed locally as a dependency when you install gearman-job-server.
   However you are free to deploy the queue storage in a different machine or
   replace it with a durable solution like MySQL or SQLite3.
   For more configuration options available, visit:
   http://gearman.org/manual/job_server/.


Gearman Job Worker
==================

In AtoM, a worker is just a CLI task that you can run in a terminal or supervise
with specific tools like upstart, supervisord or circus. The worker will wait
for jobs that are assigned by the job server.

The simplest way to run a worker is from your terminal:

.. code-block:: bash

   php symfony tools:gearman-worker

A better way to run a worker is to use a process supervisor like upstart
(included in Ubuntu). An upstart service (:file:`/etc/init/atom-worker.conf`)
could look like:

.. code-block:: upstart

   description "AtoM worker (gearmand) upstart service"
   
   start on (started mysql)
   stop on runlevel [016]
   
   respawn
   respawn limit 5 10
   
   env LOCATION=/usr/share/nginx/atom
   env LOGFILE=/usr/share/nginx/atom/log/atom-worker.log
   
   setuid www-data
   setgid www-data
   
   script
   
     php \
       -d memory_limit=-1 \
       -d error_reporting="E_ALL" \
         ${LOCATION}/symfony tools:gearman-worker >> ${LOGFILE} 2>&1
   
   end script

You can control the service execution status with the following commands:

.. code-block:: bash

   sudo start atom-worker   # Starts the worker
   sudo stop atom-worker    # Stops the worker
   sudo restart atom-worker # Restarts the workers
   sudo status atom-worker  # Obtain current running status

:command:`initctl` is the primary command used to interact with Upstart and its
services. Check out its man page (:command:`man initctl`) or the following
link for more instructions: http://upstart.ubuntu.com/cookbook/#initctl.

An AtoM worker needs to know where the job server is running, which is defined
in an application setting called :guilabel:`gearman_job_server` under
:file:`config/app.yml`. Whenever you change that setting, make sure that the
Symfony cache is refreshed and the worker is restarted.

Note that the job server will perfectly handle multiple workers running
simultaneously and the work load will be distributed across all available
workers. If there are no workers available because they are busy completing
other tasks, the job server will store the job in the queues and deliver them
once a worker becomes available.
