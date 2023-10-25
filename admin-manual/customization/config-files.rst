.. _customization-config-files:

===============================
Manage AtoM configuration files
===============================

.. _Downloads page: https://www.accesstomemory.org/download/
.. _Ansible deployment scripts: https://github.com/artefactual-labs/ansible-atom/
.. _Archivematica: https://www.archivematica.org/

.. |info| image:: images/info-sign.png
   :height: 18
   :width: 18
.. |clip| image:: images/paperclip.png
   :height: 18
   :width: 18
.. |manage| image:: images/plus-sign.png
   :height: 18
   :width: 18
.. |pencil| image:: images/edit-sign.png
   :height: 18
   :width: 18
.. |import| image:: images/download-alt.png
   :height: 18
   :width: 18
.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

Many settings in AtoM can be managed directly through the
:term:`user interface` via the **Admin > Settings** menu (see: :ref:`settings`
for details). However, there are also several configuration files maintained
in AtoM's code where various settings and configurations can be managed, and
which can be edited directly by a user via the command-line. These files can
be useful for customizing the behavior and performance of your application.
Details on each have been included below.

.. IMPORTANT::

   The Symfony PHP framework that AtoM uses uses a configuration cascade -
   meaning it will look for configuration files in multiple locations in a
   specific order, and the final configuration will be compiled from all found
   configuration files in a specific order of preference. See the Symfony
   documentation for more information:

   * https://symfony.com/legacy/doc/reference/1_4/en/03-Configuration-Files-Principles#chapter_03_configuration_cascade

   The locations of the configuration files listed below are the default 
   locations used in a standard installation using the downloadable tarball
   package provided on the Access to Memory website's `Downloads page`_.

   However, depending on your installation method (or if you are using an
   Artefactual-provided development environment like the AtoM 
   :ref:`Vagrant box <dev-env-vagrant>`), these files may appears in different
   locations, such as in the ``apps/qubit/config`` directory. 

   **An example: The Elasticsearch search.yml config file**

   Before installation, the default version of the ``search.yml`` configuration
   file is found in the Elasticsearch (ES) :ref:`plugin <manage-plugins>` in 
   AtoM, at:

   * ``plugins/arElasticSearchPlugin/config/search.yml``

   This default file is typically copied to its new location once the 
   :ref:`installer <installation-ubuntu-installer>` is run as part of the 
   installation process. 

   If installing via the Artefactual provided downloadable tarball, the new
   location will typically be: 

   * ``config/search``

   However, Artefactual uses `Ansible deployment scripts`_ to prepare the 
   :ref:`dev-env-vagrant` development environment, and in the process, the 
   ES configuration file is set at ``apps/qubit/config/search.yml``.

   **Making configuration changes**

   Symfony will compile the settings found in all applicable configuration 
   files, in a specific order of preference. This means that one file will not
   completely override the other - instead, priority file location values will
   be favored, but where a configuration setting is not found for a particular
   parameter in the preferred location, Symfony will check the next location
   for a relevant parameter. 

   If a particular parameter exists in multiple files but has different values, 
   then the cascade order preference will determine which setting value takes 
   effect.

   If you are uncertain where to make your changes, you can always make them in 
   all relevant configuration files to ensure the changes will take effect as
   expected. 

**Jump to:**

* :ref:`config-change-files`
* :ref:`config-files-overview`
* :ref:`config-application-server`

.. _config-change-files:

How to change values in configuration files
===========================================

From AtoM's root directory, use the ``nano`` command to open a file for editing
- e.g.:

.. code-block:: bash

   nano config/app.yml

You can save changes with ``CTRL+O + ENTER``, and exit with ``CTRL+X`` (you
will be asked to save if you haven't yet).

.. IMPORTANT::

   If you change any of the files listed below, clear the cache and restart
   PHP-FPM to apply the changes.

   * :ref:`maintenance-clear-cache`
   * :ref:`troubleshooting-restart-php-fpm`

:ref:`Back to top <customization-config-files>`

.. _config-files-overview:

Important configuration files
=============================

Below is a list of some of the configuration files available in AtoM that
you may need to adjust as a system administrator. 

**Jump to:**

* :ref:`config-app-yml`
* :ref:`config-settings-yml`
* :ref:`config-factories-yml`
* :ref:`config-config-php`
* :ref:`config-sitemap-yml`
* :ref:`config-search`
* :ref:`cas-app-yml`
* :ref:`config-security-ymls`

.. _config-app-yml:

config/app.yml
---------------

.. _htmlpurifier: http://htmlpurifier.org/

This is the primary file where AtoM-specific settings that cannot be managed
via the :term:`user interface` are maintained. This file includes settings
such as:

* ``upload_limit``: Global digital object upload limit (in gigabytes) - can be
  set to -1 for unlimited, or set to a specific limit in GBs.
* ``download_timeout``: Timeout limit for fetching digital objects from
  external services (in seconds) - default value is 10s. See also:
  :ref:`installation-execution-limits`.
* ``cache_engine``: Which cache engine you want to use (can use Memcached for
  a distributed cache, for example) - default is sfAPCCache
* ``read_only``: Enable read-only mode, if you want to remove the login button
  and prevent users from logging into the application. See also:
  :ref:`read-only-mode`.
* ``google_analytics_api_key``: Set a Google Analytics API key, for basic
  installation-wide analytics via Google - see: :ref:`maintenance-web-analytics`
* ``google_analytics_institutions_dimension_index``: Set a custom dimension
  via Google Analytics to allow for per-institution page view counts in a
  :term:`multi-repository system`. See: :ref:`google-analytics-repo-pageviews`
* ``google_tag_manager_container_id``: Set a Google Tag Manager API key, for
  further element-specific analytics. See: :ref:`google-tag-manager`
* ``htmlpurifier_enabled``: Enable htmlpurifier_ - limits HTML on static pages
  to a white-list of approved elements and attributes, to prevent XSS. See:
  :ref:`security-static-pages`.
* ``workers_key``: Allows setting a custom key that will add a unique hash
  to the Gearman atom-worker, to avoid conflicts when multiple AtoM installations
  are co-tenanted on the same server.
* ``treeview_items_per-page_max``: Increase the maximum allowed value for the
  full-width :term:`treeview` paging limit - see: :ref:`fwt-items-per-page`
* ``response_header``: The CSP `repsonse_header` setting is used to set the CSP
  header type and can have one of two values: `Content-Security-Policy` or 
  `Content-Security-Policy-Report-Only`. See :ref:`csp-configuration` for
  additional details.
* ``directives``: The CSP `directives` setting contains the CSP policy that will
  be sent in the CSP header. See :ref:`csp-configuration` for additional details.

.. image:: images/app-yml-settings.*
   :align: center
   :width: 70%
   :alt: An image of the app.yml file in the command-line

.. IMPORTANT::

   Symfony (the PHP framework that AtoM uses) has a cascading system of
   priorization for configuration files - if you create an ``app.yml`` file in
   ``apps/qubit/config/``, its settings will override those found in
   ``config/app.yml``. This can be useful if you want to change some
   configuration values without actually altering AtoM's installation
   defaults - Artefactual uses this method for automated deployment via
   Ansible, for example.

   If your settings changes aren't taking effect in ``config/app.yml`` and
   you've already cleared the cache and restarted php-fpm, you might want to
   double-check to make sure you don't have a file in
   ``apps/qubit/config/app.yml`` overriding the other configuration file. If
   you are using the :ref:`dev-env-vagrant` box for example, you will have
   this extra config file, since Artefactual uses Ansible to automate the
   build of the Vagrant box.

   .. image:: images/apps-qubit-config-app-yml.*
      :align: center
      :width: 90%
      :alt: An example of the app.yml file in apps/qubit/config
   
   There are also some settings in this file (such as the ``read_only`` setting) 
   that may be overwritten by environment variables in the PHP pool set up 
   during installation. For general information, see below, 
   :ref:`config-application-server`. For specific information on setting up
   read-only mode in AtoM, see: 

   * :ref:`read-only-mode`

:ref:`Back to top <customization-config-files>`

.. _config-settings-yml:

apps/qubit/config/settings.yml
------------------------------

* Symfony and PHP settings - see the Symfony documentation for more general
  information: http://symfony.com/legacy/doc/reference/1_4/en/04-Settings
* For things like default_culture, default_timezone, login_module, etc
* Includes settings for error handling behavior as well - be careful
  changing these! We don't recommend it.

:ref:`Back to top <customization-config-files>`

.. _config-factories-yml:

config/factories.yml
--------------------

* Another Symfony 1.x configuration file
* More details at: http://symfony.com/legacy/doc/reference/1_4/en/05-factories
* Useful for changing logging options, user class (e.g. LDAP or CAS), etc
* We don't recommend changing this file unless you know what you're doing!
* See: :ref:`maintenance-logging` for some ideas on how to work with these
  settings to change or improve logging in AtoM

.. SEEALSO::

   * :ref:`customization-authentication`

:ref:`Back to top <customization-config-files>`

.. _config-config-php:

config/config.php
-----------------

* Where basic configuration information for database access is stored, such
  as the database user, pass, and name
* We don't recommend changing this file unless you know what you're doing!

:ref:`Back to top <customization-config-files>`

.. _config-sitemap-yml:

config/sitemap.yml
------------------

This configuration file is used in conjunction with the sitemap generation
command-line task - for more information, see: :ref:`cli-sitemap`.

This file contains the priorities (or weighting) for each
:term:`level of description` of archival descriptions included in the sitemap
the CLI task will generate. If you have added new levels of description to the
Levels of description :term:`taxonomy`, you can give them a priority here, or
adjust the default priorities included in the file (shown in the image below).

.. image:: images/config-sitemap-yml.*
   :align: center
   :width: 60%
   :alt: An image of the sitemap.yml file in the command-line

:ref:`Back to top <customization-config-files>`

.. _config-search:

config/search.yml
-----------------

.. _Elasticsearch: https://www.elastic.co/elasticsearch/
.. _stop words: https://en.wikipedia.org/wiki/Stop_word

This configuration file is used to configure `Elasticsearch`_ (ES), the search 
index used in AtoM, including:

* The host and port of your Elasticsearch index, configured during installation
  via the command-line :ref:`installer <installation-ubuntu-installer>`
* The normalizers, analyzers and filters used by Elasticsearch. See the
  `Elasticsearch`_ documentation for more information on these, and be sure
  you are looking at the documentation for the correct ES version
* Number of shards and replicas created - these are paramters used for 
  performance optimization and scalability. See the `Elasticsearch`_ 
  documentation for more information
* The tokenizers and filters used per culture - these can be useful to adjust
  when trying to improve AtoM's multilingual search for a specific language.
  See the `Elasticsearch`_ documentation for more information. This includes
  whether or not `stop words`_ are being filtered for a particular language.

.. image:: images/config-search-yml.*
   :align: center
   :width: 70%
   :alt: An image of the search configuration file

There are also two additional global configuration settings worth mentioning,
that can be customized as needed. Be aware that making changes can increase
the size of your ES index and require more resources (memory, disk space, etc)
if changed.

The first value is the ``index.mapping.total_fields.limit``. This setting
defines the maximum number of fields in an index. Field and object mappings,
as well as field aliases count towards this limit. By default in new AtoM
installations, this value is set to 3000. In particularly large installations
it's possible that this default value is not high enough to support a full
index of your data. You will know this is the case if you encounter a message
like the following message when attempting to run the
:ref:`maintenance-populate-search-index` command:

.. code-block:: bash

   Limit of total fields [3000] in index [atom] has been exceeded 

The second value is the ``index.max_result_window`` setting. By default
Elasticsearch sets a limit on the number of results returned, since these 
impact the amount of heap memory required for your search index. This value
is set to 10,000 in AtoM by default in new installations.

This means that, in the event that there are more than 10,000 results to return 
when searching or browsing, AtoM will stop loading results after the limit is 
reached, to preserve memory capacity, and the user will see the following 
message:

.. image:: images/es-sort-options.*
   :align: center
   :width: 90%
   :alt: Sort options error message

Users can use the sort direction options in the 
:ref:`Sort buttons <recurring-sort-button>` available on search and browse 
pages to reverse the sort direction and view results from the end of the list. 
However, if desired, a system administrator can increase the 
``index.max_result_window`` value to allow more results to be accessed before
the limit is reached. Be aware that this will impact memory usage!

**If you make any changes to the** ``search.yml`` **file**, you should:

* Run the :ref:`maintenance-populate-search-index` command
* Run the :ref:`maintenance-clear-cache` command
* Restart :ref:`PHP-FPM <troubleshooting-restart-php-fpm>`

:ref:`Back to top <customization-config-files>`

.. _cas-app-yml:

plugins/arCasPlugin/config/app.yml
----------------------------------

.. _CAS: https://www.apereo.org/projects/cas

This file contains additional parameters that can be used to configure the
`CAS`_ single sign-on authentication plugin. For more information, see: 

* :ref:`cas-enabling`

.. image:: images/cas-config-file.*
   :align: center
   :width: 90%
   :alt: An image of the configuration file in the CAS authentication plugin

Values that can be configured here include: 

* ``cas_version`` can be set to 1.0, 2.0, or 3.0. For more information, see: 
  https://apereo.github.io/cas/5.2.x/protocol/CAS-Protocol.html
* You can configure the connection to your CAS authentication server by 
  adjusting the ``server_name``, ``server_port``, and ``server_path`` values
* The location of your CAS server's SSL certificate can be configured. By 
  default in a new installation, the ``server_cert`` parameter is set to false.
  While CAS server SSL validation can be disabled for development, we strongly
  discourage doing so in a production environment.
* You can configure AtoM user groups to match your CAS user attributes using 
  the ``set_groups_from_attributes`` parameter, adjusting the ``attribute_key`` 
  that should be used, and configuring the various ``user_groups`` values
  to match your CAS group IDs. For more information, see: :ref:`cas-groups`.

For further details on basic configuration, see the Administrator's manual:

* :ref:`customization-authentication`

There is one other parameter worth mentioning in this file: the 
``service_url`` variable. This setting lets a system administrator specify
the AtoM site URL that the CAS server should use when responding to 
authentication requests, regardless of where the user originates. This can
be useful when multiple domain names with redirects are used for your AtoM site
for example, or when the hostname does not match the host part of the AtoM 
instance URL.

By default, the CAS server will redirect users back to the URL from which the
request originated, but this may not always work as expected when there are 
different domains or subdomains used, and can break the authentication procedure.

To avoid this, system administrators can use the ``service_url`` parameter to
specify the perferred service URL for your AtoM site that the CAS server
should redirect users to after successfully completing authentication. 

Example: 

.. code-block:: none
 
   service_url: https://atom.somedomain.org/cas/login

:ref:`Back to top <customization-config-files>`

.. _config-security-ymls:

Security configuration files
----------------------------

AtoM includes the ability for an :term:`administrator` to create and manage
user accounts, add them to groups, and configure permissions per user or per
group. For more information, see:

* :ref:`manage-user-accounts`
* :ref:`edit-user-permissions`

However, there are some default permissions that are set in AtoM on a per-group
basis that do not currently have granular and customizable permissions settings
available via the :term:`user interface`. In some cases, the default access
permissions can be modified via a number of ``security.yml`` configuration files 
found in AtoM. 

These security configuration files control application routing - meaning they
are applied during page requests, and before any application code is loaded
for the page in question. In some case, a system administrator can adjust these 
files to restrict or provide access to modules on a per-group basis.

.. NOTE::
  
   As these security configuration files control routing and not access control, 
   in some cases, access control checks may be hard-coded into the application
   code for particular pages, and while changing the related ``security.yml``
   file may allow a member of a different user group to navigate to a previously
   restricted page, ACL checks in the page may still restrict access upon
   arrival. 

   An example of this would be the :ref:`accession-security-config` described
   below. The security configuration file contains ``browse`` and ``edit`` 
   parameters, but application code ACL checks currently limit view, create, 
   edit, and delete permissions to the :term:`administrator` and editor groups. 

   This means that if you wanted to allow another user group to view and
   edit accession records, updating the ``security.yml`` file alone would not 
   suffice - you would also need to make changes to the application code.  

**Basic file structure**

Below is an example default configuration file - this example is for access to 
the :term:`taxonomies <taxonomy>`, and is located at 
``apps/qubit/modules/taxonomy/config/security.yml``.

.. code-block:: none

   browse:
     credentials: [[ editor, administrator ]]

   list:
     credentials: [[ editor, administrator ]]

   index:
     is_secure: false

   autocomplete:
     is_secure: false

   all:
     is_secure: true

Each security YAML file will include a list of component parameters, and
related default permissions. When ``all`` includes ``is_secure: true`` as a
nested value, this means that by default all relevant components will have a
permissions check applied and routing access will be restricted to any listed
user groups, unless otherwise declared. In the example above, the autocomplete
search results for taxonomy terms includes an ``is_secure: false`` key/value
pair, which overrides the global ``all`` variable for that particular
component. The ability to browse the taxonomies, and see the view page for a
particular taxonomy (list) has been restricted by default to the editor and
:term:`administrator` user groups.

.. IMPORTANT::

   In general, we don't recommend changing the global ``all`` parameters. 

   As always when making configuration and code changes, we strongly recommend
   that you make a back up of your data before proceeding and test thoroughly 
   before any changes on a production instance!

When just one user group is granted access to a particular component, it can
be listed immediately after the component name, like this example: 

.. code-block:: none

   import:
     credentials: administrator

To list multiple groups, enclose the group names in two sets of square brackets
and use commas to separate user group names. If you have created custom groups, 
you can add custom group permissions for them to these configuration files by
including the exact form of name of the group, like so: 

.. code-block:: none

   import:
     credentials: [[ editor, mycustomgroup, administrator ]]

.. TIP:: 

   To avoid any errors or unexpected outcomes during this configuration, we
   recommend that custom group names do not include spaces or special 
   characters.

As with all configuration files, if you make any changes, clear the application 
cache and restart PHP-FPM to apply the changes.

* :ref:`maintenance-clear-cache`
* :ref:`troubleshooting-restart-php-fpm`

Below is a list of some of the key security configuration files available in 
AtoM. This list is not comprehensive. Not covered below are some files that
relate to the underlying Symfony framework (and should not be altered), 
configuration files for optional plugins (like the ``arStorageServicePlugin``
used for `Archivematica`_ integration), and other files that are not 
easily configured to be accessible to other groups via the user interface. 

**Jump to:**

* :ref:`import-security-config`
* :ref:`accession-security-config`
* :ref:`description-updates-security-config`
* :ref:`storage-security-config`
* :ref:`menus-security-config`
* :ref:`taxonomy-security-config`

.. IMPORTANT:: 

   While permission to perform certain actions can be modified on a per-group
   basis by changing these configuration files, control of main menu nodes such
   as the |gears| :ref:`Admin <main-menu-admin>` and |import| 
   :ref:`Import <main-menu-import>` menus is set via code, and is restricted
   by default to the :term:`administrator` group. 

   However,an administrator can use the :ref:`manage-menus` module to add links 
   in other menus that the designated group can access, such as the |manage|
   :ref:`Manage <main-menu-manage>` menu, as shown in the example configuration
   below for granting access to Editors to the CSV import module:

   .. image:: images/import-csv-menu-example.*
      :align: center
      :width: 90%
      :alt: An image of how an administrator might add a link to the CSV import
            page to the Manage menu, so Editors can access it.  

   For more information on import security configuration, see 
   :ref:`below <import-security-config>`. In the example above, the ``editor`` 
   group would need to be added to both the ``import`` and ``importSelect`` 
   options in the related ``security.yml`` file.

:ref:`Back to top <customization-config-files>`

.. _import-security-config:

Import security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/object/config/security.yml``

This file controls the options for import and validation, including:

* :ref:`XML import <import-xml>`
* :ref:`csv-import`
* :ref:`csv-validation`
* :ref:`SKOS import <import-skos>`

**Key parameters**

* ``import``: Sets access to run CSV and XML imports
* ``importSelect``: Sets access to the import configuration page
* ``validateCsv``: Sets access to run CSV validation jobs

.. NOTE::

   Access to the |import| :ref:`Import <main-menu-import>` menu is restricted
   by default to the :term:`administrator` group in the application code. An
   administrator can use the :ref:`manage-menus` module to add a link to 
   another menu if access is required for other groups. 

.. _accession-security-config:

Accession record security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``plugins/qtAccessionPlugin/modules/accession/config/security.yml``

This file controls the ability for user groups to manage accession records. See:

* :ref:`accession-records`

**Key parameters**

* ``browse``: Sets access to the Accessions browse page. Also controls whether
  a link to the browse page will be available to the relevant user group in the 
  |pencil| :ref:`Manage <main-menu-manage>` menu.
* ``edit``: Sets access to the ability to edit existing accession records

There is another parameter not listed here, which could be manually added: 
``index`` will control the routing to access the view page of 
accession records. 

.. NOTE::

   Currently, access to accessions is limited via application code to the 
   Administrator and Editor user groups. See: 

   * `QubitAcl.class.php (L736-746) <https://github.com/artefactual/atom/blob/HEAD/plugins/qbAclPlugin/lib/QubitAcl.class.php#L736-L746>`__

   A developer would need to modify the permissions check in the link above
   to allow additional groups to access and modify accession records. 

.. _description-updates-security-config:

Description updates security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/search/config/security.yml``

The Description Updates module, normally restricted to the :term:`administrator`
user group, is designed to help authorized users identify new and recently
modified records in the system. For more information, see: 

* :ref:`search-updates`

By making modifications to this security configuration file and adding a link
to the Description Updates page to a different :term:`main menu` node that
all necessary user groups can access, it's possible to allow others to use
this module as well for administration of the site and its metadata. 

**Key parameters**

* ``descriptionUpdates``: Sets access to the :ref:`search-updates` page
* ``globalReplace``: This is an outdated module that is currently not 
  operational in AtoM, and should not be modified. 

.. _storage-security-config:

Physical storage security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/physicalobject/config/security.yml``

This file controls the ability for user groups to access and manage 
:term:`physical storage` containers and locations. For more information, see: 

* :ref:`physical-storage`

Based on the default permissions configured in this file, contributors can 
view individual storage records from associated links on related 
:term:`archival description` or :term:`accession <accession record>` records. 
Translators have the same access, but can also edit those containers they can 
access via this method, to be able to add translations. Editors and 
Administrators can browse, view, edit, and delete storage records. 

**Key parameters**

* ``autocomplete``: Sets access to viewing matching containers when linking
  physical storage to other entities via the available autocomplete. See: 
  :ref:`link-physical-storage`.
* ``boxList``: Sets access to the box list report, avaiable by clicking on the
  printer icon on the view page of the related storage container. For more
  information, see: :ref:`storage-report-manage`.
* ``browse``: Sets access to the physical storage browse page
* ``delete``: Sets access to the ability to delete physical storage containers 
  and locations
* ``edit``: Sets access to the ability to edit existing storage containers, or 
  add new ones
* ``index``: Sets access to the view page of individual storage containers. 

.. _static-page-security-config:

Static page security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/staticpage/config/security.yml``

This file controls the ability for user groups to access and manage static pages
in AtoM. For more information, see: 

* :ref:`manage-static-pages`

By default, static pages are publicly visible - however, the link to the 
management page for static pages is included by default in the |gears| 
:ref:`Admin menu <main-menu-admin>`, and the default configuration of this
security file limits edit and browse permissions to the :term:`administrator`
and translator user groups, and delete permissions to the administrator group.

**Key parameters**

* ``delete``: Sets access to the ability to delete existing static pages. Note 
  that some static pages, such as the Home page, cannot be deleted, just 
  modified. 
* ``edit``: Sets access to the ability to modify existing static pages, and 
  create new ones
* ``list``: Sets acess to the browse page for existing static pages. 

.. NOTE::

   While modifying the ``list`` and ``edit`` parameters can allow additional 
   user groups to browse existing static pages and create new ones, currently 
   the ability to edit or delete existing static pages is restricted via 
   application code to the :term:`administrator` user group. See: 

   * `QubitAcl.class.php (L749-755) <https://github.com/artefactual/atom/blob/HEAD/plugins/qbAclPlugin/lib/QubitAcl.class.php#L749-L755>`__

   A developer would need to modify the permissions check in the link above
   to allow additional groups to modify and delete static pages. 

.. _menus-security-config:

Manage menus security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/menu/config/security.yml``

This file controls the ability for user groups to manage the links appearing in 
menus found in the AtoM :term:`header bar`. For more information, see: 

* :ref:`manage-menus`

Some menus (such as the :ref:`Browse menu <browse-menu>` and the 
:ref:`clipboard <clipboard-menu-header>`, :ref:`quick links <quick-links-menu>`, 
and :ref:`language <language-menu>` menus) are publicly visible by default, 
while others (such as those in the :ref:`main-menu`) are restricted to specific 
user groups. For a general overview of the AtoM header bar and its menus, see: 

* :ref:`atom-header-bar`

**Key parameters**

* ``delete``: Sets access to the ability to delete existing menu links. Note 
  that some top-level menu nodes cannot be deleted, just modified. 
* ``edit``: Sets access to the ability to modify existing menu links, and 
  create new ones
* ``list``: Sets acess to the menu management page listing all menus and nodes. 

.. NOTE::

   Access to the |gears| :ref:`Admin menu <main-menu-admin>`, where the 
   "Manage menus" menu link is located at installation, is restricted by default 
   to the :term:`administrator` group in the application code. An administrator 
   can use the :ref:`manage-menus` module to add a link to another menu if 
   access is required for other groups. 

.. _taxonomy-security-config:

Taxonomy security configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **File location:** ``apps/qubit/modules/taxonomy/config/security.yml``

This file controls the routing access to exploring the various 
:term:`taxonomies <taxonomy>` in AtoM, used to maintain controlled vocabulary
terms used in :term:`drop-down menus <drop-down menu>` in AtoM's 
:term:`edit page` forms, or in some cases as :term:`access points <access point>`. 
For more general information on taxonomies and terms, see: 

* :ref:`terms`

At installation, a link to the taxonomies browse page is available in the 
|manage| :ref:`Manage menu <main-menu-manage>`, and the default configuration
of this file allows browse and view access to the :term:`editor` and 
:term:`administrator` user groups. 

.. IMPORTANT::

   Granular taxonomy permissions can be managed per user or per group by an 
   :term:`administrator` via the user interface using AtoM's Permissions module. 
   See: 

   * :ref:`edit-user-permissions` 

  We recommend making your taxonomy permission changes there first, and only 
  modifying this security configuration file if access is not working as 
  expected.

**Key parameters**

* ``browse``: Deprecated. Sets access to the list of taxonomies. 
* ``list``: Sets access to the list of taxonomies
* ``index``: Sets access to the view page for a taxonomy
* ``autocomplete``: Sets access to matching term results showing up in 
  autocomplete results from the global :ref:`search box <atom-search-box>` or
  when linking terms in related :term:`edit pages <edit page>`. Note that 
  separate application code filters this list so that only :term:`subject` and 
  :term:`place` access points are currently included as possible autocomplete 
  matches in the global search.  

:ref:`Back to top <customization-config-files>`

.. _config-application-server:

Application server
==================

Remember that Nginx is just the HTTP frontend. Internally, each request is
forwarded to php-fpm. php-fpm is a pool of managed AtoM processes. The pool
has its own configuration file that defines some important global PHP settings
like timeouts, and environment variables that may also modify the way that
AtoM works as documented in accesstomemory.org.

The file of the pool is located at ``/etc/php/7.4/fpm/pool.d/atom.conf``. Edit
with ``nano``. Once saved, run: ``sudo systemctl restart php7.4-fpm``, and the
changes will apply.

.. SEEALSO::

   * :ref:`security-application`
   * :ref:`read-only-mode`
   * :ref:`customization-authentication`

:ref:`Back to top <customization-config-files>`