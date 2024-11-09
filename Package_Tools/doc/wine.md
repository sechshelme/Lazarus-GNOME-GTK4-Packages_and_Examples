
# neusten Wine installieren
Die 64Bit Version muss installiert werden, auch wen man nur die 32Bit will,

```bash
mkdir wine
cd wine
git clone https://gitlab.winehq.org/wine/wine.git

// 64Bit
cd ..
mkdir build_wine64
cd build_wine64
../wine/configure --enable-win64
make -j20
sudo make install -j20

// 32Bit
cd ..
mkdir build_win32
cd build_win32
../wine/configure --with-wine64=../wine64
make -j20
sudo make install -j20
```

# MinGW Installer
(https://github.com/Vuniverse0/mingwInstaller/releases)

CMAKE:
(https://cmake.org/download/)

NMAKE:
(ftp://ftp.microsoft.com/softlib/mslfiles/nmake15.exe)

# Path erweitern
Bei `~/.bashrc` zuunderst folgendes ergänzen:
```
export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin"
```






