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



