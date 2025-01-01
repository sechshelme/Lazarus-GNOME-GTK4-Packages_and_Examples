program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;

  procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    g_application_quit(G_APPLICATION(app));
  end;

  function CreateButton: PGtkWidget;
  begin
    Result := gtk_button_new_with_label('button');
    gtk_widget_set_vexpand(Result, True);
    gtk_widget_set_hexpand(Result, True);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, grid: PGtkWidget;
    i: integer;
    provider: PGtkCssProvider;
  const
    GRID_COUNT = 4;
    GRID_SPACING = 20;

    css_string =
      'window { background-image: conic-gradient(' +
      '  from 0deg at 50% 50%, #ff0000 0deg,' +
      '  #00ff00 90deg,' +
      '  #0000ff 180deg,' +
      '  #ffff00 270deg,' +
      '  #ff0000 360deg ); }' +

      'button {' +
      '  background-color: transparent;' +
      '  border: 1px solid black;' +
      '  transition: background-color 0.2s ease;}' +

      'button:active {' +
      '  background-color: rgba(0, 0, 0, 0.6);' +
      '  transform: scale(0.98);' +
      '}' +

      'button:hover {' +
      '  background-color: rgba(255, 255, 255, 0.1);' +
      '}' +
      '';
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_data(provider, css_string, -1);
    gtk_style_context_add_provider_for_display(gdk_display_get_default, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_USER);
    g_object_unref(provider);

    grid := gtk_grid_new;
    gtk_grid_set_column_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_grid_set_row_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_widget_set_margin_top(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_start(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_end(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_bottom(GTK_WIDGET(grid), GRID_SPACING);

    gtk_box_append(GTK_BOX(box), grid);
    for i := 0 to GRID_COUNT * GRID_COUNT - 1 do begin
      drawing_area := CreateButton;
      gtk_grid_attach(GTK_GRID(grid), drawing_area, i mod GRID_COUNT, i div GRID_COUNT, 1, 1);
    end;

    button := gtk_button_new_with_label('Close');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);

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
  Randomize;
  main(argc, argv);
end.
