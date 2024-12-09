program project1;

uses
  ctypes,
  fp_glib2,
  Human;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gob-YfOXptn2RBqy4AX5x4Eghw

  procedure printHuman(hum: PEHuman);
  var
    name:Pgchar;
    age:Tgint;
  begin
    g_printf('Name: %-20s    Alter: %3d'#10, e_human_get_name(hum), e_human_get_age(hum));

    g_object_get(hum,
    'name',@name,
    'age', @age,
    nil);
    g_printf('Name: %-20s    Alter: %3d'#10, name, age);
    g_free(name);
  end;


  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    hum1, hum2: PEHuman;
  begin
    hum1 := e_human_new_with_data('Peterli Weber', 24);
    printHuman(hum1);

    e_human_set_name(hum1, 'Max Mustermann');
    e_human_set_age(hum1, 33);
    printHuman(hum1);

    e_human_set_name(hum1, 'Hans Weber');
    e_human_set_age(hum1, 44);
    printHuman(hum1);

    g_object_set(hum1,
      'name', 'Hugentobler',
      'age', 56,
      nil);
    printHuman(hum1);
    WriteLn('--------------------');

    hum2 := e_human_new;
    g_object_set(hum2,
      'name', 'Mensch 2',
      'age', 6,
      nil);
    printHuman(hum2);

    // =====

    g_object_unref(hum1);
    g_object_unref(hum2);

    Exit(0);
  end;

begin
  main(argc, argv);
end.
