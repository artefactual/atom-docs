.. _customization-authentication:

===================
User authentication
===================

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM defaults to using local user authentication, which stores user details
such as email addresses and passwords in the AtoM database. It is possible
to configure AtoM to instead integrate with existing Single sign-on services
using the `CAS <https://www.apereo.org/projects/cas>`_ or
`LDAP <https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol>`_
protocols.

**Jump to**:

* :ref:`cas-enabling`
* :ref:`cas-groups`
* :ref:`ldap-enabling`

.. SEEALSO::
   
   * :ref:`customization-config-files`
   * :ref:`log-in`
   * :ref:`read-only-mode`

.. _cas-enabling:

Enabling CAS authentication
===========================

AtoM can be configured to authenticate users using
(`CAS <https://www.apereo.org/projects/cas>`_) Single Sign-On instead of local
authentication. When this is enabled, users attempting to log in will be
redirected to a CAS server for authentication. After successfully
authenticating, a user account will be created for them in AtoM if one does
not exist already. Logging out from AtoM will then log the user out from both
AtoM and the CAS server.

Enabling CAS authentication requires manually editing a few AtoM config files.
For more information on how to do this, see
:ref:`Manage AtoM configuration files <customization-config-files>`.

The first thing to do is to activate the ``arCasPlugin``. This can be done by
by adding the plugin name to the ``$plugins`` array in 
``config/ProjectConfiguration.class.php``.

.. IMPORTANT::

   While the plugin could technically be enabled by an :term:`administrator` 
   logging in and enabling it in the :term:`user interface` via |gears| 
   **Admin > Plugins**, doing so would require authenticating locally without
   CAS enabled - and the additional configuration file changes described below
   will not yet be in place. 

   For security best practices, we recommend a system administrator enable
   the plugin using the method described above, so no local authentication 
   accounts are stored in AtoM when the intention is to use CAS. 

Next, configure the CAS settings (CAS version, server name, server port, server
path, and server SSL certificate) in the ``arCasPlugin``'s ``app.yml`` config
file with the details of the CAS server you wish to use for authentication.
AtoM supports use of CAS versions ``1.0``, ``2.0``, and ``3.0``. The plugin's
default settings make use of a public demo CAS server which can be used for
testing basic CAS login and logout functionality using the username ``admin``
and password ``django-cas-ng``.

.. WARNING::

   While CAS server SSL validation can be disabled for development, we strongly
   discourage doing so in a production environment.

For further information and additional configuration options, see the 
:ref:`customization-config-files` documentation - specifically: 

* :ref:`cas-app-yml`

Next, change the default login module to ``cas`` in 
``apps/qubit/config/settings.yml``.

Finally, change the user class to ``casUser`` in 
``apps/qubit/config/factories.yml``.

.. TIP::

   Whenever you make changes to  AtoM's configuration files, remember to clear
   the cache and restart PHP-FPM to apply the changes. See: 

   * :ref:`maintenance-clear-cache`
   * :ref:`troubleshooting-restart-php-fpm`

.. _cas-groups:

Setting AtoM group membership from CAS user attributes
------------------------------------------------------

AtoM CAS support can be optionally configured to automatically set each user's
AtoM user group membership based on the presence or absence of expected values
in user attributes returned by a CAS server during authentication. When
enabled, this entitlement check occurs on each login so that changes made to
group membership on the CAS server are reflected in AtoM on the next login.

.. IMPORTANT::

   Use of this feature requires CAS version 3.0. Earlier versions of the CAS
   protocol do not support release of user attributes.

This feature is enabled via settings in the the ``arCasPlugin``'s ``app.yml``
config file.

First, enable the feature by setting ``set_groups_from_attributes`` to
``true``.

Next, set the CAS attribute whose values will be checked to determine group
membership in ``attribute_key``.

Finally, set the ``attribute_value`` of each group in ``user_groups`` to match
the expected value for that group in the CAS attributes.

Groups can be added or removed from ``user_groups`` as desired. Only groups
that are properly configured with an ``attribute_value`` and a valid
``group_id`` will be used to set AtoM group membership on login.

.. NOTE::

   When this option is enabled, any changes that an administrator makes in 
   AtoM to a user's group membership will not persist and be overwritten on 
   the next CAS login.

:ref:`Back to top <customization-authentication>`

.. _ldap-enabling:

Enabling LDAP authentication
============================

.. _LDAP: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol

AtoM can also be configured to authenticate users using `LDAP`_, an "open,
vendor-neutral, industry standard application protocol for accessing and 
maintaining distributed directory information services over an Internet 
Protocol (IP) network" (Wikipedia). When this is enabled, users attempting to 
log in will use the credentials associated with their LDAP account, instead 
of local account credentials, when :ref:`logging in <log-in>` to AtoM. 

LDAP authentication in AtoM, by default, uses StartTLS for encryption. StartTLS
starts an unencrypted plaintext connection to the LDAP server, on port 389, then
upgrades the connection to begin Transport Layer Security (TLS) encryption. The
use of StartTLS is on by default, but can be disabled via settings in the
:ref:`app.yml <config-app-yml>`.

.. WARNING::

   While StartTLS encryption on the LDAP server can be disabled, we strongly 
   discourage doing so in a production environment.

.. IMPORTANT::
   To enable LDAP authentication in AtoM, manually installing the ``php-ldap``
   extension is required.

Enabling LDAP authentication in AtoM requires manually installing the LDAP extension
and editing a few AtoM configuration files. For more general information on how
to do this, see :ref:`Manage AtoM configuration files <customization-config-files>`.

First, we'll need to install the php LDAP extension:

.. code-block:: bash

   sudo apt-get install php-ldap

Next, make a small change in the ``config/factories.yml`` configuration file.
You can open this file with ``nano`` or another text editor to make the changes.
Starting from AtoM's root installation directory, run:

.. code-block:: bash

   sudo nano config/factories.yml

.. IMPORTANT:: 

   If you are making these changes on an AtoM installation **after** it has 
   already been installed and configured, then the file you should modify will be
   found at ``apps/qubit/config/factories.yml``.  

   During the final configuration steps of the installation process, AtoM will 
   copy the default values from the original ``config/factories`` version into 
   a new ``apps/qubit/config/factories.yml`` version, which will take precedence
   going forward. If your AtoM installation is already complete, this second one 
   will be the file you'll want to change.

   If you're not sure, check for a file at ``apps/qubit/config/factories.yml`` 
   while making changes. If it exists, make the changes in this file. Note that 
   applying the changes in both files will work fine as well. 


In the file you'll find the following section: 

.. code-block:: bash

    user:
      class: myUser
      param:
        timeout: 1800 # Session timeout in seconds

Change the ``myUser`` value to ``ldapUser``: 

.. code-block:: bash

    user:
      class: ldapUser

Exit and save your changes, then clear the application cache and restart PHP-FPM.

* :ref:`maintenance-clear-cache`
* :ref:`troubleshooting-restart-php-fpm`

After doing so, a new configuration section will be available in |gears| 
**Admin > Settings**, where you can define your LDAP authentication settings: 

.. image:: images/ldap-config.*
   :align: center
   :width: 90%
   :alt: An image of the LDAP authentication settings

The **Host** field expects the hostname or IP address of the LDAP server. 

The **Port** field should be the port on which your LDAP server will listen for 
connections. The industry standard default port for LDAP connections is ``389`` 
- by default, AtoM will populate this field with ``389``. Try this if you're not 
sure what port your LDAP server is using. 

Base DN and Bind Lookup Attribute - overview
--------------------------------------------

These two elements are what AtoM will use to determine which LDAP entry the
authentication attempt should be compared against.

The **Base DN** will provide AtoM with the common parts of an LDAP entry on 
your server that won't change per user - basically, where to look in the LDAP 
directory tree to find general user information. 

Every LDAP entry consists of a set of attributes. LDAP entries are stored in a 
tree-like directory structure, so the information provided in this field should 
give AtoM enough information to find the subdirectory that contains your unique 
users. Configuring this field in AtoM will require an understanding of how your 
LDAP server is configured. 

Every LDAP entry will have a Distinguished Name (**DN**) that uniquely identifies 
that entry and its position in the directory information tree (DIT) hierarchy, 
similar to the path to a file on a filesystem. 

Each LDAP DN is composed of zero or more elements called relative distinguished 
names (RDNs), and each RDN is composed of at least one attribute-value pairs. 
There are several commonly used attributes, such as: 

* **cn**: Common name. For example, "John Doe"
* **sn**: Surname. For example, "Doe"
* **uid**: User ID. Because a DN indicates directory location, it's possible a 
  DN may change over the lifetime of the entry, for example if an entry is moved 
  within the directory's information tree hierarchy. Including a unique ID for 
  each entry means this can be used in a DN. For example, ``jdoe01``. 
* **dc**: Domain component. For example, If the base domain name of the LDAP 
  server is found at ``ldap.example.com``, then the domain components for an 
  entry might be ``dc=ldap,dc=example,dc=com`` with each part of the full domain
  being one domain component. 
* **mail**: Email address associated with the entry. For example, 
  `` john.doe@example.com``.
* **ou**: Organizational unit. Typically represents a directory used in your 
  LDAP directory hierarchy, such as ``Users``. 
* **userPassword**: the password associated with the particular user defined in 
  the LDAP entry. 

There are a number of other attribute key-value pairs often used as well for 
capturing additional information about the entry and its location in the 
directory tree, but those listed above include the elements we need to configure
AtoM's Base DN. 

Meanwhile, the **Bind Lookup Attribute** setting in AtoM will specify which 
attribute should be used to uniquely identify the user. This attribute value 
will tell AtoM which LDAP attribute to compare against the value entered into 
the "Email" field in AtoM's login panel. While the Base DN values will be 
common to all LDAP entries, the attribute selected for Lookup should be unique. 
An example: 

.. code-block:: bash

   dn: uid=jdoe01,ou=atomUsers,dc=example,dc=com
       ^^^        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
       Lookup     Base DN

When authenticating a user, AtoM will use the Base DN and Bind Lookup
Attribute values together to identify the relevant target LDAP entry that is
used for validating the authentication attempt. This means:

* Whatever is set as the Bind Lookup Attribute in AtoM's settings should match 
  what users logging in with LDAP will enter into the AtoM login panel's 
  "Email" field. 
* Whatever password a user enters into the AtoM login panel's "Password" field
  should match the ``userPassword`` value in their LDAP directory entry. 

Configuring the Base DN and Bind Lookup Attribute settings
----------------------------------------------------------

The **Base DN** setting in AtoM *must* include any ``ou`` (organizational unit) 
directory component that target users are contained in on the LDAP server, plus 
any domain components (``dc``) required to find the information. AtoM will use
this to be able to find where individual LDAP entries are stored within the 
LDAP server's directory tree. each attribute key/value pair should be entered
separated by commas, with no spaces between them. 

For example, if the target LDAP server has user accounts in an 
Organizational Unit called "atomUsers" on a server with a domain of 
``example.com``, then the Base DN setting in AtoM would be entered as: 

.. code-block:: bash

   ou=atomUsers,dc=example,dc=com 

The **Bind Lookup Attribute** should be whatever attribute in your LDAP entries
will be globally unique, unlikely to change, and used to identify individual 
users. If you want the login experience to match AtoM's current expectations 
(using an email address in the username field) and your LDAP server is configured
to use **mail** attributes for every user, then you would enter ``mail`` into
this field. 

If ``mail`` is not used in your LDAP server, ``uid`` is a good option, as this
typically shouldn't change even if the entry moves in the LDAP directory tree. 
Barring that, ``cn`` could be used. Whatever is picked will define what type of
information end users attempting to authenticate in AtoM should enter into the 
login panel's "Email" field. 

.. image:: images/ldap-config-example.*
   :align: center
   :width: 90%
   :alt: An image of example values in the LDAP authentication settings

In the above example, users would enter their LDAP username into AtoM's
"Email" field in the login menu. If ``cn`` were used as the lookup attribute
instead, then users would need to enter their LDAP common name.

After configuring the LDAP settings
-----------------------------------

Once configured, users registered on the LDAP server should now be able to
authenticate with their LDAP credentials to log into AtoM. 

When a user authenticates for the first time, a new AtoM user is created in the 
database. However, by default, this user is **not assigned to any user groups**,
and will therefore only have the base permissions of the Authenticated user 
group. An :term:`administrator` can modify the user permissions after the 
new user has been created using AtoM's permissions module - for more information, 
see: 

* :ref:`edit-user-permissions`
* :ref:`manage-user-accounts`

.. IMPORTANT:: 

   If switching to LDAP authentication *after* creating and configuring local
   user accounts in AtoM, the most secure method to transition will likely be to 
   **delete** the local user accounts and let the LDAP authentication create new 
   ones, so that no passwords are stored in AtoM and no duplicate accounts exist. 

  The following points summarize how AtoM will attempt to validate authentication
  attempts when there are existing user accounts: 

   * As a first step, AtoM will check if a local account matches the user
     credentials if no LDAP match is found. This can allow users with existing
     local accounts to bypass the LDAP authentication, and/or continue
     accessing AtoM even if the LDAP entry is removed.
   * If a match IS found, AtoM will attempt to look for existing accounts by
     comparing the LDAP lookup attribute (user name, etc) against the emails
     stored in AtoM's user table (which are used for local authentication).
     This means that if the lookup attribute configured is **not** ``mail``,
     then a new account could be created, leaving the user with both a local
     user account and a newly created user account.
   * If no local account match is found, AtoM will create a new default user, 
     whose only initial permissions in AtoM will be those of the Authenticated
     :term:`user group`. No password will be stored in AtoM with this method, 
     since the LDAP server handles authentication. This is the default behavior 
     in AtoM when LDAP is enabled and no user accounts are present.

.. _oidc-enabling:

Enabling OIDC authentication
============================

AtoM can be configured to authenticate users using OpenID Connect (OIDC) instead
of local authentication. When this is enabled, users attempting to log in will be
redirected to an external identity and access management (IAM) server for
authentication. After successfully authenticating, a user account will be created
if one does not exist already. Logging out from AtoM will then log the user out
from both AtoM and the IAM server.

Enabling OIDC authentication requires manually editing a few config files.
For more information on how to do this, see :ref:`customization-config-files`

.. NOTE::

   Proper operation of the OIDC Plugin requires configuring AtoM with an external
   cache. See :ref:`oidc-cache-configuration` for more information.

Enable the plugin
-----------------

Create an empty file named ``activate-oidc-plugin`` in the root of the AtoM
installation to enable the OIDC plugin. Permissions and ownership of this file
should match the other folders in the AtoM folder.

Add the plugin name to the ``$plugins`` array in ``config/ProjectConfiguration.class.php``

.. image:: images/enable-oidc-plugin.*
   :align: center
   :width: 90%
   :alt: Plugin name ``arOidcPlugin`` added in the ``$plugins`` array.

.. IMPORTANT::
   For security best practices, instead of having an administrator enabling the
   plugin in the user interface, have a system administrator enable the plugin
   as outlined above to avoid local authentication accounts stored in AtoM.

Next, change the default login module to OIDC in ``apps/qubit/config/settings.yml``.

.. image:: images/configure-oidc-login-module.*
   :align: center
   :width: 90%
   :alt: Set ``login_module`` to ``oidc``.

Finally, change the user class to ``oidcUser`` in ``apps/qubit/config/factories.yml``.

.. image:: images/configure-oidc-user-class.*
   :align: center
   :width: 90%
   :alt: Update user class to ``oidcUser``.

Configure the OIDC settings in the plugin's ``app.yml`` file
------------------------------------------------------------

Next, configure the OIDC settings in the ``arOidcPlugin``'s ``app.yml`` config file
with the details of the OIDC endpoint for authentication.

.. WARNING::
   While OIDC endpoint TLS validation may be disabled for development, it is
   strongly discouraged to do so in a production environment.

Update the ``providers`` array:

.. image:: images/configure-oidc-settings-providers.*
   :align: center
   :width: 90%
   :alt: Update the ``providers`` array in ``arOidcPlugin``'s ``app.yml``.

One or many OIDC providers can be configured in the ``app.yml``. Each provider will
have separate configuration for the following settings:

.. NOTE::
   If changing the primary provider name from the default ``primary``, uncomment
   the setting ``primary_provider_name`` and specify the name of the primary provider.
   Secondary providers can be named and triggered for use by specifying a query
   param on the referring URL before pressing “Log in with SSO”. The query selector
   name can be configured with the ``provider_query_param_name`` setting.

**url**

OIDC provider authentication redirect URL:

Default for Dex in oidc-demo: http://dex:5556/dex

Default for Keycloak direct in oidc-demo: http://keycloak:8080/realms/artefactual

**client_id**

The client identifier registered with the identity provider. This identifies a
particular application instance authorized to connect to the OIDC provider for
authentication services.

**client_secret**

The credential secret for the defined client.

**primary_provider_name**

Identifies the primary OIDC provider and corresponds to an entry in ``providers``
above. The default provider name is ``primary``. If this setting is not defined,
the default provider named ``primary`` will be set.

This is the provider that will be selected for authentication when a user selects
“Log in with SSO”.

**provider_query_param_name**

This setting enables the use of additional providers and identifies the name of
the query param that can be added to the referring URL when selecting "Log in with
SSO" button. The use case for this functionality is to allow support
accounts not included in the primary IAM endpoint authenticate.

To use, append the query param and the provider name to the URL before selecting
"Log in with SSO". This must be uncommented to activate use of secondary providers.

Ex. Use the ``sample_provider`` provider by modifying the URL before pressing "Log
in with SSO":
``http://127.0.0.1:63001/index.php?secondary=sample_provider``

**redirect_url**

URL that Keycloak should redirect back to once the authentication process 
completes.

**send_oidc_logout**

This boolean value indicates to the OIDC plugin whether the IAM endpoint
supports OIDC logout and this is safe to send. Keycloak supports this functionality
so it is safe to send. For Dex, this should be set to ``false``.

**logout_redirect_url**

Use this setting to configure the URL to redirect to on Logout. This parameter
is only used if ``send_oidc_logout`` is ``true``.

**enable_refresh_token_use**

Enables use of OIDC refresh tokens to periodically check-in with the IAM service
to extend the user's session and ensure it has not been ended.

When set to ``false``, user will remain authenticated until the user ends the 
session in AtoM - in this case AtoM will not check if the session is still
valid in the backend IAM system.

When set to ``true``, AtoM will check in with the backend IAM system at intervals
determined by the refresh token expiry setting in the IAM system (ex. Keycloak).
This is dependent on a user actively using AtoM - an idle AtoM session will let
the refresh tokens expire. Active sessions can be viewed and ended on the IAM side
(ex. in Keycloak). AtoM will discover sessions have been ended the next time it
refreshes the tokens.

**server_cert**

OIDC server TLS certificate location for server validation. Accepts a file path
or ``false`` (to disable).

It is recommended to refer to an external file for the ``server_cert`` rather than
pasting the cert value into ``app.yml``.

It is also recommended to have the ``server_cert`` file NOT be located in the AtoM
application folder in a production setting. If the ``server_cert`` file is located
in the AtoM folder there is a risk that a misconfiguration in the nginx config
could expose the ``server_cert`` to the network.

**scopes**

OIDC scopes are used by an application during authentication to authorize access
to a user's details, like name and email address.

**set_groups_from_attributes**

Setting to activate parsing OIDC groups into AtoM group membership. AtoM will
attempt to translate OIDC groups to AtoM groups if ``true``. When activated, AtoM
will refresh a user's groups in AtoM from the IAM system each time they login to
ensure they are up-to-date.

If this setting is ``false``, groups parsing will not occur and the user will only
have the group ``authenticated`` on first log in. In this case, an AtoM admin will
have to manually assign groups to the user after they authenticate the first time.

See :ref:`oidc-user-groups` for more information.

**user_groups**

This setting maps OIDC roles to AtoM groups. The data structure is as follows:

.. image:: images/configure-oidc-user-groups.*
   :align: center
   :width: 90%
   :alt: Configure OIDC user_groups in `app.yml`.

This entry maps the OIDC group ``atom-admin`` to the group administrator.
The ``group_id`` is a database id - this value should not be changed for a default
installation.

**roles_source**

This setting identifies the token which contains role claims. Options are
``access-token``, ``id-token``, ``verified-claims``, or ``user-info``. Option
``set_groups_from_attributes`` must be ``true`` to enable.
Default is ``access-token``.

**roles_path**

This setting identifies the location of role claims within the token identified
in ``roles_source`` above. This is an array containing the node path to locate the
roles array within the OIDC token. By default this is found in Keycloak's access
token under ``realm_access/roles``.

**user_matching_source**

This setting identifies how IAM users are matched to users in AtoM. There are two
valid options:

``user_matching_source: oidc-email`` or ``user_matching_source: oidc-username``

Using ``oidc-username`` will work without additional scopes being requested.

Using ``oidc-email`` requires the email scope to be set above in the scopes setting.
Email is an optional user setup field in Keycloak but MUST be set if matching to
pre-existing user accounts by email is going to work.

See :ref:`oidc-user-groups` for more information.

**auto_create_atom_user**

Activate or disable the automatic creation of user records from OIDC endpoint
details. Allowed settings are:

``true`` (default): AtoM will automatically create a user record on first login.

``false``: AtoM will not automatically create a user record on first login - user
must be created in advance to successfully authenticate.

If this setting is ``false``, the User settings page will allow users to be
created and deleted. When this setting is ``true``, the ability to create and delete
users is suppressed - users will automatically be created from details received
from the OIDC endpoint.

Clear the cache
---------------

After updating the settings listed above, clear the Symfony cache:
``php symfony cc`` and restart ``php-fpm``.

Deactivating the OIDC plugin
----------------------------

Deactiviating the OIDC plugin is a matter of reversing the steps taken to enable
the plugin.

First, delete the plugin name ``arOidcPlugin`` from the ``$plugins`` array in
``config/ProjectConfiguration.class.php``.

Then, revert the default login module to its original value of ``user`` in
``apps/qubit/config/settings.yml``.

Finally, revert the user class value to ``myUser`` in ``apps/qubit/config/factories.yml``.

At this point, clear all caches and restart ``php-fpm``.

.. NOTE::
   User records created while the OIDC plugin was activated will require an
   administrator to set a password for the user as these fields will be ``NULL``
   in the database.

   Any group membership settings applied to users while the OIDC plugin was
   activated will remain set.

.. _oidc-user-groups:

Set user groups from OIDC groups
--------------------------------

User groups can be configured automatically based on user groups returned by OIDC
endpoint during authentication. When enabled, this entitlement check occurs on
each login so that changes made to group membership on the IAM server are reflected
in AtoM on the next login.

Enable via settings in the ``plugins/arOidcPlugin/config/app.yml``:

First, enable the feature by setting ``set_groups_from_attributes`` to ``true``.

Then, set the ``roles_source`` and ``roles_path`` to identify where to look for OIDC
roles in the tokens returned from the OIDC enpoint. AtoM can be configured to look
for role info in a few locations:
``access-token``, ``id-token``, ``verified-claims``, or ``user-info``

Finally, set the ``attribute_value`` of each group in ``user_groups`` to match the
expected value for that group in the OIDC token.
Groups can be added or removed from ``user_groups`` as desired. Proper configuration
of ``attribute_value`` and a valid ``group_id`` are required to set group
membership on login.

.. NOTE::
   When enabled, changes made by an administrator will be overwritten on the next
   OIDC login.

If ``set_groups_from_attributes`` is set to ``false``, an administrator will need
to manually assign and administer group membership for each user. OIDC
authenticated users will, by default, only have the ``authenticated`` group membership.

.. IMPORTANT::
   An administrator user must exist before activating the OIDC plugin if OIDC group
   membership mapping is **DEACTIVATED**. This user will be required to assign
   group memberships to new users. See :ref:`cli-promote-user-admin` for more information.

Implications for user records created prior to activating OIDC plugin
---------------------------------------------------------------------

**Matching OIDC user info to existing users**

AtoM user record must match the IAM user record. Set ``user_matching_source`` to
either ``oidc-email`` or ``oidc-username``. Mismatch will result in a new user
record to be created.

**Existing password and salt fields**

Once the OIDC plugin is activated, existing password hashes stored in user records
will no longer be used, but valid again if the OIDC plugin is deactivated. If it
is desired that users should **NOT** be allowed to authenticate locally, the
password hash and salt fields must be deleted or set to ``NULL`` in the database.

.. _oidc-cache-configuration:

OIDC Cache Configuration
------------------------

External cache is required for the correct operation of the OIDC plugin authentication
flow. To configure an external cache, the storage class definition in ``factories.yml``
needs to be implemented in ``QubitCacheSessionStorage`` instead of ``QubitSessionStorage``.

The default ``factories.yml`` storage definition is incompatible with the OIDC
plugin authentication redirect pattern.

.. code-block:: bash

   storage:
     class: QubitSessionStorage
     param:
       session_name: symfony
       session_cookie_httponly: true
       session_cookie_secure: true

Example using ``QubitCacheSessionStorage``, demonstrating configuration for
Memcache as backend.

.. code-block:: bash

   storage:
     class: QubitCacheSessionStorage
     param:
       session_name: symfony
       session_cookie_httponly: true
       session_cookie_secure: true
       cache:
         class: sfMemcacheCache
         param:
           host: <memcache-host>
           port: <memcache-port>
           prefix: atom
           storeCacheInfo: true
           persistent: true

Example using ``QubitCacheSessionStorage`` to connect to APC cache backend.

.. code-block:: bash

   storage:
     class: QubitCacheSessionStorage
     param:
       session_name: symfony
       session_cookie_httponly: true
       session_cookie_secure: true
       cache:
         class: sfAPCCache
         param:
           storeCacheInfo: yes
           prefix: atom-public
           host: <apc-host>
           port: <apc-port>
           persistent: yes

:ref:`Back to top <customization-authentication>`