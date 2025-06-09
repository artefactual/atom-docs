.. _security-js-challenge:

=========================
AtoM Javascript Challenge
=========================

There has been a surge in bots that seem to be repeatedly attempting to crawl
sites which leads to DDoS. Defending against this is labour intensive, so AtoM
now includes a JS challenge based bot defense to protect AtoM users who find
themselves facing these attacks.

The main idea is to identify if the browser/tool trying to access AtoM
supports Javascript, or if it is being run in headless mode to filter out
tools like Selenium. Typically if it is a bot making these page requests
then Javascript is not supported, and this challenge traps them in a loop.


.. _js-challenge-setup:

AtoM's JS Challenge configuration
=================================

All settings for the JS challenge are configured in :ref:`config-app-yml` file:

.. code-block:: yaml

   user_challenge:
    activated: true
    test_headless: true
    cookiename_visited: atom_visited
    cookiename_headless: atom_headless
    cookiename_js: atom_js
    salt: 'REPLACE_WITH_SECRET'
    delay_seconds: 5
    cookie_days: 90
    cidr_exceptions:
      - '192.168.1.0/24'
      - '10.0.0.0/8'
    asn_user_agent_exceptions:
      examplebot:
        asn: 12345
        user_agent: ".*ExampleBot.*"
    network_user_agent_exceptions:
      monitoring_tool:
        user_agent: ".*prometheus.*"
        src_net: "159.89.122.75/32"
    country_exceptions:
      canada:
        country: CA
    asn_exceptions:
      - 15169
      - 12345

The specific directives defined in the defaults above are as follows:

- activated: This setting activates the js challenge feature. Valid values are
  “true” and “false”. If “false” the js challenge will not be used.

- test_headless: This setting activates the test to see if the user’s browser
  reports if it is headless. Valid values are “true” and “false”. If the test
  determines the user’s browser is headless, the ‘visited’ cookie will not be
  set and the bot will be stuck in a js challenge loop.

- cookiename_visited, cookiename_headless, cookiename_js:  These three settings
  allow these cookie names to be overridden. Shown above are the default values.

- salt: This is used to ensure that the cookie values are random and specific to
  your AtoM installation. If this setting is not customized with a random
  value, then the cookie contents could be guessed and the JS challenge
  bypassed.

.. IMPORTANT::
  This setting MUST BE SET TO A RANDOM VALUE before activating the js challenge.
  For additional information regarding the setting, see

  * :ref:`js-cookie-dev-env`
  * :ref:`js-salt-notes`

- delay_seconds: This configures the number of seconds the user will wait at
  the challenge page. Default is 5 seconds.

- cookie_days: This configures the number of days that the visited cookie will
  live. Default is 90 days. After 90 days the challenge will need to be
  completed again.

- cidr_exceptions: Lists exceptions by cidr range. If the request IP falls into
  one of these ranges the js challenge will not be required of the requester.

- asn_user_agent_exceptions: Lists exceptions by asn/user agent pairs. If the
  request matches both criteria then the js challenge will not be required of
  the requester. User agent exception supports RegEx.

- network_user_agent_exceptions: Lists exceptions by network/user agent pairs.
  If the request matches both criteria then the js challenge will not be
  required of the requester. Network is specified as a cidr notation range.
  User agent exception supports RegEx.

- country_exceptions: Lists exceptions by GeoIp country code. If the request
  country matches an exception then the js challenge will not be required of
  the requester.

- asn_exceptions: Lists exceptions by asn. If the request asn matches an
  exception then the js challenge will not be required of the requester.

.. _js-config-geoip:

Configure GeoIp
---------------

GeoIp databases are required for the exception functionality for processing
country_exceptions, asn_user_agent_exceptions and asn_exceptions. If GeoIp
is not set up these exceptions will be ignored even if the exceptions are
configured in `app.yml`.

All settings for the JS challenge are configured :ref:`config-app-yml` file:

.. code-block:: yaml

   geoip:
     asn_db_path: \%SF_ROOT_DIR\%/geoip/GeoLite2-ASN.mmdb
     city_db_path: \%SF_ROOT_DIR\%/geoip/GeoLite2-City.mmdb

These two settings determine the path to the ASN and city GeoIp databases which
are required by the JS challenge exception filters. These can be downloaded
`here <https://dev.maxmind.com/geoip/geolite2-free-geolocation-data//>`__

Finishing up installing JS challenge
------------------------------------

After installing the js challenge you should:
1. Clear any cache
2. Update composer dependencies
3. Rebuild BS5 theme

.. _js-cookie-dev-env:

Cookies and the development environment
=======================================

When testing with the AtoM Docker environment you will need to refer to the test
AtoM instance on localhost instead of 127.0.0.1 so that the domain path that
the cookie is scoped to behaves properly.

When using 127.0.0.1, browsers treat it as a literal IP address rather than a
domain name. This means that even if you try to set a domain attribute, the
cookie may not be shared across what you might consider subdomains. In
contrast, localhost is treated specially by many browsers, and cookies set on
localhost tend to work as expected.

For consistent cookie sharing across subdomains in your test environment, it's
best to use a custom domain name that resolves to 127.0.0.1.

.. _js-salt-notes:

Notes about Salt and Cookies
============================

There are a few things to keep in mind regarding the salt and cookies:

1. Salt must be a unique random value.
   The ‘salt’ value contained in the `app.yml` file is used to ensure
   that the hash that is contained in each of the cookies is unique to your
   AtoM site.

   This value must be updated to a unique random value when activating the
   JS challenge.

   If this setting is not customized with a random value when the js challenge
   feature is activated, then the cookie contents could be guessed and the
   JS challenge bypassed.

2. If the salt value is changed after the js challenge feature has been
   activated, all currently issued cookies will be invalidated and all
   users will have the js challenge re-applied the next time they visit
   the site.

3. The salt is used on the server side to create a unique checksum with the
   originating IP address value. This value serves as unique token content
   that MUST be included in the cookies when they are created in the end
   user’s browser. The js running in the browser must receive this unique
   token from the AtoM server - the browser does not know the salt value and
   so cannot guess the checksum helping to ensure that the cookies cannot be
   faked by the requester.

4. If a user clears their browser cache and deletes cookies set in the browser
   this will delete the ‘atom-visited’ cookie as well. Doing so will cause the
   JS challenge to be applied again when the user next visits the AtoM site.

.. _js-flow:

How Javascript Challenge Works
==============================

.. image:: images/JS-challenge-flow.*
   :align: center
   :alt: An image describing the Javascript challenge flow

The above diagram describes how the JS challenge logic flow is applied. New
requests start at “Incoming AtoM request” and proceed downwards. First, the
request is compared to exception filters - if any filters match, the user
will bypass the challenge and be forwarded straight to the application.

Second, if the cookies are not present, then the user will be re-directed
to the admin/challenge action - this is a page that will display the
“Validating you’re not a robot” text and run the JS script in the browser.
If this is successful two cookies will be set: one indicating JS is activated,
and one indicating the browser’s ‘headless’ state.

Thirdly, the user will be redirected back to the AtoM page they originally
requested. If the cookies are present then the ‘atom-visited’ cookie will
be set and the user will be be allowed to visit the page. If these cookies
were not properly set, then a redirect back to the challenge will be sent.

The end result is that legitimate browsers will be able to easily set these
cookies and pass this test. If these cookies are not set because it is not
actually a browser requesting these AtoM pages but a script or a tool like
Selenium, then these users will be caught in a redirect loop and will not
be able to access the AtoM site.

:ref:`Back to top <security-js-challenge>`
