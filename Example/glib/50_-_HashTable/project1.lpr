program project1;

uses
  ctypes,
  fp_glib2;

  procedure hfunc(key: Tgpointer; Value: Tgpointer; user_data: Tgpointer); cdecl;
  begin
    g_printf('Name: %s   Alter: %i'#10, key, Value);
  end;


  procedure Check(table: PGHashTable; Name: Pgchar);
  var
    age_ptr: Tgpointer;
  begin
    age_ptr := g_hash_table_lookup(table, Name);
    if age_ptr = nil then begin
      g_printf('Name: %s nicht gefunden'#10, Name);
    end else begin
      g_printf('%s is %i Jahre alt'#10, Name, PtrUInt(age_ptr));
    end;
  end;

  procedure key_destroy_func(Data: Tgpointer); cdecl;
  begin

  end;

  procedure value_destroy_func(Data: Tgpointer); cdecl;
  begin

  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    hash_table: PGHashTable;
  begin
// https://www.perplexity.ai/search/gib-mir-ein-c-gtk4-beispiel-mi-.CX.nqcxSHab_yXI3ejZRw

//    g_list_free_full

    hash_table := g_hash_table_new(@g_str_hash, @g_str_equal);
//    hash_table := g_hash_table_new_full(@g_str_hash, @g_str_equal,@key_destroy_func,@value_destroy_func);

    g_hash_table_insert(hash_table, g_strdup('Otto'), Pointer(13));
    g_hash_table_insert(hash_table, g_strdup('Alex'), Pointer(13));
    g_hash_table_insert(hash_table, g_strdup('Peter'), Pointer(24));
    g_hash_table_insert(hash_table, g_strdup('Rolf'), Pointer(55));
    g_hash_table_insert(hash_table, g_strdup('Ralf'), Pointer(42));

    g_hash_table_foreach(hash_table, @hfunc, nil);
    g_printf(#10);

    Check(hash_table, 'Rudolf');
    Check(hash_table, 'Peter');
    Check(hash_table, 'Ralf');

    g_hash_table_destroy(hash_table);
//    g_hash_table_destroy(hash_table);
  end;

begin
  main(argc, argv);
end.
