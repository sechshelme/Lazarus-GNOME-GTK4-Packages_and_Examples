program project1;

uses
  hb_common,             // io.
  hb_unicode,            // io.
  hb_buffer,             // io. > hb_unicode
  hb_blob,               // io.
  hb_paint,              // io. -> hb_blob
  hb_draw,               // io.
  hb_font,               // io. -> hb_draw, hb_paint
  hb_set,                // io.
  hb_map,                // io. -> hb_set
  hb_face,               // io. -> hb_blob, hb_set, hb_map
  hb_shape_,             // io. -> hb_buffer
  hb_ot_name,            // io.
  hb_aat_layout,         // io. -> hb_ot_name
  hb_ot_layout,          // io. -> hb_set, hb_map, hb_ot_name, hb_font
  hb_ot_math,            // io.
  hb_ot_metrics,         // io.

  hb_gobject_enums,      // io.                                       ( andere lib )
  hb_subset,             // io. hb_common, hb_set, hb_map, hb_ot_name ( andere lib )

  hb_deprecated,         // io. hb_common, hb_buffer, hb_font, hb_unicode, hb_draw, hb_aat_layout


  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  begin
    g_print('Click'#10);
  end;


var
  surface: Pcairo_surface_t = nil;
  cr: Pcairo_t = nil;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    cairo_set_source_surface(cr, surface, 0.8, 0.8);
    cairo_paint(cr);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
    buf: Phb_buffer_t;
    hb_fnt: fp_glib2.Phb_font_t;
    glyph_count: DWord;
    glyph_info: Phb_glyph_info_t;
    glyph_pos: Phb_glyph_position_t;
    glyph_char: array[0..4] of Tgchar;
    i, j: integer;
    len: Tgint;
    extents: Tcairo_text_extents_t;
    x: double = 10;
    y: double = 50;
    char_width, spacing: double;
  const
    Text: Pgchar = 'Hello, HarfBuzz ! ÄÖÜöäüÿŸlllwww';
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

    // ==========

    surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 600, 200);
    cr := cairo_create(surface);
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
      len := g_unichar_to_utf8(g_utf8_get_char(Text + glyph_info[i].cluster), glyph_char);

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

    if cr<>nil then cairo_destroy(cr);
    if surface<>nil then cairo_surface_destroy(surface);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
