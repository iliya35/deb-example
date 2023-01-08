#!/bin/bash
PKG_NAME="helloworld"
VERSION=$(cat VERSION)
ARCH_NAME="${PKG_NAME}-${VERSION}.tar.gz"

debmake -y -p ${PKG_NAME} \
    -u ${VERSION} -r 1 -x1 -n \
    -e "iliya.gorshkov@yandex.ru" \
    -f "Iliya Gorshkov" \
    -b':bin' \
    -i debuild