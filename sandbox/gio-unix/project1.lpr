program project1;

uses
  ctypes,
  fp_glib2,

  gdesktopappinfo,
  gfiledescriptorbased,
  gunixfdmessage,
  gunixinputstream,
  gunixmounts,
  gunixoutputstream;


  // /usr/share/applications/org.gnome.Calendar.desktop


  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gde-jvWhrS19T8WLXZCq6u7t9Q

  procedure PrintInfo(app_info: PGAppInfo);
  begin
    g_print('Name:              %s'#10, g_app_info_get_name(G_APP_INFO(app_info)));
    g_print('Beschreibung:      %s'#10, g_app_info_get_description(G_APP_INFO(app_info)));
    g_print('Ausführbare Datei: %s'#10, g_app_info_get_executable(G_APP_INFO(app_info)));
  end;

  procedure PrintPCharArray(ch: PPgchar; const Titel: Pgchar = nil);
  var
    i: cint;
  begin
    if Titel <> nil then begin
      g_print('=== %s ==='#10);
    end;
    if ch <> nil then begin
      i := 0;
      while ch[i] <> nil do begin
        g_print('  Value %3d: %s'#10, i + 1, ch[i]);
        Inc(i);
      end;
    end;
  end;

  procedure Variante1;
  var
    app_info: PGDesktopAppInfo;
    err: PGError = nil;
    actions, categories: PPgchar;
    len: SizeUInt;
    i: integer;
  begin
    app_info := g_desktop_app_info_new('google-chrome.desktop');
    if app_info = nil then  begin
      g_print('Konnte die .desktop-Datei nicht öffnen'#10);
      Exit;
    end;

    PrintInfo(G_APP_INFO(app_info));

    actions := g_desktop_app_info_list_actions(app_info);
    if actions <> nil then begin
      PrintPCharArray(actions, 'Desktop Action');
      //      g_strfreev(actions);
    end else begin
      g_print('Keine Aktionen gefunden'#10);
    end;

    categories := g_desktop_app_info_get_string_list(app_info, 'Categories', @len);
    g_print('Catogories count: %d'#10, len);

    if categories <> nil then begin
      for i := 0 to len - 1 do begin
        g_print('  Value %3d: %s'#10, i + 1, categories[i]);
      end;
      g_strfreev(categories);
    end;

    if not g_app_info_launch(G_APP_INFO(app_info), nil, nil, @err) then begin
      g_print('Fehler beim Starten der Anwendung %s'#10, err^.message);
      g_error_free(err);
      g_object_unref(app_info);
      Exit;
    end;
    g_object_unref(app_info);
  end;

  procedure Variante2;   // gehört nicht zu gio-unix
  var
    app_info: PGAppInfo;
    err: PGError = nil;
  begin
    app_info := g_app_info_create_from_commandline('nemo', 'Datei Manager', G_APP_INFO_CREATE_NONE, @err);
    if app_info = nil then  begin
      g_print('Konnte GAppInfo nicht erstellen: %s'#10, err^.message);
      g_error_free(err);
      g_object_unref(app_info);
      Exit;
    end;

    PrintInfo(app_info);

    g_object_unref(app_info);
  end;

  procedure PrintAppInfo;
  const
    O_RDONLY = 0;
  var
    fd: longint;
    stream: PGInputStream;
    buffer: array [0..31] of Tgchar;
    bytes_read: Tgssize;
    err: PGError = nil;
    seekable: PGSeekable;
  begin
    fd := g_open('/etc/services', O_RDONLY, 0644);
    if fd = -1 then begin
      g_printerr('Konnte Datei nicht öffnen'#10);
    end else begin
      g_print('Konnte Datei öffnen'#10);
    end;

    stream := g_unix_input_stream_new(fd, True);
    if stream = nil then begin
      g_printerr('stream error'#10);
      exit;
    end;

    repeat
      bytes_read := g_input_stream_read(stream, @buffer, SizeOf(buffer) - 1, nil, @err);
      buffer[bytes_read] := #0;
      g_print('%s', buffer);
    until bytes_read <= 0;
    g_print(#10);

    g_object_unref(stream);
  end;



  function main(argc: cint; argv: PPChar): cint;
  begin
    g_type_init;
    g_print(#10'============ Variante 1'#10#10);
    //    Variante1;
    g_print(#10'============ Variante 2'#10#10);
    //    Variante2;
    g_print(#10'============ Variante 3'#10#10);
    PrintAppInfo;
  end;

begin
  main(argc, argv);
end.
