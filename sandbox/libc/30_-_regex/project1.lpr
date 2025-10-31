program project1;

uses
  fp_stdio,
  fp_regex;

  procedure main;
  var
    ret: longint;
    regex: Tre_pattern_buffer;
  const
    text = 'long short long double belong longer long';
  begin
    ret := regcomp(@regex, '\blong\b', REG_EXTENDED);
    if ret <> 0 then begin
      printf('Regex konnte nicht kompiliert werden'#10);
      Exit;
    end;

    ret := regexec(@regex, text, 0, nil, 0);
    if ret = 0 then begin
      printf('Gefunden: "long" als eigenständiges Wort'#10);
    end else if ret = REG_NOMATCH then begin
      printf('"long" Nicht gefunden'#10);
    end else begin
      printf('Fehler bei RegEx-Suche'#10);
    end;

    regfree(@regex);
  end;

begin
  main;
end.
