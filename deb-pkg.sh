#!/bin/bash
PKG_NAME="helloworld"
VERSION=$(cat VERSION)
ARCH_NAME="${PKG_NAME}-${VERSION}.tar.gz"

debmake -y -p ${PKG_NAME} \
    -u ${VERSION} -r 1 -x1 -n \
    -e "igorshkov@k-tech.ru" \
    -f "Iliya Gorshkov" \
    -b':bin' \
    -i debuild

lintian ../${PKG_NAME}_${VERSION}_amd64.deb