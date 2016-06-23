.. _api-browse-io:

===================================
Browse information objects endpoint
===================================

**GET /api/informationobjects**

This endpoint will obtain a list of
:term:`information objects <information object>` (AKA
:term:`archival descriptions <archival description>`) and the total count.
The results can be filtered using the same parameters as the advanced search page
(detailed below).

.. SEEALSO::

   For more information on working with :term:`archival description` records
   in AtoM, see: :ref:`archival-descriptions`. For further information on
   Advanced search, see: :ref:`advanced-search`

Information object fields returned include:

* **reference_code**: The full inherited :term:`reference code` of the
  description. If the Admin setting for
  :ref:`reference code inheritance <inherit-reference-code>` is turned off,
  then only the identifier will be included in the response.
* **slug**: the :term:`slug` of the description assigned by AtoM.
* **title**: the formal or supplied title of the description; equivalent to
  ISAD(G) 3.1.2.
* **creators**: The names of any :term:`creators <creator>` associated with
  the description; equivalent to ISAD(G) 3.2.1 or ISAAR(CPF) 5.1.2. Can return
  multiple values.
* **creation_dates**: Dates of creation. Equivalent to ISAD(G) 3.1.3; however,
  only creation dates will be returned - other types (e.g. accumulation,
  broadcasting, etc) are not included in the response. Can return multiple
  values.
* **level_of_description**: The :term:`level of description` of the
  description.
* **repository**: the :term:`archival institution` associated with the
  description.
* **physical_characteristics**: Physical characteristics and technical
  requirements; equivalent to ISAD(G) 3.4.4.
* **place_access_points**: :term:`place` :term:`access points <access point>`
  that have been associated with the description. Can return multiple values.
* **thumbnail_url**: the path to the :term:`thumbnail` of a linked
  :term:`digital object` associated with the description.

When returning the response, :term:`draft <draft record>` descriptions will be
hidden, but other ACL rules will be ignored (including thumbnail restrictions)
for performance reasons.

The amount of results returned in a response is limited by the global Admin
setting for :ref:`results-page`. The **skip** parameter (described below) can
be used to page results - for example, if 10 results are returned in the first
request, following request can include a parameter to skip the first 10
records in the response.

.. _browse-io-ex-req:

Example request
===============

.. code-block:: none

   GET /api/informationobjects HTTP/1.1
   Host: www.example.com

.. _browse-io-ex-resp:

Example response
================

.. code-block:: none

   HTTP/1.1 200 OK
   Content-Type: application/json; charset=utf-8

   {
     "total": 1143,
     "results": [
       {
         "reference_code": "CA ON00311 PF41",
         "slug": "john-honsberger-fonds",
         "title": "John Honsberger fonds",
         "repository": "The Law Society of Upper Canada Archives",
         "physical_characteristics": "Some items in the fonds are stored folded.",
         "level_of_description": "Fonds",
         "creators": [
           "Honsberger, John David"
         ],
         "creation_dates": [
           "1763-2012"
         ],
         "place_access_points": [
           "Toronto"
         ],
         "thumbnail_url": "http:\/\/127.0.0.1\/uploads\/r\/law-society-of-upper-canada-archives\/2\/5\/1\/251a9152c6e71751519dc49086d62f3abde38d34619f66516ca0edf97076a1cf\/honsberger_142.jpg"
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-026",
         "slug": "thomas-b-townsend-to-thomas-b-townsend-the-younger-deed-of-land",
         "title": "Thomas B. Townsend to Thomas B. Townsend the younger: deed of land",
         "repository": "The Law Society of Upper Canada Archives",
         "physical_characteristics": "Item is stored folded.",
         "level_of_description": "Item",
         "creation_dates": [
           "30 May 1903"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-025",
         "slug": "charles-marriott-et-al-to-jane-m-kerr-deed-of-land-situate-on-rosedale-road-toronto",
         "title": "Charles Marriott et al to Jane M. Kerr: deed of land situate on Rosedale Road, Toronto",
         "repository": "The Law Society of Upper Canada Archives",
         "physical_characteristics": "Item is stored folded.",
         "level_of_description": "Item",
         "creation_dates": [
           "26 Nov. 1900"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-024",
         "slug": "mortgage-william-hanlan-et-al-to-simpson-hill",
         "title": "Mortgage : William Hanlan et al to Simpson Hill",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "Item",
         "creation_dates": [
           "8 Mar. 1900"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-023",
         "slug": "quit-claim-deed-daniel-hanlon-et-al-to-william-hanlon",
         "title": "Quit claim deed: Daniel Hanlon et al to William Hanlon",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "Item",
         "creation_dates": [
           "14 Mar. 1895"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-019",
         "slug": "abstracts-of-title-2",
         "title": "Abstracts of title",
         "repository": "The Law Society of Upper Canada Archives",
         "physical_characteristics": "Items in this file were previously folded.",
         "level_of_description": "File",
         "creation_dates": [
           "1894-1895, 1900"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-022",
         "slug": "mortgage-william-hanlon-to-the-trust-loan-co-of-canada",
         "title": "Mortgage: William Hanlon to the Trust & Loan Co. of Canada",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "Item",
         "creation_dates": [
           "2 Mar. 1895"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-018",
         "slug": "mortgage-william-hanlon-to-richard-coffey",
         "title": "Mortgage: William Hanlon to Richard Coffey",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "Item",
         "creation_dates": [
           "19 Mar. 1894"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-021",
         "slug": "conveyance-john-hanlon-et-al-to-william-hanlon",
         "title": "Conveyance: John Hanlon et al to William Hanlon",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "Item",
         "creation_dates": [
           "11 Feb. 1895"
         ]
       },
       {
         "reference_code": "CA ON00311 PF41-PF41-5-2011053-020",
         "slug": "hanlon-hill-certificates",
         "title": "Hanlon & Hill: certificates",
         "repository": "The Law Society of Upper Canada Archives",
         "level_of_description": "File",
         "creation_dates": [
           "1894-1900"
         ]
       }
     ]
   }


.. _browse-io-parameters:

Request parameters
==================

All search and filter parameters available to users via the
:ref:`advanced-search` :term:`user interface` can also be used as parameters
to filter the API endpoint's response, including
:term:`boolean <boolean search>` queries. In most cases, the implementation is
identical, with a few variations outlined below. Further examples of how to
construct the requests with parameters are included below the explanatory
notes for the available parameters.

.. _browse-io-boolean:

Boolean criteria parameters
---------------------------

* **sq0**: Query string. Used submit search terms.
* **so0**: Query operator. Available options are ``and``, ``or``, and ``not``.
  The default operator when the parameter is not included is ``and``.
* **sf0**: Query field. Used to limit the boolean parameters to searching
  within a specific :term:`field` of the information objects. Options include:

  * ``_all`` : Search all indexed fields. When no sf0 parameter is included,
    this is the default.
  * ``title``: Limit boolean search query to title field - the formal or
    supplied title of the description; equivalent to  ISAD(G) 3.1.2.
  * ``identifier``: Limit boolean search to the identifier field.
  * ``referenceCode``: Limit boolean search to the full inherited
    :term:`reference code` value of descriptions
  * ``scopeAndContent``: Limit boolean search query to the Scope and content
    field; equivalent to ISAD(G) 3.3.1
  * ``archivalHistory``: Limit boolean search query to the Archival history
    field; equivalent to ISAD(G) 3.2.3
  * ``extentAndMedium``: Limit boolean search query to the Extent and medium
    field; equivalent to ISAD(G) 3.1.5
  * ``genre``: Limit boolean search query to genre
    :term:`access points <access point>` associated with descriptions.
  * ``subject``: Limit boolean search query to :term:`subject`
    :term:`access points <access point>` associated with descriptions.
  * ``name``: Limit boolean search query to name
    :term:`access points <access point>` associated with descriptions (e.g.
    :term:`authority records <authority record>` associated with a description
    not as a :term:`creator` but as a name access point).
  * ``place``: Limit boolean search query to :term:`place`
    :term:`access points <access point>` associated with descriptions.

An unlimited number of criteria can be sent by incrementally increasing the
number in the above parameters (e.g. ``sq1``, ``so1``, ``sf1``, etc). They
must by consecutive numbers starting at zero and the only required parameter
is the query string.

.. TIP::

   It is possible to pass query operators within a single combined string by
   directly adding ``AND``, ``OR``, or ``AND NOT`` to your query string value.
   This is best tested and explored by playing with the advanced search
   interface in AtoM, and using the URL parameters returned with the response
   as parameters for the API. For example, if you use the advanced search
   interface, and add "taxes AND investments" to the query field, and limit it
   to Scope and content, the parameters passed via the URL when the results
   are returned are:

   ``/api/informationobjects/?sq0=taxes+AND+investments&sf0=scopeAndContent``

   This is the same as manually increasing the parameter numbers and repeating
   the criteria indivudually, like so:

   ``/api/informationobjects?sq0=taxes&sfo=scopeAndContent&sq1=investments&sf1=scopeAndContent``

   .. image:: images/api-browse-io-tip1.*
      :align: center
      :width: 90%
      :alt: An example query in the AtoM search interface

   See the examples below for more instances of this.

You can also use other boolean operators to enhance the results returned such
as ``*`` wildcards or ``~`` fuzzy searching. For more information on available
boolean operators, see: :ref:`advanced-search-operators` in the
:ref:`advanced-search` documentation.

Note that the boolean criteria parameters can also be used in combination with
the filter parameters outlined :ref:`below <browse-io-filter>`.

.. _browse-io-boolean-examples:

Example requests with Boolean criteria
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Return results with** ``conveyance`` **AND** ``issuing`` **in scope and
content:**

``/api/informationobjects?sq0=conveyance+AND+issuing&sf0=scopeAndContent``

Or, this could also be expressed as:

``/api/informationobjects?sq0=conveyance&sf0=scopeAndContent&sq1=issuing&sf1=scopeAndContent``

**Return results with** ``"conveyance issuing"`` **(e.g. that exact string)
in Scope and content:**

``/api/informationobjects?sq0="conveyance+issuing"&sf0=scopeAndContent``

**Return results with** ``conveyance`` **OR** ``issuing`` **in the scope and
content field:**

``/api/informationobjects?sq0=conveyance+issuing&sf0=scopeAndContent``

**Return results with** ``coffee`` **OR** ``chocolate`` **in any field, AND**
(``photo*`` OR ``picture*`` OR ``image*``) **in Extent and medium:**

``/api/informationobjects?sq0=chocolate&so1=or&sq1=coffee&so2=and&sq2=photo*+OR+picture*+OR+image*&sf2=extentAndMedium&topLod=0``

.. image:: images/api-browse-io-tip2.*
  :align: center
  :width: 70%
  :alt: An example query in the AtoM search interface

.. _browse-io-filter:

Filter parameters
-----------------

The filter parameters below are the same as those found in the
:term:`user interface` as part of the :ref:`advanced-search` module, with some
small variations (such as the ``skip`` parameter).

In many cases, the parameters expect internal IDs as the values for the
parameters. Since these ids are automatically generated via mysql autonumerics
(and thus subject to change over time), and because all :term:`terms <term>`
in AtoM exist in user-editable :term:`taxonomies <taxonomy>`, it is not possible
to list all available options for each parameter - it will depend on the data
in your particular system. For some values, you can find a list of some of the
default term IDs in ``lib/model/QubitTerm.php``, or you can always perform an
advanced search via the :term:`user interface`, and then look at the resulting
URL to see how the parameter has been passed - the same parameter and ID can be
used in the API.

.. TIP::

   If you have access to the AtoM database, you could use a SQL query to
   return a list of terms and their IDs from a particular :term:`taxonomy`.
   You will need to know the Taxonomy's name, as listed in the
   :term:`user interface` (via **Manage > Taxonomies**), and select a culture -
   the following example will use the Genre taxonomy, with the default terms
   returned in  English (``en``). This query can easily be adapted by swapping
   in a different taxonomy name and culture value in the final parameters.

   .. code-block:: sql

      SELECT term.id, term_i18n.name FROM term LEFT JOIN term_i18n ON (term.id = term_i18n.id) WHERE term.taxonomy_id = (SELECT id FROM taxonomy_i18n WHERE culture = 'en' AND name = 'Genre') AND term_i18n.culture = 'en';

   For some basic tips on using SQL to access AtoM's database, see:
   :ref:`common-atom-queries`.

.. SEEALSO::

   * :ref:`advanced-search`
   * :ref:`terms`
   * :ref:`recurring-facet-filters`

Filter parameters available for the Browse information object endpoint
include:

* **sf_culture**: ISO 639-1 language code for display. See :ref:`api-intro-i18n`
  for more information on this parameter.
* **limit**: The maximum number of information objects returned in a single
  response. Note that this parameter is limited by the :ref:`results-page`
  global setting - you can use this parameter to limit the response further
  (e.g. request less results than the global setting), but increasing the
  limit parameter will not override the Results per page setting value.

  * *Example* - return only 5 results per request:
    ``/api/informationobjects?limit=5``

* **skip**: The amount of information objects skipped when returning the
  results. This parameter can be used to page results - for example, if the
  first response includes 10 results, then the following request can include a
  ``skip=10`` parameter, which will skip the first 10 results and begin the
  response on the 11th. See the examples below.

  * *Example* - Skip the first 20 results: ``/api/informationobjects?skip=20``

* **sort**: This parameter offers the user options to sort the results.
  The options available are identical to those found in the
  :ref:`recurring-sort-button` for archival descriptions, and are described
  below. When the parameter is not included, the default sort order is
  whatever has been set in the :ref:`sort-browser-users` setting. Otions:

  * ``identifier``: sort results by :term:`reference code`
  * ``alphabetic``: sort results alphabetically. Note that in AtoM,
    alphabetic sorting uses ASCII sorting, not natural sorting - see
    `this article <http://blog.codinghorror.com/sorting-for-humans-natural-sort-order/>`__
    for a bit more on the difference.
  * ``date``: sorted by the internal startDate value, which should be ISO-8601
    formatted (e.g. YYYY-MM-DD, YYYY-MM, or YYYY)
  * ``lastUpdated``: sorted by most recent created or modified date
  * *Example* - sort by most recently created/modified: ``/api/informationobjects?sort=lastUpdated``

* **topLod**: Return only top level descriptions, or all descriptions.
  Equivalent to the top-level descriptions filter (which is on by default in
  the :term:`archival description` browse page, but off by default on search
  results pages) in the :term:`user interface`. When the parameter is not
  included, the default is to return all levels of description (e.g.
  ``topLod=0``) Options:

  * ``0``: all results
  * ``1``: only top-level descriptions
  * *Example* - return only top-level descriptions: ``/api/informationobjects?topLod=1``

* **onlyMedia**: Return results with a linked :term:`digital object`, or all
  descriptions. The default when this parameter is not included is to return
  all descriptions (e.g. ``onlyMedia=0``). Options:

  * ``0``: Return all descriptions
  * ``1``: Return only descriptions with a linked :term:`digital object`
  * *Example* - return descriptions with a digital object: ``/api/informationobjects?onlyMedia=1``

* **copyrightStatus**: Return records with a particular copyright status,
  based on PREMIS rights statements associated with the description. For more
  information on PREMIS rights in AtoM, see: :ref:`rights`. Expects the
  internal ID of a particular term from the Copyright status
  :term:`taxonomy` as the value.

  * *Example* - Return records with a PREMIS rights statement that indicates
    they are under copyright: ``/api/informationobjects?copyrightStatus=335``

* **materialType**: Relates to the Canadian
  :ref:`RAD standard's <rad-template>` General material desgination (GMD)
  terms - terms are found in AtoM's Material type  :term:`taxonomy`.
  Returns results limited to those linked to a particular GMD term. Expects
  the internal ID of a particular :term:`term` from the Material type taxonomy
  as its value.

  * *Example* - Return records with a General material designation of "Moving
    images": ``/api/informationobjects?materialType=264``

* **languages**: Equivalent to the languages :term:`facet <facet filter>` in
  the :term:`user interface`, which limits the results of a request to
  descriptions in a specific language. Expects an ISO 639-1 language code.

  * *Example* - return records in French: ``/api/informationobjects?languages=fr``

* **levels**: Return results limited to a specified level of description.
  Expects a term ID from the Levels of description taxonomy as the parameter
  value. Like all :term:`taxonomy` terms in AtoM, these :term:`terms <term>` can
  be user-defined, so the IDs may vary.

  * *Example* - Return records with a level of description of "Series":
    ``/api/informationobjects?levels=224``

* **mediatypes**: Filters results based on the :term:`digital object`
  linked to the descriptions returned. Expects the internal id of the default
  terms used in the Media type taxonomy:

  * *Example* - Return records with a linked digital object that is an image:
    ``/api/informationobjects?mediatypes=136``

* **repos**: Returns records filtered by their association to a
  particular :term:`repository` (e.g. an :term:`archival institution`). Only
  really useful as a parameter in a multi-repository AtoM installation.
  Expects the internal repository ID as a value - AtoM does not include
  default archival institutions during installation, so these IDs will
  depend on user data.

  * *Example* - Return records associated with the Example Archives (example
    ID = 827): ``/api/informationobjects?repos=827``


* **places**: Returns records filtered by their association to a
  particular :term:`place` :term:`access point`. For more information on
  linking an :term:`archival description` to an access point, see:
  :ref:`add-term-fly`. Expects the internal place term ID as a value - AtoM
  does not include default place terms during installation, so these IDs will
  depend on user data.

  * *Example* - Return records with "Example place" (example ID = 1123) as a
    linked place access point: ``/api/informationobjects?places=1123``

* **subjects**: Returns records filtered by their association to a
  particular :term:`subject` :term:`access point`. For more information on
  linking an :term:`archival description` to an access point, see:
  :ref:`add-term-fly`. Expects the internal subject term ID as a value - AtoM
  does not include default subject terms during installation, so these IDs
  will depend on user data.

  * *Example* - Return records with "Example subject" (example ID = 945) as a
    linked subject access point: ``/api/informationobjects?subjects=945``

* **genres**: Returns records filtered by their association to a
  particular genre :term:`access point`. For more information on
  linking an :term:`archival description` to an access point, see:
  :ref:`add-term-fly`. Expects a specific ID for one of the
  :term:`terms <term>` in the Genre :term:`taxonomy` as a value. AtoM
  includes 45 default terms at installation, taken from the US Library of
  Congress' "Basic Genre Terms for Cultural Heritage Materials," available at:
  http://memory.loc.gov/ammem/techdocs/genre.html.

  * *Example* - Return records with "Photographs" (ID = 403) as a linked
    genre access point: ``/api/informationobjects?genres=403``

* **creators**: Returns records filtered by their association to particular
  actor (i.e. link to an :term:`authority record` as a :term:`creator`).
  Expects the internal actor ID as a value. AtoM does not include default
  authority records at installation, so these IDs will depend on user data.

  * *Example* - Return records linked to "Creator 1" (example ID = 1245)
    authority record as a creator: ``/api/informationobjects?creators=1245``

* **names**: Returns records filtered by their association to particular
  actor (i.e. link to an :term:`authority record` as a name
  :term:`access point`). Expects the internal actor ID as a value. AtoM does
  not include default authority records at installation, so these IDs will
  depend on user data.

  * *Example* - Return records linked to "Name 1" (example ID = 4432)
    authority record as a name access point: ``/api/informationobjects?names=4432``

* **collection**: Similar to the "Part of" facet in the
  :term:`user interface` - see :ref:`browse-hierarchy-facet` for
  further information. Returns records with a common top-level
  :term:`parent record`. Expects the information object ID of the top-level
  parent record as its value. These IDs will depend on user data.

  * *Example* - Return descendent records of "Example fonds" (example ID =
    972): ``/api/informationobjects?collection=972``

* **startDate**: Used to supply a start date for a date range query over the
  event dates associated with an information object. Expects an ISO-8601
  formatted date string (YYYY-MM-DD) as its value. Queries against the
  internal, controlled start date value associated with an archival
  description (not the display date, which allows users to include expressions
  of approximation or uncertainty in the date display). For more information,
  see: :ref:`date-range-search`.

  * *Example* - Return records with a start date of 1900 or later:
    ``/api/informationobjects?startDate=1900-01-01``

* **endDate**: Used to supply a end date for a date range query over the
  event dates associated with an information object. Expects an ISO-8601
  formatted date string (YYYY-MM-DD) as its value. Queries against the
  internal, controlled end date value associated with an archival
  description (not the display date, which allows users to include expressions
  of approximation or uncertainty in the date display). For more information,
  see: :ref:`date-range-search`.

  * *Example* - Return records with a end date of 1900 or earlier:
    ``/api/informationobjects?endDate=1900-01-01``

* **rangeType**: Associated with a date range search, this parameter
  determines the type of date range query applied - inclusive, or exact.
  For more information, see: :ref:`date-range-search`. When this parameter is
  not included with a date range query, the default value is ``inclusive``.
  Accepted parameter values:

  * ``exact``: the start and end dates of descriptions returned must fall
    entirely within the date range entered.
  * ``inclusive``: any description whose start or end dates touch or overlap
    the target date range will be returned. **Note:** this is labelled as
    "Overlapping" in the Advanced search :term:`user interface`.
  * *Example* - Return records whose dates of creation fall exactly between
    1900 and 1902: ``/api/informationobjects?startDate=1900-01-01&endDate=1902-12-31&rangeType=exact``

.. _browse-io-filter-examples:

Examples of using filter parameters in combination
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Return results with a Genre access point of "Maps" created between 1900 and
1970, and return the results sorted by start date:**

``/api/informationobjects?genres=394&startDate=1900-01-01&endDate=1970-12-31&rangeType=exact&sort=date``

**Return any series-level records with a start date after 1900 from a
particular repository:**

``/api/informationobjects?repos=471&levels=224&topLod=0&startDate=1900-01-01&rangeType=exact``

**Return top-level descriptions with a linked digital object that is textual:**

``/api/informationobjects?topLod=1&onlyMedia=1&mediatypes=137``

.. NOTE::

   In this example, the ``onlyMedia`` parameter is not really needed - the
   ``mediatypes`` parameter will ensure that only results with textual digital
   objects linked will be returned. It has been included to demonstrate how to
   combine available parameters, and should return the same number of results
   as:

``/api/informationobjects?topLod=1&mediatypes=137``

**Return Spanish descriptions with a digital object attached:**

``/api/informationobjects?languages=es&onlyMedia=1``

.. _browse-io-examples:

Combining boolean and filter parameters - examples
--------------------------------------------------

**Return results that have the word "west" in a place access point field:**

``/api/informationobjects?sq0=west&sf0=place&topLod=0``

**Return results that have NO place access point, created between 1950 and
1969:**

``/api/informationobjects?sq0=_missing_:places&startDate=1950-01-01&endDate=1969-12-31&rangeType=exact&topLod=0``

.. TIP::

   You can use the following formula to search for missing/empty fields, or to
   broadly search for fields that have data in them - you need to know
   internal Elasticsearch field name to be able to do so:

   Returns results with no data in the specified field

   ``_missing_:field.name``

   Returns results with any data in the specified field

   ``_exists_:field.name``

   This will work in the :term:`user interface` if you enter it into the
   boolean query fields of the Advanced search panel, but you can also
   incorporate it into an API query, using the ``sq0`` parameter:

   Return descriptions with no data in the scope and content field in English:

   ``/api/informationobjects?sq0=_missing_:i18n.en.scopeAndContent``

   The examples above and below this tip show this parameter used in an API
   query.

**Return Series-level records with ANY subject access point AND** ``tax*``
**in the Scope and content field, sorted by most recently created or
modified:**

``/api/informationobjects?sq0=_exists_:subjects&so1=and&sq1=tax*&sf1=scopeAndContent&levels=224&sort=lastUpdated``

**Return results with** ``coffee`` **OR** ``chocolate`` **in any field, with
dates that match or overlap a range of January 1, 1990 - March 4, 2001, sorted
by date:**

``/api/informationobjects?sq0=chocolate&so1=or&sq1=coffee&startDate=1990-01-01&endDate=2001-03-04&rangeType=inclusive&sort=date``

.. TIP::

   The above query could also be expressed more simply by relying on the
   boolean operator and rangeType defaults, and therefore being able to exclude some
   parameters, like so:

   ``/api/informationobjects?sq0=chocolate+coffee&startDate=1990-01-01&endDate=2001-03-04&sort=date``


:ref:`Back to top <api-browse-io>`
