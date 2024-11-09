// https://www.perplexity.ai/search/ich-woltlte-wine-bauen-mit-win-1g22O8FNSW2MUvXmXHVsLQ

# Wine installieren

Die 64Bit Version muss installiert werden, auch wen man nur die 32Bit will,

```
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

# Vorbereitung für 32Birt Wine:

```
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6-dev-i386 gcc-multilib

sudo apt-get install libx11-dev:i386 libfreetype6-dev:i386 libxcursor-dev:i386 libxrandr-dev:i386 libxinerama-dev:i386 libxi-dev:i386 libxext-dev:i386 libxcomposite-dev:i386 libasound2-dev:i386 libpulse-dev:i386 libdbus-1-dev:i386 libsane-dev:i386 libusb-1.0-0-dev:i386 libv4l-dev:i386 libgphoto2-dev:i386 liblcms2-dev:i386
```





