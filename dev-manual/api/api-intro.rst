.. _api-intro:

============
API Overview
============

AtoM includes an API allowing access to part of the AtoM dataset in JSON
format. The API is implemented in a Symfony plugin that needs to be
:ref:`enabled <api-intro-plugin>` in Admin/Plugins. This API requires an API
key to be passed with each request; details on generating an API are included
below in the :ref:`api-intro-auth` section.

There are three endpoints available:

* :ref:`Browse taxonomy terms <api-browse-taxonomies>`
* :ref:`Browse information objects <api-browse-io>`
* :ref:`Read information object <api-read-io>`

.. _api-intro-plugin:

Enable the API plugin
=====================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18


Before being able to expose the API endpoints, the ``arRestApiPlugin``
must be enabled. You must be logged in as an :term:`administrator` to
manage plugin settings.

To enable the API plugin, navigate via the :term:`main menu` to |gears|
**Admin > Plugins**. AtoM will redirect you to the :ref:`Plugins <manage-plugins>`
page.

Ensure that the checkbox next to the ``arRestApiPlugin`` is checked - if it is
not, check the box and then save the change using the Save button located in the
:term:`button block` at the bottom of the page.

.. image:: images/enable-api-plugin.*
   :align: center
   :width: 80%
   :alt: An image of the API plugin in AtoM

.. TIP::

   Setting not taking effect? In some cases, a system administator with access
   to the command-line may have to restart your webserver and php5-fpm for the
   changes to take effect. We also recommend clearing the application cache. If
   you are using our recommended installation configuration (see:
   :ref:`installation-linux`) such as Nginx for your web server, you can restart
   these services with the following commands from the root directory of your
   AtoM installation:

   .. code:: bash

      sudo service nginx restart
      sudo service php5-fpm restart
      php symfony cc

After enabling the OAI plugin, you will want to make sure that you generated
an API key, so you can send requests to the available endpoints. See
:ref:`api-intro-auth`, below.

.. SEEALSO::

   For more information on available plugins in AtoM, see:
   :ref:`manage-plugins`. For more information on Symonfy 1.x plugin
   development, consult the Symfony Project
   `documentation <http://symfony.com/legacy/doc>`__; in particular, see this
   section on Plugins:

   * http://symfony.com/legacy/doc/jobeet/1_4/en/20?orm=Propel

.. _api-intro-auth:

Authentication
==============

The AtoM API requires that an API key value be passed as part of the header
with each request. These keys are generated in AtoM, and are associated with a
user account - this maintains a chain of custody and responsibility. Only an
:term:`administrator` has the proper :term:`permissions <access privilege>` to
generate an API Key; however, admins can generate a key for any other user in
the system.

.. _api-intro-auth-key:

Generating an API Key for a user
--------------------------------

API keys are associated with :term:`user accounts <user account>` in AtoM -
for more general information, see: :ref:`manage-user-accounts`. Only an
:term:`administrator` has the proper :term:`permissions <access privilege>` to
generate an API Key; however, admins can generate a key associated with any
user account.

.. SEEALSO::

   * :ref:`manage-user-accounts`

**To generate an API key for an existing user:**

1. Navigate to |gears| **Admin > Users**. AtoM will redirect you to the Users
   page.

.. image:: images/list-users.*
   :align: center
   :width: 90%
   :alt: An image of the List users page in AtoM

2. Select the user for whom you would like to generate an API key, and click
   on their :term:`username`. AtoM will load the user's Profile page.

.. image:: images/view-user.*
   :align: center
   :width: 90%
   :alt: An image of a user profile view page in AtoM

3. Click on the Edit button in the :term:`button block` at the bottom of the
   page to enter :term:`edit mode`. You can also click on the "User details"
   :term:`area header` to enter edit mode. AtoM will reload the user profile
   page in edit mode so you can make changes.
4. In the "Access control" :term:`area <information area>` at the bottom of
   the edit page, click on the :term:`drop-down menu` beneath the "REST API
   access key heading, and select "(Re)generate API key."

.. image:: images/generate-api-key.*
   :align: center
   :width: 90%
   :alt: An image of the REST API access key generation option in the User
         edit page

5. You can cancel this process at any time using the "Cancel" button located
   in the :term:`button block` at the bottom of the user :term:`edit page`.
   Note that navigating away from the page **without first clicking Save**
   will also result in no changes being made.
6. To generate the API key, click the "Save" button located in the
   :term:`button block` at the bottom of the edit page.

.. image:: images/button-block-save.*
   :align: center
   :width: 70%
   :alt: An image of the button block at the bottom of the User edit page

7. AtoM will reload the User profile page in :term:`view mode` - you will now
   see an API key value listed on the user's profile.

.. image:: images/user-view-api-key.*
   :align: center
   :width: 90%
   :alt: An image of the user profile view page with an API key displayed

8. Note that you can regenerate a different key by repeating the steps above,
   or delete an existing key by following the steps above but choosing "Delete
   API key" in step 4.

.. _api-intro-key-example:

Using an API Key in a request
-----------------------------

An API key value must be passed with each request to the API endpoints, or no
response will be returned. You can use something like `curl <https://curl.haxx.se/>`__
to submit the requests with the API key in the header.

**Example request** (using curl):

.. code-block:: bash

   curl -H "REST-API-Key: 90e458ded261c7a5" "http://10.10.10.10/index.php/api/informationobjects"

See the subsequent pages for more details on each endpoint, and available
parameters. There are three endpoints available:

* :ref:`Browse taxonomy terms <api-browse-taxonomies>`
* :ref:`Browse information objects <api-browse-io>`
* :ref:`Read information object <api-read-io>`

.. _api-intro-i18n:

Common parameter - i18n culture
===============================

The one parameter that is currently common across all API endpoints is the
``sf_culture`` parameter. AtoM expects an ISO 639-1 formatted language
code (examples include en, fr, es - see
`Wikipedia <https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`__ for a
list of available codes) as the parameter value.

This parameter is not required for an API request. If it is not included, then
AtoM will return the response with data from the default culture of the
application.

AtoM is a multilingual application that supports the translation of both user
interface elements, and user content. This means that it is possible that a
particular resource is available in more than one culture - the availability
of a response for any given i18n parameter will depend on the data available.
For more information on AtoM's multilingual functionality, see:
:ref:`multilingual-design-principles`.

:ref:`Back to top <api-intro>`
