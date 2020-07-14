.. _installation-asynchronous-jobs:

=======================================
Asynchronous jobs and worker management
=======================================

AtoM relies on `Gearman <http://gearman.org>`__ in order to execute certain
long-running tasks asynchronously to guarantee that web requests are handled
promptly and work loads can be distributed across multiple machines.

For example, the ingest of Archivematica DIPs is processed asynchronously. See
:ref:`Upload DIP <archivematica:upload-atom>` for more details.

You'll need a good understanding of all the components involved to find out what
the best configuration and arrangement of services will be for you. You could
configure it so every service runs in the same machine, or scale up to many
machines across the network. You can always start small in a single-node
environment and add more hardware later.

.. _installation-gearman-job-server:

Gearman Job Server
==================

The first thing that you need to do is to install the job server (Gearman Job
Server):

.. code-block:: bash

   sudo apt-get install gearman-job-server

It's up to you to install the job server in the same machine where you are
running AtoM or in another machine in the same network. If you are doing the
latter, make sure that you update :file:`/etc/default/gearman-job-server`
accordingly:

.. code-block:: bash

   PARAMS="--listen=* --port=4730"

.. note::

   By default, Gearman's job queues are stored in memory. However you are free
   to deploy the queue storage in a different machine or replace it with a
   durable solution like MySQL or SQLite3. For more configuration options
   available, visit: http://gearman.org/manual/job_server/.

.. _installation-gearman-job-worker:

Gearman Job Worker
==================

In AtoM, a worker is just a CLI task that you can run in a terminal or supervise
with specific tools like upstart, supervisord or circus. The worker will wait
for jobs that are assigned by the job server.

The simplest way to run a worker is from your terminal:

.. code-block:: bash

   php symfony jobs:worker

A better way to run a worker is to use a process supervisor like systemd. This
is documented below.

systemd (Ubuntu 18.04)
-----------------------------

Create the following service (:file:`/usr/lib/systemd/system/atom-worker.service`):

.. code-block:: none

   [Unit]
   Description=AtoM worker
   After=network.target
   # High interval and low restart limit to increase the possibility
   # of hitting the rate limits in long running recurrent jobs.
   StartLimitIntervalSec=24h
   StartLimitBurst=3

   [Install]
   WantedBy=multi-user.target

   [Service]
   Type=simple
   User=www-data
   Group=www-data
   WorkingDirectory=/usr/share/nginx/atom
   ExecStart=/usr/bin/php7.2 -d memory_limit=-1 -d error_reporting="E_ALL" symfony jobs:worker
   KillSignal=SIGTERM
   Restart=on-failure
   RestartSec=30

.. IMPORTANT::

      If you are not using PHP 7.2, be sure to update the `ExecStart` filepath
      in the `[Service]` section of  the sample configuration block above!
      Currently it assumes PHP 7.2 is being used, and will not  work for
      installations using a different PHP version without modification.

Now reload systemd, enable and start the AtoM worker:

.. code-block:: bash

   sudo systemctl daemon-reload
   sudo systemctl enable atom-worker
   sudo systemctl start atom-worker

You can control the service execution status with the following commands:

.. code-block:: bash

   sudo systemctl enable atom-worker   # Enables the worker (on boot)
   sudo systemctl start atom-worker    # Starts the worker
   sudo systemctl stop atom-worker     # Stops the worker
   sudo systemctl restart atom-worker  # Restarts the workers
   sudo systemctl status atom-worker   # Obtains current status

You can have access to the journal of our new ``atom-worker`` unit as follows:

.. code-block:: bash

   sudo journalctl -f -u atom-worker

This is going to be useful in case you need to troubleshoot the worker.

.. TIP::

   If the worker hits the start rate limit (3 starts in 24h) to be able to start
   it again after fixing the issue, the failed status has to be cleared:

   .. code-block:: bash

      sudo systemctl reset-failed atom-worker
      sudo systemctl start atom-worker


Other considerations
--------------------

An AtoM worker needs to know where the job server is running, which is defined
in an application setting under :file:`config/gearman.yml` and defaults to
``127.0.0.1:4730``.

Note that the job server will perfectly handle multiple workers running
simultaneously and the work load will be distributed across all available
workers. If there are no workers available because they are busy completing
other tasks, the job server will store the job in the queues and deliver them
once a worker becomes available.

If you're planing to connect multiple AtoM instances to the same Gearman server,
make sure to set a different string value for the ``workers_key`` setting
located in :file:`config/app.yml`. This will avoid collisions between those
instances and the workers will only take the jobs that belong to their related
AtoM install.

Whenever you change any of these settings, make sure that the Symfony cache is
cleared and the workers are restarted.
