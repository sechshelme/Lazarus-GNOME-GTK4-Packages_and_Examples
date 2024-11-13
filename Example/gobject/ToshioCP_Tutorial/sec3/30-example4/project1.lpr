program project1;

uses
  ctypes,
  glib280, tdouble;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec3.md
  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/src/tdouble1/tdouble.c



  function main(argc: cint; argv: PPChar): cint;
  var
    d: PTDouble;
    value: Tgdouble;
  begin
    d:=t_double_new(10.0);
    if t_doube_get_value(d, @value) then begin
      g_print('t_doube_get_value io. :  %lf.'#10, value);
    end else begin
      g_print('t_doube_get_value error'#10);
    end;

    t_double_set_value(d, -20.0);
    if t_doube_get_value(d, @value) then begin
      g_print('New Size: %lf'#10, value);
    end else begin
      g_print('t_doube_get_value error'#10);
    end;

    t_double_mul(d, 3.3);
    if t_doube_get_value(d, @value) then begin
      g_print('New Size: %lf'#10, value);
    end else begin
      g_print('t_doube_get_value error'#10);
    end;

    g_object_unref(d);

    Result := 0;
  end;

begin
  main(argc, argv);
  WriteLn('--- ende --');
end.
