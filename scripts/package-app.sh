#!/bin/bash
set -e
set -o pipefail

export VERSION
export APP_ITERATION
export APP_TYPE
export APP_VENDOR
export APP_DESCRIPTION
export APP_LICENSE
export APP_URI
export APP_MAINTAINER
export APP_DEPS
export RASPBERRYPI_ARCH

VERSION="$(python ../setup.py --version)"
APP_ITERATION=$(if [ -f build_version ]; then cat build_version; else echo 1; fi)
APP_TYPE=deb
APP_VENDOR=$(python ../setup.py --author)
APP_DESCRIPTION=$(python ../setup.py --description)
APP_LICENSE=$(python ../setup.py --license)
APP_URI=$(python ../setup.py --url)
APP_MAINTAINER=Collab
RASPBERRYPI_ARCH=armhf
APP_DEPS="--depends libbz2-dev --depends libsdl-dev --depends libportmidi-dev --depends libsdl-ttf2.0-dev --depends libsdl-mixer1.2-dev --depends libsdl-image1.2-dev --depends python3.4-dev --depends libavformat-dev --depends libavcodec-dev --depends libavdevice-dev --depends libavutil-dev --depends libswscale-dev --depends libavresample-dev --depends libavfilter-dev"
export app_includes="waco.conf waco.py setup.py waco_demo2.py fonts waco_demo3.py"

export APP_OWNER_USER=waco
export APP_OWNER_GROUP=waco
export APP_NAME="waco-rpi"
export APP_PREFIX=/opt/waco-rpi

echo "Packaging..."
echo
echo "APP_NAME:" "${APP_NAME}"
echo "APP_PREFIX:" "${APP_PREFIX}"
echo

cd ..

# remove older debs
rm -fv ${APP_NAME}_*.deb

# create .deb
echo "Creating .deb file (${APP_NAME}-${VERSION}-${APP_ITERATION})..."
echo

fpm -s dir -t "${APP_TYPE}" --name "${APP_NAME}" --vendor "${APP_VENDOR}" --version "${VERSION}" \
--maintainer "${APP_MAINTAINER}" --url "${APP_URI}" --license "${APP_LICENSE}" --description "${APP_DESCRIPTION}" \
--architecture "${RASPBERRYPI_ARCH}" --deb-user "${APP_OWNER_USER}" --deb-group "${APP_OWNER_GROUP}" \
--iteration "${APP_ITERATION}" --deb-compression 'xz' --exclude "*__pycache__" \
--deb-systemd scripts/startup/waco.service --deb-default scripts/startup/waco --no-deb-systemd-restart-after-upgrade \
${APP_DEPS} --prefix "${APP_PREFIX}" ${app_includes}

# show app details
dpkg-deb -c ${APP_NAME}_*.deb
dpkg-deb -I ${APP_NAME}_*.deb

# increase build version nr
APP_ITERATION=$((APP_ITERATION + 1))
echo "$APP_ITERATION" > scripts/build_version

echo
echo "Package ready."
