https://docs.gtk.org/glib/cross-compiling.html
https://www.perplexity.ai/search/meson-setup-cross-file-cross-i-Mo.47eqHQd2d1pl3Vg_Sxg
https://www.perplexity.ai/search/dies-lief-fehlerfrei-durch-mes-XAJpupvZTtezUr0jYoGUQA

# Aufrufe
```bash
meson ../gtk/ --cross-file=../cross.txt
# oder
// meson setup --cross-file ../cross.ini ../build_win64/ -Dvulkan=disabled
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled -Dgst-plugins-good:soup=disabled
meson ../gtk-4.14.2/ --cross-file ../cross.ini -Dvulkan=disabled -Dmedia-gstreamer=disabled

ninja -j20
```


# cross.ini
```ini
# https://docs.gtk.org/glib/cross-compiling.html

[host_machine]
system = 'windows'
cpu_family = 'x86_64'
cpu = 'x86_64'
endian = 'little'

[properties]
c_args = []
c_link_args = []
sys_root = '$HOME/.wine/drive_c'
# sys_root = '/path/to/your/windows/sysroot'

# c_link_args = ['-lsynchronization']
# c_link_args = ['-fstack-protector']
# c_link_args = ['-static-libgcc', '-Wl,-Bstatic', '-lpthread']
# cpp_args = []
# cpp_link_args = ['-static-libgcc', '-static-libstdc++', '-Wl,-Bstatic', '-lpthread']
# c_args = ['-D_FILE_OFFSET_BITS=64']
# cpp_args = ['-D_FILE_OFFSET_BITS=64']


[binaries]
c = 'x86_64-w64-mingw32-gcc'
cpp = 'x86_64-w64-mingw32-g++'
ar = 'x86_64-w64-mingw32-ar'
ld = 'x86_64-w64-mingw32-ld'
objcopy = 'x86_64-w64-mingw32-objcopy'
strip = 'x86_64-w64-mingw32-strip'
pkgconfig = 'x86_64-w64-mingw32-pkg-config'
windres = 'x86_64-w64-mingw32-windres'

exe_wrapper = 'wine64
# exe_wrapper = 'wine'
```


# Änderungen

Evtl. muss folgendes geändert werden:
` /home/tux/Schreibtisch/von_Git/GTK4/gtk/subprojects/gstreamer/subprojects/gstreamer/gst/gstsystemclock.c`
Linie: 102

```c
static inline int
gst_atomic_int_get_acquire (gst_atomic_int * x)
{
__atomic_load_n;
//   return InterlockedAndAcquire (x, 1);
}

static inline void
gst_atomic_int_set_release (gst_atomic_int * x, gint val)
{
 __atomic_store_n;
//   InterlockedOrRelease (x, 1);
}
```
# Links und ChatGPT Info

https://docs.gtk.org/glib/cross-compiling.html
https://www.perplexity.ai/search/meson-setup-cross-file-cross-i-Mo.47eqHQd2d1pl3Vg_Sxg
https://www.perplexity.ai/search/dies-lief-fehlerfrei-durch-mes-XAJpupvZTtezUr0jYoGUQA



