program project1;

uses
  ctypes,

  pango_types,

  pango_script,         // io.
  pango_color,          // io.
  pango_glyph,
  pango_break,
  pango_item,
  pango_engine,
  pango_direction,
  pango_fontset,
  pango_context,
  pango_fontmap,
  pango_coverage,
  pango_matrix,
  pango_gravity,
  pango_font,
  pango_language,
  pango_attributes,




  fp_glib2,
  fp_GTK4;

  // https://www.perplexity.ai/search/was-ist-gi-scanner-JsyzTafESNujenggA8EGLw

procedure Print_PangoLogAttr;
var
  text: PChar='Hello, Pango!';
  len, i: Integer;
  log_attrs: PPangoLogAttr;

begin
  len := Length(text);

  // Allokiere Speicher für die logischen Attribute
  GetMem(log_attrs, (len + 1) * SizeOf(TPangoLogAttr));

  // Berechne die logischen Attribute für den Text
  pango_get_log_attrs(PAnsiChar(text), len, -1, nil, log_attrs, len + 1);

  // Gib die Größe von PangoLogAttr aus
  WriteLn('Die Größe von PangoLogAttr beträgt: ', SizeOf(TPangoLogAttr), ' Bytes');

  // Gib einige logische Attribute aus
  for i := 0 to len do  begin
    Write('Position ', i, ': ');
    if log_attrs[i].is_line_break=1 then
      Write('Möglicher Zeilenumbruch ');
    if log_attrs[i].is_word_start=1 then
      Write('Wortanfang ');
    if log_attrs[i].is_word_end=1 then
      Write('Wortende ');
    WriteLn;
  end;

  // Speicher freigeben
  FreeMem(log_attrs);
end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, label1: PGtkWidget;
    pa: TPangoLogAttr;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    label1 := gtk_label_new(nil);
    gtk_label_set_markup(GTK_LABEL(label1), '<span foreground="blue" size="x-large">Hallo, <i>Pango</i> und <b>GTK4</b>!</span>');


    Print_PangoLogAttr;


    WriteLn('TPangoLogAttr: ', SizeOf(TPangoLogAttr));

//    WriteLn(PtrUInt(@pa.reserved) - PtrUInt(@pa));


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
