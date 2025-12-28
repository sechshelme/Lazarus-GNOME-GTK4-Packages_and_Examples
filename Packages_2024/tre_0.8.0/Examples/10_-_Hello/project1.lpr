program project1;

uses
  fp_tre;

  procedure main;
  const
    pattern = 'q[aeiou]';
    text = 'The quick brown fox jumps over the lazy dog.';
  var
    reg: Tregex_t;
    ret: longint;
    match: Tregmatch_t;

  begin
    ret := tre_regcomp(@reg, pattern, REG_EXTENDED);
    if ret <> 0 then begin
      WriteLn('Kompilierung fehlgeschlagen');
      Exit;
    end;

    if tre_regexec(@reg, text, 1, @match, 0) = 0 then begin
      WriteLn('Gefunden bei Position ', integer(match.rm_so), '-', integer(match.rm_eo), ': ');
    end else begin
      WriteLn('Kein Match\n');
    end;
    tre_regfree(@reg);

  end;

begin
  main;
end.
