program project1;

uses
  ctypes,
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_GDK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

var
  window, drawing_area: PGtkWidget;
  pixbuf_animation: PGdkPixbufAnimation;
  iter: PGdkPixbufAnimationIter;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    pixbuf: PGdkPixbuf;
  begin
    pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);
    if pixbuf <> nil then begin
      gdk_cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
    end;
    cairo_paint(cr);
  end;

  function timer_func(user_data: Tgpointer): Tgboolean; cdecl;
  var
    time: TGTimeVal;
  begin
    g_get_current_time(@time);
    gdk_pixbuf_animation_iter_advance(iter, @time);

    gtk_widget_queue_draw(drawing_area);

    Result := True;
  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  var
    time: TGTimeVal;
    box: Tgpointer;

  begin
    // === Widget

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pixbuf Demo',
      'default-width', 320,
      'default-height', 200,
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


    drawing_area := g_object_new(GTK_TYPE_DRAWING_AREA,
      'width-request', 320,
      'height-request', 320,
      nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    pixbuf_animation := gdk_pixbuf_animation_new_from_file('uhr.gif', nil);
    if pixbuf_animation <> nil then begin
      WriteLn('pixbuf io.');
      g_print('Animation Size: %d x %d'#10, gdk_pixbuf_animation_get_width(pixbuf_animation),gdk_pixbuf_animation_get_height(pixbuf_animation));
      g_get_current_time(@time);
      iter := gdk_pixbuf_animation_get_iter(pixbuf_animation, @time);

      g_timeout_add(gdk_pixbuf_animation_iter_get_delay_time(iter), @timer_func, nil);

      gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    end;

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

begin
  main;
end.
