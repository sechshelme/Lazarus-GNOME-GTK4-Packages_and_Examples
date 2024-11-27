program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  const
    counter: cint = 0;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), PChar('Ich wurde ' + IntToStr(counter) + ' gelickt'));
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    cairo_set_source_rgb(cr, 0.8, 0.8, 0.8);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
    cairo_set_line_width(cr, 5.0);
    cairo_move_to(cr, 50.0, 50.0);
    cairo_line_to(cr, 350.0, 350.0);
    cairo_stroke(cr);

    cairo_set_source_rgb(cr, 0.0, 0.0, 1.0);
    cairo_arc(cr, 200.0, 200.0, 100.0, 0.0, 2 * G_PI);
    cairo_fill(cr);
    WriteLn('w: ', Width, '  h; ', Height);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
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

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_box_append(GTK_BOX(box), button);

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
