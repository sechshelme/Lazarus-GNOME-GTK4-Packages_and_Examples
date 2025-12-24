program project1;

uses
  fp_glib2,
  fp_gdk_pixbuf2;

  procedure main;
  var
    formats, iter: PGSList;
    format: PGdkPixbufFormat;
    name, licence: Pgchar;
    mime_types, extensions: PPgchar;
    i: integer;
  begin
    formats := gdk_pixbuf_get_formats;

    iter := formats;
    while iter <> nil do begin
      format := PGdkPixbufFormat(iter^.data);
      name := gdk_pixbuf_format_get_name(format);
      licence := gdk_pixbuf_format_get_license(format);
      mime_types := gdk_pixbuf_format_get_mime_types(format);
      extensions := gdk_pixbuf_format_get_extensions(format);

      g_printf(#10'Format: %s'#10, name);
      g_printf('  Lizenz: %s'#10, licence);

      if mime_types <> nil then begin
        i := 0;
        g_printf('  MIME:'#10);
        while mime_types[i] <> nil do begin
          g_printf('    %s\'#10, mime_types[i]);
          inc(i);
        end;
      end;

      if extensions <> nil then begin;
        i := 0;
        g_printf('  Ext:'#10);
        while extensions[i] <> nil do begin
          g_printf('    %s'#10, extensions[i]);
          inc(i);
        end;

      end;

      g_free(name);
      g_free(licence);
      g_strfreev(mime_types);
      g_strfreev(extensions);
      iter := g_slist_next(iter);
    end;

    g_slist_free(formats);
  end;

begin
  main;
end.
