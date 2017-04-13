#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
from setuptools import setup


def check_setuptools_features():
    import pkg_resources
    try:
        list(pkg_resources.parse_requirements('foo~=1.0'))
    except ValueError:
        exit('Your Python distribution comes with an incompatible version '
             'of `setuptools`. Please run:\n'
             ' sudo pip install --upgrade setuptools\n'
             'and then run this command again')

# check if setuptools is up to date
check_setuptools_features()


setup(
    name="waco-rpi",
    author="Thijs Triemstra",
    description="Scripts for running a headless Pi Zero in a Waco mini TV.",
    license="MIT",
    keywords="raspberry orange banana pi rpi lcd display screen spi i2c",
    url="https://github.com/thijstriemstra/waco-rpi",
    install_requires=[
        "luma.core>=0.7.4",
        "luma.emulator>=0.1.2",
        "luma.lcd>=0.3.4"
    ],
    classifiers=[
        "License :: OSI Approved :: MIT License",
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Education",
        "Intended Audience :: Developers",
        "Topic :: Education",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6"
    ]
)
