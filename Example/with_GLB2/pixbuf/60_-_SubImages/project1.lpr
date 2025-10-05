program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  const
    BUF_SIZE = 256;
  var
    byteData: array of byte = nil;
    window, box, picture, picture_sub1,
    picture_sub2: PGtkWidget;
    x: integer;
    pixbuf2, pixbuf_sub1, pixbuf_sub2: PGdkPixbuf;

  begin

    // === pixbuf
    SetLength(byteData, BUF_SIZE * BUF_SIZE * 4);
    for x := 0 to BUF_SIZE * BUF_SIZE do begin
      byteData[x * 4 + 0] := $80;
      byteData[x * 4 + 1] := x mod BUF_SIZE;
      byteData[x * 4 + 2] := x div BUF_SIZE;
      byteData[x * 4 + 3] := $FF;
    end;
    pixbuf2 := gdk_pixbuf_new_from_data(Pguchar(byteData), GDK_COLORSPACE_RGB, True, 8, BUF_SIZE, BUF_SIZE, BUF_SIZE * 4, nil, nil);
    if pixbuf2 = nil then begin
      g_print('pixbuf2 error');
      exit;
    end;

    picture := gtk_picture_new_for_pixbuf(pixbuf2);
    gtk_widget_set_hexpand(picture, True);
    gtk_widget_set_vexpand(picture, True);

    // === Sub 1
    pixbuf_sub1 := gdk_pixbuf_new_subpixbuf(pixbuf2, 32,32, 64, 64);

    picture_sub1 := gtk_picture_new_for_pixbuf(pixbuf_sub1);
    gtk_widget_set_hexpand(picture_sub1, True);
    gtk_widget_set_vexpand(picture_sub1, True);


    // === Sub 2
    pixbuf_sub2 := gdk_pixbuf_new_subpixbuf(pixbuf2, 160, 160, 64, 64);

    picture_sub2 := gtk_picture_new_for_pixbuf(pixbuf_sub2);
    gtk_widget_set_hexpand(picture_sub2, True);
    gtk_widget_set_vexpand(picture_sub2, True);


    // === Widget
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_hexpand(box, True);
    gtk_widget_set_vexpand(box, True);

    g_object_unref(pixbuf_sub1);
    g_object_unref(pixbuf_sub2);
    g_object_unref(pixbuf2);

    gtk_box_append(GTK_BOX(box), picture);
    gtk_box_append(GTK_BOX(box), picture_sub1);
    gtk_box_append(GTK_BOX(box), picture_sub2);

    gtk_window_set_child(GTK_WINDOW(window), box);
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
