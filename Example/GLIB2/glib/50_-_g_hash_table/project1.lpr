program project1;

uses
  ctypes,
  fp_glib2;

  procedure hfunc(key: Tgpointer; Value: Tgpointer; user_data: Tgpointer); cdecl;
  begin
    g_printf('Name: %-10sAlter: %3s'#10, key, Value);
  end;


  procedure Check(table: PGHashTable; Name: Pgchar);
  var
    age_ptr: Tgpointer;
  begin
    age_ptr := g_hash_table_lookup(table, Name);
    if age_ptr = nil then begin
      g_printf('Name: %s nicht gefunden'#10, Name);
    end else begin
      g_printf('%s ist %s Jahre alt'#10, Name, PtrUInt(age_ptr));
    end;
  end;

  procedure key_destroy_func(Data: Tgpointer); cdecl;
  begin
    g_print('Name %s gelöscht'#10, Data);
    g_free(Data);
  end;

  procedure value_destroy_func(Data: Tgpointer); cdecl;
  begin
    g_print('Alter %s gelöscht'#10, Data);
    g_free(Data);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    hash_table: PGHashTable;
  begin
    hash_table := g_hash_table_new_full(@g_str_hash, @g_str_equal, @key_destroy_func, @value_destroy_func);

    g_hash_table_insert(hash_table, g_strdup('Otto'), g_strdup('13'));
    g_hash_table_insert(hash_table, g_strdup('Alex'), g_strdup('13'));
    g_hash_table_insert(hash_table, g_strdup('Peter'), g_strdup('24'));
    g_hash_table_insert(hash_table, g_strdup('Rolf'), g_strdup('55'));
    g_hash_table_insert(hash_table, g_strdup('Ralf'), g_strdup('42'));

    g_hash_table_foreach(hash_table, @hfunc, nil);
    g_printf(#10);

    Check(hash_table, 'Rudolf');
    Check(hash_table, 'Peter');
    Check(hash_table, 'Ralf');
    g_printf(#10);

    g_hash_table_destroy(hash_table);

    g_print('Ende'#10);
  end;

begin
  main(argc, argv);
end.
