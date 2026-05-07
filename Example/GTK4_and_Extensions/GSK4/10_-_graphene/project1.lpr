program project1;

uses
  fp_glib2,
  fp_GLIBTools,
  fp_graphene,
  fp_cairo,
  fp_GTK4,
  MyGrid,
  MyWidget;

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure spacing_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    grid: PMyGrid absolute user_data;
  begin
    my_grid_set_spacing(grid, g_random_int_range(1, 20));
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  const
    GRID_COUNT = 4;
  var
    window, box, button, area, grid, buttonBox: PGtkWidget;
    i: integer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);
    gtk_window_present(GTK_WINDOW(window));

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    grid := my_grid_new;
    gtk_box_append(GTK_BOX(box), grid);

    for i := 0 to GRID_COUNT * GRID_COUNT - 1 do begin
      area := my_widget_new;
      my_grid_set_spacing(PMyGrid(grid), 10);
      gtk_widget_set_vexpand(area, True);
      gtk_widget_set_hexpand(area, True);
      gtk_grid_attach(GTK_GRID(grid), area, i mod GRID_COUNT, i div GRID_COUNT, 1, 1);
    end;

    buttonBox:= gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_box_append(GTK_BOX(box), buttonBox);
    gtk_widget_set_halign(buttonBox, GTK_ALIGN_END);
    gtk_widget_set_margin_end(buttonBox, 10);
    gtk_widget_set_margin_bottom(buttonBox, 10);

    button := gtk_button_new_with_label('spacing');
    g_signal_connect(button, 'clicked', G_CALLBACK(@spacing_clicked_cp), grid);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);
    gtk_box_append(GTK_BOX(buttonBox), button);
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
