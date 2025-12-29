program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_FreeType2,
  fp_harfbuzz,
  fp_cairo,
  fp_GTK4;

type
  TAppDate = record
    ft_library: TFT_Library;
    ft_face: TFT_Face;
    hb_font: Phb_font_t;
    hb_buffer: Phb_buffer_t;
  end;
  PAppDate = ^TAppDate;


  procedure quit_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    window: PGtkWindow;
  begin
    window := GTK_WINDOW(gtk_widget_get_ancestor(widget, GTK_TYPE_WINDOW));
    gtk_window_close(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
//    text = 'السلام عليكم HarfBuzz يعمل!';
//text = 'السلام عليكم';
    text='Hello    World !';

  var
    appData: PAppDate absolute user_data;

    ft_slot: TFT_GlyphSlot;
    ft_bmp: PFT_Bitmap;

    hb_info: Phb_glyph_info_t;
    hb_pos: Phb_glyph_position_t;
    hb_gid: Thb_codepoint_t;
    hb_len: DWord = 0;

    x, y: double;
    i, row: integer;

    cr_stride: longint;
    cr_copy: pbyte;
    cr_surface: Pcairo_surface_t;

    s:String;
    const
      counter:Int64=0;

  begin
    inc(counter);
    WriteStr(s, text, ' ', counter);
    WriteLn(s);
    s:=text;

    // Hintergrund
    cairo_set_source_rgb(cr, 0.95, 0.55, 0.55);
    cairo_paint(cr);

    // Schrift und Text
    hb_buffer_clear_contents(appData^.hb_buffer);

    hb_buffer_add_utf8(appData^.hb_buffer, PChar(s), -1, 0, -1);
    hb_buffer_guess_segment_properties(appData^.hb_buffer);
    hb_shape(appData^.hb_font, appData^.hb_buffer, nil, 0);
    hb_info := hb_buffer_get_glyph_infos(appData^.hb_buffer, @hb_len);
    hb_pos := hb_buffer_get_glyph_positions(appData^.hb_buffer, @hb_len);

    g_printf('[Info] Zeichne %u Glyphen'#10, hb_len);

    x := 50.0;
    y := height / 2.0;
    cairo_set_source_rgb(cr, 0.1, 0.2, 0.6);

    for i := 0 to hb_len - 1 do begin
      hb_gid := hb_info[i].codepoint;
      if FT_Load_Glyph(appData^.ft_face, hb_gid, FT_LOAD_RENDER) <> 0 then  begin
        continue;
      end;

      ft_slot := appData^.ft_face^.glyph;
      ft_bmp := @ft_slot^.bitmap;
      if (ft_bmp^.width = 0) or (ft_bmp^.rows = 0) then  begin
        continue;
      end;

      cr_stride := cairo_format_stride_for_width(CAIRO_FORMAT_A8, ft_bmp^.width);
      cr_copy := g_malloc0(cr_stride * ft_bmp^.rows);
      for row := 0 to ft_bmp^.rows - 1 do begin
        move(ft_bmp^.buffer[row * ft_bmp^.pitch], cr_copy[row * cr_stride], ft_bmp^.width);
      end;

      cr_surface := cairo_image_surface_create_for_data(cr_copy, CAIRO_FORMAT_A8, ft_bmp^.width, ft_bmp^.rows, cr_stride);

      cairo_save(cr);
      cairo_translate(cr, x + ft_slot^.bitmap_left + (hb_pos[i].x_offset / 64.0), y - ft_slot^.bitmap_top - (hb_pos[i].y_offset / 64.0));
      cairo_mask_surface(cr, cr_surface, 0, 0);
      cairo_restore(cr);

      cairo_surface_destroy(cr_surface);
      g_free(cr_copy);

      x += hb_pos[i].x_advance / 64.0;
      y += hb_pos[i].y_advance / 64.0;

//      if hb_gid = 32 then     x += hb_pos[i].x_advance / 64.0;  // Nur advance!
WriteLn(hb_gid);
      if hb_gid = 32 then     x +=190;
    end;
  end;

  procedure startup(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppDate absolute user_data;
  const
    font_path = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf';
  begin
    if FT_Init_FreeType(@appData^.ft_library) <> 0 then begin
      g_printf('[Fehler] Konnte FreeType nicht initialisieren'#10);
      Exit;;
    end;

    if FT_New_Face(appData^.ft_library, font_path, 0, @appData^.ft_face) <> 0 then begin
      g_printf('[Fehler] Konnte Schrift nicht laden: %s'#10, font_path);
      FT_Done_FreeType(appData^.ft_library);
      Exit;
    end;

    FT_Set_Char_Size(appData^.ft_face, 0, 32 * 64, 0, 0);

    appData^.hb_font := hb_ft_font_create(appData^.ft_face, nil);
    appData^.hb_buffer := hb_buffer_create;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppDate absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Harfbuzz-Example');
    gtk_window_set_default_size(GTK_WINDOW(window), 500, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, appData, nil);

    gtk_widget_set_size_request(drawing_area, 600, 100);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), nil);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure shutdown(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppDate absolute user_data;
  begin
        hb_buffer_destroy (appData^.hb_buffer);
    hb_font_destroy (appData^.hb_font);

    FT_Done_Face(appData^.ft_face);
    FT_Done_FreeType(appData^.ft_library);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
    appData: TAppDate;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup), @appData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @appData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown), @appData);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
