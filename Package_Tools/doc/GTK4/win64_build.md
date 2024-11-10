https://docs.gtk.org/glib/cross-compiling.html
https://www.perplexity.ai/search/meson-setup-cross-file-cross-i-Mo.47eqHQd2d1pl3Vg_Sxg
https://www.perplexity.ai/search/dies-lief-fehlerfrei-durch-mes-XAJpupvZTtezUr0jYoGUQA

```bash
mkdir gtk
cd gtk
git clone https://gitlab.gnome.org/GNOME/gtk.git
mkdir build_win64
cd build_win64
meson ../gtk/ --cross-file ../cross.ini

ninja -j20


# oder
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled -Dgst-plugins-good:soup=disabled
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled -Dmedia-gstreamer=disabled

```

```ini
# cross.ini
[host_machine]
system = 'windows'
cpu_family = 'x86_64'
cpu = 'x86_64'
endian = 'little'

[properties]
c_args = []
c_link_args = []
# c_link_args = ['-lsynchronization']
sys_root = '$HOME/.wine/drive_c'
# sys_root = '/path/to/your/windows/sysroot'

[binaries]
c = 'x86_64-w64-mingw32-gcc'
cpp = 'x86_64-w64-mingw32-g++'
ar = 'x86_64-w64-mingw32-ar'
ld = 'x86_64-w64-mingw32-ld'
objcopy = 'x86_64-w64-mingw32-objcopy'
strip = 'x86_64-w64-mingw32-strip'
pkgconfig = 'x86_64-w64-mingw32-pkg-config'
windres = 'x86_64-w64-mingw32-windres'

# exe_wrapper = 'wine64'
exe_wrapper = 'wine'

[built-in options]
vulkan = 'disabled'
default_library = 'shared'
build-demos = 'false'```
```

