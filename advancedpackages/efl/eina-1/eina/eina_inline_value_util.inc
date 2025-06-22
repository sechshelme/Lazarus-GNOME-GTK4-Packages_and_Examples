{$IFDEF read_interface}

function eina_value_util_type_size(AType: PEina_Value_Type): TSize_t; overload; deprecated;
function eina_value_util_type_offset(AType: PEina_Value_Type; ABase: cardinal): cardinal; overload; deprecated;
function eina_value_util_int_new(c: integer): PEina_Value; overload; deprecated;
function eina_value_util_double_new(c: double): PEina_Value; overload; deprecated;
function eina_value_util_bool_new(c: TEina_Bool): PEina_Value; overload; deprecated;
function eina_value_util_string_new(c: pchar): PEina_Value; overload; deprecated;
function eina_value_util_stringshare_new(c: pchar): PEina_Value; overload; deprecated;
function eina_value_util_time_new(c: TTime_t): PEina_Value; overload; deprecated;
function eina_value_util_dup(AVal: PEina_Value): PEina_Value; overload; deprecated;
function eina_value_util_stringshare_copy(AVal: PEina_Value; AStr: PPEina_Stringshare): TEina_Bool; overload; deprecated;
function eina_value_util_string_copy(AVal: PEina_Value; AStr: PPChar): TEina_Bool; overload; deprecated;

function eina_value_type_size(AType: PEina_Value_Type): TSize_t;
function eina_value_type_offset(AType: PEina_Value_Type; ABase: cardinal): cardinal;

// Macro EINA_VALUE_NEW expansion - These call eina_value_set with a value
function eina_value_uchar_new(c: byte): PEina_Value;
function eina_value_ushort_new(c: word): PEina_Value;
function eina_value_uint_new(c: cardinal): PEina_Value;
function eina_value_ulong_new(c: longword): PEina_Value;
function eina_value_uint64_new(c: uint64): PEina_Value;
function eina_value_char_new(c: ansichar): PEina_Value;
function eina_value_short_new(c: smallint): PEina_Value;
function eina_value_int_new(c: integer): PEina_Value;
function eina_value_long_new(c: longint): PEina_Value;
function eina_value_int64_new(c: int64): PEina_Value;
function eina_value_float_new(c: single): PEina_Value;
function eina_value_double_new(c: double): PEina_Value;
function eina_value_bool_new(c: TEina_Bool): PEina_Value;
function eina_value_string_new(c: pchar): PEina_Value;
function eina_value_stringshare_new(c: pchar): PEina_Value;
function eina_value_time_new(c: TTime_t): PEina_Value;
function eina_value_error_new(c: TEina_Error): PEina_Value;

// Macro EINA_VALUE_INIT expansion - These call eina_value_set with a value
function eina_value_uchar_init(c: byte): TEina_Value;
function eina_value_ushort_init(c: word): TEina_Value;
function eina_value_uint_init(c: cardinal): TEina_Value;
function eina_value_ulong_init(c: longword): TEina_Value;
function eina_value_uint64_init(c: uint64): TEina_Value;
function eina_value_char_init(c: ansichar): TEina_Value;
function eina_value_short_init(c: smallint): TEina_Value;
function eina_value_int_init(c: integer): TEina_Value;
function eina_value_long_init(c: longint): TEina_Value;
function eina_value_int64_init(c: int64): TEina_Value;
function eina_value_float_init(c: single): TEina_Value;
function eina_value_double_init(c: double): TEina_Value;
function eina_value_bool_init(c: TEina_Bool): TEina_Value;
function eina_value_string_init(c: pchar): TEina_Value;
function eina_value_stringshare_init(c: pchar): TEina_Value;
function eina_value_time_init(c: TTime_t): TEina_Value;
function eina_value_error_init(c: TEina_Error): TEina_Value;

// Macro EINA_VALUE_GET expansion - These call eina_value_get with a pointer
function eina_value_uchar_get(const V: PEina_Value; C: pbyte): TEina_Bool;
function eina_value_ushort_get(const V: PEina_Value; C: pWord): TEina_Bool;
function eina_value_uint_get(const V: PEina_Value; C: pCardinal): TEina_Bool;
function eina_value_ulong_get(const V: PEina_Value; C: pLongWord): TEina_Bool;
function eina_value_uint64_get(const V: PEina_Value; C: pUInt64): TEina_Bool;
function eina_value_char_get(const V: PEina_Value; C: pansichar): TEina_Bool;
function eina_value_short_get(const V: PEina_Value; C: pSmallInt): TEina_Bool;
function eina_value_int_get(const V: PEina_Value; C: pInteger): TEina_Bool;
function eina_value_long_get(const V: PEina_Value; C: pLongint): TEina_Bool;
function eina_value_int64_get(const V: PEina_Value; C: pInt64): TEina_Bool;
function eina_value_float_get(const V: PEina_Value; C: pSingle): TEina_Bool;
function eina_value_double_get(const V: PEina_Value; C: pDouble): TEina_Bool;
function eina_value_bool_get(const V: PEina_Value; C: PEina_Bool): TEina_Bool;
function eina_value_string_get(const V: PEina_Value; C: pPChar): TEina_Bool;
function eina_value_stringshare_get(const V: PEina_Value; C: pPChar): TEina_Bool;
function eina_value_time_get(const V: PEina_Value; C: pTime_t): TEina_Bool;
function eina_value_error_get(const V: PEina_Value; C: PEina_Error): TEina_Bool;

// Macro EINA_VALUE_CONVERT expansion - These create a temp Eina_Value and use eina_value_get with a pointer
function eina_value_uchar_convert(const V: PEina_Value; C: pbyte): TEina_Bool;
function eina_value_ushort_convert(const V: PEina_Value; C: pWord): TEina_Bool;
function eina_value_uint_convert(const V: PEina_Value; C: pCardinal): TEina_Bool;
function eina_value_ulong_convert(const V: PEina_Value; C: pLongWord): TEina_Bool;
function eina_value_uint64_convert(const V: PEina_Value; C: pUInt64): TEina_Bool;
function eina_value_char_convert(const V: PEina_Value; C: pansichar): TEina_Bool;
function eina_value_short_convert(const V: PEina_Value; C: pSmallInt): TEina_Bool;
function eina_value_int_convert(const V: PEina_Value; C: pInteger): TEina_Bool;
function eina_value_long_convert(const V: PEina_Value; C: pLongint): TEina_Bool;
function eina_value_int64_convert(const V: PEina_Value; C: pInt64): TEina_Bool;
function eina_value_float_convert(const V: PEina_Value; C: pSingle): TEina_Bool;
function eina_value_double_convert(const V: PEina_Value; C: pDouble): TEina_Bool;
function eina_value_bool_convert(const V: PEina_Value; C: PEina_Bool): TEina_Bool;
function eina_value_string_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
function eina_value_stringshare_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
function eina_value_time_convert(const V: PEina_Value; C: pTime_t): TEina_Bool;
function eina_value_error_convert(const V: PEina_Value; C: PEina_Error): TEina_Bool;

function eina_value_dup(const AVal: PEina_Value): PEina_Value;
function eina_value_reference_copy(const AVal: PEina_Value): TEina_Value;
function eina_value_stringshare_copy(const AVal: PEina_Value; AStr: PPEina_Stringshare): TEina_Bool;
function eina_value_string_copy(const AVal: PEina_Value; AStr: PPChar): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}


function eina_value_type_size(AType: PEina_Value_Type): TSize_t;
begin
  if AType <> nil then begin
    Result := AType^.value_size;
  end else begin
    Result := 0;
  end;
end;

function eina_value_type_offset(AType: PEina_Value_Type; ABase: cardinal): cardinal;
var
  Size, Padding: cardinal;
begin
  Size := eina_value_type_size(AType);
  if Size = 0 then begin
    Exit(ABase);
  end;

  if (ABase mod Size) = 0 then begin
    Result := ABase;
  end else begin
    if ABase > Size then begin
      Padding := ABase - Size;
    end else begin
      Padding := Size - ABase;
    end;
    Result := ABase + Padding;
  end;
end;

// Macro EINA_VALUE_NEW expansion - These call eina_value_set with a value
function eina_value_uchar_new(c: byte): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UCHAR);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer, C will handle va_arg for Bytes
  Result := v;
end;

function eina_value_ushort_new(c: word): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_USHORT);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_uint_new(c: cardinal): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UINT);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_ulong_new(c: longword): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_ULONG);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_uint64_new(c: uint64): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UINT64);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_char_new(c: ansichar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_CHAR);
  if v <> nil then begin
    eina_value_set(v, Pointer(nativeuint(c)));
  end; // Convert Char to integer type then to Pointer
  Result := v;
end;

function eina_value_short_new(c: smallint): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_SHORT);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_int_new(c: integer): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_INT);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_long_new(c: longint): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_LONG);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_int64_new(c: int64): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_INT64);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer (handle 64-bit casting for Pointer)
  Result := v;
end;

function eina_value_float_new(c: single): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_FLOAT);
  if v <> nil then //    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  begin
    Result := v;
  end;
end;

function eina_value_double_new(c: double): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_DOUBLE);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_bool_new(c: TEina_Bool): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_BOOL);
  if v <> nil then begin
    eina_value_set(v, Pointer(nativeuint(c)));
  end; // Pass bool as integer value then to Pointer
  Result := v;
end;

function eina_value_string_new(c: pchar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_STRING);
  if v <> nil then begin
    eina_value_set(v, c);
  end; // PChar is already a Pointer
  Result := v;
end;

function eina_value_stringshare_new(c: pchar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_STRINGSHARE);
  if v <> nil then begin
    eina_value_set(v, c);
  end; // PChar is already a Pointer
  Result := v;
end;

function eina_value_time_new(c: TTime_t): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_TIMESTAMP);
  if v <> nil then begin
    eina_value_set(v, Pointer(c));
  end; // Pass value as Pointer
  Result := v;
end;

function eina_value_error_new(c: TEina_Error): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_ERROR);
  if v <> nil then begin
    eina_value_set(v, Pointer(nativeuint(c)));
  end; // Pass value as Pointer
  Result := v;
end;

// Macro EINA_VALUE_INIT expansion - These call eina_value_set with a value
function eina_value_uchar_init(c: byte): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);
  if eina_value_setup(@Result, EINA_VALUE_TYPE_UCHAR) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_ushort_init(c: word): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_USHORT) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_uint_init(c: cardinal): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_UINT) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_ulong_init(c: longword): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_ULONG) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_uint64_init(c: uint64): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_UINT64) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_char_init(c: ansichar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_CHAR) then begin
    eina_value_set(@Result, Pointer(nativeuint(c)));
  end;
end;

function eina_value_short_init(c: smallint): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_SHORT) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_int_init(c: integer): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_INT) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_long_init(c: longint): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_LONG) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_int64_init(c: int64): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_INT64) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_float_init(c: single): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_FLOAT) then //    eina_value_set(@Result, Pointer(c));
  begin
  end;
end;

function eina_value_double_init(c: double): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_DOUBLE) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_bool_init(c: TEina_Bool): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_BOOL) then begin
    eina_value_set(@Result, Pointer(nativeuint(c)));
  end;
end;

function eina_value_string_init(c: pchar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_STRING) then begin
    eina_value_set(@Result, c);
  end;
end;

function eina_value_stringshare_init(c: pchar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_STRINGSHARE) then begin
    eina_value_set(@Result, c);
  end;
end;

function eina_value_time_init(c: TTime_t): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_TIMESTAMP) then begin
    eina_value_set(@Result, Pointer(c));
  end;
end;

function eina_value_error_init(c: TEina_Error): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value), 0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_ERROR) then begin
    eina_value_set(@Result, Pointer(nativeuint(c)));
  end;
end;

// Macro EINA_VALUE_GET expansion - These call eina_value_get with a pointer
function eina_value_uchar_get(const V: PEina_Value; C: pbyte): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0; // Initialize through pointer
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_UCHAR then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_ushort_get(const V: PEina_Value; C: pWord): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_USHORT then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_uint_get(const V: PEina_Value; C: pCardinal): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_UINT then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_ulong_get(const V: PEina_Value; C: pLongWord): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_ULONG then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_uint64_get(const V: PEina_Value; C: pUInt64): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_UINT64 then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_char_get(const V: PEina_Value; C: pansichar): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := #0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_CHAR then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_short_get(const V: PEina_Value; C: pSmallInt): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_SHORT then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_int_get(const V: PEina_Value; C: pInteger): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_INT then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_long_get(const V: PEina_Value; C: pLongint): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_LONG then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_int64_get(const V: PEina_Value; C: pInt64): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_INT64 then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_float_get(const V: PEina_Value; C: pSingle): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0.0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_FLOAT then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_double_get(const V: PEina_Value; C: pDouble): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0.0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_DOUBLE then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_bool_get(const V: PEina_Value; C: PEina_Bool): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := EINA_FALSE;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_BOOL then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_string_get(const V: PEina_Value; C: pPChar): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := nil;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type
    = EINA_VALUE_TYPE_STRING then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_stringshare_get(const V: PEina_Value; C: pPChar): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := nil;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_STRINGSHARE then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_time_get(const V: PEina_Value; C: pTime_t): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_TIMESTAMP then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

function eina_value_error_get(const V: PEina_Value; C: PEina_Error): TEina_Bool;
begin
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  C^ := 0;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;
  if V^._type = EINA_VALUE_TYPE_ERROR then begin
    Result := eina_value_get(V, @C);
  end // Pass the pointer C directly
  else begin
    Result := EINA_FALSE;
  end;
end;

// Macro EINA_VALUE_CONVERT expansion
function eina_value_uchar_convert(const V: PEina_Value; C: pbyte): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  // Try no conversion first
  if eina_value_uchar_get(V, C) then begin
    Exit(EINA_TRUE);
  end;
  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UCHAR) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_uchar_get(@dst, C) then begin
    goto OnError;
  end; // Pass the pointer C directly
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_ushort_convert(const V: PEina_Value; C: pWord): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_ushort_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_USHORT) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_ushort_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_uint_convert(const V: PEina_Value; C: pCardinal): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_uint_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UINT) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_uint_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_ulong_convert(const V: PEina_Value; C: pLongWord): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_ulong_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_ULONG) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_ulong_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_uint64_convert(const V: PEina_Value; C: pUInt64): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_uint64_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UINT64) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_uint64_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_char_convert(const V: PEina_Value; C: pansichar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_char_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_CHAR) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_char_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_short_convert(const V: PEina_Value; C: pSmallInt): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_short_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_SHORT) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_short_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_int_convert(const V: PEina_Value; C: pInteger): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_int_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_INT) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_int_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_long_convert(const V: PEina_Value; C: pLongint): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_long_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_LONG) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_long_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_int64_convert(const V: PEina_Value; C: pInt64): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_int64_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_INT64) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_int64_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_float_convert(const V: PEina_Value; C: pSingle): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_float_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_FLOAT) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_float_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_double_convert(const V: PEina_Value; C: pDouble): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_double_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_DOUBLE) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_double_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_bool_convert(const V: PEina_Value; C: PEina_Bool
  ): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_bool_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_BOOL) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_bool_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_string_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_string_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_STRING) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_string_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_stringshare_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_stringshare_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_STRINGSHARE) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_stringshare_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_time_convert(const V: PEina_Value; C: pTime_t): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_time_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_TIMESTAMP) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_time_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

function eina_value_error_convert(const V: PEina_Value; C: PEina_Error): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label
  OnError;
begin
  r := EINA_FALSE;
  if C = nil then begin
    Exit(EINA_FALSE);
  end;
  if V = nil then begin
    Exit(EINA_FALSE);
  end;

  if eina_value_error_get(V, C) then begin
    Exit(EINA_TRUE);
  end;

  FillChar(dst, SizeOf(TEina_Value), 0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_ERROR) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_convert(V, @dst) then begin
    goto OnError;
  end;
  if not eina_value_error_get(@dst, C) then begin
    goto OnError;
  end;
  r := EINA_TRUE;

  OnError:
    eina_value_flush(@dst);
  Result := r;
end;

// ================================

function eina_value_dup(const AVal: PEina_Value): PEina_Value;
var
  v: PEina_Value;
begin
  if AVal = nil then begin
    Exit(nil);
  end;

  v := eina_value_new(eina_value_type_get(AVal));
  if v = nil then begin
    Exit(nil);
  end;

  if not eina_value_copy(AVal, v) then begin
    eina_value_setup(v, EINA_VALUE_TYPE_ERROR);
    eina_value_set(v, Pointer(EINA_ERROR_VALUE_FAILED));
  end;
  Result := v;
end;

function eina_value_reference_copy(const AVal: PEina_Value): TEina_Value;
var
  v: TEina_Value;
begin
  FillChar(v, SizeOf(TEina_Value), 0);

  if not eina_value_copy(AVal, @v) then begin
    eina_value_setup(@v, EINA_VALUE_TYPE_ERROR);
    eina_value_set(@v, Pointer(EINA_ERROR_VALUE_FAILED));
  end;
  Result := v;
end;

function eina_value_stringshare_copy(const AVal: PEina_Value; AStr: PPEina_Stringshare): TEina_Bool;
begin
  if AVal = nil then begin
    Exit(EINA_FALSE);
  end;
  if AStr = nil then begin
    Exit(EINA_FALSE);
  end;
  AStr^ := #0;

  if not (AVal^._type = EINA_VALUE_TYPE_STRINGSHARE) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_get(AVal,PPointer( AStr)) then begin
    Exit(EINA_FALSE);
  end;
  eina_stringshare_ref(AStr^);
  Result := EINA_TRUE;
end;

function eina_value_string_copy(const AVal: PEina_Value; AStr: PPChar): TEina_Bool;
var
  s: pchar;
begin
  if AVal = nil then begin
    Exit(EINA_FALSE);
  end;
  if AStr = nil then begin
    Exit(EINA_FALSE);
  end;
  AStr^ := #0;

  if not ((AVal^._type = EINA_VALUE_TYPE_STRINGSHARE) or (AVal^._type = EINA_VALUE_TYPE_STRING)) then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_get(AVal, @s) then begin
    Exit(EINA_FALSE);
  end; // Pass address of local PChar
  if s <> nil then begin
    AStr^ := strdup(s);
  end else begin
    AStr^ := nil;
  end;
  Result := EINA_TRUE;
end;

// Deprecated functions (legacy compat)
function eina_value_util_type_size(AType: PEina_Value_Type): TSize_t;
begin
  Result := eina_value_type_size(AType);
end;

function eina_value_util_type_offset(AType: PEina_Value_Type; ABase: cardinal): cardinal;
begin
  Result := eina_value_type_offset(AType, ABase);
end;

function eina_value_util_int_new(c: integer): PEina_Value;
begin
  Result := eina_value_int_new(c);
end;

function eina_value_util_double_new(c: double): PEina_Value;
begin
  Result := eina_value_double_new(c);
end;

function eina_value_util_bool_new(c: TEina_Bool): PEina_Value;
begin
  Result := eina_value_bool_new(c);
end;

function eina_value_util_string_new(c: pchar): PEina_Value;
begin
  Result := eina_value_string_new(c);
end;

function eina_value_util_stringshare_new(c: pchar): PEina_Value;
begin
  Result := eina_value_stringshare_new(c);
end;

function eina_value_util_time_new(c: TTime_t): PEina_Value;
begin
  Result := eina_value_time_new(c);
end;

function eina_value_util_dup(AVal: PEina_Value): PEina_Value;
begin
  Result := eina_value_dup(AVal);
end;

function eina_value_util_stringshare_copy(AVal: PEina_Value;
  AStr: PPEina_Stringshare): TEina_Bool;
begin
  Result := eina_value_stringshare_copy(AVal, AStr);
end;

function eina_value_util_string_copy(AVal: PEina_Value; AStr: PPChar
  ): TEina_Bool;
begin
  Result := eina_value_string_copy(AVal, AStr);
end;

{$ENDIF read_implementation}
