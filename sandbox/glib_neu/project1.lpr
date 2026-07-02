program project1;

// diff /usr/include/glib-2.0/gio/gioenumtypes.h /home/tux/include_neu/gtk-4.0/gdk/gdkenumtypes.h > test.diff

// diff -U 1 -r /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/glib-2.80.0/C-include/gio-unix-2.80.0 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/glib-2.88.0/C-include/gio-unix-2.0 > test.diff
// diff -U 1 /usr/include/glib-2.0/girepository /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/Ubuntu_26.04/girepository > test.diff


uses
gdktypes,
gdkenums,
gdkenumtypes,
gdkapplaunchcontext,
gdkcairo,
gdkcairocontext,
gdkcicpparams,
gdkclipboard,
gdkcolorstate,
gdkcontentdeserializer,

gdkcontentformats,
gdkcontentprovider,
gdkcontentproviderimpl,
gdkcontentserializer,
gdkcursor,
gdkdevice,
gdkdevicepad,
gdkdevicetool,
gdkdisplay,
gdkdisplaymanager,
gdkdmabufformats,
gdkdmabuftexture,
gdkdmabuftexturebuilder,
gdkdrag,
gdkdragsurface,
gdkdragsurfacesize,
gdkdrawcontext,
gdkdrop,
gdkevents,
gdkframeclock,
gdkframetimings,
gdkglcontext,
gdkgltexture,
gdkgltexturebuilder,
gdkkeys,
gdkkeysyms,
gdkmemorytexture,
gdkmemorytexturebuilder,
gdkmonitor,
gdkpaintable,
gdkpango,
gdkpopup,
gdkpopuplayout,
gdkrectangle,
gdkrgba,
gdkseat,
gdksnapshot,
gdksurface,
gdktexture,
gdktexturedownloader,
gdktoplevel,
gdktoplevellayout,
gdktoplevelsize,
gdkvulkancontext,



  fp_girepository_2,
  fp_glib_unix,
  fp_gio_unix_2,

  fp_glib2;

  procedure main;
  var
    list: PPgchar;
    i: integer = 0;
    v: Pgchar;
  begin
    list := g_listenv;
    if list <> nil then begin
      while list[i] <> nil do begin
        v := g_getenv(list[i]);
        g_printf('%3d. %-30s   %s'#10, i, list[i], v);
        Inc(i);
      end;
      g_free(list);
    end;
  end;

begin
  g_ecn_code_point_get_type;
  main;
end.
