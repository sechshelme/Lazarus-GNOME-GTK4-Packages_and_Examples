program project1;

uses
  ctypes,
  fp_glib2;

type
  THumanData = record
    FirstName, LastName: Pgchar;
    age: Tgint;
    Gender: Pgchar;
  end;
  PHumanData = ^THumanData;

  THumanDatas = array of THumanData;

const
  HumanData: THumanDatas = (
    (FirstName: 'Hans'; LastName: 'Weber'; age: 23; Gender: 'Mann'),
    (FirstName: 'Hans'; LastName: 'Hürlimann'; age: 23; Gender: 'Mann'),
    (FirstName: 'Ännchen'; LastName: 'Müller'; age: 23; Gender: 'Frau'),
    (FirstName: 'Ümmü'; LastName: 'Maier'; age: 23; Gender: 'Frau'),
    (FirstName: 'Reto'; LastName: 'Ulrich'; age: 33; Gender: 'Mann'));


  procedure printChildHuman(per: PHumanData);
  const
    w = 15;
  var
    fn, ln, gender: Pgchar;
    age: Tgint;
    pfn, pln: Tglong;
  begin
    fn := per^.FirstName;
    pfn := w - g_utf8_strlen(fn, -1);

    ln := per^.LastName;
    pln := w - g_utf8_strlen(ln, -1);

    age := per^.age;
    gender := per^.Gender;
    g_printf('Name: %s%*s%s%*s Alter: %4d Geschlecht: %s'#10, fn, pfn, '', ln, pln, '', age, gender);
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
    g_printf(#10'----------------------------'#10#10);

    for i := 0 to Length(HumanData) - 1 do begin
      printChildHuman(@HumanData[i]);
    end;

    g_printf(#10'----------------------------'#10#10);

  end;


begin
  printUTF8;
end.
