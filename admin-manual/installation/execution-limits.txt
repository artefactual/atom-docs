.. _installation-execution-limits:

====================
PHP execution limits
====================

There are several PHP configuration settings that may be responsible for
prematurely halting a script. This is a frequent problem in many installations,
especially when handling large file uploads. In the PHP site there is also a
useful guide we recommend reading: `Common pitfalls
<http://www.php.net/manual/features.file-upload.common-pitfalls.php>`_.

``max_execution_time``:
  Limits the running time of a script (in seconds), e.g.:

  .. code-block:: ini

    max_execution_limit = 30

``memory_limit``:
  Limits the amount of memory a script may consume (in bytes [B], kilobytes
  [K], megabytes [M] or gigabytes [G]).

  .. code-block:: ini

    memory_limit = 128M

  Please note that this memory limit is not related to the amount of system
  memory (RAM) available, but is an artificial limit imposed by PHP to avoid
  run-away scripts from consuming all system resources. This implies that
  adjusting the PHP configuration should be done **before** deciding whether
  adding more RAM to your system may be beneficial. This limit is especially
  important if you are trying to process :term:`digital objects <digital
  object>` because it is needed to allocate enough memory to process both the
  input and the output digital object. See the following table:

  +------------+------------+
  | Size (MB)  | Megapixels |
  +============+============+
  | 100        | 13         |
  +------------+------------+
  | 128        | 18         |
  +------------+------------+
  | 256        | 35         |
  +------------+------------+
  | 512        | 70         |
  +------------+------------+
