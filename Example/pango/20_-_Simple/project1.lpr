program project1;

uses
  ctypes,
  fp_glib2,
  fp_cairo,
  fp_pango,
  fp_GLIBTools;

const
  RADIUS = 200;
  N_WORDS = 9;
  FONT_WITH_MANUAL_SIZE = 'Times new roman,Sans';
  FONT_SIZE = 36;
  DEVICE_DPI = 72;
  TWEAKABLE_SCALE = 0.1;

  procedure draw_text(cr: Pcairo_t);
  var
    layout: PPangoLayout;
    desc: PPangoFontDescription;
    i: integer;
    angle: double;
    red: double;
    w, h: longint;
  begin
    cairo_translate(cr, RADIUS / TWEAKABLE_SCALE, RADIUS / TWEAKABLE_SCALE);

    layout := pango_cairo_create_layout(cr);
    pango_layout_set_text(layout, 'Test'#10'سَلام', -1);

    desc := pango_font_description_from_string(FONT_WITH_MANUAL_SIZE);
    pango_font_description_set_absolute_size(desc, FONT_SIZE * DEVICE_DPI * PANGO_SCALE / (72.0 * TWEAKABLE_SCALE));

    g_printf('PANGO_SCALE = %d'#10, PANGO_SCALE);

    pango_layout_set_font_description(layout, desc);
    pango_font_description_free(desc);

    for i := 0 to N_WORDS-1 do begin
      angle := (360.0 * i) / N_WORDS;

      cairo_save(cr);

      red := (1 + cos((angle - 60) * G_PI / 180.0)) / 2;
      cairo_set_source_rgb(cr, red, 0, 1.0 - red);

      cairo_rotate(cr, angle * G_PI / 180.0);

      pango_cairo_update_layout(cr, layout);

      pango_layout_get_size(layout, @w, @h);
      cairo_move_to(cr, (-(w / PANGO_SCALE) / 2.0), (-RADIUS) / TWEAKABLE_SCALE);
      pango_cairo_show_layout(cr, layout);

      cairo_restore(cr);
    end;

    g_object_unref(layout);
  end;

  procedure main;
  var
    surface: Pcairo_surface_t;
    cr: Pcairo_t;
    status: Tcairo_status_t;
  begin
    surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 2 * RADIUS, 2 * RADIUS);
    cr := cairo_create(surface);
    cairo_scale(cr, TWEAKABLE_SCALE, TWEAKABLE_SCALE);

    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
    cairo_paint(cr);
    draw_text(cr);
    cairo_destroy(cr);

    status := cairo_surface_write_to_png(surface, 'test.png');
    cairo_surface_destroy(surface);
  end;

begin
  main;
end.
