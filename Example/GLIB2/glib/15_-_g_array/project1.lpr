program project1;

uses
  ctypes,
  fp_glib2;

  procedure printTitle(title: Pgchar);
  begin
    g_printf(#10#10#10'=========== %s ==============='#10#10, title);
  end;


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

  procedure ptr_free_func(Data: Tgpointer); cdecl;
  begin
    g_printf('"%s" freigegeben'#10, Data);
    g_free(Data);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    garray: PGArray;
    i: cint;
    p: TPerson;
    gptrarray: PGPtrArray;
  begin
    // Eine cint Array
    printTitle('cint array');

    garray := g_array_new(False, False, SizeOf(cint));
    for i := 0 to 8 do begin
      g_array_append_val(garray, i);
    end;

    for i := 0 to garray^.len - 1 do begin
      g_printf('%4i'#10, pcint(garray^.Data)[i]);
    end;

    g_array_free(garray, True);


    // Eine record Array
    printTitle('record array');

    garray := g_array_new(False, False, SizeOf(TPerson));

    for i := 0 to 15 do begin
      g_snprintf(p.Name, SizeOf(p.Name), 'Person %d', i + 1);
      p.age := 20 + i;
      g_array_append_val(garray, p);
    end;

    PrintArray(garray);
    g_array_free(garray, True);

    // Eine Pointer Array
    printTitle('Pointer array');

    gptrarray := g_ptr_array_new_with_free_func(@ptr_free_func);
    g_ptr_array_add(gptrarray, g_strdup('Pointer eins'));
    g_ptr_array_add(gptrarray, g_strdup('Pointer zwei'));
    g_ptr_array_add(gptrarray, g_strdup('Pointer drei'));

    for i := 0 to gptrarray^.len - 1 do begin
      g_print('Value: %s'#10, g_ptr_array_index(gptrarray, i));
    end;
    g_print(#10);

    g_ptr_array_unref(gptrarray);

    printTitle('Ende');
  end;

begin
  main(argc, argv);
end.
