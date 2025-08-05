program project1;

uses
  fp_stdio,
  fp_ctype,
  clib,
  fp_locale;


  procedure main;
  const
    s: pchar = 'A1b';
  var
    i: integer;
    loc: Tlocale_t;
  begin
    for  i := 0 to Length(s) - 1 do begin
      if isdigit(byte(s[i])) <> 0 then begin
        printf('''%c'' ist eine Ziffer.'#10, s[i]);
      end else if isalpha((byte(s[i]))) <> 0 then begin
        printf('''%c'' als Großbuchstabe: ''%c'''#10, s[i], toupper(byte(s[i])));
      end;
    end;

    loc := newlocale(LC_CTYPE_MASK, 'C', nil);

    for i := 45 to 55 do begin
      if isdigit_l(i, loc) <> 0 then begin
        printf('''%c'' ist eine Ziffer in der ''C'' Locale.'#10, i);
      end else begin
        printf('''%c'' ist keine Ziffer in der ''C'' Locale.'#10, i);
      end;
    end;
  end;

begin
  main;
end.
