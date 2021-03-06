git clone  https://github.com/trezor/cython-hidapi
 cd cython-hidapi
 git submodule init
 git submodule update
 cd ..
 docker run --privileged -ti --rm \
   -e WINEPREFIX="/wine/wine-py2.7.8-32" \
   -v $(pwd)/cython-hidapi:/code \
   -v $(pwd)/helpers:/helpers \
   ogrisel/python-winbuilder wineconsole --backend=curses Z:\\helpers\\hidapi-build.bat
   #cp -av cython-hidapi/build/lib.win32-2.7/hid.pyd ./helpers