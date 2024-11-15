program project1;

uses
  ctypes,
  x,
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_GDK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

// https://www.perplexity.ai/search/was-macht-diese-funktion-gdk-p-U_1J7dpKT76ybVtLBO9pTQ

var
  window, drawing_area: PGtkWidget;
  pixbuf_animation: PGdkPixbufAnimation;
  iter: PGdkPixbufAnimationIter;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    pixbuf: PGdkPixbuf;
  begin
    gdk_pixbuf_animation_iter_advance(iter, nil);

    pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);

    if pixbuf <> nil then begin
      gdk_cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
    end;
    cairo_paint(cr);
  end;

  function timer_func(user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_widget_queue_draw(drawing_area);

    Result := True;
  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  var
    box, Label1: Tgpointer;
    err: PGError;

    AniProp: record
    Width, Height, delay: longint;

      end;
    pc: Pgchar;

  begin
    // === Widget

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pixbuf Demo',
      'default-width', 200,
      'default-height', 200,
      'resizable', gFalse,
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

    err := nil;
    pixbuf_animation := gdk_pixbuf_animation_new_from_file('pinguin.gif', @err);
    if pixbuf_animation = nil then begin
      g_printerr('Ungültige Animations-Datei !'#10);
      g_printerr('  Fehlerbereich: %s'#10, g_quark_to_string(err^.domain));
      g_printerr('  Fehlercode: %d'#10, err^.code);
      g_printerr('  Fehlermeldung: %s#10', err^.message);
      Exit;
    end;
    AniProp.Width := gdk_pixbuf_animation_get_width(pixbuf_animation);
    AniProp.Height := gdk_pixbuf_animation_get_height(pixbuf_animation);
    g_print('Animation width: %d'#10, AniProp.Width);
    g_print('Animation height: %d'#10, AniProp.Height);

    iter := gdk_pixbuf_animation_get_iter(pixbuf_animation, nil);

    AniProp.delay := gdk_pixbuf_animation_iter_get_delay_time(iter);
    g_timeout_add(AniProp.delay, @timer_func, nil);

    drawing_area := g_object_new(GTK_TYPE_DRAWING_AREA,
      'width-request', AniProp.Width,
      'height-request', AniProp.Height,
      nil);
    gtk_box_append(GTK_BOX(box), drawing_area);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);


    pc := g_malloc(100);
    g_snprintf(pc, 100, 'Animation: '#10'  width: %d'#10'  height: %d'#10'  delay: %dms'#10, AniProp.Width, AniProp.Height, AniProp.delay);
    Label1 := g_object_new(GTK_TYPE_LABEL,
      'label', pc,
      nil);

    g_free(pc);

    GObjectShowProperty(window);
    gtk_box_append(GTK_BOX(box), Label1);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_widget_show(window);
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
