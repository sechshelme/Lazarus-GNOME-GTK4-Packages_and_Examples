program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

  procedure PutPixel(pixbuf: PGdkPixbuf; x, y: Integer; r, g, b, a: Tguchar);
  var
    rs, n_cannels: longint;
    pixels: Pguchar;
    p: Pguchar;
  begin
    n_cannels := gdk_pixbuf_get_n_channels(pixbuf);
    rs := gdk_pixbuf_get_rowstride(pixbuf);
    pixels := gdk_pixbuf_get_pixels(pixbuf);
    p := pixels + y * rs + x * n_cannels;
    p[0] := r;
    p[1] := g;
    p[2] := b;
    p[3] := a;
  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);  cdecl;
  const
    SIZE = $100;
  var
    byteData: array of byte = nil;
    window, box, picture1: PGtkWidget;
    x, i: integer;
    pixbuf1: PGdkPixbuf;

  begin
    // === pixbuf

    SetLength(byteData, SIZE * SIZE * 4);
    for x := 0 to SIZE * SIZE do begin
      byteData[x * 4 + 0] := $00;
      byteData[x * 4 + 1] := $00;
      byteData[x * 4 + 2] := x;
      byteData[x * 4 + 3] := x shl 4;
    end;
    pixbuf1 := gdk_pixbuf_new(GDK_COLORSPACE_RGB, True, 8, SIZE, SIZE);
    if pixbuf1 = nil then begin
      g_print('pixbuf2 error');
      exit;
    end;

    for i := 0 to SIZE - 1 do begin
      PutPixel(pixbuf1, i, i, $FF, i, SIZE - i, $FF);
    end;

    picture1 := gtk_picture_new_for_pixbuf(pixbuf1);
    g_object_unref(pixbuf1);

    gtk_widget_set_hexpand(picture1, True);
    gtk_widget_set_vexpand(picture1, True);

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

    gtk_box_append(GTK_BOX(box), picture1);
    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.example.PixbufExample', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
