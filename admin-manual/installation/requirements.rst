.. _installation-requirements:

======================
Technical Requirements
======================

*On this page*

* :ref:`Hardware and server environment <hardware>`
* :ref:`Minimum hardware requirements <minreq>`
* :ref:`Software dependencies <soft_dep>`
* :ref:`Other dependencies <other-dependencies>`

.. _hardware:

Hardware and server environment
===============================

Please note that it is difficult to provide an authoritative baseline or
recommended system specification for running AtoM. What is considered an
"acceptable" performance level is subjective, and the performance of the
application depends greatly on factors such as the how much data is in the
database and how many users are accessing the site simultaneously.

Furthermore, AtoM makes use of different components and services that could be
deployed in a distributed manner (across multiple machines in a network) in
order to accept an escalating number of users. The main goal of this
documentation is to describe the configuration of AtoM and its dependencies on
a single machine, but some aspects of a multi-node installation will also be
discussed.

.. _minreq:

Minimum hardware requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::

   The following information is intended to provide a starting point for
   setting up your system. It provides specifications for an "all-in-one"
   deployment, with all of the services (i.e. nginx, Percona server, ES,
   memcached) installed in a single virtual machine.

For a frame of reference, Artefactual's standard AtoM test/demo site deployment is a cloud VM with the following specifications:

* Processor: 2 vCPUs @ 2.3GHz
* Memory: 7GB
* Disk space (processing):  50GB at a minimum for AtoM's core stack plus more
  storage would be required for supporting any substantial number of digital
  objects.

.. _soft_dep:

Software dependencies (required)
--------------------------------

These are the minimum requirements, but please remember that in most of the
cases you'll experience better results working with the latest stable releases
of each component.

* A webserver like `Apache <https://httpd.apache.org/>`__ or
  `Nginx <http://nginx.com/>`__; Artefactual prefers the latter in
  development
* `Elasticsearch <https://www.elastic.co/products/elasticsearch>`__ 1.3.0 or
  newer (we use ES 1.7.6 in development).
  Elasticsearch 2.0 or newer is still not supported as they have deprecated a
  number of APIs still used in AtoM
* Oracle `Java <https://www.java.com/en/>`__ 7 or newer (required for
  Elasticsearch)
* `MySQL <https://www.mysql.com/>`__ 5.1 or newer
* `PHP <http://php.net/>`__ 5.5 or 5.6 (with Ubuntu 14.04) or 7.0 (with Ubuntu 16.04) 
* `Memcached <http://memcached.org>`__
* `Gearman job server <http://gearman.org>`__

Additionally, the following PHP extensions are mandatory:

* cURL
* JSON
* APC (apcu in PHP 5.5+, apcu-bc also required in PHP 7.0+)
* PDO and PDO-MySQL
* XSL

Optionally:

* Readline (not available in Windows).
* Memcache

.. note::

   All these dependencies can run in a number of different operative systems,
   including :ref:`installation-windows`, :ref:`installation-macosx`, Solaris,
   FreeBSD or :ref:`installation-linux`.

.. _other-dependencies:

Other dependencies
------------------

**ImageMagick**

    *ImageMagick® is a software suite to create, edit, compose, or convert
    bitmap images. It can read and write images in a variety of formats (over
    100) including DPX, EXR, GIF, JPEG, JPEG-2000, PDF, PhotoCD, PNG,
    Postscript, SVG, and TIFF. Use ImageMagick to resize, flip, mirror,
    rotate, distort, shear and transform images, adjust image colors, apply
    various special effects, or draw text, lines, polygons, ellipses and
    Bézier curves.*

`ImageMagick <http://www.imagemagick.org/script/index.php>`__ is used in AtoM
to create image derivatives (reference and :term:`thumbnail`) from the
:term:`master digital object`, including the creation of derivatives from
uploaded multi-page TIFFs. ImageMagick *and* Ghostscript are required for
creating single page and mulit-page PDF derivative images as well.

**Ghostscript**

    *Ghostscript is a suite of software based on an interpreter for Adobe
    Systems' PostScript and Portable Document Format (PDF) page description
    languages. Its main purposes are the rasterization or rendering of such
    page description language files, for the display or printing of document
    pages, and the conversion between PostScript and PDF files.* (`Wikipedia
    <https://en.wikipedia.org/wiki/Ghostscript>`__)

`Ghostscript <http://www.ghostscript.com/>`__ is used in AtoM *with*
ImageMagick for creating single-page and multi-page PDF derivative images

**FFmpeg**

    *FFmpeg is a complete, cross-platform solution to record, convert and
    stream audio and video. It includes libavcodec - the leading audio/video
    codec library.*

`FFmpeg <http://ffmpeg.org/>`__ is used in AtoM to create video derivatives,
including creating a flash reference video derivative for in-browser viewing.

**pdftotext (part of poppler-utils)**

    *pdftotext is an open source command-line utility for converting PDF files
    to plain text files —i.e. extracting text data from PDF-encapsulated
    files. It is freely available and included by default with many Linux
    distributions, and is also available for Windows as part of the Xpdf
    Windows port.* (`Wikipedia <https://en.wikipedia.org/wiki/Pdftotext>`__)

pdftotext is used in AtoM to extract PDF text to make it searchable via
AtoM's :term:`user interface`.

**Apache FOP**

    *Apache™ FOP (Formatting Objects Processor) is a print formatter driven by
    XSL formatting objects (XSL-FO) and an output independent formatter. It is
    a Java application that reads a formatting object (FO) tree and renders the
    resulting pages to a specified output.*

`Apache FOP <https://xmlgraphics.apache.org/fop/>`__ is used in AtoM to create
PDF finding aids.
