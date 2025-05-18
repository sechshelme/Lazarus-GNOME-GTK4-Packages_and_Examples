unit Eo;

interface

uses
  ctypes, efl, fp_eina, efl_object_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEo_Object = record
  end;
  PEo_Object = ^TEo_Object;

  PEfl_Class = ^TEfl_Class;
  TEfl_Class = TEo;

  PPEfl_Object = ^PEfl_Object;
  PEfl_Object = ^TEfl_Object;
  TEfl_Object = TEo;

var
  _efl_class_creation_lock: TEina_Lock; cvar;external libeo;
  _efl_object_init_generation: dword; cvar;external libeo;

type
  TEfl_Del_Intercept = procedure(obj_id: PEo); cdecl;

type
  PEfl_Event = ^TEfl_Event;

  TEfl_Event = record
    obj: PEfl_Object;
    desc: PEfl_Event_Description;
    info: pointer;
  end;

type
  TEfl_Event_Cb = procedure(data: pointer; event: PEfl_Event); cdecl;

  TEfl_Callback_Array_Item = record
    desc: PEfl_Event_Description;
    func: TEfl_Event_Cb;
  end;
  PEfl_Callback_Array_Item = ^TEfl_Callback_Array_Item;

  TEfl_Callback_Array_Item_Full = record
    desc: PEfl_Event_Description;
    priority: TEfl_Callback_Priority;
    func: TEfl_Event_Cb;
    user_data: pointer;
  end;
  PEfl_Callback_Array_Item_Full = ^TEfl_Callback_Array_Item_Full;

function efl_event_callback_priority_add(obj: PEo; desc: PEfl_Event_Description; priority: TEfl_Callback_Priority; cb: TEfl_Event_Cb; data: pointer): TEina_Bool; cdecl; external libeo;
function efl_event_callback_del(obj: PEo; desc: PEfl_Event_Description; func: TEfl_Event_Cb; user_data: pointer): TEina_Bool; cdecl; external libeo;
function efl_event_future_scheduler_get(obj: PEo; arr: PEfl_Callback_Array_Item): PEina_Future_Scheduler; cdecl; external libeo;
function efl_event_callback_array_priority_add(obj: PEo; arr: PEfl_Callback_Array_Item; priority: TEfl_Callback_Priority; data: pointer): TEina_Bool; cdecl; external libeo;
function efl_event_callback_array_del(obj: PEo; arr: PEfl_Callback_Array_Item; user_data: pointer): TEina_Bool; cdecl; external libeo;
function efl_event_callback_call(obj: PEo; desc: PEfl_Event_Description; event_info: pointer): TEina_Bool; cdecl; external libeo;
function efl_event_callback_legacy_call(obj: PEo; desc: PEfl_Event_Description; event_info: pointer): TEina_Bool; cdecl; external libeo;

type
  TEfl_Future_Cb_Desc = record
    success: function(o: PEo; data: pointer; value: TEina_Value): TEina_Value; cdecl;
    error: function(o: PEo; data: pointer; error: TEina_Error): TEina_Value; cdecl;
    free: procedure(o: PEo; data: pointer; dead_future: PEina_Future); cdecl;
    success_type: PEina_Value_Type;
    data: pointer;
    storage: ^PEina_Future;
  end;
  PEfl_Future_Cb_Desc = ^TEfl_Future_Cb_Desc;

function efl_future_cb_from_desc(obj: PEo; desc: TEfl_Future_Cb_Desc): TEina_Future_Desc; cdecl; external libeo;
function efl_future_chain_array(obj: PEo; prev: PEina_Future; descs: PEfl_Future_Cb_Desc): PEina_Future; cdecl; external libeo;

type
  TEfl_Dbg_Info = record
    name: PEina_Stringshare;
    value: TEina_Value;
  end;
  PEfl_Dbg_Info = ^TEfl_Dbg_Info;

procedure efl_dbg_info_get(obj: PEo; root_node: PEfl_Dbg_Info); cdecl; external libeo;

var
  EFL_DBG_INFO_TYPE: PEina_Value_Type; cvar;external libeo;

procedure efl_dbg_info_free(info: PEfl_Dbg_Info); cdecl; external libeo;

type
  PEfl_Object_Op = ^TEfl_Object_Op;
  TEfl_Object_Op = dword;

function EFL_NOOP: TEfl_Object_Op;

type
  PEfl_Class_Type = ^TEfl_Class_Type;
  TEfl_Class_Type = longint;

const
  EFL_CLASS_TYPE_REGULAR = 0;
  EFL_CLASS_TYPE_REGULAR_NO_INSTANT = 1;
  EFL_CLASS_TYPE_INTERFACE = 2;
  EFL_CLASS_TYPE_MIXIN = 3;
  EFL_CLASS_TYPE_INVALID = 4;

const
  EO_VERSION = 2;

type
  TEfl_Op_Description = record
    api_func: pointer;
    func: pointer;
  end;
  PEfl_Op_Description = ^TEfl_Op_Description;

  TEfl_Object_Ops = record
    descs: PEfl_Op_Description;
    count: Tsize_t;
  end;
  PEfl_Object_Ops = ^TEfl_Object_Ops;

  TEfl_Class_Description = record
    version: dword;
    name: pchar;
    _type: TEfl_Class_Type;
    data_size: Tsize_t;
    class_initializer: function(klass: PEfl_Class): TEina_Bool; cdecl;
    class_constructor: procedure(klass: PEfl_Class); cdecl;
    class_destructor: procedure(klass: PEfl_Class); cdecl;
  end;
  PEfl_Class_Description = ^TEfl_Class_Description;

  TEfl_Object_Property_Reflection_Setter = function(obj: PEo; value: TEina_Value): TEina_Error; cdecl;
  TEfl_Object_Property_Reflection_Getter = function(obj: PEo): TEina_Value; cdecl;

  TEfl_Object_Property_Reflection = record
    property_name: pchar;
    set_: TEfl_Object_Property_Reflection_Setter;
    get: TEfl_Object_Property_Reflection_Getter;
  end;
  PEfl_Object_Property_Reflection = ^TEfl_Object_Property_Reflection;

  TEfl_Object_Property_Reflection_Ops = record
    table: PEfl_Object_Property_Reflection;
    count: Tsize_t;
  end;
  PEfl_Object_Property_Reflection_Ops = ^TEfl_Object_Property_Reflection_Ops;

function efl_class_new(desc: PEfl_Class_Description; parent: PEfl_Class; args: array of const): PEfl_Class; cdecl; external libeo;
function efl_class_new(desc: PEfl_Class_Description; parent: PEfl_Class): PEfl_Class; cdecl; external libeo;
function efl_class_functions_set(klass_id: PEfl_Class; object_ops: PEfl_Object_Ops; reflection_table: PEfl_Object_Property_Reflection_Ops): TEina_Bool; cdecl; external libeo;
function efl_object_override(obj: PEo; ops: PEfl_Object_Ops): TEina_Bool; cdecl; external libeo;
function efl_isa(obj: PEo; klass: PEfl_Class): TEina_Bool; cdecl; external libeo;
function efl_class_name_get(klass: PEfl_Class): pchar; cdecl; external libeo;
function efl_class_memory_size_get(klass: PEfl_Class): Tsize_t; cdecl; external libeo;
function efl_debug_name_get(obj_id: PEo): pchar; cdecl; external libeo;
function efl_object_init: TEina_Bool; cdecl; external libeo;
function efl_object_shutdown: TEina_Bool; cdecl; external libeo;
{$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Id_Domain = ^TEfl_Id_Domain;
  TEfl_Id_Domain = longint;

const
  EFL_ID_DOMAIN_INVALID = -(1);
  EFL_ID_DOMAIN_MAIN = 0;
  EFL_ID_DOMAIN_SHARED = 1;
  EFL_ID_DOMAIN_THREAD = 2;

type
  TEfl_Domain_Data = record
  end;
  PEfl_Domain_Data = ^TEfl_Domain_Data;

function efl_domain_get: TEfl_Id_Domain; cdecl; external libeo;
function efl_domain_switch(domain: TEfl_Id_Domain): TEina_Bool; cdecl; external libeo;
function efl_domain_current_get: TEfl_Id_Domain; cdecl; external libeo;
function efl_domain_current_set(domain: TEfl_Id_Domain): TEina_Bool; cdecl; external libeo;
function efl_domain_current_push(domain: TEfl_Id_Domain): TEina_Bool; cdecl; external libeo;
procedure efl_domain_current_pop; cdecl; external libeo;
function efl_domain_data_get: PEfl_Domain_Data; cdecl; external libeo;
function efl_domain_data_adopt(data_in: PEfl_Domain_Data): TEfl_Id_Domain; cdecl; external libeo;
function efl_domain_data_return(domain: TEfl_Id_Domain): TEina_Bool; cdecl; external libeo;
function efl_compatible(obj: PEo; obj_target: PEo): TEina_Bool; cdecl; external libeo;
{$endif}
type
  TEfl_Object_Op_Call_Data = record
    eo_id: PEo;
    obj: PEo_Object;
    func: pointer;
    data: pointer;
    extn1: pointer;
    extn2: pointer;
    extn3: pointer;
    extn4: pointer;
  end;
  PEfl_Object_Op_Call_Data = ^TEfl_Object_Op_Call_Data;

function _efl_object_api_op_id_get(api_func: pointer): TEfl_Object_Op; cdecl; external libeo; deprecated;
function _efl_object_op_api_id_get(api_func: pointer; obj: PEo; api_func_name: pchar; file_: pchar; line: longint): TEfl_Object_Op; cdecl; external libeo;
function _efl_object_call_resolve(obj: PEo; func_name: pchar; call: PEfl_Object_Op_Call_Data; op: TEfl_Object_Op; file_: pchar; line: longint): TEina_Bool; cdecl; external libeo;
procedure _efl_object_call_end(call: PEfl_Object_Op_Call_Data); cdecl; external libeo;
function _efl_add_end(obj: PEo; is_ref: TEina_Bool; is_fallback: TEina_Bool): PEo; cdecl; external libeo;
function efl_super(obj: PEo; cur_klass: PEfl_Class): PEo; cdecl; external libeo;
function efl_cast(obj: PEo; cur_klass: PEfl_Class): PEo; cdecl; external libeo;
function efl_class_get(obj: PEo): PEfl_Class; cdecl; external libeo;
function _efl_added_get: PEo; cdecl; external libeo;
function efl_added_get: PEo; cdecl; external libeo name '__efl_added';

function _efl_add_internal_start(file_: pchar; line: longint; klass_id: PEfl_Class; parent: PEo; ref: TEina_Bool; is_fallback: TEina_Bool): PEo; cdecl; external libeo;

type
  PEfl_Substitute_Ctor_Cb = ^TEfl_Substitute_Ctor_Cb;
  TEfl_Substitute_Ctor_Cb = function(data: pointer; obj_id: PEo): PEo; cdecl;

function _efl_add_internal_start_bindings(file_: pchar; line: longint; klass_id: PEfl_Class; parent: PEo; ref: TEina_Bool;
  is_fallback: TEina_Bool; substitute_ctor: TEfl_Substitute_Ctor_Cb; sub_ctor_data: pointer): PEo; cdecl; external libeo;
procedure efl_del(obj: PEo); cdecl; external libeo;
function efl_class_override_register(klass: PEfl_Class; override: PEfl_Class): TEina_Bool; cdecl; external libeo;
function efl_class_override_unregister(klass: PEfl_Class; override: PEfl_Class): TEina_Bool; cdecl; external libeo;
function efl_data_scope_get(obj: PEo; klass: PEfl_Class): pointer; cdecl; external libeo;
function efl_data_scope_safe_get(obj: PEo; klass: PEfl_Class): pointer; cdecl; external libeo;
function efl_data_xref_internal(file_: pchar; line: longint; obj: PEo; klass: PEfl_Class; ref_obj: PEo): pointer; cdecl; external libeo;

procedure efl_data_xunref_internal(obj: PEo; data: pointer; ref_obj: PEo); cdecl; external libeo;
function efl_ref(obj: PEo): PEo; cdecl; external libeo;
procedure efl_unref(obj: PEo); cdecl; external libeo;
function efl_ref_count(obj: PEo): longint; cdecl; external libeo;
procedure efl_del_intercept_set(obj: PEo; del_intercept_func: TEfl_Del_Intercept); cdecl; external libeo;
function efl_del_intercept_get(obj: PEo): TEfl_Del_Intercept; cdecl; external libeo;
procedure efl_reuse(obj: PEo); cdecl; external libeo;
function efl_xref_internal(file_: pchar; line: longint; obj: PEo; ref_obj: PEo): PEo; cdecl; external libeo;
procedure efl_xunref(obj: PEo; ref_obj: PEo); cdecl; external libeo;
procedure efl_wref_add(obj: PEo; wref: PPEfl_Object); cdecl; external libeo;
procedure efl_wref_del(obj: PEo; wref: PPEfl_Object); cdecl; external libeo;
procedure efl_key_data_set(obj: PEo; key: pchar; data: pointer); cdecl; external libeo;
function efl_key_data_get(obj: PEo; key: pchar): pointer; cdecl; external libeo;
procedure efl_key_ref_set(obj: PEo; key: pchar; objdata: PEfl_Object); cdecl; external libeo;
function efl_key_ref_get(obj: PEo; key: pchar): PEfl_Object; cdecl; external libeo;
procedure efl_key_wref_set(obj: PEo; key: pchar; objdata: PEfl_Object); cdecl; external libeo;
function efl_key_wref_get(obj: PEo; key: pchar): PEfl_Object; cdecl; external libeo;
procedure efl_key_value_set(obj: PEo; key: pchar; value: PEina_Value); cdecl; external libeo;
function efl_key_value_get(obj: PEo; key: pchar): PEina_Value; cdecl; external libeo;
procedure efl_manual_free_set(obj: PEo; manual_free: TEina_Bool); cdecl; external libeo;
function efl_manual_free(obj: PEo): TEina_Bool; cdecl; external libeo;
function efl_destructed_is(obj: PEo): TEina_Bool; cdecl; external libeo;
function efl_property_reflection_set(obj: PEo; property_name: pchar; value: TEina_Value): TEina_Error; cdecl; external libeo;
function efl_property_reflection_get(obj: PEo; property_name: pchar): TEina_Value; cdecl; external libeo;
function efl_property_reflection_exist(obj: PEo; property_name: pchar): TEina_Bool; cdecl; external libeo;
function efl_class_type_get(klass: PEfl_Class): TEfl_Class_Type; cdecl; external libeo;

type
  Tefl_key_data_free_func = procedure(para1: pointer); cdecl;

function efl_callbacks_cmp(a: PEfl_Callback_Array_Item; b: PEfl_Callback_Array_Item): longint; cdecl; external libeo;

function efl_event_callback_add(obj: PEo; desc: PEfl_Event_Description; cb: TEfl_Event_Cb; data: Pointer): TEina_Bool;
function efl_event_callback_array_add(obj: PEo; arr: PEfl_Callback_Array_Item; data: Pointer): TEina_Bool;
procedure efl_event_callback_forwarder_add(obj: PEo; desc: PEfl_Event_Description; new_obj: PEfl_Object);

function efl_event_callback_count(obj: PEo; desc: PEfl_Event_Description): dword; cdecl; external libeo;

var
  EINA_VALUE_TYPE_OBJECT: PEina_Value_Type; cvar;external libeo;

var
  _EFL_EVENT_CALLBACK_ADD: TEfl_Event_Description; cvar;external libeo;
  _EFL_EVENT_CALLBACK_DEL: TEfl_Event_Description; cvar;external libeo;

function EFL_EVENT_CALLBACK_ADD: PEfl_Event_Description;
function EFL_EVENT_CALLBACK_DEL: PEfl_Event_Description;

function eo_classes_iterator_new: PEina_Iterator; cdecl; external libeo;
function eo_objects_iterator_new: PEina_Iterator; cdecl; external libeo;
function efl_ownable_get(obj: PEo): TEina_Bool; cdecl; external libeo;

procedure efl_data_xunref(obj, data: Pointer; ref_obj: PEo);
procedure efl_data_unref(obj, data: Pointer);



// === Konventiert am: 18-5-25 13:19:14 ===

// === static inline
function EFL_DBG_INFO_LIST_APPEND(list: PEfl_Dbg_Info; name: pchar): PEfl_Dbg_Info; unimplemented;
function efl_replace(storage: PPEo; new_obj: PEo): TEina_Bool;
function eina_value_object_new(obj: PEo): PEina_Value; unimplemented;
function eina_value_object_init(obj: PEo): TEina_Value; unimplemented;
function eina_value_object_get(const v: PEina_Value): PEo; unimplemented;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_alive_get(const obj: PEo): boolean;
{$endif}




implementation

function EFL_DBG_INFO_LIST_APPEND(list: PEfl_Dbg_Info; name: pchar): PEfl_Dbg_Info;
var
  tmp: PEfl_Dbg_Info = nil;
begin
  {$warning "inline von eina_value fehlt"}

  tmp := calloc(1, SizeOf(tmp^));
  if tmp = nil then  begin
    Exit(nil);
  end;

  tmp^.name := eina_stringshare_add(name);
  //  eina_value_list_setup(tmp^.value, EFL_DBG_INFO_TYPE);

  if list <> nil then  begin
    //    eina_value_list_pappend(list^.value, tmp);
  end;

  Result := tmp;
end;

function efl_replace(storage: PPEo; new_obj: PEo): TEina_Bool;
var
  tmp: PEo;
begin
  tmp := nil;

  if storage = nil then begin
    Exit(EINA_FALSE);
  end;
  if storage^ = new_obj then begin
    Exit(EINA_FALSE);
  end;
  if new_obj <> nil then begin
    tmp := efl_ref(new_obj);
  end;
  if storage^ <> nil then begin
    efl_unref(storage^);
  end;
  storage^ := tmp;
  Result := EINA_TRUE;
end;


function eina_value_object_new(obj: PEo): PEina_Value;
var
  v: PEina_Value;
begin
  {$warning "inline von eina_value fehlt"}
  v := eina_value_new(EINA_VALUE_TYPE_OBJECT);
  if v <> nil then begin
    //    eina_value_set(v, obj);
  end;
  Result := v;
end;

function eina_value_object_init(obj: PEo): TEina_Value;
var
  v: TEina_Value;
begin
  {$warning "inline von eina_value fehlt"}
  //  v := EINA_VALUE_EMPTY;
  FillChar(v, SizeOf(v), 0);

  //  if eina_value_setup(@v, EINA_VALUE_TYPE_OBJECT) then begin
  //    eina_value_set(@v, obj);
  //  end;
  Result := v;
end;

function eina_value_object_get(const v: PEina_Value): PEo;
var
  r: PEo = nil;
begin
  if v = nil then begin
    Exit(nil);
  end;
  {$warning "inline von eina_value fehlt"}
  //  if eina_value_type_get(v) <> EINA_VALUE_TYPE_OBJECT then begin
  //    Exit(nil);
  //  end;

  //  if not eina_value_pget(v, @r) then begin
  //    Exit(nil);
  //  end;
  Result := r;
end;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_alive_get(const obj: PEo): boolean;
begin
  Result := efl_finalized_get(obj) and not efl_invalidating_get(obj) and not efl_invalidated_get(obj);
end;
{$endif}



// =============


function EFL_NOOP: TEfl_Object_Op;
begin
  EFL_NOOP := TEfl_Object_Op(0);
end;

procedure efl_data_xunref(obj, data: Pointer; ref_obj: PEo);
begin
  efl_data_xunref_internal(obj, data, ref_obj);
end;

procedure efl_data_unref(obj, data: Pointer);
begin
  efl_data_xunref_internal(obj, data, obj);
end;

function efl_event_callback_add(obj: PEo; desc: PEfl_Event_Description; cb: TEfl_Event_Cb; data: Pointer): TEina_Bool;
begin
  efl_event_callback_add := efl_event_callback_priority_add(obj, desc, EFL_CALLBACK_PRIORITY_DEFAULT, cb, data);
end;

function efl_event_callback_array_add(obj: PEo; arr: PEfl_Callback_Array_Item; data: Pointer): TEina_Bool;
begin
  efl_event_callback_array_add := efl_event_callback_array_priority_add(obj, arr, EFL_CALLBACK_PRIORITY_DEFAULT, data);
end;

procedure efl_event_callback_forwarder_add(obj: PEo; desc: PEfl_Event_Description; new_obj: PEfl_Object);
begin
  efl_event_callback_forwarder_priority_add(obj, desc, EFL_CALLBACK_PRIORITY_DEFAULT, new_obj);
end;

function EFL_EVENT_CALLBACK_ADD: PEfl_Event_Description;
begin
  EFL_EVENT_CALLBACK_ADD := @(_EFL_EVENT_CALLBACK_ADD);
end;

function EFL_EVENT_CALLBACK_DEL: PEfl_Event_Description;
begin
  EFL_EVENT_CALLBACK_DEL := @(_EFL_EVENT_CALLBACK_DEL);
end;


end.
