library mylib;

  procedure AusgabeStr(s: pchar); cdecl;
  begin
    WriteLn('Str: '#27'[93m', s, #27'[0m');
  end;

  procedure AusgabeInt(i: integer); cdecl;
  begin
    WriteLn('Int: '#27'[93m', i, #27'[0m');
  end;

exports AusgabeStr;
exports AusgabeInt;

end.

