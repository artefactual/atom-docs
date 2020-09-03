.. _customization-authentication:

===================
User authentication
===================

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

.. _ldap-enabling:

Enabling LDAP authentication
============================

TODO
