program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  Human,
  Human_Child,
  Human_Child_Inc;

  procedure ParentHuman;

    procedure printHuman(hum: PEHuman);
    const
      w = 15;
    var
      fn, ln: Pgchar;
      age: Tgint;
      size: Tgfloat;
      pfn, pln: Tglong;
    begin
      g_object_get(hum,
        'firstname', @fn,
        'lastname', @ln,
        'age', @age,
        'size', @size,
        nil);
      pfn := w - g_utf8_strlen(fn, -1);
      pln := w - g_utf8_strlen(ln, -1);
      g_printf('Name: %s%*s%s%*s Alter: %4d  Grösse: %4.2fm'#10, fn, pfn, '', ln, pln, '', age, size);
      g_free(fn);
      g_free(ln);
    end;

  var
    per, per2: PEHuman;
  begin
    g_printf(#10'----- Parent Human -----'#10#10);

    per := E_human_new_with_data('Peterli', 'Weber', 24, 1.80);
    printHuman(per);

    g_object_set(per,
      'firstname', 'Max',
      'lastname', 'Hürlimann',
      'age', 56,
      'size', Tgdouble(2.0),
      nil);
    printHuman(per);

    g_object_set(per,
      'firstname', 'Hans',
      'lastname', 'Weber',
      'age', 56,
      'size', Tgdouble(1.234),
      nil);
    printHuman(per);

    g_object_set(per,
      'firstname', 'Ümmü',
      'lastname', 'Müller',
      'age', 56,
      'size', Tgdouble(1.75),
      nil);
    printHuman(per);
    g_object_unref(per);

    // =====

    per2 := g_object_new(E_TYPE_HUMAN,
      'firstname', 'Peter',
      'lastname', 'Ulrich',
      'age', 6,
      'size', Tgdouble(0.87),
      nil);
    printHuman(per2);

    g_object_unref(per2);
  end;

  // =======================================================================

  procedure ChildHuman;

    procedure printChildHuman(hum: PEHumanExt);
    const
      w = 15;
    var
      fn, ln, gender: Pgchar;
      age: Tgint;
      size: Tgfloat;
      pfn, pln: Tglong;
    begin
      fn := e_human_get_firstname(E_HUMAN(hum));
      pfn := w - g_utf8_strlen(fn, -1);

      ln := e_human_get_lastname(E_HUMAN(hum));
      pln := w - g_utf8_strlen(ln, -1);

      g_object_get(hum,
        'size', @size,
        'age', @age,
        nil
        );
      gender := E_humanExt_get_gender(hum);
      g_printf('Name: %s%*s%s%*s Alter: %4d  Grösse: %4.2fm  Geschlecht: %s'#10, fn, pfn, '', ln, pln, '', age, size, gender);
    end;

  var
    HumanExt1, HumanExt2: PEHumanExt;
  begin
    g_printf(#10'----- Child Human -----'#10#10);

    HumanExt1 := E_humanExt_new_with_data('Hans', 'Hürlimann', 21, 1.67, 'Mann');
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Lücia',
      'lastname', 'Müller',
      'age', 16,
      'size', Tgdouble(1.72),
      'gender', 'Frau',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Ralf',
      'lastname', 'Maier',
      'age', 19,
      'size', Tgdouble(1.35),
      'gender', 'Kind',
      nil);
    printChildHuman(HumanExt1);

    g_object_set(HumanExt1,
      'firstname', 'Rolf',
      'lastname', 'Ulrich',
      'age', 9,
      'size', Tgdouble(1.35),
      'gender', 'Mann',
      nil);
    printChildHuman(HumanExt1);

    HumanExt2 := g_object_new(E_TYPE_HUMANEXT,
      'firstname', 'Mensch1',
      'lastname', 'Mensch2',
      'age', 99,
      'size', Tgdouble(1.05),
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

  // =======================================================================

  procedure printChildHumanInc(Human: PEHumanInc);
  var
    fn, ln, gender: Pgchar;
    age: Tgint;
    size: Tgfloat;
  begin
    g_object_get(Human,
      'firstname', @fn,
      'lastname', @ln,
      'age', @age,
      'size', @size,
      nil);

    gender := E_humanExt_get_gender(E_HUMANEXT(Human));

    g_print('%s %s    %d    %4.2f   %s'#10, fn, ln, age, size, gender);
    g_free(fn);
    g_free(ln);
  end;


  procedure ChildHumanTimer;
  var
    Human: PEHumanInc;
  begin
    g_printf(#10'----- Child Human Inc -----'#10#10);

    Human := g_object_new(E_TYPE_HUMANINC,
      'firstname', 'Werner',
      'lastname', 'Otto',
      'age', 90,
      'size', Tgdouble(1.63),
      'gender', 'Frau',
      'timeon', gTrue,
      'time', 1,
      nil);

    printChildHumanInc(Human);
    g_printf(#10);
    GObjectShowProperty(Human);

    g_object_unref(Human);
  end;

begin
  ParentHuman;
  ChildHuman;

  ChildHumanTimer;
end.
