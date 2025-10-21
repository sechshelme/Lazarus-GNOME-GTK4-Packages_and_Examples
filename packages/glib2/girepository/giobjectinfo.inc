{$IFDEF read_interface}


type
  TGIObjectInfoRefFunction = function(obj: pointer): pointer; cdecl;
  TGIObjectInfoUnrefFunction = procedure(obj: pointer); cdecl;
  TGIObjectInfoSetValueFunction = procedure(value: PGValue; obj: pointer); cdecl;
  TGIObjectInfoGetValueFunction = function(value: PGValue): pointer; cdecl;

function gi_object_info_get_type_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_type_init_function_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_abstract(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository2;
function gi_object_info_get_final(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository2;
function gi_object_info_get_fundamental(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository2;
function gi_object_info_get_parent(info: PGIObjectInfo): PGIObjectInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_interfaces(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_interface(info: PGIObjectInfo; n: dword): PGIInterfaceInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_fields(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_field(info: PGIObjectInfo; n: dword): PGIFieldInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_properties(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_property(info: PGIObjectInfo; n: dword): PGIPropertyInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_methods(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_method(info: PGIObjectInfo; n: dword): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_object_info_find_method(info: PGIObjectInfo; name: pchar): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_object_info_find_method_using_interfaces(info: PGIObjectInfo; name: pchar; declarer: PPGIBaseInfo): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_signals(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_signal(info: PGIObjectInfo; n: dword): PGISignalInfo; cdecl; external libgirepository2;
function gi_object_info_find_signal(info: PGIObjectInfo; name: pchar): PGISignalInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_vfuncs(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_vfunc(info: PGIObjectInfo; n: dword): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_object_info_find_vfunc(info: PGIObjectInfo; name: pchar): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_object_info_find_vfunc_using_interfaces(info: PGIObjectInfo; name: pchar; declarer: PPGIBaseInfo): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_object_info_get_n_constants(info: PGIObjectInfo): dword; cdecl; external libgirepository2;
function gi_object_info_get_constant(info: PGIObjectInfo; n: dword): PGIConstantInfo; cdecl; external libgirepository2;
function gi_object_info_get_class_struct(info: PGIObjectInfo): PGIStructInfo; cdecl; external libgirepository2;
function gi_object_info_get_ref_function_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_ref_function_pointer(info: PGIObjectInfo): TGIObjectInfoRefFunction; cdecl; external libgirepository2;
function gi_object_info_get_unref_function_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_unref_function_pointer(info: PGIObjectInfo): TGIObjectInfoUnrefFunction; cdecl; external libgirepository2;
function gi_object_info_get_set_value_function_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_set_value_function_pointer(info: PGIObjectInfo): TGIObjectInfoSetValueFunction; cdecl; external libgirepository2;
function gi_object_info_get_get_value_function_name(info: PGIObjectInfo): pchar; cdecl; external libgirepository2;
function gi_object_info_get_get_value_function_pointer(info: PGIObjectInfo): TGIObjectInfoGetValueFunction; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:32 ===

function GI_TYPE_OBJECT_INFO: TGType;
function GI_OBJECT_INFO(obj: Pointer): PGIObjectInfo;
function GI_IS_OBJECT_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_OBJECT_INFO: TGType;
begin
  GI_TYPE_OBJECT_INFO := gi_object_info_get_type;
end;

function GI_OBJECT_INFO(obj: Pointer): PGIObjectInfo;
begin
  Result := PGIObjectInfo(g_type_check_instance_cast(obj, GI_TYPE_OBJECT_INFO));
end;

function GI_IS_OBJECT_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_OBJECT_INFO);
end;



{$ENDIF read_implementation}
