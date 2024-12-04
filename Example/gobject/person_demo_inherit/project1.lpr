program project1;

uses
  ctypes,
  fp_glib2,
  Person,
  Person_inherit;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gob-YfOXptn2RBqy4AX5x4Eghw
  // https://www.perplexity.ai/search/gib-mit-ein-gobject-beispiel-i-9vZ4Jy8nSESadMh_l_uthA


  procedure printPersonext(per: PExPersonExt);
  begin
    g_printf('Name: %s    Alter: %d    Geschlecht: %s'#10, Ex_person_get_name(EX_PERSON(per)), Ex_person_get_age(EX_PERSON(per)), Ex_personExt_get_gender(per));
  end;

  procedure ExtPerson;
  var
    PersonExt: PExPersonExt;
  begin
      PersonExt := Ex_personExt_new_with_data('Hans', 21, 'Mann');
      printPersonext(PersonExt);

    g_object_set(PersonExt,
      'name', 'Vreni',
      'age', 16,
      'gender', 'Frau',
      nil);
    printPersonext(PersonExt);

    g_object_unref(PersonExt);
  end;

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
    g_object_unref(per);

    // =====

    per2 := Ex_person_new;
    g_object_set(per2,
      'name', 'Person 2',
      'age', 6,
      nil);
    printPerson(per2);
    g_object_unref(per2);

    // === Ext

    WriteLn('-------- Ext Person ------------');

    ExtPerson;

    Exit(0);
  end;

begin
  main(argc, argv);
end.
