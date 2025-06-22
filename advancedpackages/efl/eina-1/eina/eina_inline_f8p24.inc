{$IFDEF read_interface}

function eina_f8p24_add(a, b: TEina_F8p24): TEina_F8p24;
function eina_f8p24_sub(a, b: TEina_F8p24): TEina_F8p24;
function eina_f8p24_mul(a, b: TEina_F8p24): TEina_F8p24;
function eina_f8p24_scale(a: TEina_F8p24; b: integer): TEina_F8p24;
function eina_f8p24_div(a, b: TEina_F8p24): TEina_F8p24;
function eina_f8p24_sqrt(a: TEina_F8p24): TEina_F8p24;
function eina_f8p24_fracc_get(v: TEina_F8p24): longword;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_f8p24_add(a, b: TEina_F8p24): TEina_F8p24;
begin
  Result := a + b;
end;

function eina_f8p24_sub(a, b: TEina_F8p24): TEina_F8p24;
begin
  Result := a - b;
end;

function eina_f8p24_mul(a, b: TEina_F8p24): TEina_F8p24;
begin
  Result := TEina_F8p24((int64(a) * int64(b)) shr 24);
end;

function eina_f8p24_scale(a: TEina_F8p24; b: integer): TEina_F8p24;
begin
  Result := a * b;
end;

function eina_f8p24_div(a, b: TEina_F8p24): TEina_F8p24;
begin
  Result := TEina_F8p24((int64(a) shl 24) div int64(b));
end;

function eina_f8p24_sqrt(a: TEina_F8p24): TEina_F8p24;
var
  root, remHi, remLo, testDiv: longword;
  count: integer;
begin
  root := 0;
  remHi := 0;
  remLo := longword(a);
  count := 24;

  repeat
    remHi := (remHi shl 8) or (remLo shr 24);
    remLo := remLo shl 2;
    root := root shl 1;
    testDiv := (root shl 1) + 1;

    if remHi >= testDiv then begin
      remHi := remHi - testDiv;
      Inc(root);
    end;

    Dec(count);
  until count < 0;

  Result := TEina_F8p24(root);
end;

function eina_f8p24_fracc_get(v: TEina_F8p24): longword;
begin
  Result := longword(v) and $FFFFFF;
end;

{$ENDIF read_implementation}
