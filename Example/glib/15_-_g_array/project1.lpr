program project1;

uses
  ctypes,
  fp_glib2;

type
  TPerson = record
    Name: array[0..49] of char;
    age: cint;
  end;
  PPerson = ^TPerson;

  procedure PrintArray(g_arr: PGArray);
  var
    i: integer;
    p: TPerson;
  begin
    g_printf('Count: %i'#10, g_arr^.len);
    for i := 0 to g_arr^.len - 1 do begin
      p := PPerson(g_arr^.Data)[i];
      g_printf('%4i. Name: %-16s Alter: %4i'#10, i, p.Name, p.age);
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    garray: PGArray;
    i: cint;
    p: TPerson;
  begin
    // Eine cint Array

    garray := g_array_new(False, False, SizeOf(cint));
    for i := 0 to 8 do begin
      g_array_append_val(garray, i);
    end;

    for i := 0 to garray^.len - 1 do begin
      g_printf('%4i'#10, pcint(garray^.Data)[i]);
    end;

    g_array_free(garray, True);


    // Eine record Array
    garray := g_array_new(False, False, SizeOf(TPerson));

    for i := 0 to 15 do begin
      g_snprintf(p.Name, SizeOf(p.Name), 'Person %d', i + 1);
      p.age := 20 + i;
      g_array_append_val(garray, p);
    end;

    PrintArray(garray);

    g_array_free(garray, True);
  end;

begin
  main(argc, argv);
end.
