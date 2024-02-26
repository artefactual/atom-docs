.. _intro:

==============
What is AtoM?
==============

**AtoM** stands for "Access to Memory". It is a web-based, open source
application for standards-based archival description and access in a
multilingual, :term:`multi-repository <multi-repository system>` environment.


Technical overview
==================

.. image:: images/what-is-atom.*
   :align: right
   :width: 50%
   :alt: A diagram of AtoM's technical architecture


**AtoM comprises:**

HTML pages served to a web browser from a web server. The team at
`Artefactual <http://www.artefactual.com/>`__ (lead developers of the AtoM
project) prefer `Nginx <http://wiki.nginx.org/Main>`_ in both development and
production environments, but `Apache <https://httpd.apache.org/>`_ has been
tested as well; other web servers might be used but they are not tested by
AtoM :term:`developers <developer>`.

A database on a database server. `MySQL
<https://en.wikipedia.org/wiki/MySQL>`_ (8.0) is used in development but AtoM
uses a database abstraction layer and is therefore potentially compatible with
Postgres, SQLite, SQLServer, Oracle, etc. (other solutions are not tested by
AtoM developers)

PHP 7.4 software code that manages requests and responses between the web
clients, the application logic, and the application content stored in
the database. AtoM also makes use of a number of PHP extensions; see:
:ref:`installation-requirements`.

The Symfony (`1.4 <http://symfony.com/legacy>`_) framework that organizes the
component parts using object orientation and best practice web design
patterns.

`Elasticsearch <http://www.elasticsearch.org/>`__ (5.x), a distributed
search server based on Apache Lucene, which acts as the application's search
and analytic engine. Elasticsearch is not integrated directly into AtoM code
as a library, but as a service deployed in the same network which AtoM
interacts with through a
`REST <https://en.wikipedia.org/wiki/Representational_State_Transfer>`__ ful
`API <https://en.wikipedia.org/wiki/API>`__.

To encourage application reliability (for example, the replacement of nodes in
case of failure) and scalability (e.g. the ability to handle more traffic,
requests, etc.), all elements of AtoM's core stack can be configured in a
`distributed <https://en.wikipedia.org/wiki/Distributed_computing>`__ manner.
For more information, see: :ref:`installation-ansible`.

Web-based
=========

All user interactions with the system (add, view, search, edit, and
delete actions) take place through a web browser. Users access HTML
pages on the web server; clicking a button or link triggers a PHP script
that sends a command to the database and returns the output as HTML back
to the user's browser.

.. warning:: With the release of 2.0, AtoM will no longer support Internet
  Explorer (IE) 8 or earlier versions. If possible, please upgrade your browser
  to IE9 or higher, or use a supported browser such as `Firefox
  <http://www.mozilla.org/en-US/firefox/fx/#desktop>`_,
  `Chrome <https://www.google.com/intl/en_uk/chrome/browser/>`_,
  `Opera <http://www.opera.com/browser/>`_, or `Safari
  <http://www.apple.com/safari/>`_.

  Please see :doc:`Technical requirements <technical-requirements>` for more
  information.


Open source
===========

AtoM is built with open source tools (NGINX, MySQL, PHP, Symfony,
Elasticsearch) rather than proprietary software. The underlying AtoM code is
itself open source, with the source code freely available for use or
modification as users or other :term:`developers <developer>` see fit (under
the `A-GPL version 3 <https://www.gnu.org/licenses/agpl-3.0.html>`_ license).
Therefore **there is no cost to download any of the software required to run
the AtoM application.**

Our documentation is also freely available under a  Creative Commons
Attribution-ShareAlike 3.0 Unported license (`CC BY SA
<http://creativecommons.org/licenses/by-sa/3.0/>`__), and we maintain a free
public `User forum <https://groups.google.com/forum/#!forum/ica-atom-users>`__.

Find out more information on Open Source and Free Software from:

* The `Free Software Foundation <http://www.gnu.org/philosophy/free-sw.html>`_
* The `Open Source Initiative <http://opensource.org/>`_
* `Wikipedia <https://en.wikipedia.org/wiki/Open-source_software>`_

Standards-based
===============

AtoM was originally built around `International Council on Archives
<http://www.ica.org>`_ (ICA) descriptive standards:

* General International Standard Archival Description (:ref:`ISAD
  <isad-template>`) - 2nd edition, 1999
* International Standard Archival Authority Record (Corporate bodies,
  Persons, Families) (:ref:`ISAAR <isaar-template>`) - 2nd edition, 2003
* International Standard For Describing Institutions with Archival
  Holdings (:ref:`ISDIAH <isdiah-template>`) - 1st edition, March 2008
* International Standard For Describing Functions (:ref:`ISDF <isdf-template>`)
  - 1st edition, May 2007

AtoM supports Simple Knowledge Organization System (`SKOS
<http://www.w3.org/2004/02/skos/>`_) - W3C Recommendation 18 August 2009.

AtoM is designed to be flexible enough for adaptation to other
descriptive standards; see :doc:`Descriptive standards
<descriptive-standards>` for a full list of other standards currently
supported.


Multilingual
============

All user interface elements and database content can be translated into
multiple languages. AtoM comes with several translations installed, all of
which are generously provided by volunteer translators from the
AtoM User Community.

Want to help us translate the AtoM application into your language, or improve
an existing translation? Find more information on how to contribute
`here <https://wiki.accesstomemory.org/Resources/Translation>`__.

Multi-repository
================

AtoM can be used by a single institution for its own descriptions or it can be
set up as a :term:`multi-repository <multi-repository system>` "union list"
accepting descriptions from any number of contributing institutions.
