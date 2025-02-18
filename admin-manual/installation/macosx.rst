.. _installation-macosx:

========
Mac OS X
========

OS X 15.2 (Sequoia) and newer ships with PHP pre-installed.
Recent versions of OS X include PHP 8.x. On the other hand, MySQL can be
installed using the `official package <http://dev.mysql.com/downloads/mysql/>`_.

However, we encourage you to use `homebrew <http://brew.sh/>`_, an open source
package manager for OS X that will make the installation of the dependencies
and its maintenance much easier. Installing homebrew is easy:

.. code-block:: bash

   ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"


More instructions can be found at:
https://github.com/mxcl/homebrew/wiki/Installation

Once homebrew is installed, you are ready to install all the
packages needed:

.. code-block :: bash

   brew install php --with-mysql --with-fpm
   brew install nginx
   brew install elasticsearch
   brew install mysql

Some extra :ref:`dependencies <installation-requirements>` can be also be
installed via homebrew:

.. code-block :: bash

   brew install ffmpeg
   brew install imagemagick
   ...
