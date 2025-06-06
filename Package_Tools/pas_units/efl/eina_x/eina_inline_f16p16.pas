unit eina_inline_f16p16;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_f16p16_add(a, b: TEina_F16p16): TEina_F16p16;
function eina_f16p16_sub(a, b: TEina_F16p16): TEina_F16p16;
function eina_f16p16_mul(a, b: TEina_F16p16): TEina_F16p16;
function eina_f16p16_scale(a: TEina_F16p16; b: integer): TEina_F16p16;
function eina_f16p16_div(a, b: TEina_F16p16): TEina_F16p16;
function eina_f16p16_sqrt(a: TEina_F16p16): TEina_F16p16;
function eina_f16p16_fracc_get(v: TEina_F16p16): cardinal;

implementation

function eina_f16p16_add(a, b: TEina_F16p16): TEina_F16p16;
begin
  Result := a + b;
end;

function eina_f16p16_sub(a, b: TEina_F16p16): TEina_F16p16;
begin
  Result := a - b;
end;

function eina_f16p16_mul(a, b: TEina_F16p16): TEina_F16p16;
begin
  Result := TEina_F16p16((int64(a) * int64(b)) shr 16);
end;

function eina_f16p16_scale(a: TEina_F16p16; b: integer): TEina_F16p16;
begin
  Result := a * b;
end;

function eina_f16p16_div(a, b: TEina_F16p16): TEina_F16p16;
begin
  Result := TEina_F16p16((int64(a) shl 16) div int64(b));
end;

function eina_f16p16_sqrt(a: TEina_F16p16): TEina_F16p16;
var
  root, remHi, remLo, testDiv, count: cardinal;
begin
  root := 0;
  remHi := 0;
  remLo := cardinal(a);
  count := 16;
  repeat
    remHi := (remHi shl 16) or (remLo shr 16);
    remLo := remLo shl 2;
    root := root shl 1;
    testDiv := (root shl 1) + 1;
    if remHi >= testDiv then begin
      remHi := remHi - testDiv;
      Inc(root);
    end;
    Dec(count);
  until count = 0;
  Result := root;
end;

function eina_f16p16_fracc_get(v: TEina_F16p16): cardinal;
begin
  Result := v and $FFFF;
end;

end.
