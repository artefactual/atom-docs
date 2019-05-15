.. _dev-env-vagrant:

=======
Vagrant
=======

This guide will setup a new Oracle `VirtualBox
<https://www.virtualbox.org/>`__ virtual machine with AtoM installed on your
computer. It works on most operating systems, including MacOS X, Linux,
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
   manager). VirtualBox 5.1.18 or newer is required.
#. Install Vagrant from http://www.vagrantup.com/ (or use your package manager).
   Vagrant 1.9.3 or newer is required. Be aware that Ubuntu 14.04 installs
   Vagrant 1.4.3, which does not meet the requirements.


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

The login details are:

* Username: ``vagrant``
* Password: ``vagrant``

If you are using Windows, the preferred SSH client is
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`__.

.. TIP::

   If you are a developer who requires access to the MySQL database in AtoM's
   Vagrant box, here are the credentials:

   * **Username**: ``root``
   * **Password**: ``root``


.. _vagrant-customize:

Customize the environment
=========================

There are a number of configuration changes that you may want to make if you are
planning to use git and submit code to a repository.

1. Locales customize programs to your language and country. We use `en_ES.UTF8`
   but you can change it. The process is explained in the `Locale page <https://help.ubuntu.com/community/Locale>`__
   of the official Ubuntu wiki.

2. Ideally, you will also update the system to use your current timezone. See
   `how to change the timezone from the command line in Ubuntu <https://help.ubuntu.com/community/UbuntuTime#Using_the_Command_Line_.28terminal.29>`__.

3. Set up your `username <https://help.github.com/articles/setting-your-username-in-git/>`__
   and `email <https://help.github.com/articles/setting-your-email-in-git/>`__ in
   Git.

4. Create a new SSH keys to authenticate against a git server like Github.
   Optionally you can forward your local SSH agent using `ForwardAgent`, e.g.
   run ``vagrant ssh -- -A`` or ``vagrant ssh -- -o ForwardAgent=yes`` instead
   of just ``vagrant ssh``. Alternatively, you can set ``config.ssh.forward_agent``
   to ``true`` in the local Vagrantfile or the global ``~/.vagrant.d/Vagrantfile``.


.. _vagrant-network-share:

Access the code from your host
==============================

We have configured a Samba server in the Vagrant box in order to allow you to
access the AtoM directory inside the box.

From your host, you could mount the samba share either using `mount.cifs` or
by adding the following entry in :file:`/etc/fstab`:

.. code-block:: bash

   //10.10.10.10/vagrant /home/user/Desktop/atom cifs user=vagrant,passwd=vagrant,iocharset=utf8,sec=ntlm,uid=user,gid=user,noauto,user 0 0

Note that the above example is mounting the network share into :file:`/home/user/Desktop/atom`,
feel free to modify this according to your environment.

.. NOTE::

   There are alternative ways to share files between your host and the virtual
   box, e.g. Vagrant offers a smart detection system that internally uses NFS,
   vboxsf or rsync to achieve this. However, we've found that the most
   convenient method for our specific case is to share the files via Samba. We
   may reconsider this in the future. For further reading about this you may
   want to visit `Comparing Filesystem Performance in Virtual Machines <http://mitchellh.com/comparing-filesystem-performance-in-virtual-machines>`__
   by Mitchell Hashimoto, the creator of Vagrant.

Note that the directory where you have installed the vagrantfile on your host
system (e.g. ``Desktop/atom-vagrant``) will be accessible from inside the
guest as ``/vagrant``. So if you want to import a CSV called
``my-descriptions.csv`` from your host's ``atom-vagrant`` directory, the
command might look like:

.. code-block:: bash

   php symfony csv:import /vagrant/my-descriptions.csv


.. _vagrant-updates:

Keeping the environment up to date
==================================

You can check if the box you're using is outdated with ``vagrant box outdated``.
This can check if the box in your current Vagrant environment is outdated as
well as any other box installed on the system.

To pull in the latest code for your box, connect via SSH (see
:ref:`vagrant-connect-terminal`), navigate to the atom folder with ``cd atom``, and
run ``git pull --rebase``. After pulling in new code, you will want to do the following:

* Clear cache: ``php symfony cc``

* Restart services: ``sudo systemctl restart php7.0-fpm`` and ``sudo
  systemctl restart atom-worker``

.. NOTE::

    In most cases, you will definitely want to complete the next two steps:
    *Run the SQL upgrade task* and *Repopulate the search index*. There is no
    harm in running these even if they are not necessary.

    If you know for certain that the changes pulled in did not contain updates
    to the database, feel free to omit executing ``tools:upgrade-sql`` and
    ``search:populate`` below.


* Run the SQL upgrade task: ``php symfony tools:upgrade-sql``

* Repopulate the search index: ``php symfony search:populate``

* Compile stylesheets: ``make -C plugins/arDominionPlugin``

If you are pulling in major changes to the AtoM codebase, we recommend purging
the database back to the clean demo version (``sudo php symfony tools:purge --demo``)
run the SQL upgrade task, and clear the cache and restart services. Then re-import
some test data and repopulate the search index.

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

You can find more help at the `Box Versioning <https://docs.vagrantup.com/v2/boxes/versioning.html>`__
page.
