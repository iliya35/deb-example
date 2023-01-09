#!/bin/bash
PKG_NAME="helloworld"
VERSION=$(cat VERSION)
ARCH_NAME="${PKG_NAME}-${VERSION}.tar.gz"

DEBUG=pdfbmeclak

debmake -y -p ${PKG_NAME} \
    -u ${VERSION} -x1 -t \
    -e "igorshkov@k-tech.ru" \
    -f "Iliya Gorshkov" \
    -b":bin" \
    -i "debuild --no-lintian -uc -us"

lintian ../${PKG_NAME}_${VERSION}-1_amd64.deb

mkdir -p ./out/binary
mkdir -p ./out/source

find ../ -name "${PKG_NAME}_*.deb" -type f -exec  cp -Lrfv "{}" out/binary \;
find ../ -name "${PKG_NAME}_*.debian.tar.*" -exec  cp -Lrfv "{}" out/source \;
find ../ -name "${PKG_NAME}_*.orig.tar.*" -exec  cp -Lrfv "{}" out/source \;
find ../ -name "${PKG_NAME}_*.dsc" -exec  cp -Lrfv "{}" out/source \;