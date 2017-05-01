Scripts for running headless Pi Zero inside a Waco mini TV.

Documentation
-------------

```
sudo apt-get install -y libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libavresample-dev libavfilter-dev
```

Enable the service on startup:
```
cd scripts
sudo cp startup/waco.service /lib/systemd/system/
sudo cp startup/waco.env /etc/default/waco
```

```
sudo systemctl enable waco.service
sudo systemctl start waco.service
```

Monitor status with:
```
sudo systemctl status waco.service -l
```

Usage
-----

```
PYTHONPATH=../luma.examples/examples/ python waco_demo1.py --config waco.conf
```

