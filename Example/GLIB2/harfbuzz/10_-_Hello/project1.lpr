program project1;

uses
  ctypes,
  SysUtils,
  fp_FreeType2,
  fp_glib2,
  fp_harfbuzz,
  fp_cairo,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  begin
    g_print('Click'#10);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    buf: Phb_buffer_t;
    hb_fnt: Phb_font_t;
    glyph_info: Phb_glyph_info_t;
    glyph_pos: Phb_glyph_position_t;
    glyph_count: DWord;
    i: Integer;
    x: double = 10;
    y: double = 50;
    glyph_char: array[0..4] of Tgchar;
    extents: Tcairo_text_extents_t;
    char_width, spacing: double;
  const
    Text: Pgchar = 'Hello, HarfBuzz ! ÄÖÜöäüÿŸlllwww';
  begin
    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
    cairo_paint(cr);

    buf := hb_buffer_create;
    hb_buffer_add_utf8(buf, Text, -1, 0, -1);
    hb_buffer_guess_segment_properties(buf);

    hb_fnt := hb_font_create(hb_face_get_empty);
    hb_font_set_scale(hb_fnt, 18 * 64, 18 * 64);

    hb_shape(hb_fnt, buf, nil, 0);

    glyph_info := hb_buffer_get_glyph_infos(buf, @glyph_count);
    glyph_pos := hb_buffer_get_glyph_positions(buf, @glyph_count);

    cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
    cairo_select_font_face(cr, 'Sans', CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 18);

    for i := 0 to glyph_count - 1 do begin
      FillChar(glyph_char, SizeOf(glyph_char),$00);
      g_unichar_to_utf8(g_utf8_get_char(Text + glyph_info[i].cluster), glyph_char);

      cairo_text_extents(cr, glyph_char, @extents);
      cairo_move_to(cr, x + glyph_pos[i].x_offset / 64.0 - extents.x_bearing, y + glyph_pos[i].y_offset / 64.0);

      cairo_show_text(cr, glyph_char);

      char_width := extents.x_advance;
      spacing := char_width * 1.2;

      x += glyph_pos[i].x_advance / 64 + spacing;
      y += glyph_pos[i].y_advance / 64;
    end;

    hb_buffer_destroy(buf);
    hb_font_destroy(hb_fnt);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 500, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_set_size_request(drawing_area, 400, 100);
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
