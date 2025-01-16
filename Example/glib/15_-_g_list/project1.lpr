program project1;

uses
  ctypes,
  fp_glib2;

  procedure printList(l: PGList);
  var
    iterator: PGList;
    i: Tgint = 0;
  begin
    iterator := l;
    while iterator <> nil do begin
      g_printf('%2d. %s'#10, i, iterator^.Data);
      iterator := iterator^.Next;
      Inc(i);
    end;
    g_printf('---------------'#10);
  end;

  procedure free_func(Data: Tgpointer); cdecl;
  begin
    g_free(Data);
  end;

  function compareFunc(a: Tgconstpointer; b: Tgconstpointer): Tgint; cdecl;
  begin
    Result := g_strcmp0(a, b);
  end;

  procedure deleteItem(l: PPGList; item: Pgchar);
  var
    element: PGList;
  begin
    element := g_list_find_custom(l^, item, @compareFunc);
    if element <> nil then begin
      g_free(element^.Data);
      //      l^ := g_list_remove(l^, item);
      l^ := g_list_delete_link(l^, element);
    end else begin
      g_printf('not found'#10);
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    list: PGList = nil;
  begin
    list := g_list_append(list, g_strdup('Apfel'));
    list := g_list_append(list, g_strdup('Banane'));
    list := g_list_append(list, g_strdup('Birne'));
    list := g_list_prepend(list, g_strdup('Kirsche'));
    list := g_list_prepend(list, g_strdup('Orange'));
    list := g_list_insert(list, g_strdup('Pflaume'), 4);
    printList(list);
    deleteItem(@list, 'Apfel');
    printList(list);

    g_list_free_full(list, @free_func);
  end;

begin
  main(argc, argv);
end.
