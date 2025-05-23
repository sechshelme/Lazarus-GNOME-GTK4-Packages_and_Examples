program Project1;

uses
  fp_cairo_ps,
  fp_cairo;

  // https://www.cairographics.org/documentation/cairomm/reference/svg-surface_8cc-example.html

  procedure Create_Cairo;
  var
    cairo_x_multiplier, cairo_y_multiplier: integer;
    cr_surface: Pcairo_surface_t;
    cr: Pcairo_t;
    xc: double = 320;
    yc: double = 240;
    radius: double = 200;
    angele1: double = 45 * (pi / 180);
    angele2: double = 180 * (pi / 180);

  begin
    cairo_x_multiplier := 1;
    cairo_y_multiplier := 1;

    cr_surface := cairo_ps_surface_create('test.ps', 640, 480);

    cairo_surface_set_device_scale(cr_surface, cairo_x_multiplier, cairo_y_multiplier);

    cr := cairo_create(cr_surface);

    cairo_set_source_rgba(cr, 1, 1, 1, 1.0);
    cairo_rectangle(cr, 0, 0, 640, 480);
    cairo_fill(cr);

    cairo_set_source_rgba(cr, 0, 0, 0, 1.0);
    cairo_set_line_width(cr, 10.0);
    cairo_arc(cr, xc, yc, radius, angele1, angele2);
    cairo_stroke(cr);

    cairo_set_source_rgba(cr, 1, 0.2, 0.2, 0.6);
    cairo_set_line_width(cr, 6.0);

    cairo_arc(cr, xc, yc, 10.0, 0, 2 * pi);
    cairo_fill(cr);

    cairo_arc(cr, xc, yc, radius, angele1, angele1);
    cairo_line_to(cr, xc, yc);
    cairo_arc(cr, xc, yc, radius, angele2, angele2);
    cairo_line_to(cr, xc, yc);
    cairo_stroke(cr);

    cairo_destroy(cr);
    cairo_surface_destroy(cr_surface);
  end;

begin
  Create_Cairo();
end.
