program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_pango,
  fp_GTK4;

  procedure on_scale_changed_cp(range: PGtkRange; user_data: Tgpointer); cdecl;
  var
    Value: double;
  begin
    Value := gtk_range_get_value(range);
    g_printf('Value: %.2f'#10, Value);
  end;

  procedure set_scale_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    scale: PGtkRange absolute Data;
    id: Tgulong;
  begin
    id := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(scale), 'idKey'));
    g_signal_handler_block(scale, id);
    gtk_range_set_value(scale, 50.0);
    g_signal_handler_unblock(scale, id);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, scale: PGtkWidget;
    changed_handler_id: Tgulong;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 100, 10);
    gtk_widget_set_margin_top(scale, 20);
    gtk_widget_set_margin_bottom(scale, 20);
    gtk_widget_set_margin_start(scale, 30);
    gtk_widget_set_margin_end(scale, 30);
    gtk_scale_set_draw_value(GTK_SCALE(scale), True);
    gtk_scale_set_digits(GTK_SCALE(scale), 2);
    gtk_scale_add_mark(GTK_SCALE(scale), 0, GTK_POS_BOTTOM, '0.00');
    gtk_scale_add_mark(GTK_SCALE(scale), 100, GTK_POS_BOTTOM, '100.00');
    changed_handler_id := g_signal_connect(scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), nil);
    g_object_set_data(G_OBJECT(scale), 'idKey', GUINT_TO_POINTER(changed_handler_id));
    gtk_box_append(GTK_BOX(box), scale);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@set_scale_cp), scale);
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
