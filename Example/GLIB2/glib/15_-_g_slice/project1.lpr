program project1;

uses
  ctypes,
  fp_glib2;

type
  THuman = record
    Name: Pgchar;
    age: Tgint;
  end;
  PHuman = ^THuman;
  PPHuman = ^PHuman;

  function CreateHuman(Name: Pgchar; age: Tgint): PHuman;
  begin
    Result := g_slice_alloc(SizeOf(THuman));
    Result^.Name := g_strdup(Name);
    Result^.age := age;
  end;

  procedure DestroyHuman(human: PHuman);
  begin
    if human <> nil then begin
      g_free(human^.Name);
      g_slice_free1(SizeOf(THuman), human);
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    num_people: integer = 3;
    people: PPHuman;
    i: integer;
  begin
    people := g_slice_alloc0(num_people * SizeOf(THuman));

    people[0] := CreateHuman('Hans', 45);
    people[1] := CreateHuman('Peter', 33);
    people[2] := CreateHuman('Ralf', 23);

    for i := 0 to num_people - 1 do begin
      g_printf('Name: %-20s  Age: %d'#10, people[i]^.Name, people[i]^.age);
    end;

    for i := 0 to num_people - 1 do begin
      DestroyHuman(people[i]);
    end;

    g_slice_free1(SizeOf(THuman), people);
  end;

begin
  main(argc, argv);
end.
