# Übersetzen der C-Header
```
h2pas -p -T -d -c -e xxx.h
```

# Makro entschlüsseln
```
gcc main.c -E
```

# neusten meson installieren
```
git clone https://github.com/mesonbuild/meson.git
cd meson/
sudo python3 setup.py install
meson --version
```

## Mehr Infos
https://mesonbuild.com/Cross-compilation.html
https://stackoverflow.com/questions/57436089/meson-can-not-find-windows-resource-compiler-on-linux
https://sourceforge.net/p/meson/wiki/Cross%20compilation/

# Speicher Leeks mit C-Funktionen

`valgrind --leak-check=full ./project1`

# Binär Datei in Byte Array Komstante

## Als C-Include
`xxd -i xxx.bin -> xxx.h`

## Als Pascal Constante Array
`hexdump -v -e '16/1 "$%02X, " "\n"' xxx.bin > xxx.txt`


# Version des runtergeladenen Paketes abfragen
`git describe --tags`

# Alle "-" in Dateinname in "_" umbenenen
```
for file in *-*; do mv "$file" "${file//-/_}"; done
```


# wine
## MinGW Installer
(https://github.com/Vuniverse0/mingwInstaller/releases)

## DLL verkleinern
`x86_64-w64-mingw32-strip xxx.dll`

## DLL mit make bauen
`make CROSS_COMPILE=x86_64-w64-mingw32- HOST=x86_64-windows ZLIB=no IDSDIR="" SHARED=yes -j`



CMAKE:
(https://cmake.org/download/)

NMAKE:
(ftp://ftp.microsoft.com/softlib/mslfiles/nmake15.exe)

## Path erweitern
Bei `~/.bashrc` zuunderst folgendes ergänzen:
```
export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin"
```

#gir2pas
https://gitlab.com/freepascal.org/lazarus/lazarus/-/merge_requests/207
```
gir2pas -P Laz -e Set -i /usr/share/gir-1.0/Gtk-3.0.gir -o gtk3bindings
```

# Ubuntu im Browser 
Im Browser: http://localhost:3000

`docker run -d --name=webtop -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 3000:3000 --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/webtop:ubuntu-mate`








