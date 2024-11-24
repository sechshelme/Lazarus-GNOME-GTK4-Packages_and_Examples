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


  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  // https://www.perplexity.ai/search/was-ist-gi-scanner-JsyzTafESNujenggA8EGLw

  procedure Print_PangoLogAttr;
  var
    //    Text: Pgchar = 'Hello, Pango!'#10'Hallo Pango!';
    Text: Pgchar = 'blublu';
    len, i: integer;
    log_attrs: PPangoLogAttr;

  begin
    len := Length(Text);

    // Allokiere Speicher für die logischen Attribute
    GetMem(log_attrs, (len + 1) * SizeOf(TPangoLogAttr));

    // Berechne die logischen Attribute für den Text
    pango_get_log_attrs(Text, len, -1, nil, log_attrs, len + 1);

    // Gib die Größe von PangoLogAttr aus
    g_printf('Die Größe von PangoLogAttr beträgt: %zu Bytes'#10, SizeOf(TPangoLogAttr));

    // Gib einige logische Attribute aus
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
      g_printf(#10);
    end;

    // Speicher freigeben
    FreeMem(log_attrs);
  end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, label1: PGtkWidget;
    attrs: PPangoAttrList;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    label1 := gtk_label_new(nil);
    gtk_label_set_markup(GTK_LABEL(label1), '<span foreground="blue" size="x-large">Hallo, <i>Pango</i> und <b>GTK4</b>!</span>');

    attrs := pango_attr_list_new;
    pango_attr_list_insert(attrs, pango_attr_underline_new(PANGO_UNDERLINE_SINGLE));

    gtk_label_set_attributes(GTK_LABEL(label1), attrs);
    pango_attr_list_unref(attrs);


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
  main(argc, argv);
end.
