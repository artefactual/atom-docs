.. _manage-jobs:

===========
Manage jobs
===========

.. |edit| image:: images/edit-sign.png
   :height: 18
   :width: 18

.. |gears| image:: images/gears.png
   :height: 18
   :width: 18

AtoM relies on `Gearman <http://gearman.org>`__ in order to execute certain
long-running tasks asynchronously to guarantee that web requests are handled
promptly and work loads can be distributed across multiple machines. This ensures
time and/or resource-intensive tasks do not timeout when running via the web
browser.

.. IMPORTANT::

   You must have the necessary dependencies installed and configured to be able
   manage asynchronous jobs in AtoM. See:

   * Installation: :ref:`installation-ubuntu-serve-workers`.
   * :ref:`maintenance-asynchronous-jobs`

Prior to AtoM 2.2, only the ingest of `Archivematica <https://www.archivematica.org>`__
DIPs was processed asynchronously. See
:ref:`Upload DIP <archivematica:upload-atom>` for more details.

As of AtoM 2.2, the ability to generate a PDF or RTF :term:`finding aid` from
:term:`archival descriptions <archival description>`, and the ability to manage
:ref:`PREMIS <premis-template>` rights inheritance, are now also handled as
asynchronous :term:`jobs <job>` in AtoM. Later versions of AtoM have increasingly
used the job scheduler to handle long-running operations, including publication
status updates, imports and exports, move operations, print reports, and more.

.. SEEALSO::

   * :ref:`print-finding-aids`
   * :ref:`rights-inheritance`
   * :ref:`publish-archival-description`
   * :ref:`move-archival-description`
   * :ref:`csv-import`
   * :ref:`csv-export`

Users can see the status of job requests by navigating to |edit| **Manage > Jobs**.

.. image:: images/manage-jobs-tab.*
   :align: center
   :width: 30%
   :alt: An image of the Manage menu

.. _using-jobs-page:

Using the Jobs page
===================

When first arriving on the page, users will see a table showing the status of any
ongoing jobs, as well as any previous jobs that have not been cleared by another
user. If you are an administrator, jobs displayed include CLI tasks that you
can run in a terminal. See :ref:`below <jobs-permissions>` for more information
on permissions and the Manage jobs page.

.. image:: images/manage-jobs.*
   :align: center
   :width: 80%
   :alt: An image of the Jobs page

**Start date**: When the job was first requested.

**End date**: When the job completed. A status of "N/A" implies that the job is
still executing.

**Job name**: Internal name of the job executed; indicates the type of job
being performed. Examples include:

* *arFindingAidJob* - Generate a :term:`finding aid` in either PDF or RTF
  format from an :term:`archival description`. See: :ref:`print-finding-aids`.
* *Inherit rights* - Allow :term:`child <child record>` descriptions to inherit
  the :ref:`PREMIS <premis-template>` rights applied to a parent. See:
  :ref:`rights-inheritance`.
* *arObjectMoveJob* - Move an archival description from one
  :term:`parent record` to another (or to become a top-level description).
  See: :ref:`move-archival-description`
* *arUpdatePublicationStatusJob* - Update the :term:`publication status` of a
  record and its descendants to either "published" or "draft". See:
  :ref:`publish-archival-description`.
* *arFileImportJob*: an import of records, such as a CSV or XML import. See:
  :ref:`import-export`.

**Job status**: Jobs can have 1 of 3 statuses:

* *Running* - The job is currently being executed. Refresh the page for an
  updated status.
* *Completed* - The job completed successfully.
* *Error* - The job failed to complete as requested. If there is any further
  information, it will be included in the "Info" column of the Jobs table.

If the job is related to a specific record, then the Job status column will
also include a blue arrow icon - this acts as a hyperlink to the related
record.

**Info**: Provides any available additional information about the status of a
job. The Info column also includes a link to the full report from the console
of the job, also known as the Job details page. For more information, see
below: :ref:`job-details`.

**User**: The :term:`username` of the AtoM user who initiated the job.

.. image:: images/manage-jobs-tabs.*
   :align: right
   :width: 20%
   :alt: An image of the Jobs page tabs

The Jobs page also includes tabs that allows users to view only those jobs that
are currently still being executed (e.g., a status of "Running") or jobs that
have failed (e.g., a status of "Error"). These can be useful when a large number
of jobs are being executed simultaneously, and/or the list of jobs has not been
cleared in some time. Click on one of the other tabs to switch the view from
"All jobs" to "Active jobs" or "Failed jobs". AtoM will refresh the page and
the table will be limited to the selected view.

.. _jobs-button-block:

Jobs page button block options
------------------------------

.. image:: images/button-block-jobs.*
   :align: center
   :width: 60%
   :alt: An image of the Jobs page button block

**Refresh and Auto refresh**

The jobs page will **not** automatically update when there is a change in a
job's  status - to see an updated status, such as whether or not a running job
has completed  successfully or failed, the user must refresh the page. This
can be done either  by manually refreshing the browser, or using the "Refresh"
button in the  :term:`button block` at the bottom of the jobs page.

.. image:: images/auto-refresh.*
   :align: right
   :width: 13%
   :alt: An image of the Jobs page auto-refresh option when engaged

In cases where a lot of jobs are running or a constant and automated status update
is desirable, users can click the **Auto refresh** button. Doing so will cause
the browser to automatically refresh every 5 seconds, until the auto-refresh
option is disengaged. When engaged, the Auto refresh button will show a checkmark
inside the circle on the button.

**Export history CSV**

In case users would like to clear completed jobs but keep a record outside of AtoM
of previous jobs performed, a :term:`CSV` export of the Jobs table is available.
Like the display table in the :term:`user interface`, the output contains columns
for startDate, endDate, jobName, jobStatus, jobInfo, and jobUser.

.. image:: images/jobs-csv-output.*
   :align: center
   :width: 80%
   :alt: An example image of the Jobs page CSV export

**Clear inactive jobs**

Clicking this button will remove any inactive jobs regardless of status (i.e.
completed or failed jobs) created by you from the Jobs page. Any jobs still
processing, or jobs created by another user, will not be affected.

.. NOTE::

   You can **only** clear jobs that you have initiated. If you are an
   administrator, you can clear all inactive jobs from the jobs page that you
   have initiated via the web-based dashboard or via a command-line terminal
   as of 2.5.

If all inactive jobs have been cleared and there are no current jobs running,
AtoM will indicate this in the jobs page with a message.

.. image:: images/jobs-cleared.*
   :align: center
   :width: 80%
   :alt: An example image of the Jobs page when there are no jobs

.. SEEALSO::

   The Administrator's manual includes installation instructions for setting up
   `Gearman <http://gearman.org>`__ and asynchronous job support in AtoM. A
   separate page also includes some examples of how to manage workers and
   jobs from the command-line. For more information, see:

   * Installation: :ref:`installation-ubuntu-serve-workers`.
   * :ref:`maintenance-asynchronous-jobs`

.. _job-details:

The Job details page
====================

When a job is executed, the task is run by one of the AtoM workers managed by
the Job scheduler, and all job details are captured by the console and
recorded to the AtoM worker log. The Job details page provides users with this
output via the :term:`user interface`. This can be useful in many cases - for
example, troubleshooting a job that has failed. Additionally, some import
options allow users to skip matched records and report them in the Job details
instead - an administrator can then review the output found on the Job details
page against the original import to determine what records where skipped
during import. For more information on imports, see: :ref:`import-export`.

.. image:: images/job-details.*
   :align: center
   :width: 90%
   :alt: An example image of the Job details page


.. _jobs-permissions:

Jobs and user permissions
=========================

Access to the Jobs page functionality is dependent on your :term:`user role`.
See :ref:`User roles <user-roles>`, :ref:`manage-user-accounts`, and
:ref:`edit-user-permissions` for more information on managing user roles in AtoM.

All authenticated (e.g. logged in) users can access the Jobs page. However, most
users will only see jobs and be able to clear jobs which they have started. Only
an :term:`administrator` can see the status of all jobs - however, like all users,
administrators can only clear jobs that belong to them. Administrators can clear
jobs that are associated with tasks run on the command-line.

:ref:`Back to top <manage-jobs>`
