program project1;

uses
  ctypes,
  fp_glib2,
  tdouble;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec4.md


  procedure div_by_zero_cb(self: PGObject; Data: Tgpointer); cdecl;
  var
    c: PChar absolute Data;
  begin
    g_printerr(#10'Error: division by zero.'#10#10);
  end;



  procedure t_print(op: PChar; d1, d2, d3: PTDouble);
  var
    v1, v2, v3: Tgdouble;
  begin
    if not t_doube_get_value(d1, @v1) then begin
      Exit;
    end;
    if not t_doube_get_value(d2, @v2) then begin
      Exit;
    end;
    if not t_doube_get_value(d3, @v3) then begin
      Exit;
    end;
    g_print('%lf %s %lf = %lf'#10, v1, op, v2, v3);
  end;



  function main(argc: cint; argv: PPChar): cint;
  var
    d1, d2, d3: PTDouble;
    v1, v3: Tgdouble;
  begin
    d1 := t_double_new(10.0);
    d2 := t_double_new(20.0);

    g_signal_connect(d1, 'div-by-zero', G_CALLBACK(@div_by_zero_cb), nil);

    d3 := t_double_add(d1, d2);
    if d3 <> nil then begin
      t_print('+', d1, d2, d3);
      g_object_unref(d3);
    end;

    d3 := t_double_sub(d1, d2);
    if d3 <> nil then begin
      t_print('-', d1, d2, d3);
      g_object_unref(d3);
    end;

    d3 := t_double_mul(d1, d2);
    if d3 <> nil then begin
      t_print('*', d1, d2, d3);
      g_object_unref(d3);
    end;

    d3 := t_double_div(d1, d2);
    if d3 <> nil then begin
      t_print('/', d1, d2, d3);
      g_object_unref(d3);
    end;

    t_double_set_value(d2, 0.0);

    d3 := t_double_div(d1, d2);
    if d3 <> nil then begin
      t_print('/', d1, d2, d3);
      g_object_unref(d3);
    end;

    d3 := t_double_uminus(d1);
    if (d3 <> nil) and (t_doube_get_value(d1, @v1) and (t_doube_get_value(d3, @v3))) then  begin
      g_print('-%lf = %lf'#10, v1, v3);
      g_object_unref(d3);
    end;

    g_object_unref(d1);
    g_object_unref(d2);

    Result := 0;
  end;

begin
  main(argc, argv);
  WriteLn('--- ende --');
end.
