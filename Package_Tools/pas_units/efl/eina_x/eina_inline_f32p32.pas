unit eina_inline_f32p32;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_f32p32_add(a, b: TEina_F32p32): TEina_F32p32;
function eina_f32p32_sub(a, b: TEina_F32p32): TEina_F32p32;
function eina_f32p32_mul(a, b: TEina_F32p32): TEina_F32p32;
function eina_f32p32_scale(a: TEina_F32p32; b: integer): TEina_F32p32;
function eina_f32p32_div(a, b: TEina_F32p32): TEina_F32p32;
function eina_f32p32_sqrt(a: TEina_F32p32): TEina_F32p32;
function eina_f32p32_fracc_get(v: TEina_F32p32): cardinal;

implementation

function eina_fp32p32_llabs(a: TEina_F32p32): uint64;
begin
  if a < 0 then begin
    Result := uint64(-a);
  end else begin
    Result := uint64(a);
  end;
end;

function eina_f32p32_add(a, b: TEina_F32p32): TEina_F32p32;
begin
  Result := a + b;
end;

function eina_f32p32_sub(a, b: TEina_F32p32): TEina_F32p32;
begin
  Result := a - b;
end;

function eina_f32p32_mul(a, b: TEina_F32p32): TEina_F32p32;
var
  up: TEina_F32p32;
  a2, b2: uint64;
  sign: TEina_F32p32;
  result64: TEina_F32p32;
begin
  sign := a xor b;
  a2 := eina_fp32p32_llabs(a);
  b2 := eina_fp32p32_llabs(b);

  a2 := (a2 shr 16) + ((a2 shr 15) and 1);
  b2 := (b2 shr 16) + ((b2 shr 15) and 1);

  up := a2 * b2;
  result64 := up;

  if sign < 0 then begin
    Result := -result64;
  end else begin
    Result := result64;
  end;
end;

function eina_f32p32_scale(a: TEina_F32p32; b: integer): TEina_F32p32;
begin
  Result := a * b;
end;

function eina_f32p32_div(a, b: TEina_F32p32): TEina_F32p32;
var
  sign: TEina_F32p32;
  abs_a, abs_b: uint64;
  result64: TEina_F32p32;
begin
  sign := a xor b;

  if b = 0 then begin
    if sign < 0 then begin
      Result := TEina_F32p32($8000000000000000);
    end else begin
      Result := TEina_F32p32($7FFFFFFFFFFFFFFF);
    end;
    Exit;
  end;

  abs_a := eina_fp32p32_llabs(a);
  abs_b := eina_fp32p32_llabs(b);

  result64 := eina_f32p32_mul(abs_a, (uint64(1) shl 62) div (abs_b shr 2));

  if sign < 0 then begin
    Result := -result64;
  end else begin
    Result := result64;
  end;
end;

function eina_f32p32_sqrt(a: TEina_F32p32): TEina_F32p32;
var
  root, remHi, remLo, testDiv, count: uint64;
begin
  root := 0;
  remHi := 0;
  remLo := uint64(a);
  count := 32;
  repeat
    remHi := (remHi shl 32) or (remLo shr 32);
    remLo := remLo shl 2;
    root := root shl 1;
    testDiv := (root shl 1) + 1;
    if remHi >= testDiv then begin
      remHi := remHi - testDiv;
      root := root + 1;
    end;
    Dec(count);
  until count = 0;
  Result := TEina_F32p32(root);
end;

function eina_f32p32_fracc_get(v: TEina_F32p32): cardinal;
begin
  Result := cardinal(v);
end;

end.
