{$IFDEF read_interface}

function eina_f32p32_int_from(v: int32): TEina_F32p32;
function eina_f32p32_int_to(v: TEina_F32p32): int32;
function eina_f32p32_double_from(v: double): TEina_F32p32;
function eina_f32p32_double_to(v: TEina_F32p32): double;

function eina_f16p16_int_from(v: int32): TEina_F16p16;
function eina_f16p16_int_to(v: TEina_F16p16): int32;
function eina_f16p16_float_from(v: single): TEina_F16p16;
function eina_f16p16_float_to(v: TEina_F16p16): single;
function eina_f16p16_double_from(v: double): TEina_F16p16;
function eina_f16p16_double_to(v: TEina_F16p16): double;

function eina_f8p24_int_from(v: int32): TEina_F8p24;
function eina_f8p24_int_to(v: TEina_F8p24): int32;
function eina_f8p24_float_from(v: single): TEina_F8p24;
function eina_f8p24_float_to(v: TEina_F8p24): single;

function eina_f16p16_to_f32p32(a: TEina_F16p16): TEina_F32p32;
function eina_f8p24_to_f32p32(a: TEina_F8p24): TEina_F32p32;
function eina_f32p32_to_f16p16(a: TEina_F32p32): TEina_F16p16;
function eina_f8p24_to_f16p16(a: TEina_F8p24): TEina_F16p16;
function eina_f32p32_to_f8p24(a: TEina_F32p32): TEina_F8p24;
function eina_f16p16_to_f8p24(a: TEina_F16p16): TEina_F8p24;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_f32p32_int_from(v: int32): TEina_F32p32;
begin
  Result := TEina_F32p32(v) shl 32;
end;

function eina_f32p32_int_to(v: TEina_F32p32): int32;
begin
  Result := int32(v shr 32);
end;

function eina_f32p32_double_from(v: double): TEina_F32p32;
begin
  if v < 0 then begin
    Result := TEina_F32p32(v * 4294967296.0 - 0.5);
  end else begin
    Result := TEina_F32p32(v * 4294967296.0 + 0.5);
  end;
end;

function eina_f32p32_double_to(v: TEina_F32p32): double;
begin
  Result := v / 4294967296.0;
end;

function eina_f16p16_int_from(v: int32): TEina_F16p16;
begin
  Result := v shl 16;
end;

function eina_f16p16_int_to(v: TEina_F16p16): int32;
begin
  Result := v shr 16;
end;

function eina_f16p16_float_from(v: single): TEina_F16p16;
begin
  if v < 0 then begin
    Result := TEina_F16p16(v * 65536.0 - 0.5);
  end else begin
    Result := TEina_F16p16(v * 65536.0 + 0.5);
  end;
end;

function eina_f16p16_float_to(v: TEina_F16p16): single;
begin
  Result := v / 65536.0;
end;

function eina_f16p16_double_from(v: double): TEina_F16p16;
begin
  if v < 0 then begin
    Result := TEina_F16p16(round(v) * 65536.0 - 0.5);
  end else begin
    Result := TEina_F16p16(round(v) * 65536.0 + 0.5);
  end;
end;

function eina_f16p16_double_to(v: TEina_F16p16): double;
begin
  Result := v / 65536.0;
end;

function eina_f8p24_int_from(v: int32): TEina_F8p24;
begin
  Result := v shl 24;
end;

function eina_f8p24_int_to(v: TEina_F8p24): int32;
begin
  Result := v shr 24;
end;

function eina_f8p24_float_from(v: single): TEina_F8p24;
begin
  if v < 0 then begin
    Result := TEina_F8p24(v * 16777216.0 - 0.5);
  end else begin
    Result := TEina_F8p24(v * 16777216.0 + 0.5);
  end;
end;

function eina_f8p24_float_to(v: TEina_F8p24): single;
begin
  Result := v / 16777216.0;
end;

function eina_f16p16_to_f32p32(a: TEina_F16p16): TEina_F32p32;
begin
  Result := TEina_F32p32(a) shl 16;
end;

function eina_f8p24_to_f32p32(a: TEina_F8p24): TEina_F32p32;
begin
  Result := TEina_F32p32(a) shl 8;
end;

function eina_f32p32_to_f16p16(a: TEina_F32p32): TEina_F16p16;
begin
  Result := TEina_F16p16(a shr 16);
end;

function eina_f8p24_to_f16p16(a: TEina_F8p24): TEina_F16p16;
begin
  Result := TEina_F16p16(a shr 8);
end;

function eina_f32p32_to_f8p24(a: TEina_F32p32): TEina_F8p24;
begin
  Result := TEina_F8p24(a shr 8);
end;

function eina_f16p16_to_f8p24(a: TEina_F16p16): TEina_F8p24;
begin
  Result := TEina_F8p24(a shl 8);
end;

{$ENDIF read_implementation}
