.. _oai-pmh:

==============
OAI Repository
==============

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM has the ability to act as a data provider to service providers interested
in harvesting descriptive metadata from AtoM, by exposing simple Dublin Core
XML via OAI-PMH, the Open Archives Initiative Protocol for Metadata
Harvesting (version 2.0).

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

A boolean value (e.g. true [yes] or false [no]) that determines if requests
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
particular OAI repository within its network domain to create a unqiue, OAI
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
identifer is returned as part of the response to an OAI
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

.. SEEALSO::

   * :ref:`settings`

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

.. _oai-pmh-verbs:

OAI-PMH verbs in AtoM
=====================

Below you will find a few examples of available OAI request verbs that AtoM
will support, along with some example responses. For more details, see the OAI
-PMH 2.0 documentation, available at:

* http://www.openarchives.org/OAI/2.0/openarchivesprotocol.htm

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

.. code:: bash

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2015-03-27T23:23:04Z</responseDate>
      <request verb="Identify">http://example-site.com/;oai</request>
      <Identify>
        <repositoryName>Example Repository</repositoryName>
        <baseURL>http://example-site.com</baseURL>
        <protocolVersion>2.0</protocolVersion>
        <adminEmail>admin@example-site.com</adminEmail>
        <adminEmail>admin2@example-site.com</adminEmail>
        <earliestDatestamp>1985-10-26T01:20:00Z</earliestDatestamp>
        <deletedRecord>no</deletedRecord>
        <granularity>YYYY-MM-DDThh:mm:ssZ</granularity>
        <compression>gzip</compression>
        <description>
          <oai-identifier xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai-identifier http://www.openarchives.org/OAI/2.0/oai-identifier.xsd">
            <scheme>oai</scheme>
            <repositoryIdentifier>example-site.com:repoid</repositoryIdentifier>
            <delimiter>:</delimiter>
            <sampleIdentifier>example-site.com:repoid_100002</sampleIdentifier>
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

   In AtoM 2.2, only Dublin Core (oai_dc) XML is currently available.

**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListMetadataFormats

**Example response:**

The response shows that the repository supports one metadata format:
``oai_dc``. For each of the formats returned by such a request, the location
of an XML Schema describing the format should be given. The support of these
formats at the repository-level does not imply support of each format for each
item of the repository.

.. code:: bash

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2015-03-26T22:12:10Z</responseDate>
      <request verb="ListMetadataFormats">http://example-site.com/;oai</request>
      <ListMetadataFormats>
          <metadataFormat>
              <metadataPrefix>oai_dc</metadataPrefix>
              <schema>http://www.openarchives.org/OAI/2.0/oai_dc.xsd</schema>
              <metadataNamespace>http://www.openarchives.org/OAI/2.0/oai_dc/</metadataNamespace>
          </metadataFormat>
      </ListMetadataFormats>
  </OAI-PMH>

.. _oai-list-identifiers:

List identifiers
----------------

This verb is an abbreviated form of :ref:`ListRecords <oai-list-records>`,
retrieving only headers rather than records. Optional arguments permit selective
harvesting of headers based on set membership and/or datestamp. The
``metadataPrefix`` is a required argument as part of the request.

**Arguments**

* ``from`` - *optional* - parameter entered as UTCdatetime value, which
  specifies a lower bound for datestamp-based selective harvesting.
* ``until`` - *optional* - parameter entered as UTCdatetime value, which
  specifies an upper bound for datestamp-based selective harvesting.
* ``metadataPrefix`` - *required* - must be ``oai_dc``.
* ``resumptionToken`` - *optional* - used to continue a request that was
  truncated. Value is a token supplied as part of the previous incomplete
  request.

**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&metadataPrefix=oai_dc

**Example response:**

Example is truncated for brevity. A resumption token is included in the
example.

.. code:: bash

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2015-03-26T22:41:15Z</responseDate>
      <request verb="ListIdentifiers" metadataPrefix="oai_dc">http://example-site.com/;oai</request>
      <ListIdentifiers>
        <header>
          <identifier>oai:example-site.com:yourrepocode_10267</identifier>
          <datestamp>2011-11-23T04:18:02Z</datestamp>
          <setSpec>None</setSpec>
        </header>
        <header>
          <identifier>oai:example-site.com:yourrepocode_10269</identifier>
          <datestamp>2011-11-23T04:18:03Z</datestamp>
          <setSpec>None</setSpec>
        </header>
        <header>
          <identifier>example-site.com:yourrepocode_10272</identifier>
          <datestamp>2011-11-23T04:18:04Z</datestamp>
          <setSpec>None</setSpec>
        </header>
        <resumptionToken>from=&until=&cursor=100</resumptionToken>
      </ListIdentifiers>
    </OAI-PMH>

**Example request with the resumption token used**

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&metadataPrefix=oai_dc&resumptionToken=cursor%3D100

.. WARNING::

   AtoM's resumption token currently contains symbol characters that are not URL
   encoded - meaning putting it directly into a browser will fail. The above
   example shows how the symbol characters can be encoded for use. This *may*
   prevent a harvester from continuing a truncated request. See
   issue `8158 <https://projects.artefactual.com/issues/8158>`__ in our ticket
   tracking system for how we hope to improve this in the future.

**Example requests with** ``from`` **and** ``until`` **parameters**

Specifies a lower or upper bound for datestamp-based selective harvesting.
Both parameters can be used together if needed to target a particular range.

* Expose the identifiers of records created after 2015-01-01:

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&from=2015-01-01&metadataPrefix=oai_dc

* Expose the identifiers of records created up until 2012-12-31

.. code:: bash

   http://example-site.com/;oai?verb=ListIdentifiers&until=2012-12-31&metadataPrefix=oai_dc

.. TIP::

   The earliest date stamp associated with the records available from the
   repsository is included in a typical Identify response. See above,
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
* ``metadataPrefix`` - *required* - must be ``oai_dc``.
* ``resumptionToken`` - *optional* - used to continue a request that was
  truncated. Value is a token supplied as part of the previous incomplete
  request.

**Example request:**

.. code:: bash

   http://example-site.com/;oai?verb=ListRecords&metadataPrefix=oai_dc

**Example response:**

Example has been truncated to one record for brevity. Normally each record
would appear contained within the ``<record>`` element.

.. code:: bash

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
               <setSpec>oai:oai:example-site.com:repocode_111</setSpec>
             </header>
             <metadata>
               <oai_dc:dc xmlns="http://purl.org/dc/elements/1.1/"
              xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
                 <title>Syllabus of lectures on &#039;Cities in Evolution&#039;</title>
                 <description>An introductory course of general sociology. University of Bombay.</description>
                 <date>1919</date>
                 <format>1 item</format>
                 <identifier>http://example-site.com/syllabus-of-lectures-on-cities-in-evolution</identifier>
                 <identifier>5</identifier>
                 <source></source>
                 <language xsi:type="dcterms:ISO639-3">eng</language>
                 <rights>Open</rights>
               </oai_dc:dc>
             </metadata>
           </record>
           <resumptionToken>from=&until=&cursor=100</resumptionToken>
         </ListRecords>
     </OAI-PMH>

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

**Example response**

.. code:: bash

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
          <setSpec>None</setSpec>
        </header>
        <metadata>
          <oai_dc:dc xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <title>Bob Ross fonds</title>
            <creator>Ross, Robert (Bob) Norman, 1942-1995</creator>
            <description>The fonds consists of sketches and preparatory works of art from throughout
            Bob Ross' television artist career, personal correspondence, poetry by
            Ross, photographs of the artist and his work, journals and record books, press clippings and
            studio recordings.</description>
            <date>1926-2000</date>
            <format>126 cm of textual material; 330 drawings; 194 photographs; 7 posters; 99 Betacam videotapes</format>
            <identifier>http://example-site.com/bob-ross-fonds</identifier>
            <identifier>12345<identifier/>
            <source><source/>
            <relation>http://example-site.com/artefactual-art-gallery-research-library-and-archives</relation>
            <relation>Artefactual Art Gallery Research Library and Archives</relation>
            <rights>Open</rights>
          </oai_dc:dc>
        </metadata>
      </record>
    </GetRecord>
   </OAI-PMH>

If the resource has a :term:`digital object` attached, AtoM will include a
link to the  digital object in the OAI response, using
`Atom <http://tools.ietf.org/html/rfc4287>`__ Syndication format XML:

.. code:: bash

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
                <oai_dc:dc xmlns="http://purl.org/dc/elements/1.1/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
                <title>Ray Houser fonds</title>
                <creator>Houser, Ray, 1897-1981</creator>
                <subject>Education</subject>
                <description>The fonds consists Waterloo Lutheran Seminary fundraising information, and sermons by Ray Houser. Fonds is comprised of the following series: Waterloo Lutheran Seminary fund raising; Sermons</description>
                <date>1960-1963</date>
                <type>image</type>
                <format>image/jpeg</format>
                <format>20 cm of textual records</format>
                <identifier>http://example-site.com/ray-houser-fonds</identifier>
                <identifier>S735</identifier>
                <source/>
                <relation>http://example-site.com/wilfrid-laurier-university-archives</relation>
                <relation>Wilfrid Laurier University Archives</relation>
                <rights>Open</rights>
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




.. _oai-list-sets:

List sets
---------

This verb is used to retrieve the set structure of a repository, useful for
selective harvesting. For a long request (e.g. a repository with many sets), a
resumption token may be supplied - the ``resumptionToken`` is the only
parameter supported by this verb.

**Example request**

.. code:: bash

   http://example-site.com/;oai?verb=ListSets

**Example response**

The response has been truncated to just a few examples for brevity.

.. IMPORTANT::

   At the moment, the ``setSpec`` is not being populated in AtoM as part of
   this response. This is a known bug we hope to fix in a future release; see
   `#6436 <https://projects.artefactual.com/issues/6436>`__ for further
   details.

.. code:: bash

   <?xml version="1.0" encoding="utf-8" ?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
    http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>2015-03-29T23:28:18Z</responseDate>
      <request verb="ListSets">http://example-site.com/;oai</request>
      <ListSets>
          <set>
            <setSpec></setSpec>
            <setName>Fonds S720 - Canadian Water Resources Association fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds S714 - Clara Bernhardt fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds U250 - Herman Overgaard fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds C61 - Emily Stowe and Augusta Stowe Gullen collection</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds U121 - Nils Willison fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds S735 - Ray Houser fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds U129 - Robert Langen fonds</setName>
          </set>
          <set>
            <setSpec></setSpec>
            <setName>Fonds U251 - Seminette Club fonds</setName>
          </set>
        </ListSets>
      </OAI-PMH>

:ref:`Back to top <oai-pmh>`
