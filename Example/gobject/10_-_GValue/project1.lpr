program project1;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ

uses
  ctypes,
  fp_glib2;

  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    int_value, string_value, static_string_value: TGValue;
  begin
    int_value:=G_VALUE_INIT_;
    g_value_init(@int_value, G_TYPE_INT);
    g_value_set_int(@int_value, 123);

    string_value:=G_VALUE_INIT_;
    g_value_init(@string_value, G_TYPE_STRING);
    g_value_set_string(@string_value, 'Hello gobject');

    g_printf('Integer-Wert: %d'#10, g_value_get_int(@int_value));
    g_printf('String-Wert: %s'#10, g_value_get_string(@string_value));

    g_value_unset(@int_value);
    g_value_unset(@string_value);


    static_string_value:=G_VALUE_INIT_;
    g_value_init(@static_string_value, G_TYPE_STRING);
    g_value_set_static_string(@static_string_value, 'Hello gobject static');

    g_printf('String-Wert: %s'#10, g_value_get_string(@static_string_value));
    g_value_unset(@static_string_value);
    g_value_unset(@static_string_value);



    Exit(0);
  end;

begin
  main(argc, argv);
end.
