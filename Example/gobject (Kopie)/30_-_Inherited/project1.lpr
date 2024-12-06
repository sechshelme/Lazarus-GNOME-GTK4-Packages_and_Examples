program project1;

uses
  ctypes,
  fp_glib2,
  Person,
  Person_inherit;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gob-YfOXptn2RBqy4AX5x4Eghw
  // https://www.perplexity.ai/search/gib-mit-ein-gobject-beispiel-i-9vZ4Jy8nSESadMh_l_uthA
  // https://www.perplexity.ai/search/ich-will-mit-gobject-3-propert-OyYpPCprQVq00phtJ1aw7g


  procedure ParentPerson;

    procedure printPerson(per: PExPerson);
    begin
      g_printf('Name: %-14s    Alter: %4d'#10, Ex_person_get_name(per), Ex_person_get_age(per));
    end;

  var
    per, per2: PExPerson;

  begin
    g_printf(#10'----- Parent Person -----'#10#10);

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
  end;

  procedure ChildPerson;

    procedure printChildPerson(per: PExPersonExt);
    begin
      g_printf('Name: %-14s    Alter: %4d   Geschlecht: %s'#10, Ex_person_get_name(EX_PERSON(per)), Ex_person_get_age(EX_PERSON(per)), Ex_personExt_get_gender(per));
    end;

  var
    PersonExt1, PersonExt2: PExPersonExt;
  begin
    g_printf(#10'----- Child Person -----'#10#10);

    PersonExt1 := Ex_personExt_new_with_data('Hans', 21, 'Mann');
    printChildPerson(PersonExt1);

    g_object_set(PersonExt1,
      'name', 'Vreni',
      'age', 16,
      'gender', 'Frau',
      nil);
    printChildPerson(PersonExt1);

    g_object_set(PersonExt1,
      'name', 'Ralf',
      'age', 19,
      'gender', 'Kind',
      nil);
    printChildPerson(PersonExt1);

    g_object_set(PersonExt1,
      'name', 'Rolf',
      'age', 9,
      'gender', 'Mann',
      nil);
    printChildPerson(PersonExt1);

    PersonExt2 := g_object_new(EX_TYPE_PERSONEXT,
      'name', 'Person2',
      'age', 99,
      'gender', 'Frau',
      nil);
    printChildPerson(PersonExt2);

    g_object_unref(PersonExt1);
    g_object_unref(PersonExt2);
  end;


begin
  ParentPerson;
  ChildPerson;
end.
