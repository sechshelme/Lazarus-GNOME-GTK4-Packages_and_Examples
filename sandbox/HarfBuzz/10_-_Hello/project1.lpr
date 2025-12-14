program project1;

uses
  SysUtils,
  fp_FreeType2,
  fp_glib2,
  fp_harfbuzz,
  fp_cairo,
  fp_GTK4;

  procedure quit_cb(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
var
  buf: Phb_buffer_t;
  hb_fnt: Phb_font_t;
  glyph_count: UInt32;
  glyph_infos: Phb_glyph_info_t;
  glyph_positions: Phb_glyph_position_t;
  i: int32;
  x, y, pos_x, pos_y: double;
begin
  // Cyan Hintergrund
  cairo_set_source_rgb(cr, 0.0, 1.0, 1.0);
  cairo_paint(cr);

  // HarfBuzz Buffer
  buf := hb_buffer_create;
  hb_buffer_add_utf8(buf, 'Hello, HarfBuzz! ÄÖÜöäüÿŸ', -1, 0, -1);
  hb_buffer_guess_segment_properties(buf);

  // Einfache Font (kein FreeType nötig)
  hb_fnt := hb_font_create(hb_face_get_empty);
  hb_font_set_scale(hb_fnt, 18 * 64, 18 * 64);
  hb_shape(hb_fnt, buf, nil, 0);

  // Glyph-Daten holen
  glyph_infos := hb_buffer_get_glyph_infos(buf, @glyph_count);
  glyph_positions := hb_buffer_get_glyph_positions(buf, @glyph_count);

  // Schwarz für Text, korrekte Cairo Font
  cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
  cairo_select_font_face(cr, 'Sans', CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
  cairo_set_font_size(cr, 18);

  // Positioniertes Rendering (fixer Cluster-Bug)
  x := 20.0;
  y := Height div 2 + 10.0;
  x:=1000000;

  for i := 0 to glyph_count - 1 do begin
    pos_x:= x + glyph_positions[i].x_advance / 64.0 + glyph_positions[i].x_offset / 64.0;
    pos_y:= y + glyph_positions[i].y_advance / 64.0 + glyph_positions[i].y_offset / 64.0;

    pos_x:=10000;

    cairo_move_to(cr, pos_x, pos_y);
    cairo_show_glyphs(cr, @glyph_infos[i].codepoint, 1);  // Einfache Glyph-ID

    x := x + glyph_positions[i].x_advance / 64.0;
  end;

  // Cleanup
  hb_font_destroy(hb_fnt);
  hb_buffer_destroy(buf);
end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 500, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_halign(box, GTK_ALIGN_FILL);
    gtk_widget_set_valign(box, GTK_ALIGN_FILL);
    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Beenden');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cb), window);
    gtk_widget_set_hexpand(button, True);
    gtk_widget_set_vexpand(button, False);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
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
