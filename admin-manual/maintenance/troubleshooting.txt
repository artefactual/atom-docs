.. _maintenance-troubleshooting:

===============
Troubleshooting
===============

PHP configuration
-----------------

One of the reasons why PHP is not so popular is because of how much its
`compile-time configuration <http://www.php.net/manual/en/configure.about.php>`_
and its `runtime configuration
<http://www.php.net/manual/en/configuration.php>`_ affect the final behavior of
the environment.

Because every system is setup differently, PHP provides a function called
`phpinfo() <http://php.net/manual/en/function.phpinfo.php>`_ that makes possible
to explore the configuration settings for debugging purposes. It's important to
be aware of your PHP configuration when you are troubleshooting a problem in
AtoM.

All you have to do is to create a new file with the contents shown below and put
it in a web viewable location, then open that location from your browser. You
could also add the function (found in the third line) to the very end of the
`qubit_dev.php file
<https://github.com/artefactual/atom/blob/2.x/qubit_dev.php>`_.

.. code-block:: php

   <?php

   phpinfo();

   ?>

You can find more help on the following link: `How can I create a phpinfo.php
page? (mediatemple.net)
<https://kb.mediatemple.net/questions/764/How+can+I+create+a+phpinfo.php+page%3F#gs>`_.
