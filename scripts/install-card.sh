#!/bin/bash
set -e
set -o pipefail

# card path
if [ -z "$1" ] ; then
    echo "Error: No path to card supplied, e.g. /media/username/5FGT-123F"
    exit 1
fi

export CARD_PATH=$1/raspberrypi-ua-netinst

echo
echo "Installation target: ""${CARD_PATH}"

export SUDOERS_PATH=$CARD_PATH/config/files/root/etc/sudoers.d

echo
echo "Creating directories..."
echo

mkdir -pv "$SUDOERS_PATH"

echo
echo "Copying files..."
echo

# config scripts
cp -v distro/installer-config.txt "$CARD_PATH"/config/

cp -v distro/post-install.txt "$CARD_PATH"/config/
cp -v distro/installation-files.list "$CARD_PATH"/config/files/

# ssh
cp -v ~/.ssh/my_key.pub "$CARD_PATH"/config/files/

# sudo
cp -v distro/sudoers.txt "$SUDOERS_PATH"/waco

echo
echo "Installation SD-card ready."
echo
