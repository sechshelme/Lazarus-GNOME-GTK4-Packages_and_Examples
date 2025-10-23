{$IFDEF read_interface}


type
  TGIObjectInfoRefFunction = function(obj: pointer): pointer; cdecl;
  TGIObjectInfoUnrefFunction = procedure(obj: pointer); cdecl;
  TGIObjectInfoSetValueFunction = procedure(value: PGValue; obj: pointer); cdecl;
  TGIObjectInfoGetValueFunction = function(value: PGValue): pointer; cdecl;

function GI_IS_OBJECT_INFO(info: Pointer): boolean;

function g_object_info_get_type_name(info: PGIObjectInfo): Pgchar; cdecl; external libgirepository;
function g_object_info_get_type_init(info: PGIObjectInfo): Pgchar; cdecl; external libgirepository;
function g_object_info_get_abstract(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository;
function g_object_info_get_final(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository;
function g_object_info_get_fundamental(info: PGIObjectInfo): Tgboolean; cdecl; external libgirepository;
function g_object_info_get_parent(info: PGIObjectInfo): PGIObjectInfo; cdecl; external libgirepository;
function g_object_info_get_n_interfaces(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_interface(info: PGIObjectInfo; n: Tgint): PGIInterfaceInfo; cdecl; external libgirepository;
function g_object_info_get_n_fields(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_field(info: PGIObjectInfo; n: Tgint): PGIFieldInfo; cdecl; external libgirepository;
function g_object_info_get_n_properties(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_property(info: PGIObjectInfo; n: Tgint): PGIPropertyInfo; cdecl; external libgirepository;
function g_object_info_get_n_methods(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_method(info: PGIObjectInfo; n: Tgint): PGIFunctionInfo; cdecl; external libgirepository;
function g_object_info_find_method(info: PGIObjectInfo; name: Pgchar): PGIFunctionInfo; cdecl; external libgirepository;
function g_object_info_find_method_using_interfaces(info: PGIObjectInfo; name: Pgchar; implementor: PPGIObjectInfo): PGIFunctionInfo; cdecl; external libgirepository;
function g_object_info_get_n_signals(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_signal(info: PGIObjectInfo; n: Tgint): PGISignalInfo; cdecl; external libgirepository;
function g_object_info_find_signal(info: PGIObjectInfo; name: Pgchar): PGISignalInfo; cdecl; external libgirepository;
function g_object_info_get_n_vfuncs(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_vfunc(info: PGIObjectInfo; n: Tgint): PGIVFuncInfo; cdecl; external libgirepository;
function g_object_info_find_vfunc(info: PGIObjectInfo; name: Pgchar): PGIVFuncInfo; cdecl; external libgirepository;
function g_object_info_find_vfunc_using_interfaces(info: PGIObjectInfo; name: Pgchar; implementor: PPGIObjectInfo): PGIVFuncInfo; cdecl; external libgirepository;
function g_object_info_get_n_constants(info: PGIObjectInfo): Tgint; cdecl; external libgirepository;
function g_object_info_get_constant(info: PGIObjectInfo; n: Tgint): PGIConstantInfo; cdecl; external libgirepository;
function g_object_info_get_class_struct(info: PGIObjectInfo): PGIStructInfo; cdecl; external libgirepository;
function g_object_info_get_ref_function(info: PGIObjectInfo): pchar; cdecl; external libgirepository;
function g_object_info_get_ref_function_pointer(info: PGIObjectInfo): TGIObjectInfoRefFunction; cdecl; external libgirepository;
function g_object_info_get_unref_function(info: PGIObjectInfo): pchar; cdecl; external libgirepository;
function g_object_info_get_unref_function_pointer(info: PGIObjectInfo): TGIObjectInfoUnrefFunction; cdecl; external libgirepository;
function g_object_info_get_set_value_function(info: PGIObjectInfo): pchar; cdecl; external libgirepository;
function g_object_info_get_set_value_function_pointer(info: PGIObjectInfo): TGIObjectInfoSetValueFunction; cdecl; external libgirepository;
function g_object_info_get_get_value_function(info: PGIObjectInfo): pchar; cdecl; external libgirepository;
function g_object_info_get_get_value_function_pointer(info: PGIObjectInfo): TGIObjectInfoGetValueFunction; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_OBJECT_INFO(info: Pointer): boolean;
begin
  GI_IS_OBJECT_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_OBJECT;
end;


{$ENDIF read_implementation}
