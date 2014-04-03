.. _installation-windows:

=======
Windows
=======

Every single piece of software
:ref:`required by AtoM <installation-requirements>` is compatible with Windows.
However, you should know that the process may not be straightforward at all if
you are not familiar with server environments under the Windows platform.


Virtualizing Linux
==================

We strongly believe that Linux is the best choice for installing AtoM, but if
for whatever reason you are unable to switch to a different platform, you may
want to consider running a
`virtualized <https://en.wikipedia.org/wiki/Virtualization>`__ Linux instance
in Windows. Some of the most popular virtualization tools in Windows are:

* VirtualBox (open source): https://www.virtualbox.org/
* VMware: http://www.vmware.com/
* Hyper-V (the official Windows hypervisor):
  http://www.microsoft.com/hyper-v-server

You should be able to use our virtual appliance in the virtualization tool of
your choice.

.. seealso::

   * :ref:`installation-virtual-appliance`
   * :ref:`installation-vagrant`

If you intend to continue using Windows, please proceed by following the
instructions provided below. Be warned that installing AtoM in a Windows
environment can be tricky, however, so be prepared for some hassle!

Web servers
===========

The good news is that the support of PHP in `IIS <http://www.iis.net/>`__ 7 or
above is excellent. Check out the official website: http://php.iis.net.

You can also use `Apache <https://httpd.apache.org/>`__ or
`Nginx <http://nginx.com/>`__;  we have tried both and had success with
Windows configurations.

There is also the option of using `WampServer <http://www.wampserver.com/>`_ or
`XAMPP <http://www.apachefriends.org/>`_, two software stacks that provide you
with all the packages that you need in order to run AtoM out of the box:
MySQL, Apache and PHP. It's definitely a very good option for inexperienced
users.


Elasticsearch
=============

You can run Elasticsearch in Windows as long as you can install Java.
`Download <http://www.elasticsearch.org/download/>`_ the latest
version available and run :command:`bin/elasticsearch.bat` in the Windows
Terminal.
