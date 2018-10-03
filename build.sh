#!/bin/sh

#Build script for NXCFW
#Simple build script to compile, clean and copy over to sd files.

mkdir build 
cd build
mkdir switch
mkdir switch/tinfoil
mkdir switch/NX-Shell
mkdir switch/JKSV
mkdir switch/ReiNXToolkit
mkdir tinfoil
mkdir tinfoil/nsp
mkdir Toolkit
mkdir Toolkit/splashes
mkdir ReiNX
mkdir ReiNX/sysmodules
mkdir ReiNX/sysmodules.dis
mkdir ReiNX/patches
mkdir ReiNX/titles
mkdir ReiNX/titles/010000000000100D
mkdir ReiNX/titles/010000000000100D/exefs

cp /d/Github/NXCFW/NX-Shell/NX-Shell.nro /d/Github/NXCFW/build/switch/NX-Shell/NX-Shell.nro
cp /d/Github/NXCFW/Essentials/splash.jpg /d/Github/NXCFW/build/Toolkit/splashes/pyra.jpg
cp /d/Github/NXCFW/Essentials/prod.keys /d/Github/NXCFW/build/prod.keys
cp /d/Github/NXCFW/Essentials/license.dat /d/Github/NXCFW/build/license.dat
cp /d/Github/NXCFW/Essentials/boot.dat /d/Github/NXCFW/build/boot.dat
cp /d/Github/NXCFW/Essentials/splash2.png /d/Github/NXCFW/build/Toolkit/splashes/pokemon.png
cp /d/Github/NXCFW/Essentials/REICOOL.png /d/Github/NXCFW/build/Toolkit/splashes/Reicool.png
cp /d/Github/NXCFW/Essentials/Ye.png /d/Github/NXCFW/build/Toolkit/splashes/Yeezy.png
cd /d/Github/NXCFW/ReiNX
make
cp /d/Github/NXCFW/ReiNX/out/ReiNX.bin /d/Github/NXCFW/build/ReiNX.bin
cp /d/Github/NXCFW/Essentials/splash.bin /d/Github/NXCFW/build/ReiNX/splash.bin
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules/loader.kip /d/Github/NXCFW/build/ReiNX/sysmodules/loader.kip
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules/sm.kip /d/Github/NXCFW/build/ReiNX/sysmodules/sm.kip
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules.dis/pm.kip /d/Github/NXCFW/build/ReiNX/sysmodules.dis/pm.kip
cp /d/Github/NXCFW/ReiNX/out/ReiNX/sysmodules.dis/fs_mitm.kip /d/Github/NXCFW/build/ReiNX/sysmodules/fs_mitm.kip
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
cd /d/Github/NXCFW/JKSV
make
cp /d/Github/NXCFW/JKSV/JKSV.nro /d/Github/NXCFW/build/switch/JKSV/JKSV.nro
make clean
cd /d/Github/NXCFW/Tinfoil
make
cp /d/Github/NXCFW/Tinfoil/Tinfoil.nro /d/Github/NXCFW/build/switch/tinfoil/tinfoil.nro
make clean
cd /d/Github/NXCFW/ReiNXToolkit
make
cp /d/Github/NXCFW/ReiNXToolkit/ReiNXToolkit.nro /d/Github/NXCFW/build/switch/ReiNXToolkit/ReiNXToolkit.nro
make clean
cd /d/Github/NXCFW/build
export DATE=$(date +%s | cut -c 1-8)
zip -r9 NXCFW-$DATE.zip .
cp /d/Github/NXCFW/build/NXCFW-$DATE.zip /d/Github/NXCFW/out/NXCFW-$DATE.zip
cd /d/Github/NXCFW
rm -r build