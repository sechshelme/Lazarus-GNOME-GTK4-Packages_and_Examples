program project1;

uses
  ctypes,
  Math,
  glib280;

  // https://developer.ibm.com/tutorials/l-glib/

  procedure PrintList(list: PGSList);
  var
    l: PGSList;
  begin
    l := list;
    g_print('Die Anzahle der Eintraege ist: %d'#10, g_slist_length(l));
    while l <> nil do begin
      g_print('  Item: %s'#10, l^.Data);
      l:=g_slist_next(l);
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    list: PGSList = nil;
  begin
    PrintList(list);
    list := g_slist_append(list, PChar('eins'));
    list := g_slist_append(list, PChar('zwei'));
    list := g_slist_append(list, PChar('drei'));
    list := g_slist_append(list, PChar('vier'));
    PrintList(list);

    g_slist_free(list);
    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
  WriteLn('--- ende --');
end.
