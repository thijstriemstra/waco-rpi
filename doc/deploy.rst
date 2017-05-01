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

Install ``virtualenvwrapper``::

  sudo pip3.4 install virtualenvwrapper

Add following at the bottom of ``~/.bashrc``::

  export WORKON_HOME=$HOME/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4
  source /usr/local/bin/virtualenvwrapper.sh

And log out and in again.

Application
-----------

Create a ``waco-rpi`` virtualenv::

  mkvirtualenv waco-rpi

Move the waco-rpi.deb to the RaspberryPi::

  scp waco-rpi.deb waco@192.168.2.52:/home/waco/

Install the .deb file::

  dpkg

