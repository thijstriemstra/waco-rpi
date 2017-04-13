Scripts for running headless Pi Zero in a Waco mini TV.

Installation
------------

Enable the service on startup:
```
cd scripts
sudo systemctl enable waco.service
sudo systemctl start waco.service
```

Usage
-----

```
PYTHONPATH=../luma.examples/examples/ python waco_demo1.py --config waco.conf
```
