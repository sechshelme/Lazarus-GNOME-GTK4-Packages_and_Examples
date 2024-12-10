program project1;

uses
  ctypes,
  fp_glib2,
  Human_Parent,
  Human_Child;

  procedure ParentHuman;

      procedure printHuman(hum: PEHuman);
    const
      w = 15;
    var
      fn, ln: Pgchar;
      age: Tgint;
      pfn, pln: Tglong;
    begin
      fn := e_human_get_firstname(E_HUMAN(hum));
      pfn := w - g_utf8_strlen(fn, -1);

      ln := e_human_get_lastname(E_HUMAN(hum));
      pln := w - g_utf8_strlen(ln, -1);

      age := e_human_get_age(E_HUMAN(hum));
      g_printf('Name: %s%*s%s%*s Alter: %4d'#10, fn, pfn, '', ln, pln, '', age);
    end;


    //procedure printHuman(hum: PEHuman);
    //begin
    //  g_printf('Name: %-14s %-14s Alter: %4d'#10, e_human_get_firstname(hum), e_human_get_lastname(hum), e_human_get_age(hum));
    //end;

  var
    per, per2: PEHuman;

  begin
    g_printf(#10'----- Parent Human -----'#10#10);

    per := E_human_new_with_data('Peterli', 'Weber', 24);
    printHuman(per);

    e_human_set_firstname(per, 'Max');
    e_human_set_lastname(per, 'Hürlimann');
    e_human_set_age(per, 33);
    printHuman(per);

    e_human_set_firstname(per, 'Hans');
    e_human_set_lastname(per, 'Weber');
    e_human_set_age(per, 44);
    printHuman(per);

    g_object_set(per,
      'firstname', 'Ümmü',
      'lastname', 'Müller',
      'age', 56,
      nil);
    printHuman(per);
    g_object_unref(per);

    // =====

    per2 := e_human_new;
    g_object_set(per2,
      'firstname', 'Peter',
      'lastname', 'Ulrich',
      'age', 6,
      nil);
    printHuman(per2);
    g_object_unref(per2);
  end;

  procedure ChildHuman;

    procedure printChildHuman(hum: PEHumanExt);
    const
      w = 15;
    var
      fn, ln, gender: Pgchar;
      age: Tgint;
      pfn, pln: Tglong;
    begin
      fn := e_human_get_firstname(E_HUMAN(hum));
      pfn := w - g_utf8_strlen(fn, -1);

      ln := e_human_get_lastname(E_HUMAN(hum));
      pln := w - g_utf8_strlen(ln, -1);

      age := e_human_get_age(E_HUMAN(hum));
      gender := E_humanExt_get_gender(hum);
      g_printf('Name: %s%*s%s%*s Alter: %4d Geschlecht: %s'#10, fn, pfn, '', ln, pln, '', age, gender);
    end;

  var
    HumanExt1, HumanExt2: PEHumanExt;
  begin
    g_printf(#10'----- Child Human -----'#10#10);

    HumanExt1 := E_humanExt_new_with_data('Hans', 'Hürlimann', 21, 'Mann');
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Lücia',
      'lastname', 'Müller',
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

  procedure print_aligned(s: Pgchar; cw: Tgint);
  var
    p: Tglong;
  begin
    p := cw - g_utf8_strlen(s, -1);
    g_printf('%s%*s', s, p, '');
  end;



  procedure printUTF8;
  const
    src: array of Pgchar = (
      'asdÖäü',
      'asdabc',
      'öööööödddddddddddöaabc',
      'String mit ÄÖÜ',
      'String mit aou');
  var
    l, p: Tglong;
    i: integer;

  begin
    for i := 0 to Length(src) - 1 do begin
      l := g_utf8_strlen(src[i], -1);
      p := 30 - l;
      g_printf('+++ %-*s%*d +++'#10, l, src[i], p, i * 4);
    end;

    g_printf('----------------------------'#10);


    for i := 0 to Length(src) - 1 do begin
      print_aligned(src[i], 25);
      print_aligned(src[i], 25);
      g_printf('%3d'#10, i * 5);
    end;

  end;


begin
//  printUTF8;

  ParentHuman;
  ChildHuman;
end.
