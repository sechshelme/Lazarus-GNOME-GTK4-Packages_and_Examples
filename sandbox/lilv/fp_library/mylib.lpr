library mylib;

uses
  lv2,
  lv2_util,                // inline ????


  ctypes,
  fp_lv2;

  procedure AusgabeStr(s: pchar); cdecl;
  begin
    WriteLn('Str: '#27'[93m', s, #27'[0m');
  end;

  procedure AusgabeInt(i: integer); cdecl;
  begin
    WriteLn('Int: '#27'[93m', i, #27'[0m');
  end;

  function lv2_descriptor(index: uint32): PLV2_Descriptor;
  var
    descriptor: TLV2_Descriptor;
  begin
    if index = 0 then begin
      Result := nil;
    end else begin
        descriptor.URI:='http://example.org/plugins/gain';
      Result := @descriptor;
    end;
  end;

exports AusgabeStr;
exports AusgabeInt;

end.
