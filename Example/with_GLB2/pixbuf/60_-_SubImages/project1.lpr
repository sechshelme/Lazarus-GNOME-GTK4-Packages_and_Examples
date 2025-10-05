program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  const
    BUF_SIZE = 128;
  var
    pixdata: array of uint32 = nil;
    byteData: array of byte = nil;
    window, picture1, box, picture2, picture3: PGtkWidget;
    x, y: integer;
    pixbuf1, pixbuf2, pixbuf3: PGdkPixbuf;
    buf3: Pguchar;

  begin
    WriteLn('GLIB:');
    WriteLn('Version: ', glib_major_version, '.', glib_minor_version, '.', glib_micro_version);
    WriteLn('GDK_PIXPUF:');
    WriteLn('Version: ', gdk_pixbuf_major_version, '.', gdk_pixbuf_minor_version, '.', gdk_pixbuf_micro_version);
    WriteLn('Versio String: ', gdk_pixbuf_version);

    // === pixbuf 1

    SetLength(pixdata, BUF_SIZE * BUF_SIZE);
    for x := 0 to BUF_SIZE - 1 do begin
      for y := 0 to BUF_SIZE - 1 do begin
        pixdata[x + y * BUF_SIZE] := $FF00FF00;
      end;
    end;

    pixbuf1 := g_object_new(GDK_TYPE_PIXBUF,
      'colorspace', GDK_COLORSPACE_RGB,
      'n-channels', 3,
      'bits-per-sample', 8,
      'has-alpha', gTrue,
      'width', BUF_SIZE,
      'height', BUF_SIZE,
      'rowstride', BUF_SIZE * 4,
      'pixels', PUInt32(pixdata),
      nil);
    if pixbuf1 = nil then begin
      g_print('pixbuf1 error');
      exit;
    end;

    picture1 := gtk_picture_new_for_pixbuf(pixbuf1);
    gtk_widget_set_hexpand(picture1, True);
    gtk_widget_set_vexpand(picture1, True);

    // === pixbuf 2

    SetLength(byteData, BUF_SIZE * BUF_SIZE * 4);
    for x := 0 to BUF_SIZE * BUF_SIZE do begin
      byteData[x * 4 + 0] := $00;
      byteData[x * 4 + 1] := $00;
      byteData[x * 4 + 2] := x;
      byteData[x * 4 + 3] := x shl 4;
    end;
    pixbuf2 := gdk_pixbuf_new_from_data(Pguchar(byteData), GDK_COLORSPACE_RGB, True, 8, BUF_SIZE, BUF_SIZE, BUF_SIZE * 4, nil, nil);
    if pixbuf2 = nil then begin
      g_print('pixbuf2 error');
      exit;
    end;

    picture2 := gtk_picture_new_for_pixbuf(pixbuf2);
    gtk_widget_set_hexpand(picture2, True);
    gtk_widget_set_vexpand(picture2, True);

    // === pixbuf 3

    buf3 := gdk_pixbuf_get_pixels(pixbuf2);

    pixbuf3 := gdk_pixbuf_new_from_data(buf3, GDK_COLORSPACE_RGB, True, 8, BUF_SIZE, BUF_SIZE, BUF_SIZE * 4, nil, nil);
    if pixbuf3 = nil then begin
      g_print('pixbuf3 error');
      exit;
    end;

    picture3 := gtk_picture_new_for_pixbuf(pixbuf3);
    gtk_widget_set_hexpand(picture3, True);
    gtk_widget_set_vexpand(picture3, True);

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

    GObjectShowProperty(box);

    g_object_unref(pixbuf1);
    g_object_unref(pixbuf2);
    g_object_unref(pixbuf3);

    gtk_box_append(GTK_BOX(box), picture1);
    gtk_box_append(GTK_BOX(box), picture2);
    gtk_box_append(GTK_BOX(box), picture3);

    gtk_window_set_child(GTK_WINDOW(window), box);

    //    gtk_widget_show(window);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.example.PixbufExample', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    status := g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
