unit eina_inline_value;

interface

uses
  efl,
  fp_eina,
  eina_inline_list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  _EINA_VALUE_TYPE_BASICS_START: PEina_Value_Type; cvar;external libeina;
  _EINA_VALUE_TYPE_BASICS_END: PEina_Value_Type; cvar;external libeina;

function eina_value_memory_get(value: PEina_Value): Pointer;

function eina_value_inner_alloc(size: Tsize_t): Pointer; cdecl; external libecore;
procedure eina_value_inner_free(size: Tsize_t; mem: Pointer); cdecl; external libecore;

function eina_value_setup(value: PEina_Value; const typ: PEina_Value_Type): TEina_Bool;
procedure eina_value_flush(value: PEina_Value);
function eina_value_compare(const a, b: PEina_Value): integer;

function eina_value_set(value: PEina_Value; args: Pointer): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_get(value: PEina_Value; args: PPointer): TEina_Bool; overload;  // Placeholder for variadic

function eina_value_vset(value: PEina_Value; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_vget(value: PEina_Value; args: PPointer): TEina_Bool;  // args is va_list
function eina_value_pset(value: PEina_Value;  ptr: Pointer): TEina_Bool;
function eina_value_pget( value: PEina_Value; ptr: Pointer): TEina_Bool;

function eina_value_type_get(const value: PEina_Value): PEina_Value_Type;

// Eina_Value_Array
function eina_value_array_setup(value: PEina_Value; const subtype: PEina_Value_Type; step: cardinal): TEina_Bool;
function eina_value_array_count(const value: PEina_Value): cardinal;
function eina_value_array_remove(value: PEina_Value; position: cardinal): TEina_Bool;
function eina_value_array_vset(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_array_vget(const value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_array_vinsert(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_array_vappend(value: PEina_Value; args: Pointer): TEina_Bool;  // args is va_list

function eina_value_array_set(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_array_get(const value: PEina_Value; position: cardinal; var args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_array_insert(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_array_append(value: PEina_Value; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic

function eina_value_array_pset(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
function eina_value_array_pget(const value: PEina_Value; position: cardinal; ptr: Pointer): TEina_Bool;
function eina_value_array_pinsert(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
function eina_value_array_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool;
function eina_value_array_value_get(const src: PEina_Value; position: cardinal; dst: PEina_Value): TEina_Bool;

// Eina_Value_List
function eina_value_list_node_memory_get(const typ: PEina_Value_Type; const node: PEina_List): Pointer;
function eina_value_list_node_memory_setup(const typ: PEina_Value_Type; node: PEina_List): Pointer;
procedure eina_value_list_node_memory_flush(const typ: PEina_Value_Type; node: PEina_List);
function eina_value_list_setup(value: PEina_Value; const subtype: PEina_Value_Type): TEina_Bool;
function eina_value_list_count(const value: PEina_Value): cardinal;
function eina_value_list_remove(value: PEina_Value; position: cardinal): TEina_Bool;
function eina_value_list_vset(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_list_vget(const value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_list_vinsert(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_list_vappend(value: PEina_Value; args: Pointer): TEina_Bool;  // args is va_list

function eina_value_list_set(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_list_get(const value: PEina_Value; position: cardinal; var args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_list_insert(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_list_append(value: PEina_Value; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic

function eina_value_list_pset(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
function eina_value_list_pget(const value: PEina_Value; position: cardinal; ptr: Pointer): TEina_Bool;
function eina_value_list_pinsert(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
function eina_value_list_pappend(value: PEina_Value; const ptr: Pointer): TEina_Bool;

// Eina_Value_Hash
function eina_value_hash_setup(value: PEina_Value; const subtype: PEina_Value_Type; buckets_power_size: cardinal): TEina_Bool;
function eina_value_hash_population(const value: PEina_Value): cardinal;
function eina_value_hash_del(value: PEina_Value; const key: pansichar): TEina_Bool;
function eina_value_hash_vset(value: PEina_Value; const key: pansichar; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_hash_vget(const value: PEina_Value; const key: pansichar; args: Pointer): TEina_Bool;  // args is va_list

function eina_value_hash_set(value: PEina_Value; const key: pansichar; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_hash_get(const value: PEina_Value; const key: pansichar; var args: array of const): TEina_Bool; overload;  // Placeholder for variadic

function eina_value_hash_pset(value: PEina_Value; const key: pansichar; const ptr: Pointer): TEina_Bool;
function eina_value_hash_pget(const value: PEina_Value; const key: pansichar; ptr: Pointer): TEina_Bool;

// Eina_Value_Struct
function eina_value_struct_member_find(st: PEina_Value_Struct; name: pansichar): PEina_Value_Struct_Member; cdecl; external libecore;

function eina_value_struct_setup(value: PEina_Value; const sdesc: PEina_Value_Struct_Desc): TEina_Bool;
function eina_value_struct_desc_get(const value: PEina_Value): PEina_Value_Struct_Desc;
function eina_value_struct_member_memory_get(const st: PEina_Value_Struct; const member: PEina_Value_Struct_Member): Pointer;
function eina_value_struct_vset(value: PEina_Value; const name: pansichar; args: Pointer): TEina_Bool;  // args is va_list
function eina_value_struct_vget(const value: PEina_Value; const name: pansichar; args: Pointer): TEina_Bool;  // args is va_list

function eina_value_struct_set(value: PEina_Value; const name: pansichar; const args: array of const): TEina_Bool; overload;  // Placeholder for variadic
function eina_value_struct_get(const value: PEina_Value; const name: pansichar; var args: array of const): TEina_Bool; overload;  // Placeholder for variadic

function eina_value_struct_pset(value: PEina_Value; const name: pansichar; const ptr: Pointer): TEina_Bool;
function eina_value_struct_pget(const value: PEina_Value; const name: pansichar; ptr: Pointer): TEina_Bool;
function eina_value_struct_value_get(const src: PEina_Value; const name: pansichar; dst: PEina_Value): TEina_Bool;
function eina_value_struct_value_set(dst: PEina_Value; const name: pansichar; const src: PEina_Value): TEina_Bool;
function eina_value_struct_member_value_get(const src: PEina_Value; const member: PEina_Value_Struct_Member; dst: PEina_Value): TEina_Bool;
function eina_value_struct_member_value_set(dst: PEina_Value; const member: PEina_Value_Struct_Member; const src: PEina_Value): TEina_Bool;


// Eina_Value_Optional
function eina_value_optional_empty_new: PEina_Value;
function eina_value_optional_empty_is(const value: PEina_Value; is_empty: PBoolean): TEina_Bool;
function eina_value_optional_type_get(value: PEina_Value): PEina_Value_Type;

// Eina_Value_Type
function eina_value_type_setup(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
function eina_value_type_flush(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
function eina_value_type_copy(const typ: PEina_Value_Type; src, dst: Pointer): TEina_Bool;
function eina_value_type_compare(const typ: PEina_Value_Type; a, b: Pointer): integer;
function eina_value_type_convert_to(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
function eina_value_type_convert_from(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
function eina_value_type_vset(const typ: PEina_Value_Type; mem: Pointer; args: Pointer): TEina_Bool;  // va_list as Pointer
function eina_value_type_pset(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;
function eina_value_type_pget(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;






implementation

function eina_value_set(value: PEina_Value; args: Pointer): TEina_Bool;
begin
  Result := eina_value_vset(value, args);
end;

function eina_value_get(value: PEina_Value; args: PPointer): TEina_Bool;
begin
  Result := eina_value_vget(value, args);
end;

function eina_value_memory_get(value: PEina_Value): Pointer;
begin
  if value^._type^.value_size <= 8 then begin
    Result := Pointer(value^.value.buf);
  end else begin
    Result := value^.value.ptr;
  end;
end;

// EINA_VALUE_TYPE_DEFAULT(type) macro
function EINA_VALUE_TYPE_DEFAULT_IMPL(const typ: PEina_Value_Type): TEina_Bool;
begin
  if (typ <> nil) and (_EINA_VALUE_TYPE_BASICS_START <> nil) and (_EINA_VALUE_TYPE_BASICS_END <> nil) then begin
    Result := (typ >= _EINA_VALUE_TYPE_BASICS_START) and (typ <= _EINA_VALUE_TYPE_BASICS_END);
  end else begin
    Result := EINA_FALSE;
  end;
end;

// EINA_VALUE_TYPE_CHECK_RETURN_VAL(value, retval) macro
function EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: longint): longint;
begin
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  if not eina_value_type_check(value^._type) then begin
    Result := retval;
    Exit;
  end;
  Result := 1; // Placeholder for success if checks pass
end;

// EINA_VALUE_TYPE_DISPATCH_RETURN macro (simplified for Pascal)
// This translates to checking for nil method pointers and calling if present.
function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_SETUP(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.setup <> nil) then begin
    Result := typ^.setup(typ, mem);
  end else begin
    Result := def_ret;
  end;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_COMPARE(const typ: PEina_Value_Type; def_ret: integer; pa, pb: Pointer): integer;
begin
  if (typ <> nil) and (typ^.compare <> nil) then begin
    Result := typ^.compare(typ, pa, pb);
  end else begin
    Result := def_ret;
  end;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem, ptr: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.pget <> nil) then begin
    Result := typ^.pget(typ, mem, ptr);
  end else begin
    Result := def_ret;
  end;
end;

function EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PSET(const typ: PEina_Value_Type; def_ret: TEina_Bool; mem, ptr: Pointer): TEina_Bool;
begin
  if (typ <> nil) and (typ^.pset <> nil) then begin
    Result := typ^.pset(typ, mem, ptr);
  end else begin
    Result := def_ret;
  end;
end;

// EINA_VALUE_TYPE_DISPATCH macro (simplified for Pascal)
procedure EINA_VALUE_TYPE_DISPATCH_IMPL_FLUSH(const typ: PEina_Value_Type; mem: Pointer);
begin
  if (typ <> nil) and (typ^.flush <> nil) then begin
    typ^.flush(typ, mem);
  end;
end;


function eina_value_setup(value: PEina_Value; const typ: PEina_Value_Type): TEina_Bool;
var
  mem: Pointer;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if not (typ^.value_size > 0) then begin
    Exit(EINA_FALSE);
  end;

  value^._type := typ;

  if typ^.value_size <= 8 then begin
    mem := @value^.value.buf;
  end else begin
    mem := eina_value_inner_alloc(typ^.value_size);
    value^.value.ptr := mem;
    if mem = nil then begin
      Exit(EINA_FALSE);
    end;
  end;

  FillChar(mem^, typ^.value_size, 0);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then begin
    Exit(EINA_TRUE);
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(type, setup, 0, EINA_FALSE, mem);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_SETUP(typ, EINA_FALSE, mem);
end;

procedure eina_value_flush(value: PEina_Value);
var
  typ: PEina_Value_Type;
  mem: Pointer;
begin
  if (value = nil) or (value^._type = nil) then begin
    Exit;
  end;
  // EINA_VALUE_TYPE_CHECK_RETURN(value); // Assuming it exits if check fails

  typ := value^._type;
  mem := eina_value_memory_get(value);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then begin
    if typ = EINA_VALUE_TYPE_STRINGSHARE then begin
      if value^.value.ptr <> nil then begin
        eina_stringshare_del(pansichar(value^.value.ptr));
      end;
    end else if typ = EINA_VALUE_TYPE_STRING then begin
      if value^.value.ptr <> nil then begin
        FreeMem(value^.value.ptr);
        value^.value.ptr := nil;
      end;
    end else if typ^.value_size > 8 then begin
      eina_value_inner_free(typ^.value_size, mem);
    end;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH(type, flush, 0, mem);
  EINA_VALUE_TYPE_DISPATCH_IMPL_FLUSH(typ, mem);
  if typ^.value_size > 8 then begin
    eina_value_inner_free(typ^.value_size, mem);
  end;
  value^._type := nil;
end;

function eina_value_compare(const a, b: PEina_Value): integer;
var
  typ: PEina_Value_Type;
  pa, pb: Pointer;
  sa, sb: pchar;
begin
  if EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(a, -1) = 0 then begin
    Exit(-1);
  end;
  if b = nil then begin
    Exit(-1);
  end;
  if not (a^._type = b^._type) then begin
    Exit(-1);
  end;

  typ := a^._type;
  pa := eina_value_memory_get(a);
  pb := eina_value_memory_get(b);

  {$IFNDEF EINA_VALUE_NO_OPTIMIZE}
  if typ = EINA_VALUE_TYPE_UCHAR then begin
    if PCardinal(pa)^ < PCardinal(pb)^ then begin
      Result := -1;
    end else if PCardinal(pa)^ > PCardinal(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_USHORT then begin
    if PCardinal(pa)^ < PCardinal(pb)^ then begin
      Result := -1;
    end else if PCardinal(pa)^ > PCardinal(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_UINT then begin
    if PCardinal(pa)^ < PCardinal(pb)^ then begin
      Result := -1;
    end else if PCardinal(pa)^ > PCardinal(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if (typ = EINA_VALUE_TYPE_ULONG) or (typ = EINA_VALUE_TYPE_TIMESTAMP) then begin
    if PCardinal(pa)^ < PCardinal(pb)^ then begin
      Result := -1;
    end else if PCardinal(pa)^ > PCardinal(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_UINT64 then begin
    if PUInt64(pa)^ < PUInt64(pb)^ then begin
      Result := -1;
    end else if PUInt64(pa)^ > PUInt64(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_CHAR then begin
    if PUInt8(pa)^ < PUInt8(pb)^ then begin
      Result := -1;
    end else if PUInt8(pa)^ > PUInt8(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_SHORT then begin
    if PSmallint(pa)^ < PSmallint(pb)^ then begin
      Result := -1;
    end else if PSmallint(pa)^ > PSmallint(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_INT then begin
    if PInteger(pa)^ < PInteger(pb)^ then begin
      Result := -1;
    end else if PInteger(pa)^ > PInteger(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_LONG then begin
    if PLongint(pa)^ < PLongint(pb)^ then begin
      Result := -1;
    end else if PLongint(pa)^ > PLongint(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_INT64 then begin
    if PInt64(pa)^ < PInt64(pb)^ then begin
      Result := -1;
    end else if PInt64(pa)^ > PInt64(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_FLOAT then begin
    if PSingle(pa)^ < PSingle(pb)^ then begin
      Result := -1;
    end else if PSingle(pa)^ > PSingle(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if typ = EINA_VALUE_TYPE_DOUBLE then begin
    if PDouble(pa)^ < PDouble(pb)^ then begin
      Result := -1;
    end else if PDouble(pa)^ > PDouble(pb)^ then begin
      Result := 1;
    end else begin
      Result := 0;
    end;
    Exit;
  end else if (typ = EINA_VALUE_TYPE_STRINGSHARE) or (typ = EINA_VALUE_TYPE_STRING) then begin
    // Assuming PAnsiChar is the correct representation for char*
    //    var sa: PAnsiChar;
    //    var sb: PAnsiChar;
    sa := PPChar(pa)^;
    sb := PPChar(pb)^;

    if sa = sb then begin
      Result := 0;
    end else if sa = nil then begin
      Result := -1;
    end else if sb = nil then begin
      Result := 1;
    end else begin
      Result := strcmp(sa, sb);
    end;
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
  r: TEina_Bool=EINA_FALSE;
  str: pansichar;
begin
  if EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0) = 0 then begin
    Exit(EINA_FALSE);
  end;

  typ := value^._type;
  mem := eina_value_memory_get(value);

  WriteLn('xxx ',PtrUInt(mem));


  {$IFNDEF EINA_VALUE_NO_OPTIMIZE}
  if typ = EINA_VALUE_TYPE_UCHAR then begin
    PCardinal(mem)^ := PCardinal(args)^; // Expecting args to point to an unsigned int
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_USHORT then begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_UINT then begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if (typ = EINA_VALUE_TYPE_ULONG) or (typ = EINA_VALUE_TYPE_TIMESTAMP) then begin
    PCardinal(mem)^ := PCardinal(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_UINT64 then begin
    PUInt64(mem)^ := PUInt64(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_CHAR then begin
    PUInt8(mem)^ := PUInt8(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_SHORT then begin
    PSmallint(mem)^ := PSmallint(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_INT then begin
    WriteLn(1111111111111);

//    tmem^:=PtrUInt( args);

//  PInteger( mem)^:=PInteger( args)^;

  PtrUInt(mem):=1234;

  WriteLn(22222222222222);


   WriteLn('args: ',PtrUInt(args));
   WriteLn('mem: ',PtrUInt(mem));
    WriteLn('ptr: ',PtrUInt(value^.value.ptr));

//    value^.value.ptr:=Pointer(args);
//    WriteLn('args: ',PtrUInt(args));
//    tmem:=PInteger(mem);
//    tmem^:=Integer(args);

//    PInteger(mem)^ := PInteger(args)^;

//    PInteger(mem)^ := PInteger(args)^;
    WriteLn(22222222222222);
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_LONG then begin
    PLongint(mem)^ := PLongint(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_INT64 then begin
    PInt64(mem)^ := PInt64(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_FLOAT then begin
    PSingle(mem)^ := PSingle(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_DOUBLE then begin
    PDouble(mem)^ := PDouble(args)^;
    Result := EINA_TRUE;
    Exit;
  end else if typ = EINA_VALUE_TYPE_STRINGSHARE then begin
    //    Result := eina_stringshare_replace(PAnsiChar(@value^.value.ptr), PAnsiChar(PPointer(args)^));
    Exit;
  end else if typ = EINA_VALUE_TYPE_STRING then begin
    //    var str: PAnsiChar;
    str := pansichar(PPointer(args)^);
    if value^.value.ptr = str then begin
      Exit(EINA_TRUE);
    end;
    if str = nil then begin
      FreeMem(value^.value.ptr);
      value^.value.ptr := nil;
    end else begin
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
  r := EINA_FALSE;
  if (typ <> nil) and (typ^.vset <> nil) then begin
    r := typ^.vset(typ, mem, args);
  end;

  Result := r;
end;

function eina_value_vget(value: PEina_Value; args: PPointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
  ptr: Pointer;
begin
  if EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0) = 0 then begin
    Exit(EINA_FALSE);
  end;

  typ := value^._type;
  mem := eina_value_memory_get(value);

  ptr := PPointer(args)^; // Extract the target pointer from args (simulating va_arg(args, void*))

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then begin
    args^:=mem;

    WriteLn('vget: ', PtrUInt(mem));
    WriteLn('vget: ', PtrUInt(value^.value.ptr));

//    Move(mem^, ptr^, typ^.value_size);
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pget, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(typ, EINA_FALSE, mem, ptr);
end;


function eina_value_pset(value: PEina_Value; ptr: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
  str: pansichar;
begin
  if EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0) = 0 then begin
    Exit(EINA_FALSE);
  end;
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;

  typ := value^._type;
  mem := eina_value_memory_get(value);

  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then begin
    if typ = EINA_VALUE_TYPE_STRINGSHARE then begin
      // C: const char *str = *((const char * const *) ptr);
      //      var str: PAnsiChar;
      str := pansichar(PPointer(ptr)^);
      //      Result := eina_stringshare_replace(PAnsiChar(@value^.value.ptr), str);
      Exit;
    end else if typ = EINA_VALUE_TYPE_STRING then begin
      // C: const char *str = *((const char * const *) ptr);
      //      var str: PAnsiChar;
      str := pansichar(PPointer(ptr)^);
      if value^.value.ptr = str then begin
        Exit(EINA_TRUE);
      end;
      if str = nil then begin
        FreeMem(value^.value.ptr);
        value^.value.ptr := nil;
      end else begin
        //       var tmp: PAnsiChar;
        //        tmp := StrDup(str);
        //        if tmp = nil then Exit(EINA_FALSE);
        FreeMem(value^.value.ptr);
        //        value^.value.ptr := tmp;
      end;
      Result := EINA_TRUE;
      Exit;
    end else begin
      Move(ptr^, mem^, typ^.value_size);
    end;
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pset, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PSET(typ, EINA_FALSE, mem, ptr);
end;

function eina_value_pget(value: PEina_Value; ptr: Pointer): TEina_Bool;
var
  typ: PEina_Value_Type;
  mem: Pointer;
begin
  if EINA_VALUE_TYPE_CHECK_RETURN_VAL_IMPL(value, 0) = 0 then begin
    Exit(EINA_FALSE);
  end;
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;

  typ := value^._type;
  mem := eina_value_memory_get(value);
  if EINA_VALUE_TYPE_DEFAULT_IMPL(typ) then begin
    Move(mem^, ptr^, typ^.value_size);
    Result := EINA_TRUE;
    Exit;
  end;

  // EINA_VALUE_TYPE_DISPATCH_RETURN(value, pget, 0, EINA_FALSE, mem, ptr);
  Result := EINA_VALUE_TYPE_DISPATCH_RETURN_IMPL_PGET(typ, EINA_FALSE, mem, ptr);
end;

function eina_value_type_get(const value: PEina_Value): PEina_Value_Type;
begin
  if value = nil then begin
    Exit(nil);
  end;
  // C: EINA_SAFETY_ON_FALSE_RETURN_VAL(eina_value_type_check(value->type), NULL);
  // This check is implicitly handled by `eina_value_type_check` in C, but here we explicitly check
  // value.value._guarantee if value.typ is nil, as per C's intent.
  if (value^._type = nil) and (value^.value._guarantee <> 0) then // This is a heuristic for _guarantee
  begin
    if not eina_value_type_check(value^._type) then begin
      Exit(nil);
    end;
  end;
  Result := value^._type;
end;

// Eina_Value_Array functions
function EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_ARRAY) then begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_setup(value: PEina_Value; const subtype: PEina_Value_Type; step: cardinal): TEina_Bool;
var
  desc: TEina_Value_Array;
begin
  desc.subtype := subtype;
  desc.step := step;
  desc.arr := nil; // Initialized to NULL in C

  if not eina_value_setup(value, EINA_VALUE_TYPE_ARRAY) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(value, @desc) then begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_count(const value: PEina_Value): cardinal;
var
  desc: TEina_Value_Array;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(0);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(0);
  end;
  if desc.arr <> nil then begin
    Result := eina_inarray_count(desc.arr);
  end else begin
    Result := 0;
  end;
end;

function eina_value_array_remove(value: PEina_Value; position: cardinal): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  eina_value_type_flush(desc.subtype, mem);
  Result := eina_inarray_remove_at(desc.arr, position);
end;

function eina_value_array_vset(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_vset(desc.subtype, mem, args);
end;

function eina_value_array_vget(const value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  if position >= eina_inarray_count(desc.arr) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_array_vinsert(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc.subtype, mem) then begin
    eina_inarray_remove_at(desc.arr, position); // goto error_setup
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_vset(desc.subtype, mem, args) then begin
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
  position: cardinal;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  position := eina_inarray_count(desc.arr);
  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc.subtype, mem) then begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_vset(desc.subtype, mem, args) then begin
    eina_value_type_flush(desc.subtype, mem);
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

// Variadic argument stubs for array functions
function eina_value_array_set(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vset(value, position, nil); // Placeholder
end;

function eina_value_array_get(const value: PEina_Value; position: cardinal; var args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vget(value, position, nil); // Placeholder
end;

function eina_value_array_insert(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vinsert(value, position, nil); // Placeholder
end;

function eina_value_array_append(value: PEina_Value; const args: array of const): TEina_Bool;
begin
  Result := eina_value_array_vappend(value, nil); // Placeholder
end;

function eina_value_array_pset(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_pset(desc.subtype, mem, ptr);
end;

function eina_value_array_pget(const value: PEina_Value; position: cardinal; ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_nth(desc.arr, position);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ret := eina_value_type_pget(desc.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_array_pinsert(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: TEina_Value_Array;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc.subtype, mem) then begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc.subtype, mem, ptr) then begin
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
  position: cardinal;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pget(value, @desc) then begin
    Exit(EINA_FALSE);
  end;

  position := eina_inarray_count(desc.arr);
  mem := eina_inarray_alloc_at(desc.arr, position, 1);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc.subtype, mem) then begin
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc.subtype, mem, ptr) then begin
    eina_value_type_flush(desc.subtype, mem);
    eina_inarray_remove_at(desc.arr, position);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_array_value_get(const src: PEina_Value; position: cardinal; dst: PEina_Value): TEina_Bool;
var
  desc: TEina_Value_Array;
begin
  if not EINA_VALUE_TYPE_ARRAY_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if dst = nil then begin
    Exit(EINA_FALSE);
  end;

  if not eina_value_pget(src, @desc) then begin
    Exit(EINA_FALSE);
  end;
  if position >= eina_inarray_count(desc.arr) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_setup(dst, desc.subtype) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(dst, eina_inarray_nth(desc.arr, position)) then begin
    eina_value_flush(dst);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

// Eina_Value_List functions
function EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_LIST) then begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_node_memory_get(const typ: PEina_Value_Type; const node: PEina_List): Pointer;
begin
  if (node = nil) or (typ = nil) then begin
    Exit(nil);
  end;
  if typ^.value_size <= SizeOf(Pointer) then begin
    Result := @node^.data;
  end else begin
    Result := node^.data;
  end;
end;

function eina_value_list_node_memory_setup(const typ: PEina_Value_Type; node: PEina_List): Pointer;
begin
  if typ^.value_size <= SizeOf(Pointer) then begin
    Result := @node^.data;
  end else begin
    node^.data := AllocMem(typ^.value_size);
    Result := node^.data;
  end;
end;

procedure eina_value_list_node_memory_flush(const typ: PEina_Value_Type; node: PEina_List);
begin
  if typ^.value_size <= SizeOf(Pointer) then begin
    Exit;
  end;
  // C has a check for (void*)1L, which is used as a sentinel for newly allocated nodes.
  // In Pascal, we'd typically use a proper nil/pointer check or a flag.
  // For this translation, I'll simulate the C behavior.
  if node^.data <> Pointer(1) then // (void*)1L equivalent
  begin
    FreeMem(node^.data);
  end;
end;

function eina_value_list_setup(value: PEina_Value; const subtype: PEina_Value_Type): TEina_Bool;
var
  desc: TEina_Value_List;
begin
  desc.subtype := subtype;
  desc.list := nil;

  if not eina_value_setup(value, EINA_VALUE_TYPE_LIST) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(value, @desc) then begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_list_count(const value: PEina_Value): cardinal;
var
  desc: PEina_Value_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(0);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(0);
  end;
  if desc^.list <> nil then begin
    Result := eina_list_count(desc^.list);
  end else begin
    Result := 0;
  end;
end;

function eina_value_list_remove(value: PEina_Value; position: cardinal): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  eina_value_type_flush(desc^.subtype, mem);
  eina_value_list_node_memory_flush(desc^.subtype, node);
  desc^.list := eina_list_remove_list(desc^.list, node);
  Result := EINA_TRUE;
end;

function eina_value_list_vset(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_vset(desc^.subtype, mem, args);
end;

function eina_value_list_vget(const value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_list_vinsert(value: PEina_Value; position: cardinal; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  rel_node: PEina_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  if (desc^.list = nil) and (position = 0) then begin
    node := eina_list_append(nil, Pointer(1)); // Use Pointer(1) as sentinel
    desc^.list := node;
  end else if position = 0 then begin
    node := eina_list_prepend(desc^.list, Pointer(1));
    desc^.list := node;
  end else begin
    rel_node := eina_list_nth_list(desc^.list, position - 1);
    if rel_node = nil then begin
      Exit(EINA_FALSE);
    end;
    desc^.list := eina_list_append_relative_list(desc^.list, Pointer(1), rel_node);
    node := rel_node^.next; // In C, this is 'rel->next'
  end;
  if node = nil then begin
    Exit(EINA_FALSE);
  end;
  if node^.data <> Pointer(1) then begin
    Exit(EINA_FALSE);
  end; // Check if sentinel is correctly set

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_setup
  end;
  if not eina_value_type_vset(desc^.subtype, mem, args) then begin
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
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  desc^.list := eina_list_append(desc^.list, Pointer(1)); // Use Pointer(1) as sentinel
  node := eina_list_last(desc^.list);
  if node = nil then begin
    Exit(EINA_FALSE);
  end;
  if node^.data <> Pointer(1) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_setup
  end;
  if not eina_value_type_vset(desc^.subtype, mem, args) then begin
    eina_value_type_flush(desc^.subtype, mem);
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE); // goto error_set
  end;
  Result := EINA_TRUE;
end;

// Variadic argument stubs for list functions
function eina_value_list_set(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vset(value, position, nil); // Placeholder
end;

function eina_value_list_get(const value: PEina_Value; position: cardinal; var args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vget(value, position, nil); // Placeholder
end;

function eina_value_list_insert(value: PEina_Value; position: cardinal; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vinsert(value, position, nil); // Placeholder
end;

function eina_value_list_append(value: PEina_Value; const args: array of const): TEina_Bool;
begin
  Result := eina_value_list_vappend(value, nil); // Placeholder
end;


function eina_value_list_pset(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_pset(desc^.subtype, mem, ptr);
end;

function eina_value_list_pget(const value: PEina_Value; position: cardinal; ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  node := eina_list_nth_list(desc^.list, position);
  mem := eina_value_list_node_memory_get(desc^.subtype, node);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

function eina_value_list_pinsert(value: PEina_Value; position: cardinal; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_List;
  node: PEina_List;
  mem: Pointer;
  rel_node: PEina_List;
begin
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  if desc^.list = nil then begin
    node := eina_list_append(nil, Pointer(1));
    desc^.list := node;
  end else if position = 0 then  begin
    node := eina_list_prepend(desc^.list, Pointer(1));
    desc^.list := node;
  end else begin
    rel_node := eina_list_nth_list(desc^.list, position - 1);
    desc^.list := eina_list_append_relative_list(desc^.list, Pointer(1), rel_node);
    node := rel_node^.next;
  end;
  if node = nil then begin
    Exit(EINA_FALSE);
  end;
  if node^.data <> Pointer(1) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc^.subtype, mem, ptr) then begin
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
  if not EINA_VALUE_TYPE_LIST_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_List(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  desc^.list := eina_list_append(desc^.list, Pointer(1));
  node := eina_list_last(desc^.list);
  if node = nil then begin
    Exit(EINA_FALSE);
  end;
  if node^.data <> Pointer(1) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_list_node_memory_setup(desc^.subtype, node);
  if mem = nil then begin
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;

  if not eina_value_type_setup(desc^.subtype, mem) then begin
    eina_value_list_node_memory_flush(desc^.subtype, node);
    desc^.list := eina_list_remove_list(desc^.list, node);
    Exit(EINA_FALSE);
  end;
  if not eina_value_type_pset(desc^.subtype, mem, ptr) then begin
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
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_HASH) then begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_hash_setup(value: PEina_Value; const subtype: PEina_Value_Type; buckets_power_size: cardinal): TEina_Bool;
var
  desc: TEina_Value_Hash;
begin
  desc.subtype := subtype;
  desc.buckets_power_size := buckets_power_size;
  desc.hash := nil;

  if not eina_value_setup(value, EINA_VALUE_TYPE_HASH) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(value, @desc) then begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_hash_population(const value: PEina_Value): cardinal;
var
  desc: PEina_Value_Hash;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(0);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(0);
  end;
  if desc^.hash <> nil then begin
    Result := eina_hash_population(desc^.hash);
  end else begin
    Result := 0;
  end;
end;

function eina_value_hash_del(value: PEina_Value; const key: pansichar): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if key = nil then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  eina_value_type_flush(desc^.subtype, mem);
  FreeMem(mem);
  eina_hash_del_by_key(desc^.hash, key);
  Result := EINA_TRUE;
end;

function eina_value_hash_vset(value: PEina_Value; const key: pansichar; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if key = nil then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then begin
    mem := AllocMem(desc^.subtype^.value_size);
    if mem = nil then begin
      Exit(EINA_FALSE);
    end;
    if not eina_hash_add(desc^.hash, key, mem) then begin
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
    if not eina_value_type_setup(desc^.subtype, mem) then begin
      eina_value_type_flush(desc^.subtype, mem);
      eina_hash_del_by_key(desc^.hash, key);
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
  end;

  Result := eina_value_type_vset(desc^.subtype, mem, args);
end;

function eina_value_hash_vget(const value: PEina_Value; const key: pansichar; args: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if key = nil then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

// Variadic argument stubs for hash functions
function eina_value_hash_set(value: PEina_Value; const key: pansichar; const args: array of const): TEina_Bool;
begin
  Result := eina_value_hash_vset(value, key, nil); // Placeholder
end;

function eina_value_hash_get(const value: PEina_Value; const key: pansichar; var args: array of const): TEina_Bool;
begin
  Result := eina_value_hash_vget(value, key, nil); // Placeholder
end;

function eina_value_hash_pset(value: PEina_Value; const key: pansichar; const ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if key = nil then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then begin
    mem := AllocMem(desc^.subtype^.value_size);
    if mem = nil then begin
      Exit(EINA_FALSE);
    end;
    if not eina_hash_add(desc^.hash, key, mem) then begin
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
    if not eina_value_type_setup(desc^.subtype, mem) then begin
      eina_value_type_flush(desc^.subtype, mem);
      eina_hash_del_by_key(desc^.hash, key);
      FreeMem(mem);
      Exit(EINA_FALSE);
    end;
  end;

  Result := eina_value_type_pset(desc^.subtype, mem, ptr);
end;

function eina_value_hash_pget(const value: PEina_Value; const key: pansichar; ptr: Pointer): TEina_Bool;
var
  desc: PEina_Value_Hash;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_HASH_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if key = nil then begin
    Exit(EINA_FALSE);
  end;
  desc := PEina_Value_Hash(eina_value_memory_get(value));
  if desc = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_hash_find(desc^.hash, key);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ret := eina_value_type_pget(desc^.subtype, mem, ptr);
  Result := ret;
end;

// Eina_Value_Struct functions
function EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  if not (value^._type = EINA_VALUE_TYPE_STRUCT) then begin
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

  if not eina_value_setup(value, EINA_VALUE_TYPE_STRUCT) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(value, @desc) then begin
    eina_value_flush(value);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_desc_get(const value: PEina_Value): PEina_Value_Struct_Desc;
var
  st: PEina_Value_Struct;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(nil);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if (st = nil) or (st^.desc = nil) then begin
    Exit(nil);
  end;
  if not (st^.desc^.version = EINA_VALUE_STRUCT_DESC_VERSION) then begin
    Exit(nil);
  end;
  Result := st^.desc;
end;

function eina_value_struct_member_memory_get(const st: PEina_Value_Struct; const member: PEina_Value_Struct_Member): Pointer;
var
  base: pbyte;
begin
  base := pbyte(st^.memory);
  if base = nil then begin
    Exit(nil);
  end;
  Result := pbyte(integer(base) + member^.offset);
end;

function eina_value_struct_vset(value: PEina_Value; const name: pansichar; args: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_vset(member^._type, mem, args);
end;

function eina_value_struct_vget(const value: PEina_Value; const name: pansichar; args: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ptr: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := PPointer(args)^; // Simulating va_arg(args, void *)
  ret := eina_value_type_pget(member^._type, mem, ptr);
  Result := ret;
end;

// Variadic argument stubs for struct functions
function eina_value_struct_set(value: PEina_Value; const name: pansichar; const args: array of const): TEina_Bool;
begin
  Result := eina_value_struct_vset(value, name, nil); // Placeholder
end;

function eina_value_struct_get(const value: PEina_Value; const name: pansichar; var args: array of const): TEina_Bool;
begin
  Result := eina_value_struct_vget(value, name, nil); // Placeholder
end;


function eina_value_struct_pset(value: PEina_Value; const name: pansichar; const ptr: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_pset(member^._type, mem, ptr);
end;

function eina_value_struct_pget(const value: PEina_Value; const name: pansichar; ptr: Pointer): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ret: TEina_Bool;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(value));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ret := eina_value_type_pget(member^._type, mem, ptr);
  Result := ret;
end;

function eina_value_struct_value_get(const src: PEina_Value; const name: pansichar; dst: PEina_Value): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  if dst = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(src));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_setup(dst, member^._type) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(dst, mem) then begin
    eina_value_flush(dst);
    Exit(EINA_FALSE);
  end;
  Result := EINA_TRUE;
end;

function eina_value_struct_value_set(dst: PEina_Value; const name: pansichar; const src: PEina_Value): TEina_Bool;
var
  member: PEina_Value_Struct_Member;
  st: PEina_Value_Struct;
  mem: Pointer;
  ptr: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(dst, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if name = nil then begin
    Exit(EINA_FALSE);
  end;
  if src = nil then begin
    Exit(EINA_FALSE);
  end;

  st := PEina_Value_Struct(eina_value_memory_get(dst));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  member := eina_value_struct_member_find(st, name);
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  if not (src^._type = member^._type) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := eina_value_memory_get(src);
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_pset(member^._type, mem, ptr);
end;

function eina_value_struct_member_value_get(const src: PEina_Value; const member: PEina_Value_Struct_Member; dst: PEina_Value): TEina_Bool;
var
  st: PEina_Value_Struct;
  mem: Pointer;
begin
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(src, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  if dst = nil then begin
    Exit(EINA_FALSE);
  end;
  st := PEina_Value_Struct(eina_value_memory_get(src));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_setup(dst, member^._type) then begin
    Exit(EINA_FALSE);
  end;
  if not eina_value_pset(dst, mem) then begin
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
  if not EINA_VALUE_TYPE_STRUCT_CHECK_RETURN_VAL_IMPL(dst, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if member = nil then begin
    Exit(EINA_FALSE);
  end;
  if src = nil then begin
    Exit(EINA_FALSE);
  end;

  st := PEina_Value_Struct(eina_value_memory_get(dst));
  if st = nil then begin
    Exit(EINA_FALSE);
  end;
  if not (src^._type = member^._type) then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_struct_member_memory_get(st, member);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  ptr := eina_value_memory_get(src);
  if ptr = nil then begin
    Exit(EINA_FALSE);
  end;

  Result := eina_value_type_pset(member^._type, mem, ptr);
end;

// Eina_Value_Optional functions
function EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value: PEina_Value; retval: TEina_Bool): TEina_Bool;
begin
  if value = nil then begin
    Result := retval;
    Exit;
  end;
  // This check is a bit tricky from C. It checks if value->type->setup is the same as EINA_VALUE_TYPE_OPTIONAL->setup.
  // We'll approximate this by checking if the type itself is EINA_VALUE_TYPE_OPTIONAL.
  if not (value^._type = EINA_VALUE_TYPE_OPTIONAL) then begin
    Result := retval;
    Exit;
  end;
  Result := EINA_TRUE;
end;

function eina_value_optional_empty_new: PEina_Value;
begin
  Result := eina_value_new(EINA_VALUE_TYPE_OPTIONAL);
end;

type
  PEina_Value_Optional_Outer = ^TEina_Value_Optional_Outer;

  TEina_Value_Optional_Outer = record
    subtype: PEina_Value_Type;
    value: Pointer;
  end;

  PEina_Value_Optional_Inner = ^TEina_Value_Optional_Inner;

  TEina_Value_Optional_Inner = record
    subtype: PEina_Value_Type;
    value: array[0..0] of ansichar; // Flexible Array Member
  end;

function eina_value_optional_empty_is(const value: PEina_Value; is_empty: PBoolean): TEina_Bool;
var
  mem: Pointer;
  opt: PEina_Value_Optional_Outer;
begin
  if not EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(EINA_FALSE);
  end;
  if is_empty = nil then begin
    Exit(EINA_FALSE);
  end;

  mem := eina_value_memory_get(value);
  if mem = nil then begin
    Exit(EINA_FALSE);
  end;

  // This logic is platform-dependent due to `sizeof(void*)` vs `sizeof(Eina_Value_Union)`
  // Simulating the C behavior:
  if 2 * SizeOf(Pointer) <= SizeOf(TEina_Value_Union) then begin
    opt := PEina_Value_Optional_Outer(mem);
    is_empty^ := (opt^.subtype = nil);
  end else begin
    // This case refers to `*(void**)mem` which is typically for smaller internal storage.
    // Assuming `mem` directly holds a pointer to `Eina_Value_Optional_Inner` (or nil)
    is_empty^ := (PPointer(mem)^ = nil);
  end;
  Result := EINA_TRUE;
end;

function eina_value_optional_type_get(value: PEina_Value): PEina_Value_Type;
var
  mem: Pointer;
  opt: PEina_Value_Optional_Outer;
  opt_inner_ptr: PEina_Value_Optional_Inner;
begin
  if not EINA_VALUE_TYPE_OPTIONAL_CHECK_RETURN_VAL_IMPL(value, EINA_FALSE) then begin
    Exit(nil);
  end;

  mem := eina_value_memory_get(value);
  if mem = nil then begin
    Exit(nil);
  end;

  if 2 * SizeOf(Pointer) <= SizeOf(TEina_Value_Union) then begin
    opt := PEina_Value_Optional_Outer(mem);
    Result := opt^.subtype;
  end else begin
    opt_inner_ptr := PEina_Value_Optional_Inner(PPointer(mem)^); // Get the pointer to the inner struct
    if opt_inner_ptr = nil then begin
      Result := nil;
    end else begin
      Result := opt_inner_ptr^.subtype;
    end;
  end;
end;

// Implementations for the generic eina_value_type_* functions
function eina_value_type_setup(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.setup = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.setup(typ, mem);
end;

function eina_value_type_flush(const typ: PEina_Value_Type; mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.flush = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.flush(typ, mem);
end;

function eina_value_type_copy(const typ: PEina_Value_Type; src, dst: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.copy = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.copy(typ, src, dst);
end;

function eina_value_type_compare(const typ: PEina_Value_Type; a, b: Pointer): integer;
begin
  if not eina_value_type_check(typ) then begin
    Exit(0);
  end; // C returns 0 on error
  if typ^.compare = nil then begin
    Exit(0);
  end;
  Result := typ^.compare(typ, a, b);
end;

function eina_value_type_convert_to(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.convert_to = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.convert_to(typ, convert, type_mem, convert_mem);
end;

function eina_value_type_convert_from(const typ, convert: PEina_Value_Type; type_mem, convert_mem: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.convert_from = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.convert_from(typ, convert, type_mem, convert_mem);
end;

function eina_value_type_vset(const typ: PEina_Value_Type; mem: Pointer; args: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.vset = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.vset(typ, mem, args);
end;

function eina_value_type_pset(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.pset = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.pset(typ, mem, ptr);
end;

function eina_value_type_pget(const typ: PEina_Value_Type; mem, ptr: Pointer): TEina_Bool;
begin
  if not eina_value_type_check(typ) then begin
    Exit(EINA_FALSE);
  end;
  if typ^.pget = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := typ^.pget(typ, mem, ptr);
end;

end.
