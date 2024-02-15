.. _oai-pmh:

==============
OAI Repository
==============

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM has the ability to act as a data provider to service providers interested
in harvesting descriptive metadata from AtoM, by exposing either simple Dublin
Core XML or EAD 2002 XML via OAI-PMH, the Open Archives Initiative Protocol
for Metadata Harvesting (version 2.0).

The Open Archives Initiative describes OAI-PMH as follows:

    The Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH) is a
    low-barrier mechanism for repository interoperability. Data Providers are
    repositories that expose structured metadata via OAI-PMH. Service Providers
    then make OAI-PMH service requests to harvest that metadata. OAI-PMH is a
    set of six verbs or services that are invoked within HTTP.

More information about the Open Archives Initiative, and about the OAI-PMH
specification, can be found at:

* http://www.openarchives.org/pmh/

Below you will find basic information on how to enable AtoM's OAI plugin, how
to set up AtoM's OAI repository parameters, and some basic examples of
requests and responses using the OAI-PMH verbs supported by AtoM.

**Jump to:**

* :ref:`oai-pmh-plugin`
* :ref:`oai-pmh-settings`
* :ref:`oai-pmh-api-key`
* :ref:`cache-xml-oai`
* :ref:`oai-pmh-verbs`

.. _oai-pmh-plugin:

Enable the OAI plugin in AtoM
=============================

Before being able to expose metadata to a harvester request, the arOaiPlugin
must be enabled. You must be logged in as an :term:`administrator` to manage
plugin settings.

To enable the OAI plugin, navigate via the :term:`main menu` to |gears|
**Admin > Plugins**. AtoM will redirect you to the :ref:`Plugins <manage-plugins>`
page.

Ensure that the checkbox next to the **arOaiPlugin** is checked - if it is not,
check the box and then save the change using the Save button located in the
:term:`button block` at the bottom of the page.

.. TIP::

   Setting not taking effect? In some cases, a system administrator with access
   to the command-line may have to restart your webserver and php-fpm for the
   changes to take effect. We also recommend clearing the application cache. If
   you are using our recommended installation configuration (see:
   :ref:`installation-ubuntu`) such as Nginx for your web server, you can restart
   these services with the following commands from the root directory of your
   AtoM installation:

   .. code:: bash

      sudo service nginx restart
      sudo systemctl restart php7.4-fpm
      php symfony cc

After enabling the OAI plugin, you will want to make sure that you have
properly configured AtoM's OAI repository settings.

.. SEEALSO::

   * :ref:`manage-plugins`

.. _oai-pmh-settings:

Configure AtoM's OAI repository settings
========================================

The settings for AtoM's OAI repository are maintained in |gears| **Admin >
Settings > OAI repository**. You must be logged into AtoM as an
:term:`administrator` to access these settings. A brief explanation of each
field in the OAI repository settings page is included below.

To configure the settings, navigate via the :term:`main menu` to |gears|
**Admin > Settings**. AtoM will redirect you to the Settings page. Select the
"OAI repository" link in the menu on the left side of the page, and AtoM will
load the OAI repository settings.

.. image:: images/oai-repository.*
   :align: center
   :width: 70%
   :alt: An image of the OAI repository menu in AtoM

You can now make changes to configure your the OAI repository in AtoM.
Remember to save your changes when complete, using the :term:`button block`
located at the bottom of the page.

OAI repository settings field descriptions
------------------------------------------

**Require API key authentication**

A Boolean value (e.g. true [yes] or false [no]) that determines if requests
will be accepted from any harvester, or if only those requests which include
an authorized API key will receive responses. Instructions on how to configure
an API key per AtoM :term:`user account` are included below - see:
:ref:`oai-pmh-api-key`.

The default setting in AtoM is "no" - meaning if you have enabled the OAI
plugin, any harvester can make requests to AtoM. The API key setting allows an
:term:`administrator` to enable the OAI repository in AtoM, while restricting
responses to requests that include a valid API key in the HTTP header of the
request.

.. SEEALSO::

   * :ref:`oai-pmh-api-key`
   * :ref:`manage-user-accounts`

**OAI repository code**

An alpha-numeric code can be added in the value field to uniquely identify this
particular OAI repository within its network domain to create a unique, OAI
compliant identifier.

This field will **only accept letters and numbers** - any attempt to enter a symbol
(e.g. a dash, underscore, or other special character) may break the OAI
repository functionality. This will be indicated by the lack of an OAI
repository identifier or sample OAI identifier in the controlled fields below,
and by the tooltip that appears above the OAI repository code field:

.. image:: images/oai-repository-bad.*
   :align: center
   :width: 70%
   :alt: An image of the OAI repository menu in AtoM when a bad value is
         entered into the repository code field.

The value of the repository code will be combined with the base URL of your
AtoM site to construct the OAI repository identifier.

**Administrator email(s)**

The OAI-PMH specification notes that at least one repository administrator's
email address should be included as part of a response to an
:ref:`Identify <oai-identify>` request. This field allows an
:term:`administrator` to enter one or more email addresses which will be
included as part of AtoM's response.

Multiple email addresses can be entered in this free-text field, separated by
commas. See the :ref:`Identify <oai-identify>` example response below to see
how they are typically returned in a response to an Identify request.

.. WARNING::

   AtoM does not currently enforce any validation on this field - that is,
   AtoM does not force you to populate this field with any values, and email
   addresses are not checked for accuracy before being inserted into a
   response. Make sure you double-check that you've input your email addresses
   correctly!

**OAI repository identifier**

This is an auto-generated setting that produces an OAI compliant repository
identifier, which includes OAI repository code value if it is set. The
repository identifier is a combination of the base URL for your AtoM site, and
the repository code entered in the field above, separated by a colon.

**Sample OAI identifier**

This is an example of the auto-generated, OAI compliant identifier which is
created for each item in this particular OAI repository. The sample OAI
identifier is returned as part of the response to an OAI
:ref:`Identify <oai-identify>` request submitted by a harvester.

**Resumption token limit**

This relates to the number of :term:`entities <entity>` to include in a single
OAI response list before inserting a resumption token. The default setting in
AtoM is 100 (e.g. 100 identifiers would be returned in response to a
:ref:`oai-list-identifiers` request from a harvester, before a resumption
token would be issued and the request terminated). Setting a resumption token
limit avoids the possibility that large requests (such as
:ref:`oai-list-records`) will time out the system.

When the resumption token limit is reached, AtoM will end the response with a
resumption token. A harvester can then use the resumption token to submit a new
request that continues where the previous one terminated.

.. WARNING::

   Setting this value too high can result in performance issues, as AtoM may
   time out during the response to a request. We recommend keeping this value
   at 100 or lower.

**Enable additional OAI sets**

This setting allows AtoM to expose "virtual sets." Currently in AtoM, each
:term:`archival unit` (e.g. a description and all its
:term:`children <child record>`, such as a :term:`fonds`, :term:`collection`,
etc) is considered a set and is given a ``<setSpec>`` value when responding to
requests such as :ref:`oai-list-sets` or :ref:`oai-list-records`.

However, thanks to the flexible nature of OAI-PMH, AtoM can also expose virtual
sets, representing different groupings of records or different criteria for
exposure. At present, the only supported additional or "virtual" set in AtoM
is a virtual set that will only expose top-level descriptions (i.e. no children
will be included in the response). We hope to add further additional sets in
future versions of AtoM.

**Available additional sets**

=============================== ============================= ============
Set name                        Set Spec                      AtoM version
=============================== ============================= ============
Top-level collection record set oai:virtual:top-level-records 2.2.0
=============================== ============================= ============

When the setting is enabled and the changes saved, AtoM will display a list of
available virtual sets below the setting. You can click the name of a virtual
set to trigger an OAI request in the browser.

.. image:: images/oai-sets.*
   :align: center
   :width: 90%
   :alt: An image of the available OAI virtual sets

When this setting is set to "Yes," the virtual sets available can be used by
harvesters as criteria when issuing requests - for example, to issue a Get Records
request limited to top-level records:

.. code:: bash

   http://example-site.com/;oai?verb=ListRecords&metadataPrefix=oai_dc&set=oai:virtual:top-level-records

The virtual sets available in AtoM can also be seen as part of the response to a
:ref:`oai-list-sets` request.

See the :ref:`oai-pmh-verbs` section below for further examples.

:ref:`Back to top <oai-pmh>`

.. _oai-pmh-api-key:

Set AtoM to require an API key for OAI-PMH requests
===================================================

As of version 2.2, AtoM now has a setting that allows an :term:`administrator`
to restrict OAI exposure to only respond to requests that include a valid API
key. The default setting in AtoM is "no" - meaning if you have enabled the OAI
plugin, any harvester can make requests to AtoM, and users can view OAI
responses in their browsers by manipulating a URL to include an OAI request.

The API key setting, when enabled, allows an administrator to enable the OAI
repository in AtoM for specific requests only - those which include a valid
API key. To make use of this setting, an administrator should first generate
an API key for at least one :term:`user account` in AtoM before changing the
setting to "Yes."

Once enabled, OAI requests must pass a valid API key in the HTTP header.
Requests that do not pass a valid API key will return a 403 Forbidden HTTP
status response.

**To generate an API key for a user in AtoM:**

1. Navigate to |gears| **Admin > Users** via the :term:`main menu`, and find
   the user account for which you would like to generate an API key. Click the
   Edit button located in the :term:`button block` of the user's Profile page.
   For more information on managing user acccounts, see:
   :ref:`manage-user-accounts`, specifically: :ref:`edit-user`.
2. AtoM will redirect you to the :term:`edit page` for the user. At the bottom
   of the profile edit page, in the Access control
   :term:`area <information area>` you will see a :term:`drop-down menu` labelled
   "OAI-PMH API access key."

.. image:: images/oai-key-user.*
   :align: center
   :width: 70%
   :alt: An image of the OAI-PMH API access key field in a user profile

3. Using the drop-down, select the "(Re)generate API key" option, and then
   click the "Save" button located in the :term:`button block` at the bottom
   of the edit page.

.. image:: images/oai-key-generate.*
   :align: center
   :width: 70%
   :alt: An image of the OAI-PMH API access key field in a user profile

4. AtoM will reload the page in :term:`view mode`. You will see an API key
   value included (in red) on the user's profile :term:`view page`.

.. image:: images/oai-user-key.*
   :align: center
   :width: 70%
   :alt: An example of an API key for a user in the profile page

5. You can repeat steps 1-4 for as many users as are required.You can also
   **regenerate** a new key at any time by following steps 1-4 above. To
   **delete** a key, follow steps 1-2, and then select "Delete API key" from the
   drop-down menu described in step 3. When you click "Save" in the
   :term:`button block` of the edit page, AtoM will reload and display the
   user's profile in :term:`view mode` without an API key.

Once you have API keys generated for the necessary user accounts, you can now
enable the OAI repository setting so that an API key will be required as part
of a request. To do so, navigate to |gears| **Admin > Settings > OAI
repository** and make sure the radio button next to the field labelled "
Require API key authentication" is set to "Yes." Save your changes by clicking
the "Save" button in the :term:`button block` at the bottom of the OAI
repository settings page. For further guidance on managing OAI repository
settings, see the section above, :ref:`oai-pmh-settings`.

Now a valid API key must be included as part of the HTTP header in a OAI request
for AtoM to return a response - otherwise a 403 Forbidden HTTP status will be
returned instead.

You can test this functionality via the command-line using
`cURL <http://curl.haxx.se/>`__ - for example:

.. code:: bash

   curl -v -H "X-OAI-API-Key: caaac1a110b771bf" "http://example-site.com/;oai?verb=Identify"

Note that without a browser extension that would allow additional information
(such as the API key) to be passed in the HTTP header, enabling the API key
requirement in the settings means that users will no longer be able submit OAI
requests by directly manipulating the URL in the browser.

.. SEEALSO::

   * :ref:`add-user`
   * :ref:`edit-user`

:ref:`Back to top <oai-pmh>`

.. _cache-xml-oai:

Cache XML to make EAD 2002 XML available via OAI-PMH
====================================================

EAD 2002 XML is a metadata exchange standard designed to express the full
hierarchical arrangement of an :term:`archival unit` in a single XML document.

Normally, when exposing archival description metadata, the XML is
generated synchronously - that is, on request via the web browser. However,
many web browsers and harvesters have a built-in timeout limit of
approximately 1 minute, to prevent long-running tasks and requests from
exhausting system resources. Because of this, attempts to expose EAD 2002 XML
for large descriptive hierarchies via OAI-PMH can fail, as the timeout limit
is reachedbefore the document can be fully generated and served to the end user.

To avoid this, AtoM includes this setting, which allows users to pre-generate
XML exports via AtoM's job scheduler, and then cache them in the ``downloads``
directory. This way, when harvesters attempt to request EAD XML via OAI-PMH, the
file can be served directly, instead of having to generate on the fly.

For more information, see:

* :ref:`cache-xml-setting`

There is also a command-line task that a system administrator can run to
pre-generate and cache XML for all existing descriptions. See:

* :ref:`cache-xml-cli`

We strongly recommend users enable this setting and run the command-line task
if you wish to make EAD 2002 XML available to harvesters via the OAI
Repository module. If you do not, then AtoM will return a
``cannotDisseminateFormat`` error code to attempts by harvesters to request
``oai_ead``.


.. _oai-pmh-verbs:

OAI-PMH verbs in AtoM
=====================

Below you will find a few examples of available OAI request verbs that AtoM
will support, along with some example responses. For more details, see the
OAI-PMH 2.0 documentation, available at:

* http://www.openarchives.org/OAI/2.0/openarchivesprotocol.htm

Presently, AtoM can expose metadata in 2 XML formats via the OAI Repository
module: ``oai_dc`` (i.e. simple Dublin Core XML), and ``oai_ead`` (i.e. EAD
2002 XML). See the :ref:`oai-list-metadata-formats` Verb example below for
more information.

OAI verbs covered below include:

* :ref:`oai-identify`
* :ref:`oai-list-metadata-formats`
* :ref:`oai-list-identifiers`
* :ref:`oai-list-records`
* :ref:`oai-get-record`
* :ref:`oai-list-sets`

.. _oai-identify:

Identify
--------

This verb is used to retrieve information about a repository.

**Example request**

.. code:: bash

   http://example-site.com/;oai?verb=Identify

**Example response**

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
     <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
       <responseDate>2017-08-16T22:58:11Z</responseDate>
       <request verb="Identify">http://www.example.com/;oai</request>
       <Identify>
         <repositoryName>Example repository</repositoryName>
         <baseURL>http://www.example.com/index.php</baseURL>
         <protocolVersion>2.0</protocolVersion>
               <adminEmail>admin1@example.com</adminEmail>
               <adminEmail>admin2@example.com</adminEmail>
             <earliestDatestamp>2016-03-18T13:52:23Z</earliestDatestamp>
         <deletedRecord>no</deletedRecord>
         <granularity>YYYY-MM-DDThh:mm:ssZ</granularity>
         <compression>gzip</compression>
         <description>
           <oai-identifier xmlns="http://www.openarchives.org/OAI/2.0/oai-identifier" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai-identifier http://www.openarchives.org/OAI/2.0/oai-identifier.xsd">
             <scheme>oai</scheme>
             <repositoryIdentifier>www.example.com</repositoryIdentifier>
             <delimiter>:</delimiter>
             <sampleIdentifier>oai:www.example.com:repocode_100002</sampleIdentifier>
           </oai-identifier>
         </description>
       </Identify>
     </OAI-PMH>

.. _oai-list-metadata-formats:

List metadata formats
---------------------

This verb is used to list the metadata formats that can be disseminated from
the repository.

.. NOTE::

   Presently, AtoM can expose metadata in 2 XML formats via the OAI Repository
   module: ``oai_dc`` (i.e. simple Dublin Core XML), and ``oai_ead`` (i.e. EAD
   2002 XML).

**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListMetadataFormats

**Example response:**

The response shows that the repository supports two metadata formats:
``oai_dc`` and ``oai_ead``. For each of the formats returned by such a
request, the location of an XML Schema describing the format should be given.
The support of these formats at the repository-level does not imply support of
each format for each item of the repository.

If you request a format (for example ``oai_ead``) and it is not available,
then AtoM will return a ``cannotDisseminateFomat`` error code. Harvesters
can then try again in one of the other available metadata formats.

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
   <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
   http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
     <responseDate>2017-08-16T21:29:28Z</responseDate>
     <request verb="ListMetadataFormats">http://10.10.10.10/;oai</request>
     <ListMetadataFormats>
             <metadataFormat>
           <metadataPrefix>oai_dc</metadataPrefix>
           <schema>http://www.openarchives.org/OAI/2.0/oai_dc.xsd</schema>
           <metadataNamespace>http://www.openarchives.org/OAI/2.0/oai_dc/</metadataNamespace>
         </metadataFormat>
             <metadataFormat>
           <metadataPrefix>oai_ead</metadataPrefix>
           <schema>http://www.loc.gov/ead/ead.xsd</schema>
           <metadataNamespace>urn:isbn:1-931666-22-9</metadataNamespace>
         </metadataFormat>
         </ListMetadataFormats>
   </OAI-PMH>

.. IMPORTANT::

   If you want to make ``oai_ead`` metadata available to harvesters, then you
   **must** pre-generate and cache the EAD XML - AtoM will not attempt to
   generate it on the fly for OAI request. If no EAD 2002 XML has been
   pre-generated and cached, then AtoM will return a ``cannotDisseminateFormat``
   error code to attempts by harvesters to request ``oai_ead``.

   For more information, see above: :ref:`cache-xml-oai`.

.. _oai-list-identifiers:

List identifiers
----------------

This verb is an abbreviated form of :ref:`ListRecords <oai-list-records>`,
retrieving only headers rather than records. Optional arguments permit selective
harvesting of headers based on set membership and/or datestamp. The
``metadataPrefix`` is a required argument as part of the request.

When the metadata prefix used in the request is ``oai_ead``, only top-level
descriptions will be returned in the response.

**Arguments**

* ``from`` - *optional* - parameter entered as UTCdatetime value, which
  specifies a lower bound for datestamp-based selective harvesting.
* ``until`` - *optional* - parameter entered as UTCdatetime value, which
  specifies an upper bound for datestamp-based selective harvesting.
* ``metadataPrefix`` - *required* - can be either ``oai_dc`` for Dublin Core
  XML, or ``oai_ead`` for EAD 2002 XML (**not** required if resuming a
  truncated request - see ``resumptionToken``, below).
* ``resumptionToken`` - *exclusive* - used to continue a request that was
  truncated. Value is a token supplied as part of the previous incomplete
  request. If you have previously passed other arguments (such as the
  metadataPrefix, or from/until parameters), they should not be included in
  the continued request - only the verb, and the resumptionToken argument and
  token should be included.

**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&metadataPrefix=oai_dc

**Example response:**

A resumption token is included in the example.

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2017-08-16T21:35:39Z</responseDate>
      <request verb="ListIdentifiers" metadataPrefix="oai_dc">http://example-site.com/;oai</request>
      <ListIdentifiers>
        <header>
          <identifier>oai:example-site.com:yourrepocode_10267</identifier>
          <datestamp>2011-11-23T04:18:02Z</datestamp>
          <setSpec>oai:example-site.com:yourrepocode_10267</setSpec>
        </header>
        <header>
          <identifier>oai:example-site.com:yourrepocode_10269</identifier>
          <datestamp>2011-11-23T04:18:03Z</datestamp>
          <setSpec>oai:example-site.com:yourrepocode_10269</setSpec>
        </header>
        <header>
          <identifier>example-site.com:yourrepocode_10272</identifier>
          <datestamp>2011-11-23T04:18:04Z</datestamp>
          <setSpec>example-site.com:yourrepocode_10272</setSpec>
        </header>
        <resumptionToken>eyJmcm9tIjoiIiwidW50aWwiOiIiLCJjdXJzb3IiOjE2MDAsIm1ldGFkYXRhUHJlZml4Ijoib2FpX2RjIiwic2V0Ijoib2FpOnZpcnR1YWw6dG9wLWxldmVsLXJlY29yZHMifQ==</resumptionToken>
      </ListIdentifiers>
    </OAI-PMH>

**Example request with the resumption token used**

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&resumptionToken=eyJmcm9tIjoiIiwidW50aWwiOiIiLCJjdXJzb3IiOjE2MDAsIm1ldGFkYXRhUHJlZml4Ijoib2FpX2RjIiwic2V0Ijoib2FpOnZpcnR1YWw6dG9wLWxldmVsLXJlY29yZHMifQ==


**Example requests with** ``from`` **and** ``until`` **parameters**

Specifies a lower or upper bound for datestamp-based selective harvesting.
Both parameters can be used together if needed to target a particular range.

* Expose the identifiers of records created after 2015-01-01:

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&from=2015-01-01&metadataPrefix=oai_dc

* Expose the identifiers of records created up until 2012-12-31

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&until=2012-12-31&metadataPrefix=oai_dc

.. NOTE::

   As per the OAI-PMH specification, AtoM will convert local times into 
   Coordinated Universal Time (UTC) when handling ``from`` and ``until`` 
   parameters, and when returning results. Be sure to factor this into your
   range when using these parameters! 

.. TIP::

   The earliest date stamp associated with the records available from the
   repository is included in a typical Identify response. See above,
   :ref:`oai-identify`.

.. _oai-list-records:

List records
------------

This verb is used to harvest records from a repository. Optional arguments permit
selective harvesting of records based on set membership and/or datestamp. The
``metadataPrefix`` is a required argument as part of the request.

**Arguments**

* ``from`` - *optional* - parameter entered as UTCdatetime value, which
  specifies a lower bound for datestamp-based selective harvesting.
* ``until`` - *optional* - parameter entered as UTCdatetime value, which
  specifies an upper bound for datestamp-based selective harvesting.
* ``set`` - *optional* argument with a ``setSpec`` value , which specifies set
  criteria for selective harvesting.
* ``metadataPrefix`` - *required* - can be either ``oai_dc`` for Dublin Core
  XML, or ``oai_ead`` for EAD 2002 XML (**not** required if resuming a
  truncated request - see ``resumptionToken``, below).
* ``resumptionToken`` - *exclusive* - used to continue a request that was
  truncated. Value is a token supplied as part of the previous incomplete
  request. If you have previously passed other arguments (such as the
  metadataPrefix, or from/until parameters), they should not be included in
  the continued request - only the verb, and the resumptionToken argument and
  token should be included.

.. IMPORTANT::

   EAD 2002 XML is a hierarchically organized metadata exchange standard,
   designed to express a full :term:`archival unit` (such as a :term:`fonds`
   or :term:`collection` and all of its descendant records) in a single XML
   document. This means that one EAD XML file could contain thousands of
   descriptions.

   To ensure that the response does not exhaust all available system memory,
   when ``oai_ead`` is the metadata prefix used for a ListRecords request, AtoM
   will return a single full EAD 2002 XML document at a time before halting
   the request and including a resumption token. A harvester can use the
   resumption token to continue requesting records as needed - see the
   :ref:`oai-list-identifiers` section above for an example request using a
   resumption token.


**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListRecords&metadataPrefix=oai_dc

**Example response:**

.. code-block:: none

    <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
     <responseDate>2015-03-27T22:35:11Z</responseDate>
     <request verb="ListRecords" metadataPrefix="oai_dc">http://example-site.com/;oai</request>
      <ListRecords>
         <record>
             <header>
               <identifier>oai:example-site.com:repocode_666</identifier>
               <datestamp>2010-06-14T05:25:50Z</datestamp>
               <setSpec>oai:oai:example-site.com:repocode_666</setSpec>
             </header>
             <metadata>
               <oai_dc:dc xmlns="http://purl.org/dc/elements/1.1/"
              xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/
              http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
                 <dc:title>Syllabus of lectures on &#039;Cities in Evolution&#039;</dc:title>
                 <dc:description>An introductory course of general sociology. University of Bombay.</dc:description>
                 <dc:date>1919</dc:date>
                 <dc:format>1 item</dc:format>
                 <dc:identifier>http://example-site.com/syllabus-of-lectures-on-cities-in-evolution</dc:identifier>
                 <dc:identifier>5</dc:identifier>
                 <dc:source></dc:source>
                 <dc:language xsi:type="dcterms:ISO639-3">eng</dc:language>
                 <dc:rights>Open</dc:rights>
               </oai_dc:dc>
             </metadata>
           </record>
           <resumptionToken>from=&until=&cursor=100</resumptionToken>
         </ListRecords>
      </OAI-PMH>

If you have enabled the "Additional sets" setting, (see above
:ref:`oai-pmh-settings`), a virtual set parameter could also be used.

**Example request, limited to top-level records (virtual set)**

.. code:: bash

   http://example-site.com/;oai?verb=ListRecords&metadataPrefix=oai_dc&set=oai:virtual:top-level-records


See the :ref:`oai-list-identifiers` examples above for guidance on using some
of the additional arguments, such as ``from``, ``until``, and the
``resumptionToken``.

.. NOTE::

   See the :ref:`oai-get-record` response for examples of how AtoM can pass
   URLs to linked digital objects via OAI.

.. _oai-get-record:

Get record
----------

This verb is used to retrieve an individual metadata record from a repository.
Required arguments specify the identifier of the item from which the record is
requested and the format of the metadata that should be included in the record.

**Arguments**

* ``identifier``- *required* - specifies the unique identifier of the item in
  the repository from which the record must be disseminated. A list of
  identifiers can be retrieved using the
  :ref:`ListIdentifiers <oai-list-identifiers>` request.
* ``metadataPrefix`` - *required* specifies the metadataPrefix of the format
  that should be included in the metadata part of the returned record. The
  metadata formats supported by a repository and for a particular record can
  be retrieved using the
  :ref:`ListMetadataFormats <oai-list-metadata-formats>` request.

**Example request**

.. code:: bash

   http://example-site.com/;oai?verb=GetRecord&identifier=oai:example-site.com:repoid_10267&metadataPrefix=oai_dc

**Example response - DC XML**

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
    <responseDate>2015-03-27T23:57:10Z</responseDate>
    <request verb="GetRecord" identifier="oai:example-site.com:repoid_10555" metadataPrefix="oai_dc">http://example-site.com/;oai</request>
    <GetRecord>
      <record>
        <header>
          <identifier>oai:example-site.com:repoid_10555</identifier>
          <datestamp>2011-11-23T04:18:02Z</datestamp>
          <setSpec>oai:example-site.com:repoid_10555</setSpec>
        </header>
        <metadata>
            <oai_dc:dc xmlns="http://purl.org/dc/elements/1.1/"
            xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/
            http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <dc:title>Bob Ross fonds</title>
            <dc:creator>Ross, Robert (Bob) Norman, 1942-1995</dc:creator>
            <dc:description>The fonds consists of sketches and preparatory works of art from throughout
            Bob Ross' television artist career, personal correspondence, poetry by
            Ross, photographs of the artist and his work, journals and record books, press clippings and
            studio recordings.</dc:description>
            <dc:date>1926-2000</date>
            <dc:format>126 cm of textual material; 330 drawings; 194 photographs; 7 posters; 99 Betacam videotapes</dc:format>
            <dc:identifier>http://example-site.com/bob-ross-fonds</dc:identifier>
            <dc:identifier>12345<dc:identifier/>
            <dc:source><dc:source/>
            <dc:relation>http://example-site.com/artefactual-art-gallery-research-library-and-archives</dc:relation>
            <dc:relation>Artefactual Art Gallery Research Library and Archives</dc:relation>
            <dc:rights>Open</dc:rights>
          </oai_dc:dc>
        </metadata>
      </record>
    </GetRecord>
   </OAI-PMH>

If the resource has a :term:`digital object` attached, AtoM will include a
link to the  digital object in the OAI response, using
`Atom <http://tools.ietf.org/html/rfc4287>`__ Syndication format XML:

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8"?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
    <responseDate>2015-03-26T19:24:30Z</responseDate>
    <request verb="GetRecord" metadataPrefix="oai_dc" identifier="testeion_16508">http://example-site.com/;oai</request>
    <GetRecord>
        <record>
            <header>
                <identifier>oai:example-site.com:repoid_16508</identifier>
                <datestamp>2012-12-05T22:34:43Z</datestamp>
                <setSpec>oai:example-site.com:repoid_16508</setSpec>
            </header>
            <metadata>
                <oai_dc:dc xmlns="http://purl.org/dc/elements/1.1/"
                xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/
                http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
                <dc:title>Ray Houser fonds</dc:title>
                <dc:creator>Houser, Ray, 1897-1981</dc:creator>
                <dc:subject>Education</dc:subject>
                <dc:description>The fonds consists Waterloo Lutheran Seminary fundraising information,
                and sermons by Ray Houser. Fonds is comprised of the following series:
                Waterloo Lutheran Seminary fund raising; Sermons</dc:description>
                <dc:date>1960-1963</dc:date>
                <dc:type>image</dc:type>
                <dc:format>image/jpeg</dc:format>
                <dc:format>20 cm of textual records</dc:format>
                <dc:identifier>http://example-site.com/ray-houser-fonds</dc:identifier>
                <dc:identifier>S735</dc:identifier>
                <dc:source></dc:source>
                <dc:relation>http://example-site.com/wilfrid-laurier-university-archives</dc:relation>
                <dc:relation>Wilfrid Laurier University Archives</dc:relation>
                <dc:rights>Open</dc:rights>
            </oai_dc:dc>
        </metadata>
        <about>
            <feed xmlns="http://www.w3.org/2005/Atom">
            <entry>
                <id>066344-jpg</id>
                <title>066344.jpg</title>
                <link href="http://images.ourontario.ca/Partners/WLU/066344.jpg" rel="self"/>
                <category term="external" label="External"/>
            </entry>
            <entry>
                <id>066344-142-jpg</id>
                <title>066344_142.jpg</title>
                <link href="http://example-site.com/uploads/r/wilfrid-laurier-university-archives/7/2/720756250b79382b87fef68ef4d0cc6bc796d08e7b937eefc64b3dcae6f39e46/066344_142.jpg" rel="self"/>
                <category term="thumbnail" label="Thumbnail"/>
            </entry>
        </feed>
    </about>
    </record>
    </GetRecord>
    </OAI-PMH>

**Example response - EAD 2002 XML**

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
   <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
     <responseDate>2017-08-16T22:04:49Z</responseDate>
     <request verb="GetRecord" identifier="oai:10.10.10.10:atomdemo_20099" metadataPrefix="oai_ead">http://10.10.10.10/;oai</request>
         <GetRecord>
         <record>
           <header>
             <identifier>oai:10.10.10.10:atomdemo_20099</identifier>
             <datestamp>2013-06-13T22:36:34Z</datestamp>
             <setSpec>oai:10.10.10.10:atomdemo_20099</setSpec>
           </header>
           <metadata>
               <ead>
                 <eadheader langencoding="iso639-2b" countryencoding="iso3166-1" dateencoding="iso8601" repositoryencoding="iso15511" scriptencoding="iso15924" relatedencoding="DC">
                   <eadid identifier="faculty-of-social-work-office-of-dean-fonds" countrycode="CA" mainagencycode="CA-ON00362" url="http://demo.accesstomemory.org/index.php/faculty-of-social-work-office-of-dean-fonds" encodinganalog="identifier">U257</eadid>
                   <filedesc>
                     <titlestmt>
                       <titleproper encodinganalog="title">Faculty of Social Work – Office of the Dean fonds</titleproper>
                     </titlestmt>
                     <publicationstmt>
                       <publisher encodinganalog="publisher">Wilfrid Laurier University Archives</publisher>
                       <address>
                         <addressline>75 University Avenue West</addressline>
                         <addressline>Waterloo</addressline>
                         <addressline>Ontario</addressline>
                         <addressline>Canada</addressline>
                         <addressline>N2L 3C5</addressline>
                         <addressline>Telephone: 519-884-0710 ext.3906</addressline>
                         <addressline>Email: libarch@wlu.ca</addressline>
                         <addressline>http://library.wlu.ca/archives</addressline>
                       </address>
                       <date normal="2012-04-23" encodinganalog="date">2012-04-23</date>
                     </publicationstmt>
                   </filedesc>
                   <profiledesc>
                     <creation>
                     Generated by Access to Memory (AtoM) 2.4.0 <date normal="2017-08-16">2017-08-16 21:44 UTC</date>
                   </creation>
                     <langusage>
                       <language langcode="eng">English</language>
                     </langusage>
                   </profiledesc>
                 </eadheader>
                 <archdesc level="fonds" relatedencoding="ISAD(G)v2">
                   <did>
                     <unittitle encodinganalog="3.1.2">Faculty of Social Work – Office of the Dean fonds</unittitle>
                     <unitid encodinganalog="3.1.1" countrycode="CA" repositorycode="ON00362">U257</unitid>
                     <unitdate id="atom_77515_event" normal="1968" encodinganalog="3.1.3">1968 - ?</unitdate>
                     <physdesc encodinganalog="3.1.5">24 cm of textual records.</physdesc>
                     <repository>
                       <corpname>Wilfrid Laurier University Archives</corpname>
                       <address>
                         <addressline>75 University Avenue West</addressline>
                         <addressline>Waterloo</addressline>
                         <addressline>Ontario</addressline>
                         <addressline>Canada</addressline>
                         <addressline>N2L 3C5</addressline>
                         <addressline>Telephone: 519-884-0710 ext.3906</addressline>
                         <addressline>Email: libarch@wlu.ca</addressline>
                         <addressline>http://library.wlu.ca/archives</addressline>
                       </address>
                     </repository>
                     <langmaterial encodinganalog="3.4.3">
                       <language langcode="eng">English</language>
                     </langmaterial>
                     <dao linktype="simple" href="http://demo.accesstomemory.org/uploads/r/wilfrid-laurier-university-archives/7/7/77511/firstdswgrads.jpg" role="master" actuate="onrequest" show="embed"/>
                     <origination encodinganalog="3.2.1">
                       <corpname id="atom_77515_actor">Wilfrid Laurier University. Faculty of Social Work</corpname>
                     </origination>
                   </did>
                   <bioghist id="md5-9f94c64df4259a9b0020b3eb8e6bbd34" encodinganalog="3.2.2">
                     <note>
                       <p>The Waterloo Lutheran University Graduate School of Social Work was founded in 1966 with a curriculum based on clinical practice as well as community organization practice. Students specialized in one of five concentrations: community development, social planning, social administration, research, or individuals, families and social groups. The first class graduated in 1968, the same year that the Graduate School of Social Work was accredited by the Council on Social Work Education. In 1974, the name of the program was changed to the Faculty of Social Work to reflect the expansion into part-time, continuing education and undergraduate social welfare courses (offered in the Faculty of Arts and Science). In 1981, the Faculty of Social Work created an undergraduate Social Welfare Option, considered to be a minor.<lb/><lb/>The Doctor of Social Work program was established in 1987, making it the first doctoral program at Wilfrid Laurier University.<lb/><lb/>By 1988 the Faculty had moved from the seminary to the Peters building and then to the Aird building before moving to the St. Jerome’s Duke Street building in 2006. This Laurier Kitchener campus was a 12 million dollar conversion from historic landmark to professional school.<lb/><lb/>The first Dean of the Faculty of Social Work was Sheldon L. Rahn (1966-1968), followed by Francis J. Turner (1969-1979), Sherman Merle (1980-1983), Shankar A. Yelaja (1983-1993), Jonnah Hurn Mather (1994-2001), Luke J. Fusco (2001-2006), Leslie Cooper (2006-2009), and Nicholas Coady (2011-).</p>
                     </note>
                   </bioghist>
                   <odd type="publicationStatus">
                     <p>published</p>
                   </odd>
                   <odd type="statusDescription">
                     <p>Final</p>
                   </odd>
                   <scopecontent encodinganalog="3.3.1">
                     <p>Fonds consists of records from the Office of the Dean, Faculty of Social Work.</p>
                   </scopecontent>
                   <controlaccess>
                     <genreform source="rad" encodinganalog="1.1C">Textual record</genreform>
                     <subject>Education</subject>
                   </controlaccess>
                   <accruals encodinganalog="3.3.3">
                     <p>Further accruals are expected.</p>
                   </accruals>
                   <accessrestrict encodinganalog="3.4.1">
                     <p>Open</p>
                   </accessrestrict>
                   <otherfindaid encodinganalog="3.4.5">
                     <p>http://library.wlu.ca/specialcollections/findingaid/3472</p>
                   </otherfindaid>
                   <dsc type="combined">
                     <c level="series">
                       <did>
                         <unittitle encodinganalog="3.1.2">Alumni Office records</unittitle>
                         <unitid encodinganalog="3.1.1" countrycode="CA" repositorycode="ON00362">U257-1</unitid>
                       </did>
                       <odd type="publicationStatus">
                         <p>published</p>
                       </odd>
                     </c>
                   </dsc>
                 </archdesc>
               </ead>
           </metadata>
           <about>
             <feed xmlns="http://www.w3.org/2005/Atom">
              <entry>
                <id>firstdswgrads-jpg</id>
                <title>firstdswgrads.jpg</title>
                <link
               href="http://demo.accesstomemory.org/uploads/r/wilfrid-laurier-university-archives/7/7/77511/firstdswgrads.jpg" rel="self"></link>
                <category term="master" label="Master"></category>
              </entry>
              <entry>
                <id>firstdswgrads-142-jpg</id>
                <title>firstdswgrads_142.jpg</title>
                <link
               href="http://demo.accesstomemory.org/uploads/r/wilfrid-laurier-university-archives/7/7/77511/firstdswgrads_142.jpg" rel="self"></link>
                <category term="thumbnail" label="Thumbnail"></category>
              </entry>
             </feed>
            </about>
         </record>
       </GetRecord>
   </OAI-PMH>


.. _oai-list-sets:

List sets
---------

This verb is used to retrieve the set structure of a repository, useful for
selective harvesting. For a long request (e.g. a repository with many sets), a
resumption token may be supplied - the ``resumptionToken`` is the only
parameter supported by this verb.

.. TIP::

   Note that available virtual sets, including the setName and setSpec, will
   also be included in a List sets response. The example response below includes
   a virtual set example. For more information, see the :ref:`oai-pmh-settings`
   section above.

**Arguments**

* ``resumptionToken`` - *exclusive* - used to continue a request that was
  truncated. Value is a token supplied as part of the previous incomplete
  request. If you have previously passed other arguments (such as the
  metadataPrefix, or from/until parameters), they should not be included in
  the continued request - only the verb and the resumptionToken argument and
  token should be included.

**Example request**

.. code:: bash

   http://example-site.com/;oai?verb=ListSets

**Example response**

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2017-08-16T23:28:18Z</responseDate>
      <request verb="ListSets">http://example-site.com/;oai</request>
      <ListSets>
          <set>
            <setSpec>oai:example-site.com:repocode_16490</setSpec>
            <setName>Fonds S720 - Canadian Water Resources Association fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16496</setSpec>
            <setName>Fonds S714 - Clara Bernhardt fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16502</setSpec>
            <setName>Fonds U250 - Herman Overgaard fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16503</setSpec>
            <setName>Fonds C61 - Emily Stowe and Augusta Stowe Gullen collection</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16510</setSpec>
            <setName>Fonds U121 - Nils Willison fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16512</setSpec>
            <setName>Fonds S735 - Ray Houser fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16513</setSpec>
            <setName>Fonds U129 - Robert Langen fonds</setName>
          </set>
          <set>
            <setSpec>oai:example-site.com:repocode_16518</setSpec>
            <setName>Fonds U251 - Seminette Club fonds</setName>
          </set>
          <set>
            <setSpec>oai:virtual:top-level-records</setSpec>
            <setName>Top-level collection record set</setName>
          </set>
        </ListSets>
      </OAI-PMH>

:ref:`Back to top <oai-pmh>`
