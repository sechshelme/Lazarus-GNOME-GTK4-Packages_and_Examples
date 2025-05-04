program project1;

uses
  ctypes,
  fp_glib2;


  function main(argc: cint; argv: PPChar): cint;
  var
    s: PGString;
  begin
    s := g_string_new('Hello');
    g_string_append(s, ' Welt');
    g_string_append(s, #10);
    g_string_append_printf(s, 'Zeile 1'#10);
    g_string_append_printf(s, 'Zeile 2'#10);
    g_string_append_printf(s, 'Zeile 3'#10);

    g_print('%s'#10#10#10, s^.str);

    g_string_ascii_down(s);
    g_print('%s'#10#10#10, s^.str);

    g_string_ascii_up(s);
    g_print('%s'#10#10#10, s^.str);

    g_string_free(s, gTrue);
  end;

begin
  main(argc, argv);
end.
