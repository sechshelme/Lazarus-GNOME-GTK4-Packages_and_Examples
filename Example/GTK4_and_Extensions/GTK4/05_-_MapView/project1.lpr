program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4;

const
  GRID_SIZE = 5;
  TILE_SIZE = 256;
  SCREEWIDTH = TILE_SIZE * 3;
  SCREEHEIGHT = TILE_SIZE * 3;

type
  TAppData = record
    drawing_area: PGtkWidget;
    tiles: array[0..GRID_SIZE - 1, 0..GRID_SIZE - 1] of PGdkTexture;
    offset_x, offset_y: integer;
  end;
  PAppData = ^TAppData;

  TTileTask = record
    app: PAppData;
    row, col: integer;
  end;
  PTileTask = ^TTileTask;

  procedure draw_cp(area: PGtkDrawingArea; cr: Pcairo_t; width: integer; height: integer; user_data: Tgpointer); cdecl;
  var
    app: PAppData;
    r, c, w, h: integer;
    surf: Pcairo_surface_t;
  begin
    app := PAppData(user_data);
    for r := 0 to GRID_SIZE - 1 do begin
      for c := 0 to GRID_SIZE - 1 do begin
        if app^.tiles[r, c] <> nil then begin
          w := gdk_texture_get_width(app^.tiles[r, c]);
          h := gdk_texture_get_height(app^.tiles[r, c]);
          surf := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, w, h);

          gdk_texture_download(app^.tiles[r, c], cairo_image_surface_get_data(surf), cairo_image_surface_get_stride(surf));
          cairo_surface_mark_dirty(surf);

          cairo_set_source_surface(cr, surf, (c * TILE_SIZE) - app^.offset_x, (r * TILE_SIZE) - app^.offset_y);
          cairo_paint(cr);
          cairo_surface_destroy(surf);
        end;
      end;
    end;
  end;

  procedure tile_loaded_cp(source: PGObject; res: PGAsyncResult; user_data: Tgpointer); cdecl;
  var
    task: PTileTask;
    contents: pchar = nil;
    length: Tgsize;
    bytes: PGBytes;
    tex: PGdkTexture;
  begin
    task := PTileTask(user_data);
    if g_file_load_contents_finish(PGFile(source), res, @contents, @length, nil, nil) then begin
      bytes := g_bytes_new_take(contents, length);
      tex := gdk_texture_new_from_bytes(bytes, nil);
      if tex <> nil then begin
        if task^.app^.tiles[task^.row, task^.col] <> nil then begin
          g_object_unref(task^.app^.tiles[task^.row, task^.col]);
        end;
        task^.app^.tiles[task^.row, task^.col] := tex;
        gtk_widget_queue_draw(task^.app^.drawing_area);
      end;
      g_bytes_unref(bytes);
    end;
    Dispose(task);
  end;

  procedure loadlile(app: PAppData; zoom, x, y, row, col: integer);
  var
    task: PTileTask;
    url: pchar;
    f: PGFile;
  begin
    New(task);
    task^.app := app;
    task^.row := row;
    task^.col := col;
    url := g_strdup_printf('https://tile.openstreetmap.org/%d/%d/%d.png', zoom, x, y);
    f := g_file_new_for_uri(url);
    g_file_load_contents_async(f, nil, @tile_loaded_cp, task);
    g_free(url);
    g_object_unref(f);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
    window: PGtkWidget;
    lat, lon, n, x_exact, y_exact, lat_rad: double;
    zoom, x_start_idx, y_start_idx, x, y: integer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_default_size(GTK_WINDOW(window), SCREEWIDTH, SCREEHEIGHT);

    data^.drawing_area := gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(data^.drawing_area), @draw_cp, data, nil);
    gtk_window_set_child(GTK_WINDOW(window), data^.drawing_area);

    lat := 47.3769;
    lon := 8.5417; // Zürich
    zoom := 19;

    n := 1 shl zoom;

    x_exact := (lon + 180.0) / 360.0 * n;

    lat_rad := lat * pi / 180.0;
    y_exact := (1.0 - Ln((Sin(lat_rad) + 1.0) / Cos(lat_rad)) / pi) / 2.0 * n;

    x_start_idx := Trunc(x_exact);
    y_start_idx := Trunc(y_exact);

    data^.offset_x := Trunc((x_exact - x_start_idx) * TILE_SIZE);
    data^.offset_y := Trunc((y_exact - y_start_idx) * TILE_SIZE);

    for x := 0 to GRID_SIZE - 1 do begin
      for y := 0 to GRID_SIZE - 1 do begin
        loadlile(data, zoom, x_start_idx + y - 1, y_start_idx + x - 1, x, y);
      end;
    end;

    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
    data: TAppData;
  begin
    FillChar(data.tiles, SizeOf(data.tiles),0);

    app := gtk_application_new('org.gtk.mapdemo', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @data);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
