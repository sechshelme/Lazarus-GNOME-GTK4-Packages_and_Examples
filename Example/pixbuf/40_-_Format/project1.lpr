program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;


  procedure ShowImageInfo2(path: Pgchar);
  var
    format: PGdkPixbufFormat;
    w, h: Tgint;
    Name, dest: Pgchar;
    extension: PPgchar;
    i: integer;
  begin
    format := gdk_pixbuf_get_file_info(path, @w, @h);
    WriteLn('Width:', w, ' Height: ', h);
    WriteLn('Format:');
    Name := gdk_pixbuf_format_get_name(format);
    WriteLn('  Format Name: ', Name);
    g_free(Name);
    dest := gdk_pixbuf_format_get_description(format);
    WriteLn('  Dest Name: ', dest);
    g_free(dest);
    WriteLn('Erweiterungen: ');
    extension := gdk_pixbuf_format_get_extensions(format);
    i := 0;
    while extension[i] <> nil do begin
      WriteLn(extension[i]);
      Inc(i);
    end;
    g_strfreev(extension);
  end;

  function ShowImageInfo(path: Pgchar): PGString;
  var
    format: PGdkPixbufFormat;
    w, h: Tgint;
    Name, dest: Pgchar;
    extension, mime: PPgchar;
    i: integer;
  begin
    Result := g_string_new(nil);

    format := gdk_pixbuf_get_file_info(path, @w, @h);
    g_string_append_printf(Result, 'Size: %ix%i'#10, w, h);
    g_string_append_printf(Result, 'Format:'#10);
    Name := gdk_pixbuf_format_get_name(format);
    g_string_append_printf(Result, '  Format Name: %s'#10, Name);
    g_free(Name);

    dest := gdk_pixbuf_format_get_description(format);
    g_string_append_printf(Result, '  Dest Name: %s'#10, dest);
    g_free(dest);

    g_string_append_printf(Result, 'Erweiterungen: '#10);
    extension := gdk_pixbuf_format_get_extensions(format);
    i := 0;
    while extension[i] <> nil do begin
      g_string_append_printf(Result, '  %i. %s,'#10, i, extension[i]);
      Inc(i);
    end;
    g_strfreev(extension);

    g_string_append_printf(Result, 'Mime Type: '#10);
    mime := gdk_pixbuf_format_get_mime_types(format);
    i := 0;
    while mime[i] <> nil do begin
      g_string_append_printf(Result, '  %i. %s,'#10, i, mime[i]);
      Inc(i);
    end;
    g_strfreev(mime);
  end;

// https://www.perplexity.ai/search/gib-mir-ein-gtk4-beispiel-in-c-dNYfVY_GRRu1gZ.TDr1EGw
procedure printHashTable(pixbuf:PGdkPixbuf);
var
  options: PGHashTable;
  keys: PGList;
begin
  options:=gdk_pixbuf_get_options(pixbuf);
  if options=nil then WriteLn('options error');
  keys:=g_hash_table_get_keys(options);
  if keys=nil then WriteLn('keys error');
  WriteLn('count: ', g_list_length(keys));
  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, picture1, picture2, Label1, Label2: PGtkWidget;
    pixbuf1, pixbuf2: PGdkPixbuf;
    sl: PGString;
    interlace: Pgchar;

  begin
    // === Widget

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pixbuf Demo',
      'width-request', 150,
      'height-request', 150,
      'default-width', 320,
      'default-height', 200,
      'maximized', gFalse,
      nil);

    box := g_object_new(GTK_TYPE_BOX,
      'orientation', GTK_ORIENTATION_VERTICAL,
      'hexpand', gTrue,
      'vexpand', gTrue,
      'margin-start', 10,
      'margin-end', 10,
      'margin-top', 10,
      'margin-bottom', 10,
      'spacing', 10,
      nil);
    gtk_window_set_child(GTK_WINDOW(window), box);

    // === pixbuf1

    pixbuf1 := gdk_pixbuf_new_from_file('bild.png', nil);
    if pixbuf1 = nil then begin
      g_print('pixbuf1 error');
      exit;
    end;
    printHashTable(pixbuf1);

    picture1 := gtk_picture_new_for_pixbuf(pixbuf1);
    g_object_set(picture1,
      'width-request', 128,
      'height-request', 128,
      nil);
    gtk_box_append(GTK_BOX(box), picture1);

    sl := ShowImageInfo('bild.png');
    Label1 := gtk_label_new(sl^.str);
    g_string_free(sl, gTrue);
    gtk_box_append(GTK_BOX(box), Label1);

    // === pixbuf2

    pixbuf2 := gdk_pixbuf_new_from_file('bild.jpg', nil);
    if pixbuf2 = nil then begin
      g_print('pixbuf2 error');
      exit;
    end;
    printHashTable(pixbuf2);

    picture2 := gtk_picture_new_for_pixbuf(pixbuf2);
    g_object_set(picture2,
      'width-request', 128,
      'height-request', 128,
      nil);
    gtk_box_append(GTK_BOX(box), picture2);

    sl := ShowImageInfo('bild.jpg');
    Label2 := gtk_label_new(sl^.str);
    g_string_free(sl, gTrue);
    gtk_box_append(GTK_BOX(box), Label2);

    gtk_widget_show(window);
  end;

  procedure main;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.example.PixbufExample', G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    status := g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
