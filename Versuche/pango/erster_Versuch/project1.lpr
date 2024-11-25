program project1;

uses
  ctypes,

  pango_types,

  pango_script,         // io.
  pango_language,       // io. -> pango_script
  pango_direction,      // io.
  pango_color,          // io.
  pango_matrix,         // io.
  pango_gravity,        // io. -> pango_matrix, pango_script
  pango_context,        // io. -> pango_gravity, pango_matrix
  pango_item,           // io. -> pango_context, pango_direction
  pango_break,          // io. -> pango_item
  pango_glyph,          // io. -> pango_item, pango_break
  pango_coverage,       // io.
  pango_engine,         // io. -> pango_item, pango_break, pango_glyph, pango_coverage, pango_script
  pango_fontset,        // io.
  pango_fontmap,        // io. -> pango_context
  pango_font,           // io. -> pango_gravity, pango_coverage, pango_context
  pango_attributes,     // io. -> pango_color, pango_font, pango_gravity
  pango_features,       // io.
  pango_version_macros, // io. -> pango_features
  pango_glyph_item,     // io. -> pango_item, pango_glyph, pango_break
  pango_layout,         // io. -> pango_glyph_item, pango_break


  pango_renderer,       // io. -> pango_attributes, pango_matrix, pango_glyph, pango_glyph_item, pango_layout, pango_color

  pangocairo,

//  pangoft2,             //    !!!!! ft2 !!!!! -> pango_glyph, pango_matrix, pango_layout, pango_coverage
//  pangofc_font,         //    !!!!! ft2 !!!!! -> pango_matrix, pango_glyph
//  pango_ot,             //    !!!!! ft2 !!!!! -> pango_script, pango_glyph, pangofc_font


  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  // https://www.perplexity.ai/search/was-ist-gi-scanner-JsyzTafESNujenggA8EGLw

  procedure Print_PangoLogAttr;
  var
    Text: Pgchar = 'Hello, Pango!'#10'Hallo Pango!';
    len, i: integer;
    log_attrs: PPangoLogAttr;

  begin
    len := StrLen(Text);

    log_attrs := g_malloc((len + 1) * SizeOf(TPangoLogAttr));

    pango_get_log_attrs(Text, len, -1, nil, log_attrs, len + 1);

    g_printf('Die Größe von PangoLogAttr beträgt: %zu Bytes'#10, SizeOf(TPangoLogAttr));

    for i := 0 to len do begin
      g_printf('Position %d:', i);
      if log_attrs[i].is_line_break = 1 then begin
        g_printf('Möglicher Zeilenumbruch ');
      end;
      if log_attrs[i].is_word_start = 1 then begin
        g_printf('Wortanfang ');
      end;
      if log_attrs[i].is_word_end = 1 then begin
        g_printf('Wortende ');
      end;
      g_printf('         %40b'#10, log_attrs[i]);
    end;

    g_free(log_attrs);
  end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, label1: PGtkWidget;
    attrs: PPangoAttrList;
    underline_attr, underline_double_attr: PPangoAttribute;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    label1 := gtk_label_new(nil);
    gtk_label_set_markup(GTK_LABEL(label1), '<span foreground="blue" size="x-large">Hallo, <i>Pango</i> und <b>GTK4</b>!</span>');

    attrs := pango_attr_list_new;
    underline_attr := pango_attr_underline_new(PANGO_UNDERLINE_SINGLE);
    pango_attr_list_insert(attrs, underline_attr);

    underline_double_attr := pango_attr_underline_new(PANGO_UNDERLINE_DOUBLE);
    underline_double_attr^.start_index:=7;
    underline_double_attr^.end_index:=12;
    pango_attr_list_insert(attrs, underline_double_attr);

    gtk_label_set_attributes(GTK_LABEL(label1), attrs);
    pango_attr_list_unref(attrs);

  //  attrs:=    gtk_label_get_attributes(GTK_LABEL(label1));



    Print_PangoLogAttr;
    WriteLn(GDK_VERSION_4_12);
    WriteLn(GLIB_VERSION_2_12);

    // pango_language_to_string


    gtk_window_set_child(GTK_WINDOW(window), label1);
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
//  pango_fc_font_get_type;
  main(argc, argv);
end.
