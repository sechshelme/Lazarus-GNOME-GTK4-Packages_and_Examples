program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;

  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-glist-oJ5ZF.WyRtCLhviMO7Cb3w

const
  human_key = 'humanKey';
type
  THuman = record
    Name: Pgchar;
    age: Tgint;
  end;
  PHuman = ^THuman;

  procedure destroy_cp(Data: Tgpointer); cdecl;
  var
    human: PHuman absolute Data;
  begin
    g_printf('%s (freed)'#10, human^.Name);
    g_free(human^.Name);
    g_free(human);
  end;

  procedure printItems(store: PGListStore);
  var
    i: integer;
    human: PHuman;
    obj: PGObject;
    Count: Tguint;
  begin
    Count := g_list_model_get_n_items(G_LIST_MODEL(store));

    g_object_get(store, 'n-items', @Count, nil);

    g_printf('count: %d'#10, Count);
    for i := 0 to Count - 1 do begin
      obj := g_list_model_get_item(G_LIST_MODEL(store), i);
      human := g_object_get_data(obj, human_key);
      g_printf('%-15s   %3d'#10, human^.Name, human^.age);
      g_object_unref(obj);
    end;
  end;

  procedure addItem(store: PGListStore; Name: Pgchar; age: Tgint);
  var
    obj: PGObject;
    human: PHuman;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);
    human := g_malloc(SizeOf(THuman));
    human^.Name := g_strdup(Name);
    human^.age := age;
    g_object_set_data_full(obj, human_key, human, @destroy_cp);
    g_list_store_append(store, obj);
    g_object_unref(obj);
  end;

  procedure chages_cp(self: PGListModel; position: Tguint; removed: Tguint; added: Tguint; user_data: Tgpointer);
  begin
    g_printf('position: %d  removed: %d  added: %d'#10, position, removed, added);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    store: PGListStore;
  begin
    g_printf('-------------'#10);
    GSignalShow(G_TYPE_LIST_STORE);
    g_printf('-------------'#10);
    GSignalShow(G_TYPE_LIST_MODEL);
    g_printf('-------------'#10);

    store := g_list_store_new(G_TYPE_OBJECT);

    g_signal_connect(G_LIST_MODEL(store), 'items-changed', G_CALLBACK(@chages_cp), nil);

    //    GSignalShow(G_TYPE_LIST_STORE);
    //    GSignalShow(G_TYPE_LIST_MODEL);
    //    WriteLn('signal id: ', g_signal_lookup('items-changed', G_TYPE_LIST_STORE));

    addItem(store, 'Max', 33);
    addItem(store, 'Hans', 22);
    addItem(store, 'Peter', 45);
    addItem(store, 'Werner', 52);
    addItem(store, 'Bruno', 13);

    printItems(store);
    g_list_store_remove(store, 2);
    printItems(store);


    g_object_unref(store);

    Result := 0;
  end;


begin
  main(argc, argv);
end.
