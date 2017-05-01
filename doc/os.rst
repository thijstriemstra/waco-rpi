Operating System
================

`raspberrypi-ua-netinst`_ gives Raspbian power users the ability to
install a minimal base system unattended using the latest Raspbian packages.

Installer
^^^^^^^^^

Go to the ``scripts`` directory::

  cd scripts

Get `raspberrypi-ua-netinst`_::

  git clone git@github.com:FooDeas/raspberrypi-ua-netinst.git
  cd raspberrypi-ua-netinst

Now `build raspberrypi-ua-netinst`_::

  ./clean.sh
  ./update.sh
  ./build.sh
  sudo ./buildroot.sh

This creates the various installer types::

  33M jul 26 23:33 raspberrypi-ua-netinst-git-e06c41c.img.bz2
  29M jul 26 23:32 raspberrypi-ua-netinst-git-e06c41c.img.xz
  32M jul 26 23:22 raspberrypi-ua-netinst-git-e06c41c.zip

SD-card
^^^^^^^

Run ``df -h`` to see what devices are currently mounted. Insert the SD-card and
run ``df -h`` again and find the SD-card. It will be listed as something like ``/dev/sdc1``
and ``/dev/sdc2``. Unmount the disk(s) (in case there's 2 partitions, one for boot, one for system)::

  umount /dev/sdc1
  umount /dev/sdc2

`Write the image`_ to the SD-card::

  xzcat raspberrypi-ua-netinst-git-e06c41c.img.xz | sudo dd bs=4M of=/dev/sdc
  sync
  sudo eject /dev/sdc

Remove the SD-card and insert it back in the host again. Install the files
on the SD-card::

  cd ../..
  ./install-card.sh photobooth /media/thijs/9FA0-37C9 192.168.2.20 photobooth1
  sync
  sudo eject /dev/sdc

Insert SD-card into RaspberryPI, boot it up and cross your fingers for
approximately 30 minutes.

When the installation completes successfully, the logfile is moved to
``/var/log/raspberrypi-ua-netinst.log`` on the installed system.
When an error occurs during install, the logfile is placed in the
``raspberrypi-ua-netinst`` folder on the SD-card and is named
``error-<datetimestamp>.log``.

.. _raspberrypi-ua-netinst: https://github.com/FooDeas/raspberrypi-ua-netinst
.. _build raspberrypi-ua-netinst: https://github.com/FooDeas/raspberrypi-ua-netinst/blob/master/BUILD.md
.. _write the image: https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
