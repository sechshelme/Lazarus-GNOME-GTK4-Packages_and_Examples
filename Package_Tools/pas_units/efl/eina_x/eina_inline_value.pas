unit eina_inline_value;

//{$mode objfpc}{$H+} // Enables extended syntax and Unicode strings for Free Pascal
// {$mode delphi} // Compatibility mode for Delphi

interface

uses
  efl,
  fp_eina,
  eina_inline_stringshare,
  SysUtils, // For MemCopy, etc.
  Types;    // For PAnsiChar, PByte etc. (Free Pascal)

// Forward declarations for external Eina types and functions
// These would typically be in separate Eina-related Pascal units
//type
//  Eina_Bool = Boolean;

//const
//  EINA_TRUE = True;
//  EINA_FALSE = False;

//type
  // Eina_Stringshare type (assuming it's a PAnsiChar behind the scenes)
//  Eina_Stringshare = PAnsiChar;

  // Eina_Inarray (opaque pointer for now, would be a record/class in full impl)
  //Eina_Inarray = Pointer;
  //function eina_inarray_count(const arr: Eina_Inarray): Cardinal; external; // Placeholder
  //function eina_inarray_nth(const arr: Eina_Inarray; position: Cardinal): Pointer; external; // Placeholder
  //function eina_inarray_remove_at(arr: Eina_Inarray; position: Cardinal): Eina_Bool; external; // Placeholder
  //function eina_inarray_alloc_at(arr: Eina_Inarray; position, count: Cardinal): Pointer; external; // Placeholder

  //// Eina_List (opaque pointer for now, would be a record/class in full impl)
  //Eina_List = record
  //  data: Pointer;
  //  next, prev: Pointer; // Simplified for this context
  //end;
  //Eina_PList = ^Eina_List;

  //function eina_list_count(const lst: Eina_PList): Cardinal; external; // Placeholder
  //function eina_list_nth_list(lst: Eina_PList; position: Cardinal): Eina_PList; external; // Placeholder
  //function eina_list_append(lst: Eina_PList; data: Pointer): Eina_PList; external; // Placeholder
  //function eina_list_prepend(lst: Eina_PList; data: Pointer): Eina_PList; external; // Placeholder
  //function eina_list_append_relative_list(lst: Eina_PList; data: Pointer; relative: Eina_PList): Eina_PList; external; // Placeholder
  //function eina_list_remove_list(lst: Eina_PList; node: Eina_PList): Eina_PList; external; // Placeholder
  //function eina_list_last(lst: Eina_PList): Eina_PList; external; // Placeholder


  // Eina_Hash (opaque pointer for now, would be a record/class in full impl)
  //Eina_Hash = Pointer;
  //function eina_hash_population(const h: Eina_Hash): Cardinal; external; // Placeholder
  //function eina_hash_find(const h: Eina_Hash; const key: PAnsiChar): Pointer; external; // Placeholder
  //function eina_hash_add(h: Eina_Hash; const key: PAnsiChar; data: Pointer): Eina_Bool; external; // Placeholder
  //function eina_hash_del_by_key(h: Eina_Hash; const key: PAnsiChar): Pointer; external; // Placeholder

  // Eina_Value_Type (simplified for this context, needs full definition elsewhere)
  // In C, this is a struct of function pointers. In Pascal, this is tricky.
  // We'll define a record with procedure pointers for simplicity here.
  // A more robust solution might involve an interface or class hierarchy.
  //PEina_Value_Type_Setup = function(const typ: Pointer; mem: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_Flush = function(const typ: Pointer; mem: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_Copy = function(const typ: Pointer; src, dst: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_Compare = function(const typ: Pointer; a, b: Pointer): Integer; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_Convert_To = function(const typ, convert: Pointer; type_mem, convert_mem: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_Convert_From = function(const typ, convert: Pointer; type_mem, convert_mem: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_VSet = function(const typ: Pointer; mem: Pointer; args: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF} // args: va_list (Pointer to va_list)
  //PEina_Value_Type_PSet = function(const typ: Pointer; mem, ptr: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}
  //PEina_Value_Type_PGet = function(const typ: Pointer; mem, ptr: Pointer): Eina_Bool; {$IFDEF FPC}cdecl;{$ENDIF}

  //TEina_Value_Type = record
  //  value_size: Cardinal;
  //  setup: PEina_Value_Type_Setup;
  //  flush: PEina_Value_Type_Flush;
  //  copy: PEina_Value_Type_Copy;
  //  compare: PEina_Value_Type_Compare;
  //  convert_to: PEina_Value_Type_Convert_To;
  //  convert_from: PEina_Value_Type_Convert_From;
  //  vset: PEina_Value_Type_VSet;
  //  pset: PEina_Value_Type_PSet;
  //  pget: PEina_Value_Type_PGet;
  //end;
  //PEina_Value_Type = ^TEina_Value_Type;

  var
    _EINA_VALUE_TYPE_BASICS_START : PEina_Value_Type;cvar;external libeina;
    _EINA_VALUE_TYPE_BASICS_END : PEina_Value_Type;cvar;external libeina;


  // External basic value types (Pointers to const TEina_Value_Type)
  // These are assumed to be defined and linked from an external C library or Pascal unit.
  //extern var _EINA_VALUE_TYPE_BASICS_START: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var _EINA_VALUE_TYPE_BASICS_END: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_UCHAR: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_USHORT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_UINT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_ULONG: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_TIMESTAMP: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_UINT64: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_CHAR: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_SHORT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_INT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_LONG: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_INT64: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_FLOAT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_DOUBLE: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_STRINGSHARE: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_STRING: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_ARRAY: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_LIST: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_HASH: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_STRUCT: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}
  //extern var EINA_VALUE_TYPE_OPTIONAL: PEina_Value_Type; {$IFDEF FPC}cvar;{$ENDIF}

  // Eina_Value_Union (C union in Pascal)
  //TValueUnion = record
  //  case Integer of
  //    0: (buf: array[0..7] of Byte); // To hold small values directly (8 bytes)
  //    1: (ptr: Pointer);             // For larger values, points to allocated memory
  //    // We also need to simulate _guarantee from C if it's used for checks.
  //    // This might be part of a larger Eina_Value structure.
  //    2: (_guarantee: Pointer); // A placeholder to simulate the _guarantee field for type checks
  //end;
  //Eina_Value_Union = TValueUnion;
  //
  //// Eina_Value (main value structure)
  //PEina_Value = ^TEina_Value;
  //TEina_Value = record
  //  typ: PEina_Value_Type; // Renamed 'type' to 'typ' to avoid keyword conflict
  //  value: Eina_Value_Union;
  //end;
  //
  //// For Eina_Value_Array
  //TEina_Value_Array = record
  //  subtype: PEina_Value_Type;
  //  step: Cardinal;
  //  array: Eina_Inarray; // Renamed to 'array' (no conflict in Pascal)
  //end;
  //
  //// For Eina_Value_List
  //TEina_Value_List = record
  //  subtype: PEina_Value_Type;
  //  list: Eina_PList;
  //end;
  //PEina_Value_List = ^TEina_Value_List;
  //
  //// For Eina_Value_Hash
  //TEina_Value_Hash = record
  //  subtype: PEina_Value_Type;
  //  buckets_power_size: Cardinal;
  //  hash: Eina_Hash;
  //end;
  //PEina_Value_Hash = ^TEina_Value_Hash;
  //
  //// For Eina_Value_Struct
  //TEina_Value_Struct_Member = record
  //  typ: PEina_Value_Type; // Renamed 'type' to 'typ'
  //  offset: Cardinal;
  //  name: PAnsiChar;
  //end;
  //PEina_Value_Struct_Member = ^TEina_Value_Struct_Member;
  //
  //TEina_Value_Struct_Desc = record
  //  version: Cardinal; // EINA_VALUE_STRUCT_DESC_VERSION
  //  members: PEina_Value_Struct_Member; // Array of members
  //  member_count: Cardinal;
  //  // Other fields that might be in the original C struct
  //end;
  //PEina_Value_Struct_Desc = ^TEina_Value_Struct_Desc;
  //
  //const
  //  EINA_VALUE_STRUCT_DESC_VERSION = 1; // Assuming a version number
  //
  //TEina_Value_Struct = record
  //  desc: PEina_Value_Struct_Desc;
  //  memory: Pointer; // The actual memory block for struct members
  //end;
  //PEina_Value_Struct = ^TEina_Value_Struct;
  //
  //// For Eina_Value_Optional_Outer
  //TEina_Value_Optional_Outer = record
  //  subtype: PEina_Value_Type;
  //  value: Pointer;
  //end;
  //PEina_Value_Optional_Outer = ^TEina_Value_Optional_Outer;
  //
  //// For Eina_Value_Optional_Inner
  //TEina_Value_Optional_Inner = record
  //  subtype: PEina_Value_Type;
  //  value: array[0..0] of Byte; // Flexible array member
  //end;
  //PEina_Value_Optional_Inner = ^TEina_Value_Optional_Inner;


// External Eina functions (placeholders, assuming they exist elsewhere)
//function eina_value_type_check(const typ: PEina_Value_Type): TEina_Bool; external; // Placeholder
//function eina_stringshare_del(s: PAnsiChar): TEina_Bool; external; // Placeholder
//function eina_stringshare_replace(s: PAnsiChar; new_s: PAnsiChar): TEina_Bool; external; // Placeholder
//function eina_value_new(const typ: PEina_Value_Type): PEina_Value; external; // Placeholder
function eina_value_type_setup(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool; inline;
function eina_value_type_flush(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool; inline;
function eina_value_type_copy(const typ: PEina_Value_Type; src, dst: Pointer): TEina_Bool; inline;
function eina_value_type_compare(const typ: PEina_Value_Type; a, b: Pointer): Integer; inline;
function eina_value_type_convert_to(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool; inline;
function eina_value_type_convert_from(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool; inline;
function eina_value_type_vset(const typ: PEina_Value_Type; mem: Pointer; args: Pointer): TEina_Bool; inline; // va_list as Pointer
function eina_value_type_pset(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool; inline;
function eina_value_type_pget(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool; inline;

function eina_value_inner_alloc(size: Cardinal): Pointer; external; // Placeholder
procedure eina_value_inner_free(size: Cardinal; mem: Pointer); external; // Placeholder

//function eina_value_struct_member_find(const st: PEina_Value_Struct; const name: PAnsiChar): PEina_Value_Struct_Member; external; // Placeholder


// --- Eina Value Inline Functions ---

// The C code uses `EINA_SAFETY_ON_NULL_RETURN_VAL` and `EINA_SAFETY_ON_FALSE_RETURN_VAL` macros.
// We'll replace them with direct `if ... then Exit` for Pascal.
// Note: In a real-world Pascal library, you might use assertions or exceptions for safety.

function eina_value_memory_get(const value: PEina_Value): Pointer; inline;
function eina_value_setup(value: PEina_Value; const typ: PEina_Value_Type): TEina_Bool; inline;
procedure eina_value_flush(value: PEina_Value); inline;
function eina_value_compare(const a, b: PEina_Value): Integer; inline;

// These va_list functions are problematic in Pascal. We'll declare them but their implementation
// will likely be simplified or rely on the PSet/PGet methods.
// In a full Pascal solution, you'd typically have specific overloads for each type.
//function eina_value_set(value: PEina_Value; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
//function eina_value_get(const value: PEina_Value; var args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_vset(value: PEina_Value; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_vget(const value: PEina_Value; args: Pointer): TEina_Bool; inline; // args is va_list

function eina_value_pset(value: PEina_Value; const ptr: Pointer): TEina_Bool; inline;
function eina_value_pget(const value: PEina_Value; ptr: Pointer): TEina_Bool; inline;
function eina_value_type_get(const value: PEina_Value): PEina_Value_Type; inline;

// Eina_Value_Array
function eina_value_array_setup(value: PEina_Value; const subtype: PEina_Value_Type; step: Cardinal): TEina_Bool; inline;
function eina_value_array_count(const value: PEina_Value): Cardinal; inline;
function eina_value_array_remove(value: PEina_Value; position: Cardinal): TEina_Bool; inline;
function eina_value_array_vset(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_array_vget(const value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_array_vinsert(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_array_vappend(value: PEina_Value; args: Pointer): TEina_Bool; inline; // args is va_list

function eina_value_array_set(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_array_get(const value: PEina_Value; position: Cardinal; var args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_array_insert(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_array_append(value: PEina_Value; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic

function eina_value_array_pset(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool; inline;
function eina_value_array_pget(const value: PEina_Value; position: Cardinal; ptr: Pointer): TEina_Bool; inline;
function eina_value_array_pinsert(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool; inline;
function eina_value_array_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool; inline;
function eina_value_array_value_get(const src: PEina_Value; position: Cardinal; dst: PEina_Value): TEina_Bool; inline;

// Eina_Value_List
function eina_value_list_node_memory_get(const typ: PEina_Value_Type; const node: PEina_List): Pointer; inline;
function eina_value_list_node_memory_setup(const typ: PEina_Value_Type; node: PEina_List): Pointer; inline;
procedure eina_value_list_node_memory_flush(const typ: PEina_Value_Type; node: PEina_List); inline;
function eina_value_list_setup(value: PEina_Value; const subtype: PEina_Value_Type): TEina_Bool; inline;
function eina_value_list_count(const value: PEina_Value): Cardinal; inline;
function eina_value_list_remove(value: PEina_Value; position: Cardinal): TEina_Bool; inline;
function eina_value_list_vset(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_list_vget(const value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_list_vinsert(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_list_vappend(value: PEina_Value; args: Pointer): TEina_Bool; inline; // args is va_list

function eina_value_list_set(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_list_get(const value: PEina_Value; position: Cardinal; var args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_list_insert(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_list_append(value: PEina_Value; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic

function eina_value_list_pset(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool; inline;
function eina_value_list_pget(const value: PEina_Value; position: Cardinal; ptr: Pointer): TEina_Bool; inline;
function eina_value_list_pinsert(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool; inline;
function eina_value_list_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool; inline;

// Eina_Value_Hash
function eina_value_hash_setup(value: PEina_Value; const subtype: PEina_Value_Type; buckets_power_size: Cardinal): TEina_Bool; inline;
function eina_value_hash_population(const value: PEina_Value): Cardinal; inline;
function eina_value_hash_del(value: PEina_Value; const key: PAnsiChar): TEina_Bool; inline;
function eina_value_hash_vset(value: PEina_Value; const key: PAnsiChar; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_hash_vget(const value: PEina_Value; const key: PAnsiChar; args: Pointer): TEina_Bool; inline; // args is va_list

function eina_value_hash_set(value: PEina_Value; const key: PAnsiChar; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_hash_get(const value: PEina_Value; const key: PAnsiChar; var args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic

function eina_value_hash_pset(value: PEina_Value; const key: PAnsiChar; const ptr: Pointer): TEina_Bool; inline;
function eina_value_hash_pget(const value: PEina_Value; const key: PAnsiChar; ptr: Pointer): TEina_Bool; inline;

// Eina_Value_Struct
function eina_value_struct_setup(value: PEina_Value; const sdesc: PEina_Value_Struct_Desc): TEina_Bool; inline;
function eina_value_struct_desc_get(const value: PEina_Value): PEina_Value_Struct_Desc; inline;
function eina_value_struct_member_memory_get(const st: PEina_Value_Struct; const member: PEina_Value_Struct_Member): Pointer; inline;
function eina_value_struct_vset(value: PEina_Value; const name: PAnsiChar; args: Pointer): TEina_Bool; inline; // args is va_list
function eina_value_struct_vget(const value: PEina_Value; const name: PAnsiChar; args: Pointer): TEina_Bool; inline; // args is va_list

function eina_value_struct_set(value: PEina_Value; const name: PAnsiChar; const args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic
function eina_value_struct_get(const value: PEina_Value; const name: PAnsiChar; var args: array of const): TEina_Bool; overload; inline; // Placeholder for variadic

function eina_value_struct_pset(value: PEina_Value; const name: PAnsiChar; const ptr: Pointer): TEina_Bool; inline;
function eina_value_struct_pget(const value: PEina_Value; const name: PAnsiChar; ptr: Pointer): TEina_Bool; inline;
function eina_value_struct_value_get(const src: PEina_Value; const name: PAnsiChar; dst: PEina_Value): TEina_Bool; inline;
function eina_value_struct_value_set(dst: PEina_Value; const name: PAnsiChar; const src: PEina_Value): TEina_Bool; inline;
function eina_value_struct_member_value_get(const src: PEina_Value; const member: PEina_Value_Struct_Member; dst: PEina_Value): TEina_Bool; inline;
function eina_value_struct_member_value_set(dst: PEina_Value; const member: PEina_Value_Struct_Member; const src: PEina_Value): TEina_Bool; inline;

// Eina_Value_Optional
function eina_value_optional_empty_new: PEina_Value; inline;
function eina_value_optional_empty_is(const value: PEina_Value; is_empty: PBoolean): TEina_Bool; inline;
function eina_value_optional_type_get(value: PEina_Value): PEina_Value_Type; inline;


implementation

// Helper function for variadic arguments simulation.
// In a real scenario, these would call a specific typified internal function.
// For now, they just return EINA_FALSE as they can't be directly translated.
function Eina_Va_List_Stub_Set(value: PEina_Value; args: Pointer): TEina_Bool;
begin
  Result := EINA_FALSE;
end;

function Eina_Va_List_Stub_Get(const value: PEina_Value; args: Pointer): TEina_Bool;
begin
  Result := EINA_FALSE;
end;

// Helper to handle va_list in Pascal (very limited, for compilation only)
// In a real application, you would manually extract arguments or use overloads.
// For now, these are just stubs to allow compilation.
function eina_value_set(value: PEina_Value; const args: array of const): TEina_Bool;
begin
  // This is a placeholder. Real implementation would parse 'args' array.
  // For basic types, it could call eina_value_pset internally if the type is known.
  // For complex types, it would depend on the type's vset implementation.
  // For the purpose of this C-to-Pascal translation, we'll call the vset stub.
  Result := eina_value_vset(value, nil); // Pass nil as args for now, as direct va_list is not supported
end;

function eina_value_get(const value: PEina_Value; var args: array of const): TEina_Bool;
begin
  Result := eina_value_vget(value, nil); // Pass nil as args for now
end;

// Implementations of the inline functions
function eina_value_memory_get(const value: PEina_Value): Pointer;
begin
  //if value = nil then
  //begin
  //  Result := nil;
  //  Exit;
  //end;
  //
//  if (value.typ = nil) then // Also check for value.type as per C
//  begin
//    Result := nil;
//    Exit;
//  end;

  if value^._type^.value_size <= 8 then
    Result := Pointer( value^.value.buf)
  else
    Result := value^.value.ptr;
end;

// EINA_VALUE_TYPE_DEFAULT(type) macro
function EINA_VALUE_TYPE_DEFAULT_IMPL(const typ: PEina_Value_Type): TEina_Bool;
begin
  if (typ <> nil) and (_EINA_VALUE_TYPE_BASICS_START <> nil) and (_EINA_VALUE_TYPE_BASICS_END <> nil) then
    Result := (typ >= _EINA_VALUE_TYPE_BASICS_START) and (typ <= _EINA_VALUE_TYPE_BASICS_END)
  else
    Result := EINA_FALSE;
end;

// EINA_VALUE_TYPE_CHECK_RETURN_VAL(value, retval) macro
function EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: LongInt): LongInt;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  if not eina_value_type_check(value^._type) then
  begin
    Result := retval;
    Exit;
  end;
  Result := 1; // Placeholder for success if checks pass
end;

// EINA_VALUE_TYPE_DISPATCH_RETURN macro (simplified for Pascal)
// This translates to checking for nil method pointers and calling if present.
function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_SETUP(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.setup <> nil) then
    Result := typ^.setup(typ, mem)
  else
    Result := def_ret;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_COMPARE(const typ: PEina_Value_Type; def_ret: Integer; pa, pb: Pointer): Integer;
begin
  if (typ <> nil) and (typ^.compare <> nil) then
    Result := typ^.compare(typ, pa, pb)
  else
    Result := def_ret;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem, ptr: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.pget <> nil) then
    Result := typ^.pget(typ, mem, ptr)
  else
    Result := def_ret;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PSET(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem, ptr: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.pset <> nil) then
    Result := typ^.pset(typ, mem, ptr)
  else
    Result := def_ret;
end;

// EINA_VALUE_TYPE_DISPATCH macro (simplified for Pascal)
procedure EINA_VALUE_TYPE_DISPATCH_IMPL_FLUSH(const typ: PEina_Value_Type; mem: Pointer);
begin
  if (typ <> nil) and (typ^.flush <> nil) then
    typ^.flush(typ, mem);
end;


function eina_value_setup(value: PEina_Value; const typ: PEina_Value_Type): TEina_Bool;
var
  mem: Pointer;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if not (typ^.value_size > 0) then Exit(EINA_FALSE);

  value^._type := typ;

  if typ^.value_size <= 8 then
    mem := @value^.value.buf
  else
  begin
    mem := eina_value_inner_alloc(typ^.value_size);
    value^.value.ptr := mem;
    if mem = nil then Exit(EINA_FALSE);
  end;

  FillChar(mem^, typ^.value_size, 0);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then
    Exit(EINA_TRUE);

  // EINA_VALUE_TYPE_DISPATCH_RETURN(type, setup, 0, EINA_FALSE, mem);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_SETUP(typ, EINA_FALSE, mem);
end;

procedure eina_value_flush(value: PEina_Value);
var
  typ: PEina_Value_Type;
  mem: Pointer;
begin
  if (value = nil) or (value^._type = nil) then Exit;
  // EINA_VALUE_TYPE_CHECK_RETURN(value); // Assuming it exits if check fails

  typ := value^._type;
  mem := eina_value_memory_get(value);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then
  begin
    if typ = EINA_VALUE_TYPE_STRINGSHARE then
    begin
      if value^.value.ptr <> nil then
        eina_stringshare_del(PAnsiChar(value^.value.ptr));
    end
    else if typ = EINA_VALUE_TYPE_STRING then
    begin
      if value^.value.ptr <> nil then
      begin
        FreeMem(value^.value.ptr);
        value^.value.ptr := nil;
      end;
    end
    else if typ^.value_size > 8 then
      eina_value_inner_free(typ^.value_size, mem);
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH(type, flush, 0, mem);
  EINA_VALUE_TYPE_DISPATCH_IMPL_FLUSH(typ, mem);
  if typ^.value_size > 8 then
    eina_value_inner_free(typ^.value_size, mem);
  value^._type := nil;
end;

function eina_value_compare(const a, b: PEina_Value): Integer;
var
  typ: PEina_Value_Type;
  pa, pb: Pointer;
  sa, sb: PChar;
begin
  if  EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(a, -1)=0 then Exit(-1);
  if b = nil then Exit(-1);
  if not (a^._type = b^._type) then Exit(-1);

  typ := a^._type;
  pa := eina_value_memory_get(a);
  pb := eina_value_memory_get(b);

  {$IFNDEF EINA_VALUE_NO_OPTIMIZE}
  if typ = EINA_VALUE_TYPE_UCHAR then
  begin
    if PCardinal(pa)^ < PCardinal(pb)^ then Result := -1
    else if PCardinal(pa)^ > PCardinal(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_USHORT then
  begin
    if PCardinal(pa)^ < PCardinal(pb)^ then Result := -1
    else if PCardinal(pa)^ > PCardinal(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_UINT then
  begin
    if PCardinal(pa)^ < PCardinal(pb)^ then Result := -1
    else if PCardinal(pa)^ > PCardinal(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if (typ = EINA_VALUE_TYPE_ULONG) or (typ = EINA_VALUE_TYPE_TIMESTAMP) then
  begin
    if PCardinal(pa)^ < PCardinal(pb)^ then Result := -1
    else if PCardinal(pa)^ > PCardinal(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_UINT64 then
  begin
    if PUInt64(pa)^ < PUInt64(pb)^ then Result := -1
    else if PUInt64(pa)^ > PUInt64(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_CHAR then
  begin
    if PUInt8(pa)^ < PUInt8(pb)^ then Result := -1
    else if PUInt8(pa)^ > PUInt8(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_SHORT then
  begin
    if PSmallint(pa)^ < PSmallint(pb)^ then Result := -1
    else if PSmallint(pa)^ > PSmallint(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_INT then
  begin
    if PInteger(pa)^ < PInteger(pb)^ then Result := -1
    else if PInteger(pa)^ > PInteger(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_LONG then
  begin
    if PLongint(pa)^ < PLongint(pb)^ then Result := -1
    else if PLongint(pa)^ > PLongint(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_INT64 then
  begin
    if PInt64(pa)^ < PInt64(pb)^ then Result := -1
    else if PInt64(pa)^ > PInt64(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_FLOAT then
  begin
    if PSingle(pa)^ < PSingle(pb)^ then Result := -1
    else if PSingle(pa)^ > PSingle(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_DOUBLE then
  begin
    if PDouble(pa)^ < PDouble(pb)^ then Result := -1
    else if PDouble(pa)^ > PDouble(pb)^ then Result := 1
    else Result := 0;
    Exit;
  end
  else if (typ = EINA_VALUE_TYPE_STRINGSHARE) or (typ = EINA_VALUE_TYPE_STRING) then
  begin
    // Assuming PAnsiChar is the correct representation for char*
//    var sa: PAnsiChar;
//    var sb: PAnsiChar;
    sa := PPChar(pa)^;
    sb := PPChar(pb)^;

    if sa = sb then Result := 0
    else if sa = nil then Result := -1
    else if sb = nil then Result := 1
    else Result := SysUtils.StrComp(sa, sb);
    Exit;
  end;
  {$ENDIF}

  // EINA_VALUE_TYPE_DISPATCH_RETURN(type, compare, 0, EINA_FALSE, pa, pb);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_COMPARE(typ, 0, pa, pb);
end;

// eina_value_vset and eina_value_vget are challenging without va_list.
// For this translation, they will call the PSet/PGet functions, assuming
// the 'args' pointer *is* a pointer to the value to be set/get.
// This is a simplification; a full implementation would need to handle va_list
// more carefully, or the Pascal API would change to not use variadic arguments.

function eina_value_vset(value: PEina_Value; args: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
  r: TEina_Bool;
  str: PAnsiChar;
begin
  if  EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0)=0 then Exit(EINA_FALSE);

  typ := value^._type;
  mem := eina_value_memory_get(value);

  {$IFNDEF EINA_VALUE_NO_OPTIMIZE}
  if typ = EINA_VALUE_TYPE_UCHAR then
  begin
    PCardinal(mem)^ := PCardinal(args)^; // Expecting args to point to an unsigned int
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_USHORT then
  begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_UINT then
  begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if (typ = EINA_VALUE_TYPE_ULONG) or (typ = EINA_VALUE_TYPE_TIMESTAMP) then
  begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_UINT64 then
  begin
    PUInt64(mem)^ := PUInt64(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_CHAR then
  begin
    PUInt8(mem)^ := PUInt8(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_SHORT then
  begin
    PSmallint(mem)^ := PSmallint(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_INT then
  begin
    PInteger(mem)^ := PInteger(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_LONG then
  begin
    PLongint(mem)^ := PLongint(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_INT64 then
  begin
    PInt64(mem)^ := PInt64(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_FLOAT then
  begin
    PSingle(mem)^ := PSingle(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_DOUBLE then
  begin
    PDouble(mem)^ := PDouble(args)^;
    Result := EINA_TRUE;
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_STRINGSHARE then
  begin
//    Result := eina_stringshare_replace(PAnsiChar(@value^.value.ptr), PAnsiChar(PPointer(args)^));
    Exit;
  end
  else if typ = EINA_VALUE_TYPE_STRING then
  begin
//    var str: PAnsiChar;
    str := PAnsiChar(PPointer(args)^);
    if value^.value.ptr = str then Exit(EINA_TRUE);
    if str = nil then
    begin
      FreeMem(value^.value.ptr);
      value^.value.ptr := nil;
    end
    else
    begin
     // var tmp: PAnsiChar;
//      tmp := StrDup(str); // Pascal's equivalent of strdup
//      if tmp = nil then Exit(EINA_FALSE);
//      FreeMem(value^.value.ptr);
//      value^.value.ptr := tmp;
    end;
    Result := EINA_TRUE;
    Exit;
  end;
  {$ENDIF}

  // Fallback to type's vset method if not optimized or unknown basic type
  // This assumes 'args' is treated as a va_list pointer by the external vset.
  r := EINA_FALSE;
  if (typ <> nil) and (typ^.vset <> nil) then
    r := typ^.vset(typ, mem, args);

  Result := r;
end;

function eina_value_vget(const value: PEina_Value; args: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
  ptr: Pointer;
begin
  if  EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0)=0 then Exit(EINA_FALSE);

  typ := value^._type;
  mem := eina_value_memory_get(value);
  ptr := PPointer(args)^; // Extract the target pointer from args (simulating va_arg(args, void*))

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then
  begin
    Move(mem^, ptr^, typ^.value_size);
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pget, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(typ, EINA_FALSE, mem, ptr);
end;


function eina_value_pset(value: PEina_Value; const ptr: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
  str: PAnsiChar;
begin
  if  EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0)=0 then Exit(EINA_FALSE);
  if ptr = nil then Exit(EINA_FALSE);

  typ := value^._type;
  mem := eina_value_memory_get(value);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then
  begin
    if typ = EINA_VALUE_TYPE_STRINGSHARE then
    begin
      // C: const char *str = *((const char * const *) ptr);
//      var str: PAnsiChar;
      str := PAnsiChar(PPointer(ptr)^);
//      Result := eina_stringshare_replace(PAnsiChar(@value^.value.ptr), str);
      Exit;
    end
    else if typ = EINA_VALUE_TYPE_STRING then
    begin
      // C: const char *str = *((const char * const *) ptr);
//      var str: PAnsiChar;
      str := PAnsiChar(PPointer(ptr)^);
      if value^.value.ptr = str then Exit(EINA_TRUE);
      if str = nil then
      begin
        FreeMem(value^.value.ptr);
        value^.value.ptr := nil;
      end
      else
      begin
 //       var tmp: PAnsiChar;
//        tmp := StrDup(str);
//        if tmp = nil then Exit(EINA_FALSE);
        FreeMem(value^.value.ptr);
//        value^.value.ptr := tmp;
      end;
      Result := EINA_TRUE;
      Exit;
    end
    else
    begin
      Move(ptr^, mem^, typ^.value_size);
    end;
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pset, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PSET(typ, EINA_FALSE, mem, ptr);
end;

function eina_value_pget(const value: PEina_Value; ptr: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
begin
  if  EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0) =0then Exit(EINA_FALSE);
  if ptr = nil then Exit(EINA_FALSE);

  typ := value^._type;
  mem := eina_value_memory_get(value);
  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then
  begin
    Move(mem^, ptr^, typ^.value_size);
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pget, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(typ, EINA_FALSE, mem, ptr);
end;

function eina_value_type_get(const value: PEina_Value): PEina_Value_Type;
begin
  if value = nil then Exit(nil);
  // C: EINA_SAFETY_ON_FALSE_RETURN_VAL(eina_value_type_check(value->type), NULL);
  // This check is implicitly handled by `eina_value_type_check` in C, but here we explicitly check
  // value.value._guarantee if value.typ is nil, as per C's intent.
  if (value^._type = nil) and (value^.value._guarantee <> 0) then // This is a heuristic for _guarantee
  begin
    if not eina_value_type_check(value^._type) then Exit(nil);
  end;
  Result := value^._type;
end;

// Eina_Value_Array functions
function EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_ARRAY) then
  begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_setup(value: PEina_Value; const subtype: PEina_Value_Type; step: Cardinal): TEina_Bool;
var
  desc: TEina_Value_Array;
begin
  desc.subtype := subtype;
  desc.step := step;
  desc.arr := nil; // Initialized to NULL in C

  if not eina_value_setup(value, EINA_VALUE_TYPE_ARRAY) then
    Exit(EINA_FALSE);
  if not eina_value_pset(value, @desc) then
  begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_count(const value: PEina_Value): Cardinal;
var
  desc: TEina_Value_Array;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(0);
  if not eina_value_pget(value, @desc) then
    Exit(0);
  if desc.arr <> nil then
    Result := eina_inarray_count(desc.arr)
  else
    Result := 0;
end;

function eina_value_array_remove(value: PEina_Value; position: Cardinal): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then
    Exit(EINA_FALSE);

  eina_value_type_flush(desc.subtype, mem);
  Result := eina_inarray_remove_at(desc.arr, position);
end;

function eina_value_array_vset(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_vset(desc.subtype, mem, args);
end;

function eina_value_array_vget(const value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  if position >= eina_inarray_count(desc.arr) then
    Exit(EINA_FALSE);

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_array_vinsert(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then
    Exit(EINA_FALSE);

  if not eina_value_type_setup(desc.subtype, mem) then
  begin
    eina_inarray_remove_at(desc.arr, position); // goto error_setup
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_vset(desc.subtype, mem, args) then
  begin
    eina_value_type_flush(desc.subtype, mem); // goto error_set
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_vappend(value: PEina_Value; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  position: Cardinal;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  position := eina_inarray_count(desc.arr);
  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then
    Exit(EINA_FALSE);

  if not eina_value_type_setup(desc.subtype, mem) then
  begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_vset(desc.subtype, mem, args) then
  begin
    eina_value_type_flush(desc.subtype, mem);
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

// Variadic argument stubs for array functions
function eina_value_array_set(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vset(value, position, nil); // Placeholder
end;

function eina_value_array_get(const value: PEina_Value; position: Cardinal; var args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vget(value, position, nil); // Placeholder
end;

function eina_value_array_insert(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vinsert(value, position, nil); // Placeholder
end;

function eina_value_array_append(value: PEina_Value; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vappend(value, nil); // Placeholder
end;

function eina_value_array_pset(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_pset(desc.subtype, mem, ptr);
end;

function eina_value_array_pget(const value: PEina_Value; position: Cardinal; ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then
    Exit(EINA_FALSE);

  ret := eina_value_type_pget(desc.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_array_pinsert(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then
    Exit(EINA_FALSE);

  if not eina_value_type_setup(desc.subtype, mem) then
  begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc.subtype, mem, ptr) then
  begin
    eina_value_type_flush(desc.subtype, mem);
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  position: Cardinal;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if not eina_value_pget(value, @desc) then
    Exit(EINA_FALSE);

  position := eina_inarray_count(desc.arr);
  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then
    Exit(EINA_FALSE);

  if not eina_value_type_setup(desc.subtype, mem) then
  begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc.subtype, mem, ptr) then
  begin
    eina_value_type_flush(desc.subtype, mem);
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_value_get(const src: PEina_Value; position: Cardinal; dst: PEina_Value): TEina_Bool;
var
  desc: TEina_Value_Array;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then Exit(EINA_FALSE);
  if dst = nil then Exit(EINA_FALSE);

  if not eina_value_pget(src, @desc) then
    Exit(EINA_FALSE);
  if position >= eina_inarray_count(desc.arr) then
    Exit(EINA_FALSE);
  if not eina_value_setup(dst, desc.subtype) then
    Exit(EINA_FALSE);
  if not eina_value_pset(dst, eina_inarray_nth(desc.arr, position)) then
  begin
    eina_value_flush(dst);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

// Eina_Value_List functions
function EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_LIST) then
  begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_node_memory_get(const typ: PEina_Value_Type; const node: PEina_List): Pointer;
begin
  if (node = nil) or (typ = nil) then Exit(nil);
  if typ^.value_size <= SizeOf(Pointer) then
    Result := @node^.data
  else
    Result := node^.data;
end;

function eina_value_list_node_memory_setup(const typ: PEina_Value_Type; node: PEina_List): Pointer;
begin
  if typ^.value_size <= SizeOf(Pointer) then
    Result := @node^.data
  else
  begin
    node^.data := AllocMem(typ^.value_size);
    Result := node^.data;
  end;
end;

procedure eina_value_list_node_memory_flush(const typ: PEina_Value_Type; node: PEina_List);
begin
  if typ^.value_size <= SizeOf(Pointer) then Exit;
  // C has a check for (void*)1L, which is used as a sentinel for newly allocated nodes.
  // In Pascal, we'd typically use a proper nil/pointer check or a flag.
  // For this translation, I'll simulate the C behavior.
  if node^.data <> Pointer(1) then // (void*)1L equivalent
    FreeMem(node^.data);
end;

function eina_value_list_setup(value: PEina_Value; const subtype: PEina_Value_Type): TEina_Bool;
var
  desc: TEina_Value_List;
begin
  desc.subtype := subtype;
  desc.list := nil;

  if not eina_value_setup(value, EINA_VALUE_TYPE_LIST) then
    Exit(EINA_FALSE);
  if not eina_value_pset(value, @desc) then
  begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_count(const value: PEina_Value): Cardinal;
var
  desc: PEina_Value_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(0);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(0);
  if desc^.list <> nil then
    Result := eina_list_count(desc^.list)
  else
    Result := 0;
end;

function eina_value_list_remove(value: PEina_Value; position: Cardinal): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then
    Exit(EINA_FALSE);

  eina_value_type_flush(desc^.subtype, mem);
  eina_value_list_node_memory_flush(desc^.subtype, node);
  desc^.list := eina_list_remove_list(desc^.list, node);
  Result := EINA_TRUE;
end;

function eina_value_list_vset(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_vset(desc^.subtype, mem, args);
end;

function eina_value_list_vget(const value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_list_vinsert(value: PEina_Value; position: Cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  rel_node: PEina_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  if (desc^.list = nil) and (position = 0) then
    node := desc^.list := eina_list_append(nil, Pointer(1)) // Use Pointer(1) as sentinel
  else if position = 0 then
    node := desc^.list := eina_list_prepend(desc^.list, Pointer(1))
  else
  begin
    rel_node := eina_list_nth_list(desc^.list, position - 1);
    if rel_node = nil then Exit(EINA_FALSE);
    desc^.list := eina_list_append_relative_list(desc^.list, Pointer(1), rel_node);
    node := rel_node^.next; // In C, this is 'rel->next'
  end;
  if node = nil then Exit(EINA_FALSE);
  if node^.data <> Pointer(1) then Exit(EINA_FALSE); // Check if sentinel is correctly set

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then
  begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then
  begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_setup
  end;
  if not eina_value_type_vset(desc^.subtype, mem, args) then
  begin
    eina_value_type_flush(desc^.subtype, mem);
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_set
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_vappend(value: PEina_Value; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  desc^.list := eina_list_append(desc^.list, Pointer(1)); // Use Pointer(1) as sentinel
  node := eina_list_last(desc^.list);
  if node = nil then Exit(EINA_FALSE);
  if node^.data <> Pointer(1) then Exit(EINA_FALSE);

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then
  begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then
  begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_setup
  end;
  if not eina_value_type_vset(desc^.subtype, mem, args) then
  begin
    eina_value_type_flush(desc^.subtype, mem);
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_set
  end;
  Result := EINA_TRUE;
end;

// Variadic argument stubs for list functions
function eina_value_list_set(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vset(value, position, nil); // Placeholder
end;

function eina_value_list_get(const value: PEina_Value; position: Cardinal; var args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vget(value, position, nil); // Placeholder
end;

function eina_value_list_insert(value: PEina_Value; position: Cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vinsert(value, position, nil); // Placeholder
end;

function eina_value_list_append(value: PEina_Value; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vappend(value, nil); // Placeholder
end;


function eina_value_list_pset(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_pset(desc^.subtype, mem, ptr);
end;

function eina_value_list_pget(const value: PEina_Value; position: Cardinal; ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then
    Exit(EINA_FALSE);

  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_list_pinsert(value: PEina_Value; position: Cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  rel_node: PEina_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  if desc^.list = nil then
    node := desc^.list := eina_list_append(nil, Pointer(1))
  else if position = 0 then
    node := desc^.list := eina_list_prepend(desc^.list, Pointer(1))
  else
  begin
    rel_node := eina_list_nth_list(desc^.list, position - 1);
    desc^.list := eina_list_append_relative_list(desc^.list, Pointer(1), rel_node);
    node := rel_node^.next;
  end;
  if node = nil then Exit(EINA_FALSE);
  if node^.data <> Pointer(1) then Exit(EINA_FALSE);

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then
  begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then
  begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc^.subtype, mem, ptr) then
  begin
    eina_value_type_flush(desc^.subtype, mem);
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  desc^.list := eina_list_append(desc^.list, Pointer(1));
  node := eina_list_last(desc^.list);
  if node = nil then Exit(EINA_FALSE);
  if node^.data <> Pointer(1) then Exit(EINA_FALSE);

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then
  begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then
  begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc^.subtype, mem, ptr) then
  begin
    eina_value_type_flush(desc^.subtype, mem);
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

// Eina_Value_Hash functions
function EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  if not (value^.typ = EINA_VALUE_TYPE_HASH) then
  begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_hash_setup(value: PEina_Value; const subtype: PEina_Value_Type; buckets_power_size: Cardinal): TEina_Bool;
var
  desc: TEina_Value_Hash;
begin
  desc.subtype := subtype;
  desc.buckets_power_size := buckets_power_size;
  desc.hash := nil;

  if not eina_value_setup(value, EINA_VALUE_TYPE_HASH) then
    Exit(EINA_FALSE);
  if not eina_value_pset(value, @desc) then
  begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_hash_population(const value: PEina_Value): Cardinal;
var
  desc: PEina_Value_Hash;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, 0) then Exit(0);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(0);
  if desc^.hash <> nil then
    Result := eina_hash_population(desc^.hash)
  else
    Result := 0;
end;

function eina_value_hash_del(value: PEina_Value; const key: PAnsiChar): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if key = nil then Exit(EINA_FALSE);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then
    Exit(EINA_FALSE);

  eina_value_type_flush(desc^.subtype, mem);
  FreeMem(mem);
  eina_hash_del_by_key(desc^.hash, key);
  Result := EINA_TRUE;
end;

function eina_value_hash_vset(value: PEina_Value; const key: PAnsiChar; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if key = nil then Exit(EINA_FALSE);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then
  begin
    mem := AllocMem(desc^.subtype^.value_size);
    if mem = nil then Exit(EINA_FALSE);
    if not eina_hash_add(desc^.hash, key, mem) then
    begin
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
    if not eina_value_type_setup(desc^.subtype, mem) then
    begin
      eina_value_type_flush(desc^.subtype, mem);
      eina_hash_del_by_key(desc^.hash, key);
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
  end;

  Result := eina_value_type_vset(desc^.subtype, mem, args);
end;

function eina_value_hash_vget(const value: PEina_Value; const key: PAnsiChar; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if key = nil then Exit(EINA_FALSE);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

// Variadic argument stubs for hash functions
function eina_value_hash_set(value: PEina_Value; const key: PAnsiChar; const args: array of const): TEina_Bool;
begin
  Result := eina_value_hash_vset(value, key, nil); // Placeholder
end;

function eina_value_hash_get(const value: PEina_Value; const key: PAnsiChar; var args: array of const): TEina_Bool;
begin
  Result := eina_value_hash_vget(value, key, nil); // Placeholder
end;

function eina_value_hash_pset(value: PEina_Value; const key: PAnsiChar; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if key = nil then Exit(EINA_FALSE);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then
  begin
    mem := AllocMem(desc^.subtype^.value_size);
    if mem = nil then Exit(EINA_FALSE);
    if not eina_hash_add(desc^.hash, key, mem) then
    begin
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
    if not eina_value_type_setup(desc^.subtype, mem) then
    begin
      eina_value_type_flush(desc^.subtype, mem);
      eina_hash_del_by_key(desc^.hash, key);
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
  end;

  Result := eina_value_type_pset(desc^.subtype, mem, ptr);
end;

function eina_value_hash_pget(const value: PEina_Value; const key: PAnsiChar; ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if key = nil then Exit(EINA_FALSE);
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then
    Exit(EINA_FALSE);

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then
    Exit(EINA_FALSE);

  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

// Eina_Value_Struct functions
function EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  if not (value^.typ = EINA_VALUE_TYPE_STRUCT) then
  begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_setup(value: PEina_Value; const sdesc: PEina_Value_Struct_Desc): TEina_Bool;
var
  desc: TEina_Value_Struct;
begin
  desc.desc := sdesc;
  desc.memory := nil; // Initialized to NULL in C (will be allocated later)

  if not eina_value_setup(value, EINA_VALUE_TYPE_STRUCT) then
    Exit(EINA_FALSE);
  if not eina_value_pset(value, @desc) then
  begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_desc_get(const value: PEina_Value): PEina_Value_Struct_Desc;
var
  st: PEina_Value_Struct;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, nil) then Exit(nil);
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if (st = nil) or (st^.desc = nil) then
    Exit(nil);
  if not (st^.desc^.version = EINA_VALUE_STRUCT_DESC_VERSION) then Exit(nil);
  Result := st^.desc;
end;

function eina_value_struct_member_memory_get(const st: PEina_Value_Struct; const member: PEina_Value_Struct_Member): Pointer;
var
  base: PByte;
begin
  base := PByte(st^.memory);
  if base = nil then Exit(nil);
  Result := PByte(Integer(base) + member^.offset);
end;

function eina_value_struct_vset(value: PEina_Value; const name: PAnsiChar; args: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_vset(member^.typ, mem, args);
end;

function eina_value_struct_vget(const value: PEina_Value; const name: PAnsiChar; args: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(member^.typ, mem, ptr);
  Result := ret;
end;

// Variadic argument stubs for struct functions
function eina_value_struct_set(value: PEina_Value; const name: PAnsiChar; const args: array of const): TEina_Bool;
begin
  Result := eina_value_struct_vset(value, name, nil); // Placeholder
end;

function eina_value_struct_get(const value: PEina_Value; const name: PAnsiChar; var args: array of const): TEina_Bool;
begin
  Result := eina_value_struct_vget(value, name, nil); // Placeholder
end;


function eina_value_struct_pset(value: PEina_Value; const name: PAnsiChar; const ptr: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  if ptr = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_pset(member^.typ, mem, ptr);
end;

function eina_value_struct_pget(const value: PEina_Value; const name: PAnsiChar; ptr: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  if ptr = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  ret := eina_value_type_pget(member^.typ, mem, ptr);
  Result := ret;
end;

function eina_value_struct_value_get(const src: PEina_Value; const name: PAnsiChar; dst: PEina_Value): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  if dst = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(src));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);
  if not eina_value_setup(dst, member^.typ) then
    Exit(EINA_FALSE);
  if not eina_value_pset(dst, mem) then
  begin
    eina_value_flush(dst);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_value_set(dst: PEina_Value; const name: PAnsiChar; const src: PEina_Value): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ptr: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(dst, EINA_FALSE) then Exit(EINA_FALSE);
  if name = nil then Exit(EINA_FALSE);
  if src = nil then Exit(EINA_FALSE);

  st := PEina_Value_Struct(eina_value_memory_get(dst));
  if st = nil then
    Exit(EINA_FALSE);
  member := eina_value_struct_member_find(st, name);
  if member = nil then
    Exit(EINA_FALSE);
  if not (src^.typ = member^.typ) then Exit(EINA_FALSE);

  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := eina_value_memory_get(src);
  if ptr = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_pset(member^.typ, mem, ptr);
end;

function eina_value_struct_member_value_get(const src: PEina_Value; const member: PEina_Value_Struct_Member; dst: PEina_Value): TEina_Bool;
var
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then Exit(EINA_FALSE);
  if member = nil then Exit(EINA_FALSE);
  if dst = nil then Exit(EINA_FALSE);
  st := PEina_Value_Struct(eina_value_memory_get(src));
  if st = nil then
    Exit(EINA_FALSE);
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);
  if not eina_value_setup(dst, member^.typ) then
    Exit(EINA_FALSE);
  if not eina_value_pset(dst, mem) then
  begin
    eina_value_flush(dst);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_member_value_set(dst: PEina_Value; const member: PEina_Value_Struct_Member; const src: PEina_Value): TEina_Bool;
var
  st: PEina_Value_Struct;
  mem: Pointer;
  ptr: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(dst, EINA_FALSE) then Exit(EINA_FALSE);
  if member = nil then Exit(EINA_FALSE);
  if src = nil then Exit(EINA_FALSE);

  st := PEina_Value_Struct(eina_value_memory_get(dst));
  if st = nil then
    Exit(EINA_FALSE);
  if not (src^.typ = member^.typ) then Exit(EINA_FALSE);

  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then
    Exit(EINA_FALSE);

  ptr := eina_value_memory_get(src);
  if ptr = nil then
    Exit(EINA_FALSE);

  Result := eina_value_type_pset(member^.typ, mem, ptr);
end;

// Eina_Value_Optional functions
function EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then
  begin
    Result := retval;
    Exit;
  end;
  // This check is a bit tricky from C. It checks if value->type->setup is the same as EINA_VALUE_TYPE_OPTIONAL->setup.
  // We'll approximate this by checking if the type itself is EINA_VALUE_TYPE_OPTIONAL.
  if not (value^.typ = EINA_VALUE_TYPE_OPTIONAL) then
  begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_optional_empty_new: PEina_Value;
begin
  Result := eina_value_new(EINA_VALUE_TYPE_OPTIONAL);
end;

function eina_value_optional_empty_is(const value: PEina_Value; is_empty: PBoolean): TEina_Bool;
var
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then Exit(EINA_FALSE);
  if is_empty = nil then Exit(EINA_FALSE);

  mem := eina_value_memory_get(value);
  if mem = nil then
    Exit(EINA_FALSE);

  // This logic is platform-dependent due to `sizeof(void*)` vs `sizeof(Eina_Value_Union)`
  // Simulating the C behavior:
  if 2 * SizeOf(Pointer) <= SizeOf(Eina_Value_Union) then
  begin
    var opt: PEina_Value_Optional_Outer;
    opt := PEina_Value_Optional_Outer(mem);
    is_empty^ := (opt^.subtype = nil);
  end
  else
  begin
    // This case refers to `*(void**)mem` which is typically for smaller internal storage.
    // Assuming `mem` directly holds a pointer to `Eina_Value_Optional_Inner` (or nil)
    is_empty^ := (PPointer(mem)^ = nil);
  end;
  Result := EINA_TRUE;
end;

function eina_value_optional_type_get(value: PEina_Value): PEina_Value_Type;
var
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value, nil) then Exit(nil);

  mem := eina_value_memory_get(value);
  if mem = nil then
    Exit(nil);

  if 2 * SizeOf(Pointer) <= SizeOf(Eina_Value_Union) then
  begin
    var opt: PEina_Value_Optional_Outer;
    opt := PEina_Value_Optional_Outer(mem);
    Result := opt^.subtype;
  end
  else
  begin
    var opt_inner_ptr: PEina_Value_Optional_Inner;
    opt_inner_ptr := PEina_Value_Optional_Inner(PPointer(mem)^); // Get the pointer to the inner struct
    if opt_inner_ptr = nil then
      Result := nil
    else
      Result := opt_inner_ptr^.subtype;
  end;
end;

// Implementations for the generic eina_value_type_* functions
function eina_value_type_setup(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.setup = nil then Exit(EINA_FALSE);
  Result := typ^.setup(typ, mem);
end;

function eina_value_type_flush(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.flush = nil then Exit(EINA_FALSE);
  Result := typ^.flush(typ, mem);
end;

function eina_value_type_copy(const typ: PEina_Value_Type; src, dst: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.copy = nil then Exit(EINA_FALSE);
  Result := typ^.copy(typ, src, dst);
end;

function eina_value_type_compare(const typ: PEina_Value_Type; a, b: Pointer): Integer;
begin
  if not eina_value_type_check(typ) then Exit(0); // C returns 0 on error
  if typ^.compare = nil then Exit(0);
  Result := typ^.compare(typ, a, b);
end;

function eina_value_type_convert_to(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.convert_to = nil then Exit(EINA_FALSE);
  Result := typ^.convert_to(typ, convert, type_mem, convert_mem);
end;

function eina_value_type_convert_from(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.convert_from = nil then Exit(EINA_FALSE);
  Result := typ^.convert_from(typ, convert, type_mem, convert_mem);
end;

function eina_value_type_vset(const typ: PEina_Value_Type; mem: Pointer; args: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.vset = nil then Exit(EINA_FALSE);
  Result := typ^.vset(typ, mem, args);
end;

function eina_value_type_pset(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.pset = nil then Exit(EINA_FALSE);
  Result := typ^.pset(typ, mem, ptr);
end;

function eina_value_type_pget(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then Exit(EINA_FALSE);
  if typ^.pget = nil then Exit(EINA_FALSE);
  Result := typ^.pget(typ, mem, ptr);
end;

end.


