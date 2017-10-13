.. _customization-watermarking:

============
Watermarking
============

.. _here: https://demo.accesstomemory.org/26-sudbury-public-library-photo-copyright-rideau-air-photos-ltd-seeleys-bay-ont-can

A digital watermark is generally understood as a kind of marker embedded in a 
digital object (such as an image, text, video, or audio file), typically used to 
indicate ownership and/or to prevent unauthorized use. For images, the watermark 
is often a text layer or image identifying the owner of the digital object. 

AtoM supports basic digital watermarking functionality for images and text files 
such as PDFs, since the preview image (aka the :term:`reference display copy`) 
for a text file is a JPG image. The watermark **does not alter or affect** the 
:term:`master digital object`. Similarly, thumbnail images, used in search and 
browse results, are also unaffected. Only the :term:`reference display copy`, 
used on the :term:`view page` of an :term:`archival description`, will show the 
watermark. 

.. SEEALSO:: 

   * :ref:`upload-digital-object`
   * :ref:`rights-digital-object`
   * :ref:`copyright-pop-up`

AtoM's default behavior is to composite (a.k.a. "tile") new reference images
with the watermark file. For best results, we recommend using a format for
your watermark that supports alpha compositing, such as a PNG image file. The
watermark will work best if the background is transparent or white - AtoM will
render images used as a watermark transparent, so they need not be transparent
to begin with.

.. IMPORTANT:: 

   You must have Imagemagick properly installed and configured for digital 
   watermarking to work in AtoM. For more information, see: 

   * :ref:`Requirements: other dependencies <other-dependencies>`
   * :ref:`Installation: other packages <linux-ubuntu-xenial-other-packages>` 


.. _watermarking-apply:

Applying a watermark in AtoM
============================

1. First you will need to choose your watermark. You can use an institution 
   logo, or create a simple text-based image. There are also many tutorials 
   available online on how to create watermark images using open source tools
   such as `GIMP <https://www.gimp.org/>`__. Choose something that won't be too
   visually busy, so the underlying photo can still be seen clearly. Try to 
   ensure the image background is white or transparent for best results. You 
   also need to use an image format that supports alpha compositing - we 
   recommend using images in a PNG format for best results. 

   Additionally, because AtoM will tile the watermark until the entire reference 
   image is covered, we recommend choosing an image no larger than 250 x 250px. 

2. Save your chosen watermark file as ``watermark.png`` and place it in your 
   root AtoM directory. 
3. That's it! Now any images uploaded in the future will have the watermark 
   applied. If you wish to stop having watermarks applied, remove the 
   ``watermark.png`` from AtoM's root directory. 

For more information on uploading and managing digital objects in AtoM, see: 

* :ref:`upload-digital-object`

Example output
--------------

For the following example watermarked image, the watermark used was a 250 x 250 
pixel PNG image of the AtoM logo on a white background. The reference image
to which it was applied (available in the AtoM demo site, `here`_) was 
approximately 480 x 317px:

.. image:: images/watermark-example.*
   :align: center
   :width: 95%
   :alt: An exmaple reference image with a watermark applied

.. _watermark-apply-legacy:

Applying a watermark to existing images
=======================================

If you have followed the steps above, you can use the digital object derivative
regeneration command-line task to regenerate your existing derivatives. As they
are regenerated, AtoM will apply the watermark to any images generated for use
as the reference display copy. 

.. code-block:: bash

   php symfony digitalobject:regen-derivatives

For more information on using this task, see: 

* :ref:`cli-regenerate-derivatives`

.. WARNING::

   When running the ``regen-derivatives`` task, **all** of your current
   derivatives for the targeted digital objects will be deleted - meaning ALL
   of them if you provide no further criteria. They will be replaced  with new
   derivatives after the task has finished running. If you have manually
   changed the :term:`thumbnail` or :term:`reference display copy` of a
   digital object via the user interface (see: :ref:`edit-digital-object`), 
   these two will be replaced with digital object derivatives created from 
   the :term:`master digital object`.

:ref:`Back to top <customization-watermarking>` 

