#! /bin/sh
# --------------------
# Notice 
# --------------------
#   This configure shell script helps doing configure for llvm-gcc if 
#  your system changed gcc to hpc-gcc.

COMPILER="CC=llvm-gcc CXX=llvm-g++"
FEATURES="--enable-localjpeg  --enable-localzlib --enable-localpng"
FLTKABI="--with-abiversion=10305"

KVER_0=`uname -r | cut -d . -f1`
KVER_1=`uname -r | cut -d . -f2`
KVER_2=`uname -r | cut -d . -f3`
KVER_A=`uname -m`

echo "Darwin Kernel version identified ${KVER_0}.${KVER_1}.${KVER_2}, architecture : ${KVER_A}"

# Sens kernel version ...
# -----------------------
# ~ 18.x : Mojave
#   19.x : Catalina
#   20.x : Big Sur   ( Supporting arm64 archicture )

if [ ${KVER_0} -gt 19 ];then
    echo "Setting for universal binary for Big Sur"
    export ARCHFLAGS="-arch x86_64 -arch arm64"  
fi

./configure ${FEATURES} ${COMPILER} ${FLTKABI}
