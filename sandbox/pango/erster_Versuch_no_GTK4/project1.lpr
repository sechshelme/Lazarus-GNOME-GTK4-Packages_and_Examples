program project1;

uses
  ctypes,

  fp_pango,

  fp_glib2;


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



  function main(argc: cint; argv: PPChar): cint;
  begin
    Print_PangoLogAttr;
  end;

begin
  //  pango_fc_font_get_type;
  main(argc, argv);
end.
