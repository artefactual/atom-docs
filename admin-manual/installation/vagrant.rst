.. _installation-vagrant:

=============
Using Vagrant
=============

This guide will setup a new Oracle `VirtualBox
<https://www.virtualbox.org/>`__ virtual machine with AtoM installed on your
computer. It works works on most operating systems, including MacOS X, Linux,
Windows, FreeBSD and others. If you can install these and have at least
2048Mb RAM to spare you should be good.

**Minimum system requirements**: 2GB RAM; 8GB disk space

.. warning::

   This virtual machine is **not** intended to be used in production. It targets
   developers or experienced users willing to try out AtoM using Vagrant. If you
   want to start using AtoM in production, please refer to the other methods of
   installations explained under this manual.


.. _vagrant-install-dependencies:

Install Vagrant and VirtualBox
==============================

#. Install VirtualBox from https://www.virtualbox.org/ (or use your package
   manager). VirtualBox 4.3 or newer is required.
#. Install Vagrant from http://www.vagrantup.com/ (or use your package manager).
   Vagrant 1.6 or newer is required.


.. _vagrant-setup:

Spin it up
==========

#. using your computer's command-line interface, create a new directory and
   open it. The location doesn't matter, but you'll need to return to it later
   - all further command line operations should be run from inside the directory.

   .. code-block:: bash

      mkdir atom-vagrant && cd atom-vagrant

#. Initialize the current directory to be a Vagrant environment.

   .. code-block:: bash

      vagrant init artefactual/atom

#. Run Vagrant (again, from the same directory where you saved the
   Vagrantfile).

   .. code-block:: bash

      vagrant up

   Vagrant will download our custom box and boot it in VirtualBox. The
   download can take anywhere from a few minutes to an hour or more, depending
   on the speed of your connection, as the box is considerably big (approx
   1.4 GB in size).

.. _vagrant-connect-atom:

Connect to AtoM
===============

Now you should be able to connect to AtoM from your local browser.

Open http://10.10.10.10.

The default login details are:

* Username: ``demo@example.com``
* Password: ``demo``


.. _vagrant-connect-terminal:

Connect to the terminal
=======================

Run ``vagrant ssh`` from the same directory as where you ran ``vagrant up``.
Vagrant will connect you to the correct virtual machine.

.. code-block:: bash

   vagrant ssh

The login details are:

* Username: ``vagrant``
* Password: ``vagrant``

If you are using Windows, the preferred SSH client is
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_.

.. TIP::

   If you are a developer who requires access to the MySQL database in AtoM's
   Vagrant box, here are the credentials:

   * **Username**: ``root``
   * **Password**: ``root``


.. _vagrant-updates:

Keeping the environment up to date
==================================

You can check if the box you're using is outdated with ``vagrant box outdated``.
This can check if the box in your current Vagrant environment is outdated as
well as any other box installed on the system.

Finally, you can update boxes with ``vagrant box update``. This will download
and install the new box. This will not magically update running Vagrant
environments. If a Vagrant environment is already running, you'll have to
destroy and recreate it to acquire the new updates in the box. The update
command just downloads these updates locally.

.. WARNING::

   Running the ``vagrant box update`` command will destroy your old vagrant
   box, and replace it with an updated one. This means that **any data you
   have will be lost**. If you want to keep your data, it's better to create a
   new box for the update in a new directory.

You can find more help at the `Box Versioning <https://docs.vagrantup.com/v2/boxes/versioning.html>`_
page.
