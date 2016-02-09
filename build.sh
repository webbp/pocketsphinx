export SYSROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../android-arm-toolchain
ARCH=arm-linux-androideabi
#/Users/webb/Library/Android/android-ndk-r10e/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=$SYSROOT
ln -s $SYSROOT/sysroot/usr/include/linux/soundcard.h $SYSROOT/sysroot/usr/include/sys/soundcard.h

export PATH=$SYSROOT/$ARCH/bin:$PATH
export CFLAGS=-I$SYSROOT/include
export CXXFLAGS=-I$SYSROOT/include
#export C_INCLUDE_PATH=$SYSROOT/include
#export LD_LIBRARY_PATH=$SYSROOT/lib
#export LDFLAGS=-llog
#export LDFLAGS="-L$SYSROOT/lib -lsamplerate"
#export LDFLAGS=-lsamplerate

make distclean
make clean
./autogen.sh --build=x86_64 --host=$ARCH --without-python --enable-static=no --enable-shared=yes --with-sysroot=$SYSROOT --prefix=$SYSROOT && make && sudo make install
