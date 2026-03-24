## Original Quellen
https://github.com/floooh/sokol

Zuerst `CMakeLists.txt` in den Build Ordner kopieren.


## Linux

```sh
cmake ../sokol/ 
make 
sudo make install
sudo ldconfig
```

## windows

```sh
cmake ../sokol/ -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++
make   # Create DLL
```







