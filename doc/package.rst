Package
=======

Install dependencies::

  sudo apt-get install git curl bzip2 zip xz-utils gnupg kpartx \
  dosfstools binutils bc ruby-dev bsdtar reprepro libffi-dev
  sudo apt-get build-dep python

Install FPM_::

  sudo gem install fpm -v '>= 1.6.3'

Or to update::

  sudo gem update fpm

Package the application into a ``.deb`` file::

  cd scripts
  ./package-app.sh

Move the waco-rpi.deb to the RaspberryPi::

  scp waco-rpi_0.3.0-2_armhf.deb waco@192.168.2.52:/home/waco/

Next
----

Time to :doc:`deploy <deploy>` the application.

.. _FPM: https://github.com/jordansissel/fpm
