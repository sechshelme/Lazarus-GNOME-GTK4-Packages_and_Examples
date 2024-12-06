program project1;

uses
  ctypes,
  fp_glib2,
  Person;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gob-YfOXptn2RBqy4AX5x4Eghw

  procedure printPerson(per: PExPerson);
  begin
    g_printf('Name: %s    Alter: %d'#10, Ex_person_get_name(per), Ex_person_get_age(per));
  end;


  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    per, per2: PExPerson;
  begin
    per := Ex_person_new_with_data('Peterli', 24);
    printPerson(per);

    Ex_person_set_name(per, 'Max Mustermann');
    Ex_person_set_age(per, 33);
    printPerson(per);

    Ex_person_set_name(per, 'Hans Weber');
    Ex_person_set_age(per, 44);
    printPerson(per);

    g_object_set(per,
      'name', 'Hugentobler',
      'age', 56,
      nil);
    printPerson(per);
    WriteLn('--------------------');

    per2 := Ex_person_new;
    g_object_set(per2,
      'name', 'Person 2',
      'age', 6,
      nil);
    printPerson(per2);

    // =====

    g_object_unref(per);
    g_object_unref(per2);

    Exit(0);
  end;

begin
  main(argc, argv);
end.
