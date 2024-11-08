program project1;

uses
  ctypes,
  glib280,
  GTK4,
  GDK4,

  GLIBTools,
  cairo218,

  gmodule,
  glib_unix,

  gdk_pixbuf_core,
  gdk_pixbuf_features,
  gdk_pixbuf_macros,      // gdk_pixbuf_features
  gdk_pixbuf_animation,
  gdk_pixbuf_io,          // gdk_pixbuf_animation
  gdk_pixbuf_loader,      // gdk_pixbuf_animation, gdk_pixbuf_io
  gdk_pixbuf_enum_types,
  gdk_pixbuf_marshal,
  gdk_pixbuf_simple_anim,
  gdk_pixbuf_transform,
  gdk_pixdata,




  // ----

  Math;

  // https://phpandmore.net/tag/gdk_pixbuf_new_from_data/

  //const
  //  GDK_COLORSPACE_RGB=0;
  //  pixdata: array [0..1, 0..1] of uint32 = (($FFFFFF, $FF0000FF), ($FFFF00FF, $FF00FFFFFF));

  //     pixbuf = gdk_pixbuf_new_from_data(data, GDK_COLORSPACE_RGB, true, 8, 10, 10, stride, NULL, NULL); // Stride is the difference in bytes between two

  procedure on_draw2(areat: PGtkDrawingArea; cr: Pcairo_t; w, h: cint; Data: Tgpointer);
  var
    pixbuf: PGdkPixbuf;
  begin
    pixbuf := PGdkPixbuf(Data);
    gdk_cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
    cairo_paint(cr);
  end;


  procedure on_draw(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin

  end;


  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  const
    BUF_SIZE = 128;
  var
    pixdata: array of uint32 = nil;
    byteData: array of byte = nil;
    pixbuf1, anim, buf_format: Tgpointer;
    window, picture1, box, picture2: PGtkWidget;
    x, y: integer;
    pixbuf2, rotated: PGdkPixbuf;

    provider: PGtkCssProvider;
    context: PGtkStyleContext;
    in_steal: cint;
    steal: cint;
    err: PGError = nil;

  begin
    in_steal := 1;
    ;
    steal := g_steal_fd(@in_steal);
    WriteLn('steal: ', steal, '  ', in_steal);


    WriteLn('GLIB:');
    WriteLn('Version: ', glib_major_version, '.', glib_minor_version, '.', glib_micro_version);
    WriteLn('GDK_PIXPUF:');
    WriteLn('Version: ', gdk_pixbuf_major_version, '.', gdk_pixbuf_minor_version, '.', gdk_pixbuf_micro_version);
    WriteLn('Versio String: ', gdk_pixbuf_version);

    WriteLn('g_module_supported: ', g_module_supported);

    anim := g_object_new(GDK_TYPE_PIXBUF_ANIMATION, nil);
    GObjectShowProperty(anim);

    buf_format := g_object_new(gdk_pixbuf_format_get_type, nil);
    WriteLn(PtrUInt(buf_format));
    GObjectShowProperty(buf_format);

    SetLength(pixdata, BUF_SIZE * BUF_SIZE);
    for x := 0 to BUF_SIZE - 1 do begin
      for y := 0 to BUF_SIZE - 1 do begin
        //            pixdata[x + y * BUF_SIZE] := Random($FFFFFF) or $FF000000;
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
    //        pixbuf1 := gdk_pixbuf_new_from_data(Pguchar(pixdata), GDK_COLORSPACE_RGB, True, 8, BUF_SIZE, BUF_SIZE, BUF_SIZE * 4, nil, nil);

    if pixbuf1 = nil then begin
      g_print('pixbuf error');
      exit;
    end;

    SetLength(byteData, BUF_SIZE * BUF_SIZE * 4);
    for x := 0 to BUF_SIZE * BUF_SIZE do begin
      byteData[x * 4 + 0] := $00;
      byteData[x * 4 + 1] := $00;
      byteData[x * 4 + 2] := x;
      byteData[x * 4 + 3] := x shl 4;
    end;
    pixbuf2 := gdk_pixbuf_new_from_data(Pguchar(byteData), GDK_COLORSPACE_RGB, True, 8, BUF_SIZE, BUF_SIZE, BUF_SIZE * 4, nil, nil);
    rotated := gdk_pixbuf_rotate_simple(pixbuf2, GDK_PIXBUF_ROTATE_CLOCKWISE);
    GObjectShowProperty(pixbuf2);
    GObjectShowProperty(rotated);
    g_object_unref(pixbuf2);

    // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gdk-p-xDvQKArXSdyldtrSAi2p6A

    if not gdk_pixbuf_save(rotated, 'bild.png', 'png', @err, nil) then begin
      WriteLn('Fehler beim speichern des Bildes! ', err^.message);
      g_error_free(err);
    end;



    picture1 := gtk_picture_new_for_pixbuf(pixbuf1);
    gtk_widget_set_hexpand(picture1, True);
    gtk_widget_set_vexpand(picture1, True);
    GObjectShowProperty(picture1);

    picture2 := gtk_picture_new_for_pixbuf(rotated);
    gtk_widget_set_hexpand(picture2, True);
    gtk_widget_set_vexpand(picture2, True);
    GObjectShowProperty(picture2);

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pixbuf Demo',
      'width-request', 150,
      'height-request', 150,
      'default-width', 320,
      'default-height', 200,
      'maximized', gFalse,
      nil);

    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_data(provider, 'window.test { background-color: #FF00FF; }', -1);
    context := gtk_widget_get_style_context(window);
    gtk_style_context_add_provider(context, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    gtk_widget_add_css_class(window, 'test');

    GObjectShowProperty(window);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(box, 10);
    gtk_widget_set_margin_end(box, 10);
    gtk_widget_set_margin_top(box, 10);
    gtk_widget_set_margin_bottom(box, 10);
    gtk_widget_set_hexpand(box, True);
    gtk_widget_set_vexpand(box, True);

    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_data(provider, 'box.red-box { background-color: #FF0000; }', -1);
    context := gtk_widget_get_style_context(box);
    gtk_style_context_add_provider(context, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    gtk_widget_add_css_class(box, 'red-box');

    gtk_box_append(GTK_BOX(box), picture1);
    gtk_box_append(GTK_BOX(box), picture2);

    gtk_window_set_child(GTK_WINDOW(window), box);

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

var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;
begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main;
end.
