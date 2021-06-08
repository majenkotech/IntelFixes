#!/bin/bash

if [ "$ARCH" = "x86_64" ]; then
    FILE=galileo-toolchain-20150120-linux64.tar.bz2
else
    FILE=galileo-toolchain-20150120-linux32.tar.bz2
fi

echo "Arch: $ARCH"

URL=https://downloadmirror.intel.com/24619/eng/${FILE}
DEST=${HOME}/.arduino15/packages/Intel/tools/i586-poky-linux-uclibc/1.6.2+1.0/

wget -c ${URL}

rm -rf "${DEST}/i586"
mkdir -p "${DEST}"
tar -C "${DEST}" -jxf ${FILE}
cd "${DEST}/i586"
sed -i 's/-perm +111/-perm \/111/g' install_script.sh
sed -i 's/^#!\/usr\/bin\/env python$/#!\/usr\/bin\/env python2/g' relocate_sdk.py
./install_script.sh
