program project1;

// diff /usr/include/glib-2.0/gio/gioenumtypes.h /home/tux/include_neu/gtk-4.0/gdk/gdkenumtypes.h > test.diff

// diff -U 1 -r /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/glib-2.80.0/C-include/gio-unix-2.80.0 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/glib-2.88.0/C-include/gio-unix-2.0 > test.diff
// diff -U 1 /usr/include/glib-2.0/girepository /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/Ubuntu_26.04/girepository > test.diff

// diff -U 1 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/gtk-4.14.2/C-include/gdk/wayland /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/gtk-4.22.4/C-include/gtk-4.0/gdk/wayland > test.diff
uses



  fp_girepository_2,
  fp_glib_unix,
  fp_gio_unix_2,
  fp_GTK4,
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
  main;
end.
