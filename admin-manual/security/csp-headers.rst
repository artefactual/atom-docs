.. _security-csp-headers:

===============================
Content Security Policy Headers
===============================

Content Security Policy (`CSP`_) headers are a critical component of web security,
serving as a robust defense against a wide range of online threats. These
headers, which are implemented on web servers and embedded within web pages,
define a set of directives that instruct a browser on how to handle and restrict
the execution of various web resources, such as scripts, stylesheets, and
images.

The primary function of CSP headers is to mitigate the risks associated with
cross-site scripting (`XSS`_) attacks, data injection attacks, and other malicious
activities that exploit the trust model of web applications. By specifying which
sources of content are permitted, CSP headers help prevent unauthorized code
execution and reduce the attack surface, enhancing the overall security posture
of web applications.

Starting in AtoM 2.8, AtoM has built in support for CSP headers when Bootstrap 5
based themes are in use. When installing AtoM 2.8 from scratch, there's a
pre-configured CSP directive setting in place which is set to report-only mode by
default. These default settings serve as a foundation compatible with the upgraded
Bootstrap 5 based Dominion theme and can be used as a base for custom themes based
on Dominion.

.. _csp-overview:

Content Security Policy headers
-------------------------------

In a high-level example of web security using Content Security Policy (CSP),
let's consider a scenario. When a user's web browser sends a request to a server
for a particular web page, the server responds by generating the page response
and including a CSP header. This CSP header specifies trusted sources from which
scripts, stylesheets, images, and other assets can be loaded and executed.
Additionally, the server generates a unique nonce (number used once) and adds it
to all inline scripts and other assets within the response.

Once the response is sent to the user's browser, the browser acts as a security
enforcer. It checks each requested resource and script against the CSP
directive. If any resource or script does not match the trusted sources
specified in the CSP header or lacks the correct nonce, the browser rejects those
elements, preventing them from loading or executing. This strict validation
process ensures that only content from trusted sources, as defined by the CSP,
is allowed to run on the webpage. In doing so, CSP effectively protects against
cross-site scripting (`XSS`_) attacks and other security threats, making the
user's browsing experience safer and more secure.

.. image:: images/CSP-sequence-diagram.*
   :align: center
   :width: 90%
   :alt: An image describing the use of CSP headers to validate a requested page.

.. _csp-configuration:

AtoM's CSP configuration
------------------------

This is the default configuration you'll find in AtoM's :ref:`config-app-yml` file:

.. code-block:: yaml

   # Content Security Policy (CSP) header configuration. CSP settings apply
   # only when a B5 theme is active, else these settings are bypassed.
   csp:
       response_header: Content-Security-Policy-Report-Only
       directives: "default-src 'self'; font-src 'self' https://fonts.gstatic.com; img-src 'self' https://*.googleapis.com https://*.gstatic.com *.google.com *.googleusercontent.com data: https://www.gravatar.com/avatar/ https://*.google-analytics.com https://*.googletagmanager.com blob:; script-src 'self' https://*.googletagmanager.com 'nonce' https://*.googleapis.com https://*.gstatic.com *.google.com https://*.ggpht.com *.googleusercontent.com blob:; style-src 'self' 'nonce' https://fonts.googleapis.com; worker-src 'self' blob:; connect-src 'self' https://*.google-analytics.com https://*.analytics.google.com https://*.googletagmanager.com https://*.googleapis.com *.google.com https://*.gstatic.com data: blob:; frame-ancestors 'self';"

.. NOTE::
   This directive includes sources from Google to support AtoMs's Google Analytics and Google
   Maps integrations. If these are not needed, it is possible to remove the Google sources from
   the default directive. If at some future time it was desired to activate Google Analytics
   or Google Maps, these sources would need to be re-added to the directive.

The CSP ``repsonse_header`` setting is used to set the CSP header type and can have one of
two values:

- **Content-Security-Policy**:
  This setting will enforce the defined policy. When set, the browser will block any
  resources (scripts, images, stylesheets, etc.) that violate the policy directives.

- **Content-Security-Policy-Report-Only**:
  This header works similarly to the ``Content-Security-Policy`` but does not block any
  resources allowing developers to test and monitor potential violations without
  affecting the functionality of the web page. This is useful for testing a new policy or
  changes to an existing policy without risking breakage. Violations will be reported to
  the browser's console. This setting is the default.

.. IMPORTANT::
   In order to activate CSP header protection, you will need to update the CSP
   ``response_header`` from ``Content-Security-Policy-Report-Only`` to
   ``Content-Security-Policy`` in your app.yml file.

The CSP ``directives`` setting contains the CSP policy that will be sent in the CSP header.
The value for the ``directives`` setting above is the default when the Dominion theme is
in use. Multiple directives get delineated with a semicolon (``;``).

.. IMPORTANT::
   The value ``nonce`` in the above example is a placeholder and will be replaced
   with a generated unique value when AtoM generates the page response.

The specific directives defined in the defaults above are as follows:

- default-src: If resources aren't mentioned in other sections, this policy is applied.
- font-src: Stipulates which fonts can be loaded.
- img-src: Stipulates which images can be loaded.
- script-src: Stipulates which scripts can be loaded.
- style-src: Stipulates which styles or CSS can be loaded.
- worker-src: Defines valid sources for web workers and nested browsing contexts loaded using elements such as <frame> and <iframe>.
- connect-src: Specifies the URLs that the application can connect to using script interfaces like XMLHttpRequest, fetch, WebSocket, and EventSource.
- frame-ancestors 'self': Determines which domains can embed the page as a frame. This directive restricts who can embed the page in frames, iframes, embeds, or objects.

Specifying ``self`` ensures that only trusted resources from the *same origin* are loaded
and executed.

Updating these settings will require restarting :ref:`PHP-FPM <troubleshooting-restart-php-fpm>`.

.. IMPORTANT::

   CSP headers will only be applied to a response if a Bootstrap 5 based theme is in use. See:
     * :ref:`customization-theming`
     * :ref:`themes`

CSP headers can be deactivated by deleting the CSP section from the :ref:`config-app-yml`
file, saving the file, and restarting :ref:`PHP-FPM <troubleshooting-restart-php-fpm>`.

.. _csp-custom-themes:

Implementing a Content Security Policy For Your Custom Theme
------------------------------------------------------------

1. Begin with a basic CSP directive.

   If your custom theme is derived from AtoM's Dominion Bootstrap 5 theme, begin
   with the baseline CSP directive from AtoM's :ref:`config-app-yml`:

   .. code-block:: none

      Content-Security-Policy-Report-Only: default-src 'self'; font-src 'self'; img-src 'self' https://www.gravatar.com/avatar/ blob:; script-src 'self' 'nonce'; style-src 'self' 'nonce'; worker-src 'self' blob:; frame-ancestors 'self';

   In app.yml this would look like:

   .. code-block:: yaml

      # Content Security Policy (CSP) header configuration. CSP settings apply
      # only when a B5 theme is active, else these settings are bypassed.
      csp:
         response_header: Content-Security-Policy-Report-Only
         directives: "default-src 'self'; font-src 'self' https://fonts.gstatic.com; img-src 'self' https://*.googleapis.com https://*.gstatic.com *.google.com *.googleusercontent.com data: https://www.gravatar.com/avatar/ https://*.google-analytics.com https://*.googletagmanager.com blob:; script-src 'self' https://*.googletagmanager.com 'nonce' https://*.googleapis.com https://*.gstatic.com *.google.com https://*.ggpht.com *.googleusercontent.com blob:; style-src 'self' 'nonce' https://fonts.googleapis.com; worker-src 'self' blob:; connect-src 'self' https://*.google-analytics.com https://*.analytics.google.com https://*.googletagmanager.com https://*.googleapis.com *.google.com https://*.gstatic.com data: blob:; frame-ancestors 'self';"

   For those who have crafted a custom theme, but haven't used AtoM's default Bootstrap 5
   Dominion theme as a foundation, it's recommended to start with a more restrictive
   `content-security-policy` header:

   .. code-block:: none

      Content-Security-Policy-Report-Only: default-src 'self'; font-src 'self'; img-src 'self'; script-src 'self'; style-src 'self'; frame-ancestors 'self';

   In app.yml this would look like:

   .. code-block:: yaml

      # Content Security Policy (CSP) header configuration. CSP settings apply
      # only when a B5 theme is active, else these settings are bypassed.
      csp:
         response_header: Content-Security-Policy-Report-Only
         directives: "default-src 'self'; font-src 'self'; img-src 'self'; script-src 'self'; style-src 'self'; frame-ancestors 'self';"

   These examples reference the ``Content-Security-Policy-Report-Only`` header -
   this header will log violations in Chrome's Developer Tools but will not
   prevent a script from loading and running. This is helpful when developing a
   policy so that the pages and all scripts still load properly - while ensuring
   all violations will be seen in the console log. When the policy definition is
   ready to go live this CSP header type can be changed to ``Content-Security-Policy``
   to activate enforcement.

2. Monitor in the browser watching for CSP violations.

   In Chrome's Developer Tools, click on the "Console" tab. This tab displays logs,
   errors, and warnings related to the webpage you are inspecting.

   In the Console, look for messages that begin with ``Content Security Policy``. These
   messages indicate CSP violations. CSP violation messages typically include
   information about what part of the policy was violated and what resource was blocked.

3. Look for and fix any violations by adding nonce to inline script, style, etc.

   Alongside each CSP violation message in the Console, Chrome provides the source
   file's name and the line number where the violation occurred. This information
   is useful for pinpointing the exact part of your code responsible for the violation.

   Use "view source" to find the implicated line and find the violation in the
   underlying code. Most of these are going to be inline assets - scripts, styles, etc.
   See: :ref:`csp-allow-inline-sources`.

4. Activate policy enforcement.

   Once you are convinced you've caught all the violations, activate enforcement
   of the CSP policy by changing the header from
   ``Content-Security-Policy-Report-Only`` to ``Content-Security-Policy``.

.. _csp-allow-inline-sources:

Safely Allowing Inline Sources
------------------------------

If your application has inline scripts there are 4 choices:

1. Usage of ``unsafe-inline`` should be avoided.

   Allowing ``unsafe-inline`` in a CSP directive permits inline scripts or styles from
   any source to run. While it offers design flexibility, it's discouraged due to
   heightened risk of XSS attacks. This setting can expose web applications to
   malicious script injections, undermining CSP's security benefits and so using
   ``unsafe-inline`` should be avoided.

2. Add the hash of the script to the CSP directive.

   Adding a script's hash to the CSP directive allows for specific inline scripts
   to execute based on their hashed content. While this method ensures only the
   approved script runs, it's fragile because any change to the script's content
   requires recalculating and updating its hash in the CSP. This can be cumbersome
   and error-prone, especially with frequent script modifications.

   In addition, if there are a large number of violations, there could mean a lot of
   hashes to add, creating a very messy CSP directive.

3. For a given request generate a random nonce value to be returned in the CSP
   header directive and on each inline script, style etc tag.

   Each inline script or style has to be flagged as 'ok' with a nonce (a random
   token) value that is uniquely generated for a specific request/response pair.
   This nonce must be included in the Header directive, and in each inline script
   (or style, font, img source) tag. If your application has lots of inline
   scripts, styles and whatnot this could be a lot of work, but it will be
   more robust than using script hashes.

   .. code-block:: none

      Content-Security_policy-Report-Only: default-src 'self'; font-src 'self'; img-src 'self' https://www.gravatar.com/avatar/ blob:; script-src 'self' 'nonce-abcd1234567890'; style-src 'self' 'nonce-abcd1234567890'; worker-src 'self' blob:; frame-ancestors 'self';

4. Remove the inline asset! Refactor the code to move the inline asset to the
   script and style bundle. If it's an inline style can it be replaced with a
   Bootstrap 5 equivalent?

Work completed to make the Dominion theme compatible with CSP headers can be viewed
in this `AtoM CSP commit`_. This commit provides examples of how to refer to the nonce
value generated by AtoM from your theme templates, and examples of refactoring code to
remove inline styles in favour of Bootstrap 5 equivalents.

.. _csp-allow-external-sources:

Allowing External Sources
-------------------------

If for example the application makes use of Gravatar assets, we could allow them by
adding:

.. code-block:: none

   Content-Security-Policy-Report-Only: default-src 'self'; font-src 'self'; img-src 'self' https://www.gravatar.com/avatar/; script-src 'self'; style-src 'self'; frame-ancestors 'self';

Note it is good to be as specific as possible without creating a maintainance
headache when specifying the domain. E.g. if all assets are loaded from the
``avatar`` endpoint, then it is better to be more specific than allow scripts
to be run from the entire ``https://www.gravatar.com`` domain.

If your theme makes use of other services beyond Google Analytics, or the Maps API, then
you may need to whitelist additional sources. We recommend consulting the vendor's
documentation for this. For example, Matomo Analytics provides the following configuration
tips:

* https://matomo.org/faq/general/faq_20904/

.. SEEALSO::

   Additional AtoM documentation links related to Google service integrations:

   * :ref:`maintenance-web-analytics`
   * :ref:`maps-api-key`

.. _`AtoM CSP commit`: https://github.com/artefactual/atom/commit/d796a1f7252aa6ce6c4ef611fac91939584df00b
.. _`CSP`: https://en.wikipedia.org/wiki/Content_Security_Policy
.. _`XSS`: https://owasp.org/www-community/attacks/xss/
