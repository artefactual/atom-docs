.. _api-intro:

============
API Overview
============

AtoM includes an API allowing access to part of the AtoM dataset in JSON
format. The API is implemented in a Symfony plugin that needs to be enabled in
Admin/Plugins.

.. image:: images/enable-api-plugin.*
   :align: center
   :width: 70%
   :alt: An image of the API plugin in AtoM

.. SEEALSO::

   For more information on available plugins in AtoM, see:
   :ref:`manage-plugins`. For more information on Symonfy 1.x plugin
   development, consult the Symfony Project
   `documentation <http://symfony.com/legacy/doc>`__; in particular, see this
   section on Plugins:

   * http://symfony.com/legacy/doc/jobeet/1_4/en/20?orm=Propel

There are three endpoints available:

* :ref:`Browse taxonomy terms <api-browse-taxonomies>`
* :ref:`Browse information objects <api-browse-io>`
* :ref:`Read information object <api-read-io>`

.. _api-intro-auth:

Authentication
==============

The AtoM API uses Basic HTTP Auth and Cookies to give access to the data only
to authenticated users. On the first request to one of the endpoints above,
the AtoM user email and password must be sent in the 'Authorization' header.
The header value has to be 'Basic' followed by a base64 encoded version of
the string ``<user_email>:<password>``.

**Example request:**

.. code-block:: json

   GET /api/informationobjects HTTP/1.1
   Host: www.example.com
   Authorization: Basic ZGVtb0BleGFtcGxlLmNvbTpkZW1v

**Example response header:**

.. code-block:: json

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8
   Set-Cookie: symfony=54gc5cfmc0stnra3beh2pcl925; path=/; HttpOnly

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
