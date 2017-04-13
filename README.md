Scripts for running headless Pi Zero in a Waco mini TV.

Installation
------------

Enable the service on startup:
```
cd scripts
sudo cp waco.service /lib/systemd/system/
```

```
sudo systemctl enable waco.service
sudo systemctl start waco.service
```

Monitor status with:
```
sudo systemctl status waco.service
```

Usage
-----

```
PYTHONPATH=../luma.examples/examples/ python waco_demo1.py --config waco.conf
```
