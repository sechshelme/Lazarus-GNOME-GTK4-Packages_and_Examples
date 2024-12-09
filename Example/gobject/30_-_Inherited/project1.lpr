program project1;

uses
  ctypes,
  fp_glib2,
  Human_Parent,
  Human_Child;

  procedure ParentHuman;

    procedure printHuman(per: PEHuman);
    begin
      g_printf('Name: %-14s %-14s Alter: %4d'#10, e_human_get_firstname(per), e_human_get_lastname(per), e_human_get_age(per));
    end;

  var
    per, per2: PEHuman;

  begin
    g_printf(#10'----- Parent Human -----'#10#10);

    per := E_human_new_with_data('Peterli', 'Weber', 24);
    printHuman(per);

    e_human_set_firstname(per, 'Max');
    e_human_set_lastname(per, 'Mustermann');
    e_human_set_age(per, 33);
    printHuman(per);

    e_human_set_firstname(per, 'Hans');
    e_human_set_lastname(per, 'Weber');
    e_human_set_age(per, 44);
    printHuman(per);

    g_object_set(per,
      'firstname', 'Urs',
      'lastname', 'Hugentobler',
      'age', 56,
      nil);
    printHuman(per);
    g_object_unref(per);

    // =====

    per2 := e_human_new;
    g_object_set(per2,
      'firstname', 'Vorname',
      'lastname', 'Nachname',
      'age', 6,
      nil);
    printHuman(per2);
    g_object_unref(per2);
  end;

  procedure ChildHuman;

    procedure printChildHuman(per: PEHumanExt);
    begin
      g_printf('Name: %-14s %-14s Alter: %4d   Geschlecht: %s'#10, e_human_get_firstname(E_HUMAN(per)), e_human_get_lastname(E_HUMAN(per)), e_human_get_age(E_HUMAN(per)), E_humanExt_get_gender(per));
    end;

  var
    HumanExt1, HumanExt2: PEHumanExt;
  begin
    g_printf(#10'----- Child Human -----'#10#10);

    HumanExt1 := E_humanExt_new_with_data('Hans', 'Hürlimann', 21, 'Mann');
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Vreni',
      'lastname', 'Meier',
      'age', 16,
      'gender', 'Frau',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Ralf',
      'lastname', 'Maier',
      'age', 19,
      'gender', 'Kind',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Rolf',
      'lastname', 'Ulrich',
      'age', 9,
      'gender', 'Mann',
      nil);
    printChildHuman(HumanExt1);

    HumanExt2 := g_object_new(E_TYPE_HUMANEXT,
      'firstname', 'Mensch1',
      'lastname', 'Mensch2',
      'age', 99,
      'gender', 'Frau',
      nil);
    printChildHuman(HumanExt2);

    g_object_unref(HumanExt1);
    g_object_unref(HumanExt2);
  end;


  procedure printUTF8;
  const
    s1 = 'asdÖäü';
    s2 = 'asdabc';
    s3 = 'Ein langer String mit ÄÖÜ';
    s4 = 'Ein langer String mit aou';
  var
    len1, len2, len3: Tglong;
    len4: SizeInt;

  begin
    g_printf('+++ %-30s +++'#10, s1);
    g_printf('+++ %-30s +++'#10, s2);
    g_printf('+++ %-30s +++'#10, s3);
    g_printf('+++ %-30s +++'#10, s4);

    g_printf('+++ %s +++'#10, s1);
    g_printf('+++ %s +++'#10, s2);
    g_printf('+++ %s +++'#10, s3);
    g_printf('+++ %s +++'#10, s4);

    //len1 := g_utf8_strlen(s1, -1);
    //len2 := g_utf8_strlen(s2, -1);
    //len3 := g_utf8_strlen(s3, -1);
    len1 := Length(s1);
    len2 := Length(s2);
    len3 := Length(s3);
    len4 := Length(s4);
    g_printf('Länge: %d %d %d %d'#10, len1, len2, len3, len4);

    g_printf('+++ %-*s +++'#10, 100 + len1, s1);
    g_printf('+++ %-*s +++'#10, 100 + len2, s2);
    g_printf('+++ %-*s +++'#10, 100 + len3, s3);
    g_printf('+++ %-*s +++'#10, 100 + len4, s4);
  end;


begin
  printUTF8;

  ParentHuman;
  ChildHuman;
end.
