.. _security-application:

===========
Application
===========

The behavior of PHP code often depends strongly on the values of many
`configuration settings <http://php.net/manual/en/ini.list.php>`_, including
fundamental changes to things like how errors are handled.

In our installation instructions, we defined some sane settings under the
:ref:`PHP section <linux-dependency-php>`. Namely, these settings are defined
in the PHP pool (:file:`/etc/php5/fpm/pool.d/atom.conf`) and they are
prioritized over those defined in :file:`/etc/php5/fpm/php.ini`. Be aware that
multiple configuration files are read when PHP starts up, therefore it is a good
practice to check the final configuration state when you are deploying AtoM. You
can use :ref:`phpinfo() <phpinfo>` for that purpose.

There are certain settings in PHP that could be tweaked as a security measure
but they may have unexpected results in AtoM. For example, you may be tempted to
disable ``allow_url_fopen`` but that would make impossible for AtoM to fetch
digital objects from remote resources. These settings only seem convenient for
hosting providers running untrusted code from their users or willing to limit
their abilities in runtime.
