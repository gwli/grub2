TOP=`pwd`/..
installdir=$TOP/../grub_install

rm -fr $installdir
mkdir $installdir

cd $TOP

sudo apt install dh-autoreconf bison flex

./autogen.sh 
CC=clang CXX=clang++ ./configure --prefix=$installdir
make 
make install
