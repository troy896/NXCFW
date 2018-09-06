#!/bin/sh

#Build script for NXCFW
#Simple build script to compile, clean and copy over to sd files.

mkdir build 
cd build
mkdir switch
mkdir switch/tinfoil
mkdir switch/NX-Shell
mkdir switch/JKSV
mkdir switch/Toolkit
mkdir tinfoil
mkdir tinfoil/nsp
mkdir splashes
mkdir ReiNX
mkdir ReiNX/sysmodules
mkdir ReiNX/patches
mkdir ReiNX/titles
mkdir ReiNX/titles/010000000000100D
mkdir ReiNX/titles/010000000000100D/exefs
mkdir ReiNX/titles/0100000000000036
mkdir ReiNX/titles/0100000000000036/exefs


cp /d/Github/NXCFW/NX-Shell/NX-Shell.nro /d/Github/NXCFW/build/switch/NX-Shell/NX-Shell.nro
cp /d/Github/NXCFW/creport/main /d/Github/NXCFW/build/ReiNX/titles/0100000000000036/exefs/main
cp /d/Github/NXCFW/creport/main.npdm /d/Github/NXCFW/build/ReiNX/titles/0100000000000036/exefs/main.npdm
cp /d/Github/NXCFW/fspm/fs_mitm.kip /d/Github/NXCFW/build/ReiNX/sysmodules/fs_mitm.kip
cp /d/Github/NXCFW/fspm/pm.kip /d/Github/NXCFW/build/ReiNX/sysmodules/pm.kip
cp /d/Github/NXCFW/Toolkit.nro /d/Github/NXCFW/build/switch/Toolkit/Toolkit.nro
cd /d/Github/NXCFW/ReiNX 
make
cp /d/Github/NXCFW/ReiNX/out/ReiNX.bin /d/Github/NXCFW/build/ReiNX.bin
cp /d/Github/NXCFW/ReiNX/out/ReiNX/splash.bin /d/Github/NXCFW/build/ReiNX/splash.bin
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules/loader.kip /d/Github/NXCFW/build/ReiNX/sysmodules/loader.kip
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules/sm.kip /d/Github/NXCFW/build/ReiNX/sysmodules/sm.kip
cp /d/Github/NXCFW/ReiNX/out/ReiNX/patches/es_patch.rxp /d/Github/NXCFW/build/ReiNX/patches/es_patch.rxp
make clean
cd /d/Github/NXCFW/hbmenu
make nx
cp /d/Github/NXCFW/hbmenu/hbmenu.nro /d/Github/NXCFW/build/hbmenu.nro
make clean
cd /d/Github/NXCFW/hbloader
make
cp /d/Github/NXCFW/hbloader/hbl.nso /d/Github/NXCFW/build/ReiNX/titles/010000000000100D/exefs/main
cp /d/Github/NXCFW/hbloader/hbl.npdm /d/Github/NXCFW/build/ReiNX/titles/010000000000100D/exefs/main.npdm
touch /d/Github/NXCFW/build/ReiNX/titles/010000000000100D/exefs/rtld.stub
make clean
cd /d/Github/NXCFW/Tinfoil
make
cp /d/Github/NXCFW/Tinfoil/Tinfoil.nro /d/Github/NXCFW/build/switch/tinfoil/tinfoil.nro
make clean

cd /d/Github/NXCFW/build
export DATE=$(date +%s | cut -c 1-8)
zip -r9 ReiNX-$DATE.zip .
cp /d/Github/NXCFW/build/ReiNX-$DATE.zip /d/Github/NXCFW/out/ReiNX-$DATE.zip
cd /d/Github/NXCFW
rm -r build