#!/bin/bash

ARCH=`uname -m`

echo "Arch: $ARCH"

if [ "$ARCH" = "x86_64" ]; then
    FILE=iot-devkit-toolchain-linux-64bit-edison-20160606.sh
else
    FILE=iot-devkit-toolchain-linux-32bit-edison-20160606.sh
fi

URL=https://iotdk.intel.com/sdk/3.5/edison/${FILE}
DEST=${HOME}/.arduino15/packages/Intel/tools/core2-32-poky-linux/1.6.2+1.0/

wget -c "${URL}"
rm -rf "${DEST}/i686"
mkdir -p "${DEST}/i686"

chmod 755 ${FILE}
./${FILE} -y -S -R -d "${DEST}/i686"

mv "${DEST}/i686/sysroots/x86_64-pokysdk-linux" "${DEST}/i686/sysroots/pokysdk"
cd "${DEST}/i686"
sed -i 's/\/x86_64-pokysdk-linux\//\/pokysdk\//g' relocate_sdk.sh
./relocate_sdk.sh
