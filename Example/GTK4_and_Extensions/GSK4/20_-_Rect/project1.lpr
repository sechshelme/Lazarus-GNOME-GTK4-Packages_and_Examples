program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GSK4,
  fp_GTK4;


  procedure quit_clicked_cp({%H-}widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    border_node: PGskRenderNode;
    outline: TGskRoundedRect;
  const
    border_width = 10.0;
    border_widths: array[0..3] of single = (border_width, border_width, border_width, border_width);
    border_colors: array[0..3] of TGdkRGBA = (
      (red: 1.0; green: 0.0; blue: 0.0; alpha: 1.0),
      (red: 0.0; green: 1.0; blue: 0.0; alpha: 1.0),
      (red: 0.0; green: 0.0; blue: 1.0; alpha: 1.0),
      (red: 1.0; green: 1.0; blue: 0.0; alpha: 1.0));

  begin
    outline := GSK_ROUNDED_RECT_INIT(0, 0, Width - 10, Height - 10);
    border_node := gsk_border_node_new(@outline, border_widths, border_colors);

    gsk_render_node_draw(border_node, cr);
    gsk_render_node_unref(border_node);
  end;

  function CreateDrawingArea: PGtkWidget;
  begin
    Result := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(Result), @draw_func, nil, nil);
    gtk_widget_set_vexpand(Result, True);
    gtk_widget_set_hexpand(Result, True);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, grid: PGtkWidget;
    i: integer;
  const
    GRID_COUNT = 4;
    GRID_SPACING = 20;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    grid := gtk_grid_new;
    gtk_grid_set_column_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_grid_set_row_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_widget_set_margin_top(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_start(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_end(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_bottom(GTK_WIDGET(grid), GRID_SPACING);

    gtk_box_append(GTK_BOX(box), grid);
    for i := 0 to GRID_COUNT * GRID_COUNT - 1 do begin
      drawing_area := CreateDrawingArea;
      gtk_grid_attach(GTK_GRID(grid), drawing_area, i mod GRID_COUNT, i div GRID_COUNT, 1, 1);
    end;

    button := gtk_button_new_with_label('Close');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);

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
