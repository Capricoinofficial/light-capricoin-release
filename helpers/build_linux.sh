#!/bin/bash 
echo "build_linux.sh"
source helpers/build-common.sh
source build-config.sh
check_vars

$DOCKERBIN run --rm -it --privileged -e MKPKG_VER=${VERSION} -v $(pwd)/helpers:/root  -v $(pwd)/repo:/root/repo  -v $(pwd)/source:/opt/wine-light/drive_c/light-capricoin/ -v $(pwd):/root/light-capricoin-release capricoin/light-capricoin-release:${VERSION} /root/make_linux ${VERSION}

