.. _api-intro:

============
API Overview
============

AtoM includes an API allowing access to part of the AtoM dataset in JSON
format. The API is implemented in a Symfony plugin that needs to be
:ref:`enabled <api-intro-plugin>` in Admin/Plugins. This API can be accessed
by passing basic HTTP authentication, or for a more secure option, an API
key associated with a user account can be passed with each request; details on
each option and on generating an API key are included below in the
:ref:`api-intro-auth` section.

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

After enabling the plugin, you will want to make sure that you generated
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

By default, the AtoM API uses basic HTTP authentication and cookies to give
access to the data only to authenticated users. On the first request to one
of the endpoints above, the AtoM user email and password must be sent in the
"Authorization" header. The header value has to be 'Basic' followed by a
base64 encoded version of the string ``<user_email@example.com>:<password>``.

**Example request** (using curl):

.. code-block:: bash

   curl -u demo@example.com:demo http://www.example.com/api

**Example request header**

.. code-block:: none

   GET /api/informationobjects HTTP/1.1
   Host: www.example.com
   Authorization: Basic ZGVtb0BleGFtcGxlLmNvbTpkZW1v

**Example response header**

.. code-block:: none

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8
   Set-Cookie: symfony=54gc5cfmc0stnra3beh2pcl925; path=/; HttpOnly

Alternatively if you don't want to pass unencrypted user data via the
request header, an API key value can be passed as part of the header
with each request. These keys are generated in AtoM, and are associated with a
user account - this maintains a chain of custody and responsibility. Only an
:term:`administrator` has the proper :term:`permissions <access privilege>` to
generate an API Key; however, admins can generate a key associated with any
user account.

.. _api-intro-auth-key:

Generating an API Key for a user
--------------------------------

API keys are associated with :term:`user accounts <user account>` in AtoM -
for more general information, see: :ref:`manage-user-accounts`. The
instructions below will walk you through the process - note that you can
follow the same instructions with some variations to regenerate a new key at
any time, or to delete an existing key (see step 8 below).

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
response will be returned. Below is an example of using
`curl <https://curl.haxx.se/>`__ to submit the requests with the API key in
the header.

**Example request** (using curl):

.. code-block:: bash

   curl -H "REST-API-Key: 90e458ded261c7a5" "http://www.example.com/index.php/api/informationobjects"

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

Accessing endpoints via your browser
====================================

While the API has been designed to allow for communication between systems
(e.g. passing data to an aggregator, or separate front-end access system),
users can also access the API's responses via a web browser.

Depending on the browser you use, you may want to consider installing a JSON
pretty-print add-on before accessing the endpoints, to structure the display
and make it easier to read. For Firefox, we recommend the following:

* https://addons.mozilla.org/en-US/firefox/addon/jsonview/

If you're using Chrome, you shouldn't need to install anything additional.

Example requests with different parameters will be included in the
documentation for each endpoint, but in general, you can imagine taking the
example request included on the documentation, and appending it to your base
URL with whatever parameters you wish to apply. For example, the endpoint for
for the browse taxonomies endpoint is listed as ``/api/taxonomies/[id]``. If
you wanted to access the level of descriptions taxonomy in your browser (the
ID for that taxonomy is 34; a list of common taxonomies will be included in
the Browse taxonomies endpoint documentation), and your site's URL is
``http://www.example.com``, then you can view the response by entering the
following into your browser:

* ``http://www.example.com/api/taxonomies/34``

.. TIP::

   For the Browse information objects endpoint, a good way to see some of the
   available parameters in action is to perform a search via the AtoM user
   interface, using some of the available filters and facets - while there are
   some variations (included in the documentation), for the most part, the way
   we include these parameters in the URL of the returned search results page
   is the same way we've implemented them for the API.

:ref:`Back to top <api-intro>`
