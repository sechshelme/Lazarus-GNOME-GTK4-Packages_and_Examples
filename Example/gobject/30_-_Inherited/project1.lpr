program project1;

uses
  ctypes,
  fp_glib2,
  Human_Parent,
  Human_Child;

  procedure ParentHuman;

    procedure printHuman(per: PEHuman);
    begin
      g_printf('Name: %-14s    Alter: %4d'#10, e_human_get_name(per), e_human_get_age(per));
    end;

  var
    per, per2: PEHuman;

  begin
    g_printf(#10'----- Parent Human -----'#10#10);

    per := E_human_new_with_data('Peterli', 24);
    printHuman(per);

    e_human_set_name(per, 'Max Mustermann');
    e_human_set_age(per, 33);
    printHuman(per);

    e_human_set_name(per, 'Hans Weber');
    e_human_set_age(per, 44);
    printHuman(per);

    g_object_set(per,
      'name', 'Hugentobler',
      'age', 56,
      nil);
    printHuman(per);
    g_object_unref(per);

    // =====

    per2 := e_human_new;
    g_object_set(per2,
      'name', 'Person 2',
      'age', 6,
      nil);
    printHuman(per2);
    g_object_unref(per2);
  end;

  procedure ChildHuman;

    procedure printChildHuman(per: PEHumanExt);
    begin
      g_printf('Name: %-14s    Alter: %4d   Geschlecht: %s'#10, e_human_get_name(E_HUMAN(per)), e_human_get_age(E_HUMAN(per)), E_humanExt_get_gender(per));
    end;

  var
    HumanExt1, HumanExt2: PEHumanExt;
  begin
    g_printf(#10'----- Child Human -----'#10#10);

    HumanExt1 := E_humanExt_new_with_data('Hans', 21, 'Mann');
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'name', 'Vreni',
      'age', 16,
      'gender', 'Frau',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'name', 'Ralf',
      'age', 19,
      'gender', 'Kind',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'name', 'Rolf',
      'age', 9,
      'gender', 'Mann',
      nil);
    printChildHuman(HumanExt1);

    HumanExt2 := g_object_new(E_TYPE_HUMANEXT,
      'name', 'Person2',
      'age', 99,
      'gender', 'Frau',
      nil);
    printChildHuman(HumanExt2);

    g_object_unref(HumanExt1);
    g_object_unref(HumanExt2);
  end;


begin
  ParentHuman;
  ChildHuman;
end.
