unit eina_inline_value_util;


//{$mode objfpc}{$H+}

interface

uses
  efl, fp_eina,
  eina_inline_value,
  Classes, SysUtils;


  // IMPORTANT: The following external functions (eina_value_new, eina_value_set,
  // eina_value_get, eina_value_setup, eina_value_flush, eina_value_type_get,
  // eina_value_copy, eina_stringshare_ref, strdup) are assumed to be declared
  // in `Eina.Value.pas` (or similar unit) as follows, specifically noting
  // the `varargs` and `Pointer` for `eina_value_set` and `eina_value_get`
  // as they are the underlying C variadic functions.

  // Example (in Eina.Value.pas):
  // function eina_value_new(AType: PEina_Value_Type): PEina_Value; cdecl; external;
  // function eina_value_set(AVal: PEina_Value; AData: Pointer): TEina_Bool; cdecl; varargs; external; // Accepts pointer for variadic argument
  // function eina_value_get(const AVal: PEina_Value; ADataPtr: Pointer): TEina_Bool; cdecl; varargs; external; // Accepts pointer for variadic argument
  // function eina_value_setup(AVal: PEina_Value; AType: PEina_Value_Type): TEina_Bool; cdecl; external;
  // function eina_value_flush(AVal: PEina_Value): TEina_Bool; cdecl; external; // Assuming it returns bool, Eina API says void. Adjust as per actual Eina.
  // function eina_value_type_get(AVal: PEina_Value): PEina_Value_Type; cdecl; external;
  // function eina_value_copy(ASrc: PEina_Value; ADst: PEina_Value): TEina_Bool; cdecl; external;
  // function eina_value_convert(ASrc: PEina_Value; ADst: PEina_Value): TEina_Bool; cdecl; external; // This one is usually NOT varargs itself, it converts between two Eina_Value objects.
  // function eina_stringshare_ref(AStr: PEina_Stringshare): PEina_Stringshare; cdecl; external;
  // function StrDup(S: PChar): PChar; cdecl; external libc name 'strdup';


  // EINA_VALUE_EMPTY: TEina_Value = (...);
  // EINA_VALUE_TYPE_UCHAR: PEina_Value_Type;
  // ... and so on for all EINA_VALUE_TYPE_* constants
  // EINA_ERROR_VALUE_FAILED: TEina_Error = (...);

  // Legacy compat: calls eina_value_type_size()
  // @deprecated
  // @since 1.12
  function eina_value_util_type_size(AType: PEina_Value_Type): TSize_t; overload; deprecated;
  // Legacy compat: calls eina_value_type_offset()
  // @deprecated
  // @since 1.12
  function eina_value_util_type_offset(AType: PEina_Value_Type; ABase: Cardinal): Cardinal; overload; deprecated;
  // Legacy compat: calls eina_value_int_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_int_new(c: Integer): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_double_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_double_new(c: Double): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_bool_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_bool_new(c: TEina_Bool): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_string_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_string_new(c: PChar): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_stringshare_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_stringshare_new(c: PChar): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_time_new()
  // @deprecated
  // @since 1.12
  function eina_value_util_time_new(c: TTime_t): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_dup()
  // @deprecated
  // @since 1.12
  function eina_value_util_dup(AVal: PEina_Value): PEina_Value; overload; deprecated;
  // Legacy compat: calls eina_value_stringshare_copy()
  // @deprecated
  // @since 1.12
  function eina_value_util_stringshare_copy(AVal: PEina_Value; AStr: PEina_Stringshare): TEina_Bool; overload; deprecated;
  // Legacy compat: calls eina_value_string_copy()
  // @deprecated
  // @since 1.12
  function eina_value_util_string_copy(AVal: PEina_Value; AStr: PChar): TEina_Bool; overload; deprecated;

  /// @brief Get size of #Eina_Value_Type based on C type
  /// @param type The type to get the size of
  /// @return The size of the type
  /// @since 1.21
  function eina_value_type_size(AType: PEina_Value_Type): TSize_t;

  /// @brief Get padding of #Eina_Value_Type based on C type and base padding
  /// @param type The type to get the offset of
  /// @param base The existing base size
  /// @return The offset of the type
  /// @since 1.21
  function eina_value_type_offset(AType: PEina_Value_Type; ABase: Cardinal): Cardinal;

  // Macro EINA_VALUE_NEW expansion - These call eina_value_set with a value
  function eina_value_uchar_new(c: Byte): PEina_Value;
  function eina_value_ushort_new(c: Word): PEina_Value;
  function eina_value_uint_new(c: Cardinal): PEina_Value;
  function eina_value_ulong_new(c: LongWord): PEina_Value;
  function eina_value_uint64_new(c: UInt64): PEina_Value;
  function eina_value_char_new(c: AnsiChar): PEina_Value;
  function eina_value_short_new(c: SmallInt): PEina_Value;
  function eina_value_int_new(c: Integer): PEina_Value;
  function eina_value_long_new(c: Longint): PEina_Value;
  function eina_value_int64_new(c: Int64): PEina_Value;
  function eina_value_float_new(c: Single): PEina_Value;
  function eina_value_double_new(c: Double): PEina_Value;
  function eina_value_bool_new(c: TEina_Bool): PEina_Value;
  function eina_value_string_new(c: PChar): PEina_Value;
  function eina_value_stringshare_new(c: PChar): PEina_Value;
  function eina_value_time_new(c: TTime_t): PEina_Value;
  function eina_value_error_new(c: TEina_Error): PEina_Value;

  // Macro EINA_VALUE_INIT expansion - These call eina_value_set with a value
  function eina_value_uchar_init(c: Byte): TEina_Value;
  function eina_value_ushort_init(c: Word): TEina_Value;
  function eina_value_uint_init(c: Cardinal): TEina_Value;
  function eina_value_ulong_init(c: LongWord): TEina_Value;
  function eina_value_uint64_init(c: UInt64): TEina_Value;
  function eina_value_char_init(c: AnsiChar): TEina_Value;
  function eina_value_short_init(c: SmallInt): TEina_Value;
  function eina_value_int_init(c: Integer): TEina_Value;
  function eina_value_long_init(c: Longint): TEina_Value;
  function eina_value_int64_init(c: Int64): TEina_Value;
  function eina_value_float_init(c: Single): TEina_Value;
  function eina_value_double_init(c: Double): TEina_Value;
  function eina_value_bool_init(c: TEina_Bool): TEina_Value;
  function eina_value_string_init(c: PChar): TEina_Value;
  function eina_value_stringshare_init(c: PChar): TEina_Value;
  function eina_value_time_init(c: TTime_t): TEina_Value;
  function eina_value_error_init(c: TEina_Error): TEina_Value;

  // Macro EINA_VALUE_GET expansion - These call eina_value_get with a pointer
  function eina_value_uchar_get(const V: PEina_Value; C: pByte): TEina_Bool;
  function eina_value_ushort_get(const V: PEina_Value; C: pWord): TEina_Bool;
  function eina_value_uint_get(const V: PEina_Value; C: pCardinal): TEina_Bool;
  function eina_value_ulong_get(const V: PEina_Value; C: pLongWord): TEina_Bool;
  function eina_value_uint64_get(const V: PEina_Value; C: pUInt64): TEina_Bool;
  function eina_value_char_get(const V: PEina_Value; C: pAnsiChar): TEina_Bool;
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
  function eina_value_uchar_convert(const V: PEina_Value; C: pByte): TEina_Bool;
  function eina_value_ushort_convert(const V: PEina_Value; C: pWord): TEina_Bool;
  function eina_value_uint_convert(const V: PEina_Value; C: pCardinal): TEina_Bool;
  function eina_value_ulong_convert(const V: PEina_Value; C: pLongWord): TEina_Bool;
  function eina_value_uint64_convert(const V: PEina_Value; C: pUInt64): TEina_Bool;
  function eina_value_char_convert(const V: PEina_Value; C: pAnsiChar): TEina_Bool;
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

  /// @brief Create a new #Eina_Value containing the passed parameter
  /// @param val The value to use
  /// @return The #Eina_Value
  /// @since 1.21
  function eina_value_dup(const AVal: PEina_Value): PEina_Value;

  /// @brief Return a reference to #Eina_Value containing a copy of the passed parameter
  /// @param val The value to use
  /// @return The #Eina_Value
  /// @since 1.21
  function eina_value_reference_copy(const AVal: PEina_Value): TEina_Value;

  /// @brief Copy the stringshare in the passed #Eina_Value
  /// @param val The value to copy
  /// @param str The pointer to copy the stringshare to
  /// @return @c EINA_TRUE on success
  /// @since 1.21
  function eina_value_stringshare_copy(const AVal: PEina_Value; AStr: PEina_Stringshare): TEina_Bool;

  /// @brief Copy the string in the passed #Eina_Value
  /// @param val The value to copy
  /// @param str The pointer to copy the string to
  /// @return @c EINA_TRUE on success
  /// @since 1.21
  function eina_value_string_copy(const AVal: PEina_Value; AStr: PChar): TEina_Bool;

implementation

// Assumed external functions (must be declared in Eina.Value.pas or similar)
// These are the *actual* C library functions being called.
// Note the 'varargs' and 'Pointer' for the variadic functions.
// function eina_value_new(AType: PEina_Value_Type): PEina_Value; cdecl; external;
// function eina_value_set(AVal: PEina_Value; AData: Pointer): TEina_Bool; cdecl; varargs; external;
// function eina_value_get(const AVal: PEina_Value; ADataPtr: Pointer): TEina_Bool; cdecl; varargs; external;
// function eina_value_setup(AVal: PEina_Value; AType: PEina_Value_Type): TEina_Bool; cdecl; external;
// function eina_value_flush(AVal: PEina_Value): TEina_Bool; cdecl; external; // Check actual Eina API for return type
// function eina_value_type_get(AVal: PEina_Value): PEina_Value_Type; cdecl; external;
// function eina_value_copy(ASrc: PEina_Value; ADst: PEina_Value): TEina_Bool; cdecl; external;
// function eina_value_convert(ASrc: PEina_Value; ADst: PEina_Value): TEina_Bool; cdecl; external;
// function eina_stringshare_ref(AStr: PEina_Stringshare): PEina_Stringshare; cdecl; external;
// function strdup(S: PChar): PChar; cdecl; external libc name 'strdup';


function eina_value_type_size(AType: PEina_Value_Type): TSize_t;
begin
  if AType <> nil then
    Result := AType^.value_size
  else
    Result := 0;
end;

function eina_value_type_offset(AType: PEina_Value_Type; ABase: Cardinal): Cardinal;
var
  Size, Padding: Cardinal;
begin
  Size := eina_value_type_size(AType);
  if Size = 0 then
    Exit(ABase);

  if (ABase mod Size) = 0 then
    Result := ABase
  else
  begin
    if ABase > Size then
      Padding := ABase - Size
    else
      Padding := Size - ABase;
    Result := ABase + Padding;
  end;
end;

// Macro EINA_VALUE_NEW expansion - These call eina_value_set with a value
function eina_value_uchar_new(c: Byte): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UCHAR);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer, C will handle va_arg for Bytes
  Result := v;
end;

function eina_value_ushort_new(c: Word): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_USHORT);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_uint_new(c: Cardinal): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UINT);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_ulong_new(c: LongWord): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_ULONG);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_uint64_new(c: UInt64): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_UINT64);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_char_new(c: AnsiChar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_CHAR);
  if v <> nil then
    eina_value_set(v, Pointer(NativeUInt(c))); // Convert Char to integer type then to Pointer
  Result := v;
end;

function eina_value_short_new(c: SmallInt): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_SHORT);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_int_new(c: Integer): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_INT);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_long_new(c: Longint): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_LONG);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_int64_new(c: Int64): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_INT64);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer (handle 64-bit casting for Pointer)
  Result := v;
end;

function eina_value_float_new(c: Single): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_FLOAT);
  if v <> nil then
//    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_double_new(c: Double): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_DOUBLE);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_bool_new(c: TEina_Bool): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_BOOL);
  if v <> nil then
    eina_value_set(v, Pointer(NativeUInt(c))); // Pass bool as integer value then to Pointer
  Result := v;
end;

function eina_value_string_new(c: PChar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_STRING);
  if v <> nil then
    eina_value_set(v, c); // PChar is already a Pointer
  Result := v;
end;

function eina_value_stringshare_new(c: PChar): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_STRINGSHARE);
  if v <> nil then
    eina_value_set(v, c); // PChar is already a Pointer
  Result := v;
end;

function eina_value_time_new(c: TTime_t): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_TIMESTAMP);
  if v <> nil then
    eina_value_set(v, Pointer(c)); // Pass value as Pointer
  Result := v;
end;

function eina_value_error_new(c: TEina_Error): PEina_Value;
var
  v: PEina_Value;
begin
  v := eina_value_new(EINA_VALUE_TYPE_ERROR);
  if v <> nil then
    eina_value_set(v, Pointer(NativeUInt(c))); // Pass value as Pointer
  Result := v;
end;

// Macro EINA_VALUE_INIT expansion - These call eina_value_set with a value
function eina_value_uchar_init(c: Byte): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);
  if eina_value_setup(@Result, EINA_VALUE_TYPE_UCHAR) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_ushort_init(c: Word): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_USHORT) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_uint_init(c: Cardinal): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_UINT) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_ulong_init(c: LongWord): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_ULONG) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_uint64_init(c: UInt64): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_UINT64) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_char_init(c: AnsiChar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_CHAR) then
    eina_value_set(@Result, Pointer(NativeUInt(c)));
end;

function eina_value_short_init(c: SmallInt): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_SHORT) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_int_init(c: Integer): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_INT) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_long_init(c: Longint): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_LONG) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_int64_init(c: Int64): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_INT64) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_float_init(c: Single): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_FLOAT) then
//    eina_value_set(@Result, Pointer(c));
end;

function eina_value_double_init(c: Double): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_DOUBLE) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_bool_init(c: TEina_Bool): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_BOOL) then
    eina_value_set(@Result, Pointer(NativeUInt(c)));
end;

function eina_value_string_init(c: PChar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_STRING) then
    eina_value_set(@Result, c);
end;

function eina_value_stringshare_init(c: PChar): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_STRINGSHARE) then
    eina_value_set(@Result, c);
end;

function eina_value_time_init(c: TTime_t): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_TIMESTAMP) then
    eina_value_set(@Result, Pointer(c));
end;

function eina_value_error_init(c: TEina_Error): TEina_Value;
begin
  FillChar(Result, SizeOf(TEina_Value),0);

  if eina_value_setup(@Result, EINA_VALUE_TYPE_ERROR) then
    eina_value_set(@Result, Pointer(NativeUInt(c)));
end;

// Macro EINA_VALUE_GET expansion - These call eina_value_get with a pointer
function eina_value_uchar_get(const V: PEina_Value; C: pByte): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0; // Initialize through pointer
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_UCHAR then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_ushort_get(const V: PEina_Value; C: pWord): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_USHORT then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_uint_get(const V: PEina_Value; C: pCardinal): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_UINT then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_ulong_get(const V: PEina_Value; C: pLongWord): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_ULONG then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_uint64_get(const V: PEina_Value; C: pUInt64): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_UINT64 then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_char_get(const V: PEina_Value; C: pAnsiChar): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := #0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_CHAR then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_short_get(const V: PEina_Value; C: pSmallInt): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_SHORT then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_int_get(const V: PEina_Value; C: pInteger): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_INT then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_long_get(const V: PEina_Value; C: pLongint): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_LONG then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_int64_get(const V: PEina_Value; C: pInt64): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_INT64 then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_float_get(const V: PEina_Value; C: pSingle): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0.0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_FLOAT then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_double_get(const V: PEina_Value; C: pDouble): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0.0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_DOUBLE then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_bool_get(const V: PEina_Value; C: PEina_Bool): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := EINA_FALSE;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_BOOL then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_string_get(const V: PEina_Value; C: pPChar): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := nil;
  if V = nil then Exit(EINA_FALSE);
  if V^._type
  = EINA_VALUE_TYPE_STRING then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_stringshare_get(const V: PEina_Value; C: pPChar): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := nil;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_STRINGSHARE then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_time_get(const V: PEina_Value; C: pTime_t): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_TIMESTAMP then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

function eina_value_error_get(const V: PEina_Value; C: PEina_Error): TEina_Bool;
begin
  if C = nil then Exit(EINA_FALSE);
  C^ := 0;
  if V = nil then Exit(EINA_FALSE);
  if V^._type = EINA_VALUE_TYPE_ERROR then
    Result := eina_value_get(V, C) // Pass the pointer C directly
  else
    Result := EINA_FALSE;
end;

// Macro EINA_VALUE_CONVERT expansion
function eina_value_uchar_convert(const V: PEina_Value; C: pByte): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
  label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  // Try no conversion first
  if eina_value_uchar_get(V, C) then Exit(EINA_TRUE);
  FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UCHAR) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_uchar_get(@dst, C) then goto OnError; // Pass the pointer C directly
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_ushort_convert(const V: PEina_Value; C: pWord): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_ushort_get(V, C) then Exit(EINA_TRUE);

  FillChar(dst, SizeOf(TEina_Value),0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_USHORT) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_ushort_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_uint_convert(const V: PEina_Value; C: pCardinal): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_uint_get(V, C) then Exit(EINA_TRUE);

  FillChar(dst, SizeOf(TEina_Value),0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UINT) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_uint_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_ulong_convert(const V: PEina_Value; C: pLongWord): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_ulong_get(V, C) then Exit(EINA_TRUE);

  FillChar(dst, SizeOf(TEina_Value),0);
  if not eina_value_setup(@dst, EINA_VALUE_TYPE_ULONG) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_ulong_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_uint64_convert(const V: PEina_Value; C: pUInt64): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_uint64_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_UINT64) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_uint64_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_char_convert(const V: PEina_Value; C: pAnsiChar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_char_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_CHAR) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_char_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_short_convert(const V: PEina_Value; C: pSmallInt): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_short_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_SHORT) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_short_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_int_convert(const V: PEina_Value; C: pInteger): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_int_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_INT) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_int_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_long_convert(const V: PEina_Value; C: pLongint): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_long_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_LONG) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_long_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_int64_convert(const V: PEina_Value; C: pInt64): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_int64_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_INT64) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_int64_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_float_convert(const V: PEina_Value; C: pSingle): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_float_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_FLOAT) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_float_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_double_convert(const V: PEina_Value; C: pDouble): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_double_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_DOUBLE) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_double_get(@dst, C) then goto OnError;
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
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_bool_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_BOOL) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_bool_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_string_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_string_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_STRING) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_string_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_stringshare_convert(const V: PEina_Value; C: pPChar): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_stringshare_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_STRINGSHARE) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_stringshare_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_time_convert(const V: PEina_Value; C: pTime_t): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_time_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_TIMESTAMP) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_time_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;

function eina_value_error_convert(const V: PEina_Value; C: PEina_Error
  ): TEina_Bool;
var
  dst: TEina_Value;
  r: TEina_Bool;
label OnError;
begin
  r := EINA_FALSE;
  if C = nil then Exit(EINA_FALSE);
  if V = nil then Exit(EINA_FALSE);

  if eina_value_error_get(V, C) then Exit(EINA_TRUE);

    FillChar(dst, SizeOf(TEina_Value),0);

  if not eina_value_setup(@dst, EINA_VALUE_TYPE_ERROR) then Exit(EINA_FALSE);

  if not eina_value_convert(V, @dst) then goto OnError;
  if not eina_value_error_get(@dst, C) then goto OnError;
  r := EINA_TRUE;

OnError:
  eina_value_flush(@dst);
  Result := r;
end;


function eina_value_dup(const AVal: PEina_Value): PEina_Value;
var
  v: PEina_Value;
begin
  if AVal = nil then Exit(nil);

  v := eina_value_new(eina_value_type_get(AVal));
  if v = nil then Exit(nil);

  if not eina_value_copy(AVal, v) then
  begin
    eina_value_setup(v, EINA_VALUE_TYPE_ERROR);
    eina_value_set(v, Pointer(NativeUInt(EINA_ERROR_VALUE_FAILED)));
  end;
  Result := v;
end;

function eina_value_reference_copy(const AVal: PEina_Value): TEina_Value;
var
  v: TEina_Value;
begin
  FillChar(v, SizeOf(TEina_Value),0);

  if not eina_value_copy(AVal, @v) then
  begin
    eina_value_setup(@v, EINA_VALUE_TYPE_ERROR);
    eina_value_set(@v, Pointer(NativeUInt(EINA_ERROR_VALUE_FAILED)));
  end;
  Result := v;
end;

function eina_value_stringshare_copy(const AVal: PEina_Value; AStr: PEina_Stringshare): TEina_Bool;
var
  s: PChar; // Temporary PChar to get the value
begin
  if AVal = nil then Exit(EINA_FALSE);
  if AStr = nil then Exit(EINA_FALSE);
  AStr^ := #0; // Assign to dereferenced pointer

  if not (AVal^._type = EINA_VALUE_TYPE_STRINGSHARE) then Exit(EINA_FALSE);

  if not eina_value_get(AVal, @s) then Exit(EINA_FALSE); // Pass address of local PChar
  AStr := PEina_Stringshare(s);
  if AStr <> nil then
    eina_stringshare_ref(AStr); // Ref the dereferenced pointer
  Result := EINA_TRUE;
end;

function eina_value_string_copy(const AVal: PEina_Value; AStr: PChar): TEina_Bool;
var
  s: PChar;
begin
  if AVal = nil then Exit(EINA_FALSE);
  if AStr = nil then Exit(EINA_FALSE);
  AStr^ := #0; // Assign to dereferenced pointer

  if not ((AVal^._type = EINA_VALUE_TYPE_STRINGSHARE) or (AVal^._type = EINA_VALUE_TYPE_STRING)) then Exit(EINA_FALSE);

  if not eina_value_get(AVal, @s) then Exit(EINA_FALSE); // Pass address of local PChar
  if s <> nil then
    AStr := StrDup(s)
  else
    AStr := nil;
  Result := EINA_TRUE;
end;

// Deprecated functions (legacy compat)
function eina_value_util_type_size(AType: PEina_Value_Type): TSize_t;
begin
  Result := eina_value_type_size(AType);
end;

function eina_value_util_type_offset(AType: PEina_Value_Type; ABase: Cardinal): Cardinal;
begin
  Result := eina_value_type_offset(AType, ABase);
end;

function eina_value_util_int_new(c: Integer): PEina_Value;
begin
  Result := eina_value_int_new(c);
end;

function eina_value_util_double_new(c: Double): PEina_Value;
begin
  Result := eina_value_double_new(c);
end;

function eina_value_util_bool_new(c: TEina_Bool): PEina_Value;
begin
  Result := eina_value_bool_new(c);
end;

function eina_value_util_string_new(c: PChar): PEina_Value;
begin
  Result := eina_value_string_new(c);
end;

function eina_value_util_stringshare_new(c: PChar): PEina_Value;
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

function eina_value_util_stringshare_copy(AVal: PEina_Value; AStr: PEina_Stringshare): TEina_Bool;
begin
  Result := eina_value_stringshare_copy(AVal, AStr);
end;

function eina_value_util_string_copy(AVal: PEina_Value; AStr: PChar): TEina_Bool;
begin
  Result := eina_value_string_copy(AVal, AStr);
end;

end.
