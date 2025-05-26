{$IFDEF read_interface}


const
  EFL_VERSION_1_18 = 1;
  EFL_VERSION_1_19 = 1;
  EFL_VERSION_1_20 = 1;
  EFL_VERSION_1_21 = 1;
  EFL_VERSION_1_22 = 1;
  EFL_VERSION_1_23 = 1;
  EFL_VERSION_1_24 = 1;
  EFL_VERSION_1_25 = 1;
  EFL_VERSION_1_26 = 1;

type
  TEfl_Time = Ttm;
  PEfl_Time = ^TEfl_Time;

  TEfl_Text_Cursor_Handle = record
  end;
  PEfl_Text_Cursor_Handle = ^TEfl_Text_Cursor_Handle;

  TEfl_Text_Attribute_Handle = record
  end;
  PEfl_Text_Attribute_Handle = ^TEfl_Text_Attribute_Handle;

  {$ifdef EFL_BETA_API_SUPPORT}
var
  EFL_GFX_IMAGE_LOAD_ERROR_NONE: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_GENERIC: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_DOES_NOT_EXIST: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_PERMISSION_DENIED: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_CORRUPT_FILE: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_UNKNOWN_FORMAT: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_CANCELLED: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_INCOMPATIBLE_FILE: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_UNKNOWN_COLLECTION: TEina_Error; cvar;external libefl;
  EFL_GFX_IMAGE_LOAD_ERROR_RECURSIVE_REFERENCE: TEina_Error; cvar;external libefl;
  {$endif}

type
  PEfl_Gfx_Path_Command = ^TEfl_Gfx_Path_Command;
  TEfl_Gfx_Path_Command = TEfl_Gfx_Path_Command_Type;

function efl_part(obj: PEo; name: pchar): PEfl_Object; cdecl; external libefl;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_observable_tuple_free(tuple: PEfl_Observable_Tuple); cdecl; external libefl;
{$endif}


procedure __efl_internal_init; cdecl; external libefl;

// === Konventiert am: 18-5-25 17:38:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ifdef EFL_BETA_API_SUPPORT}

function efl_config_bool_set(obj: PEfl_Config; name: pchar; val: TEina_Bool): TEina_Bool;
var
  v: PEina_Value;
  b: TEina_Bool;
begin
  {$warning "inline von eina_value fehlt"}
  v := eina_value_new(EINA_VALUE_TYPE_UCHAR);
  //  eina_value_set(v, val);
  b := efl_config_set(obj, name, v);
  eina_value_free(v);
  Result := b;
end;

function efl_config_bool_get(const obj: PEfl_Config; name: pchar): TEina_Bool;
var
  v: PEina_Value;
  b: TEina_Bool;
begin
  {$warning "inline von eina_value fehlt"}
  v := efl_config_get(obj, name);
  b := False;
  //  if (v <> nil) and (eina_value_type_get(v) = EINA_VALUE_TYPE_UCHAR) then
  //    eina_value_get(v, @b);
  eina_value_free(v);
  Result := b;
end;

function efl_config_int_set(obj: PEfl_Config; name: pchar; val: integer): TEina_Bool;
var
  v: PEina_Value;
  b: TEina_Bool;
begin
  {$warning "inline von eina_value fehlt"}
  v := eina_value_new(EINA_VALUE_TYPE_INT);
  //  eina_value_set(v, val);
  b := efl_config_set(obj, name, v);
  eina_value_free(v);
  Result := b;
end;

function efl_config_int_get(const obj: PEfl_Config; name: pchar): integer;
var
  v: PEina_Value;
  b: integer;
begin
  {$warning "inline von eina_value fehlt"}
  v := efl_config_get(obj, name);
  b := 0;
  //  if (v <> nil) and (eina_value_type_get(v) = EINA_VALUE_TYPE_INT) then
  //    eina_value_get(v, @b);
  eina_value_free(v);
  Result := b;
end;

function efl_config_double_set(obj: PEfl_Config; name: pchar; val: double): TEina_Bool;
var
  v: PEina_Value;
  b: TEina_Bool;
begin
  {$warning "inline von eina_value fehlt"}
  v := eina_value_new(EINA_VALUE_TYPE_DOUBLE);
  //  eina_value_set(v, val);
  b := efl_config_set(obj, name, v);
  eina_value_free(v);
  Result := b;
end;

function efl_config_double_get(const obj: PEfl_Config; name: pchar): double;
var
  v: PEina_Value;
  b: double;
begin
  {$warning "inline von eina_value fehlt"}
  v := efl_config_get(obj, name);
  b := 0;
  //if (v <> nil) and (eina_value_type_get(v) = EINA_VALUE_TYPE_DOUBLE) then
  //    eina_value_get(v, @b);
  eina_value_free(v);
  Result := b;
end;

function efl_config_string_set(obj: PEfl_Config; name: pchar; val: pchar): TEina_Bool;
var
  v: PEina_Value;
  b: TEina_Bool;
begin
  {$warning "inline von eina_value fehlt"}
  v := eina_value_new(EINA_VALUE_TYPE_STRING);
  //  eina_value_set(v, val);
  b := efl_config_set(obj, name, v);
  eina_value_free(v);
  Result := b;
end;

function efl_config_string_get(const obj: PEfl_Config; name: pchar): PEina_Stringshare;
var
  v: PEina_Value;
  s: PEina_Stringshare;
  b: pchar;
begin
  {$warning "inline von eina_value fehlt"}
  v := efl_config_get(obj, name);
  s := nil;
  //  if (v <> nil) and (eina_value_type_get(v) = EINA_VALUE_TYPE_STRING) then
  //  begin
  //    b := nil;
  //    eina_value_get(v, @b);
  //    s := eina_stringshare_add(b);
  //  end;
  eina_value_free(v);
  Result := s;
end;


{$endif}

{$ENDIF read_implementation}
