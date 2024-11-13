program project1;

uses
  ctypes,
  glib280,
  tdouble;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec5.md


procedure notify_cb(self: PGObject; Data: Tgpointer); cdecl;
var
  c: PChar absolute Data;
begin
  g_print('notify::value'#10);
end;

function get_value(d:PTDouble):Tgdouble;
var
  v:Tgdouble;
begin
  g_object_get(d, 'value',@v,nil);
  Result:=v;
  end;


  procedure t_print(op: PChar; d1, d2, d3: PTDouble);
  begin
    g_print('%lf %s %lf = %lf'#10,get_value(d1), op, get_value(d2), get_value(d3));
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    d1, d2, d3: PTDouble;
    v1, v3: Tgdouble;
  begin
    WriteLn('fsdfdsafsdafdasf');
    d1 := t_double_new_with_value(10.0);
    d2 := t_double_new_with_value(20.0);
    g_object_set(d1, 'value', 11.1, nil);
    g_object_set(d2, 'value', 22.2, nil);


    t_double_set_value(d1,  123.456);

//    g_signal_connect(d1, 'div-by-zero', G_CALLBACK(@div_by_zero_cb), nil);
//    g_signal_connect_after(d1, 'div-by-zero', G_CALLBACK(@div_by_zero_cb), nil);
    g_signal_connect(G_OBJECT( d1), 'notify::value', G_CALLBACK(@notify_cb), nil);

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
