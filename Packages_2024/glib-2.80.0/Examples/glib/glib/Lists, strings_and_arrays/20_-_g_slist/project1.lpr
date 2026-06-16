program project1;

uses
  fp_glib2;

type
  THuman = record
    Name: PChar;
    Age: Integer;
  end;
  PHuman = ^THuman;

  procedure PrintList(list: PGSList);
  var
    l: PGSList;
    Human: PHuman;
  begin
    l := list;
    g_printf('Die Anzahle der Einträge ist: %d'#10, g_slist_length(l));
    while l <> nil do begin
      Human := PHuman(l^.Data);
      g_print('  Name: %s  Age: %i'#10, Human^.Name, Human^.Age);
      l := g_slist_next(l);
    end;
  end;

  procedure main;
  var
    tom, fred: PHuman;
    list: PGSList = nil;
  begin
    PrintList(list);
    tom := g_malloc(SizeOf(THuman));
    tom^.Name := 'Tom';
    tom^.Age := 11;
    fred := g_malloc(SizeOf(THuman));
    fred^.Name := 'Fred';
    fred^.Age := 30;

    list := g_slist_append(list, tom);
    list := g_slist_append(list, fred);
    PrintList(list);

    g_slist_free(list);

    g_free(tom);
    g_free(fred);
    g_printf('--- ende --'#10);
  end;

begin
  main;
end.


