Deploy
======

Python Installation
-------------------

Log into the Raspberry Pi and install Python 3.4::

  sudo apt-get install python3.4-dev

Install the latest ``pip``::

  wget https://bootstrap.pypa.io/get-pip.py

Install it using Python 3.4::

  sudo python3.4 get-pip.py
  rm get-pip.py

Install ``virtualenvwrapper``::

  sudo pip3.4 install virtualenvwrapper

Add following at the bottom of ``~/.bashrc``::

  export WORKON_HOME=$HOME/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4
  source /usr/local/bin/virtualenvwrapper.sh

And log out and in again.

Application
-----------

Install the .deb file we :doc:`packaged earlier <package>`::

  dpkg -i waco-rpi_0.3.0-2_armhf.deb

Create a ``waco-rpi`` virtualenv::

  mkvirtualenv waco-rpi

Change to the installation directory::

  cd /opt/waco-rpi/

Install the application dependencies::

  pip install -e .

And clone the luma examples repository::

  git clone https://github.com/rm-hull/luma.examples.git

Place a video file in ``/opt/waco-rpi/``::

  cp luma.examples/examples/images/movie.mp4 .

Launch
------

Installation is now complete and you're now ready to reboot
and if everything's hooked up correctly, enjoy the show!

Use the ``systemctl status`` command to monitor the status::

  sudo systemctl status -l -n60 --no-pager --full --output=short-monotonic waco.service

Restart with::

  sudo systemctl restart waco.service
