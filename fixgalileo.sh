#!/bin/bash

if [ "$ARCH" = "x86_64" ]; then
    FILE=galileo-toolchain-20150120-linux64.tar.bz2
else
    FILE=galileo-toolchain-20150120-linux32.tar.bz2
fi

echo "Arch: $ARCH"


URL=https://github.com/majenkotech/IntelFixes/releases/download/0.0.0-archive/${FILE}
DEST=${HOME}/.arduino15/packages/Intel/tools/i586-poky-linux-uclibc/1.6.2+1.0/

wget -c ${URL}

rm -rf "${DEST}/i586"
mkdir -p "${DEST}"
tar -C "${DEST}" -jxf ${FILE}
cp relocate_sdk_py3.py "${DEST}/i586/relocate_sdk.py"
cd "${DEST}/i586"
sed -i 's/-perm +111/-perm \/111/g' install_script.sh
./install_script.sh
