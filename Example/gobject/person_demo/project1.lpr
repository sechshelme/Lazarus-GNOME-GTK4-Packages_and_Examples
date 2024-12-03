program project1;

uses
  ctypes,
  fp_glib2,
  Person;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gob-YfOXptn2RBqy4AX5x4Eghw

  procedure printPerson(per: PPerson);
  begin
    g_printf('Name: %s    Alter: %d'#10, person_get_name(per), person_get_age(per));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    per: PPerson;
  begin
    per := person_new_with_data('Peterli', 24);
    printPerson(per);

    person_set_name(per, 'Max Mustermann');
    person_set_age(per, 33);
    printPerson(per);

    person_set_name(per, 'Hans Weber');
    person_set_age(per, 44);
    printPerson(per);

    g_object_set(per,
      'name', 'Hugentobler',
      'age', 56,
      nil);
    printPerson(per);

    g_object_unref(per);

    Exit(0);
  end;

begin
  main(argc, argv);
end.
