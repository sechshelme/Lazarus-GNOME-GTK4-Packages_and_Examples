program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;

  procedure on_quit_response_cp(widget: PGtkWidget; response_id: Tgint; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    case response_id of
      GTK_RESPONSE_YES: begin
        g_printf('YES'#10);
        g_application_quit(G_APPLICATION(app));
      end;
      GTK_RESPONSE_NO: begin
        g_printf('NO'#10);
      end;
    end;
    gtk_window_destroy(GTK_WINDOW(widget));
  end;


  procedure quit_dialog_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    dialog: PGtkWidget;
    app: PGtkApplication absolute Data;
  begin
    repeat
      widget := gtk_widget_get_parent(widget);
    until GTK_IS_WINDOW(widget);

    dialog := gtk_message_dialog_new(GTK_WINDOW(widget), GTK_DIALOG_MODAL, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, 'Möchten sie das Programm wirklich beenden ?');

    g_signal_connect(dialog, 'response', G_CALLBACK(@on_quit_response_cp), app);
    gtk_widget_show(dialog);
  end;

var
  position: double = 0.0;
  speed: double = 100.0;


  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
    i: Tgint64 = 0;
  begin
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 0, 0, 1);
    cairo_arc(cr, Width / 2 + 50 * sin(i * 0.1), Height / 2, 20, 0, 2 * PI);
    cairo_arc(cr, position, Height / 2, 20, 0, 2 * Pi);
    cairo_fill(cr);

    Inc(i);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  const
    last_frame_time: Tguint64 = 0;
  var
    current_time: Tgint64;
    delta: extended;
  begin
    current_time := gdk_frame_clock_get_frame_time(frame_clock);

    if last_frame_time <> 0 then begin
      delta := (current_time - last_frame_time) / 1000000.0;
      position += speed * delta;
      if position > gtk_widget_get_width(widget) then begin
        position := -40.0;
      end;
    end;
    last_frame_time := current_time;
    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_set_size_request(drawing_area, 300, 300);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Close');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_dialog_cp), app);

    gtk_box_append(GTK_BOX(box), button);

    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
