.. _installation-ansible:

====================================
Advanced configuration using Ansible
====================================

It is common to see high-demand scenarios where AtoM needs to be deployed in
clusters composed by many machines. When this is necessary, it is convenient to
employ configuration management tools like Chef, Puppet or Ansible in order to
automate most of the processes involved.

Ansible is our preferred choice because of its simplicity. Artefactual maintains
a number of Ansible roles that will enable you to compose complex distributed
environments. These roles could as well be used against a single server, in fact
our Vagrant box is built using these Ansible roles.

We've built a couple of examples on how to deploy AtoM:

* `AtoM + Ubuntu 14.04 (trusty) <https://github.com/artefactual/deploy-pub/tree/master/playbooks/atom-trusty>`_
* `AtoM + Ubuntu 16.04 (xenial) <https://github.com/artefactual/deploy-pub/tree/master/playbooks/atom-xenial>`_

These examples use Vagrant to provision virtual machines. This is useful during
the experimentation phase so you don't have to worry about the costs of hosting
virtual machines in a provider. You could also create a new Vagrant setup where
many virtual machines are involved. Check out `Vagrant's docs <https://www.vagrantup.com/docs/multi-machine/>`_.

However, the same playbooks will scale well to more complex scenarios where
many machines are involved.

.. WARNING:

   Our Ansible roles have been tested internally but we have not received much
   feedback from our community. Our goal is to deliver a production-ready
   solution but it may be still too early for that. Please give it a try and
   let us know the results. If you have suggestions, send us a pull request
   or point us to the area of the code that needs to be changed. Thank you!

Ryerson University Library & Archives leads the development of a similar
solution targetting Chef. `Their repositories are open source <https://github.com/ryersonlibrary?utf8=%E2%9C%93&query=atom>`_.
