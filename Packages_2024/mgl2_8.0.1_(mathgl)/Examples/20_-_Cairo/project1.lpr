program project1;

uses
  fp_cairo,
  fp_mgl2;

  function sample(gr: THMGL; p: pointer): longint; cdecl;
  var
    y0, y1, y2, y3: THMDT;
    n: longint = 30;
  begin
    y0 := mgl_create_data_size(n, 1, 1);
    mgl_data_modify(y0, '0.4*sin(2*pi*x)+0.3*cos(3*pi*x)-0.4*sin(4*pi*x)+0.2*rnd', 0);

    y1 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y1, y0);

    y2 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y2, y0);

    y3 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y3, y0);

    mgl_data_smooth(y1, 'line3', 0);
    mgl_data_smooth(y2, 'line5', 0);
    mgl_data_smooth(y3, 'quad5', 0);

    mgl_plot(gr, y0, 'k', '');
    mgl_add_legend(gr, 'NONE', 'k');
    mgl_plot(gr, y1, 'r', '');
    mgl_add_legend(gr, 'LINE_3', 'r');
    mgl_plot(gr, y2, 'g', '');
    mgl_add_legend(gr, 'LINE_5', 'g');
    mgl_plot(gr, y3, 'b', '');
    mgl_add_legend(gr, 'QUAD_5', 'b');
    mgl_legend(gr, 1, '', '');
    mgl_box(gr);

    mgl_delete_data(y0);
    mgl_delete_data(y1);
    mgl_delete_data(y2);
    mgl_delete_data(y3);

    Result := 0;
  end;

  procedure DrawToCairo(width, height: integer);
  var
    gr: THMGL;
    pixels: pbyte;
    stride: longint;
    surface: Pcairo_surface_t;
    cr: Pcairo_t;
  const
    path = 'test.png';
  begin
    gr := mgl_create_graph(Width, Height);
    if gr = nil then  begin
      WriteLn('MathGL Fehler: Konnte Graph nicht erstellen.');
      Exit;
    end;

    mgl_fill_background(gr, 0.8, 1.0, 1.0, 1.0);
    mgl_clf(gr);
    mgl_rotate(gr, 60, 40, 0); // Dreht den Graphen: 60° um X, 40° um Y

    sample(gr, nil);

    pixels := mgl_get_rgba(gr);
    stride := cairo_format_stride_for_width(CAIRO_FORMAT_ARGB32, Width);

    surface := cairo_image_surface_create_for_data(pixels, CAIRO_FORMAT_ARGB32, Width, Height, stride);

    cr := cairo_create(surface);
    cairo_arc(cr, 100.0, 100.0, 20.0, 0, 2 * PI);
    cairo_stroke(cr);

    cairo_surface_write_to_png(surface, path);
    WriteLn('PNG erfolgreich erstellt: ', path);
    cairo_surface_destroy(surface);

    mgl_delete_graph(gr);
  end;

  procedure main;
  begin
//    ViewQT;
    DrawToCairo(800, 600);
  end;

begin
  main;
end.
