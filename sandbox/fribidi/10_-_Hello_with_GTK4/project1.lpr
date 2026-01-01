program project1;

uses
  fp_fribidi,
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

const
  font_path = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf';
  scale = 64;

  procedure quit_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    window: PGtkWindow;
  begin
    window := GTK_WINDOW(gtk_widget_get_ancestor(widget, GTK_TYPE_WINDOW));
    gtk_window_close(window);
  end;

  function fribidi_str_convert(const string_orig: string): string;
  var
    orig_len: SizeInt;
    fribidi_in_char: array of TFriBidiChar = nil;
    fribidi_visual_char: array of TFriBidiChar = nil;
    len, new_len: TFriBidiStrIndex;
    fribidi_pbase_dir: TFriBidiParType;
    stat: TFriBidiLevel;
    string_formatted: string = '';
  begin
    orig_len := Length(string_orig);

    SetLength(fribidi_in_char, orig_len + 1);
    len := fribidi_charset_to_unicode(FRIBIDI_CHAR_SET_UTF8, pchar(string_orig), orig_len, PFriBidiChar(fribidi_in_char));

    SetLength(fribidi_visual_char, len + 1);
    fribidi_pbase_dir := FRIBIDI_PAR_LTR;

    stat := fribidi_log2vis(PFriBidiChar(fribidi_in_char), len, @fribidi_pbase_dir, PFriBidiChar(fribidi_visual_char), nil, nil, nil);

    if stat <> 0 then begin
      SetLength(string_formatted, len * 4 + 1);
      new_len := fribidi_unicode_to_charset(FRIBIDI_CHAR_SET_UTF8, PFriBidiChar(fribidi_visual_char), len, pchar(string_formatted));
      if new_len > 0 then begin
        Exit(string_formatted);
      end;
    end;
    Result := string_orig;
  end;


  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
//    text = 'السلام عليكم HarfBuzz يعمل! 123';
         text = 'السلام عليكم';
    //        text = 'Hello World ! 😀  😄  ☺️';

  var
    appData: PAppDate absolute user_data;

    ft_slot: TFT_GlyphSlot;
    ft_bmp: PFT_Bitmap;

    hb_info: Phb_glyph_info_t;
    hb_pos: Phb_glyph_position_t;
    hb_gid: Thb_codepoint_t;
    hb_len: DWord = 0;

    x, y, text_width: double;
    i, row: integer;

    cr_stride, needed: longint;
    cr_copy: pbyte = nil;
    cr_surface: Pcairo_surface_t;

    s: string;
    current_buffer_size: Tgsize = 64 * 64;
    converted: string;
  const
    counter: int64 = 0;

  begin
    WriteLn('Original: %s'#10, text);

    converted := fribidi_str_convert(text);
    WriteLn('Converted: %s'#10, pchar(converted));

    inc(counter);
//        WriteStr(s, converted, ' (', counter, ')');
    s := converted;
    WriteLn(s);

    // Hintergrund
    cairo_set_source_rgb(cr, 0.95, 0.55, 0.55);
    cairo_paint(cr);

    // Schrift und Text
    hb_buffer_clear_contents(appData^.hb_buffer);

    hb_buffer_add_utf8(appData^.hb_buffer, pchar(s), -1, 0, -1);
    hb_buffer_guess_segment_properties(appData^.hb_buffer);
    hb_shape(appData^.hb_font, appData^.hb_buffer, nil, 0);
    hb_info := hb_buffer_get_glyph_infos(appData^.hb_buffer, @hb_len);
    hb_pos := hb_buffer_get_glyph_positions(appData^.hb_buffer, @hb_len);

    text_width := 0.0;
    for i := 0 to hb_len - 1 do begin
      text_width += hb_pos[i].x_advance / scale;
    end;

    x := (width - text_width) * 0.5 + 20;
    y := height * 0.75;
    cairo_set_source_rgb(cr, 0.1, 0.2, 0.6);

    cr_copy := g_malloc0(current_buffer_size);
    for i := 0 to hb_len - 1 do begin
      hb_gid := hb_info[i].codepoint;

      if FT_Load_Glyph(appData^.ft_face, hb_gid, FT_LOAD_RENDER) = 0 then begin
        ft_slot := appData^.ft_face^.glyph;
        ft_bmp := @ft_slot^.bitmap;

        if (ft_bmp^.width > 0) and (ft_bmp^.rows > 0) then begin
          cr_stride := cairo_format_stride_for_width(CAIRO_FORMAT_A8, ft_bmp^.width);
          needed := cr_stride * ft_bmp^.rows;

          if needed > current_buffer_size then begin
            current_buffer_size := needed;
            cr_copy := g_realloc(cr_copy, current_buffer_size);
          end;
          FillChar(cr_copy[0], needed, $00);

          for row := 0 to ft_bmp^.rows - 1 do begin
            move(ft_bmp^.buffer[row * ft_bmp^.pitch], cr_copy[row * cr_stride], ft_bmp^.width);
          end;

          cr_surface := cairo_image_surface_create_for_data(cr_copy, CAIRO_FORMAT_A8, ft_bmp^.width, ft_bmp^.rows, cr_stride);
          cairo_save(cr);
          cairo_translate(cr, x + ft_slot^.bitmap_left + (hb_pos[i].x_offset / scale), y - ft_slot^.bitmap_top - (hb_pos[i].y_offset / scale));
          cairo_mask_surface(cr, cr_surface, 0, 0);
          cairo_restore(cr);

          cairo_surface_destroy(cr_surface);
        end;
      end;

      x += hb_pos[i].x_advance / scale;
    end;
  end;

  procedure startup(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppDate absolute user_data;
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

    FT_Set_Char_Size(appData^.ft_face, 0, 32 * scale, 0, 0);

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
    hb_buffer_destroy(appData^.hb_buffer);
    hb_font_destroy(appData^.hb_font);

    FT_Done_Face(appData^.ft_face);
    FT_Done_FreeType(appData^.ft_library);
  end;

  procedure main;
  var
    app: PGtkApplication;
    appData: TAppDate;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup), @appData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @appData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown), @appData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
