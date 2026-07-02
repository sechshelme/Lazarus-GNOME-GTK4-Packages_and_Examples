{$IFDEF read_interface}


function gi_interface_info_get_n_prerequisites(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_prerequisite(info: PGIInterfaceInfo; n: dword): PGIBaseInfo; cdecl; external libgirepository2;
function gi_interface_info_get_n_properties(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_property(info: PGIInterfaceInfo; n: dword): PGIPropertyInfo; cdecl; external libgirepository2;
function gi_interface_info_get_n_methods(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_method(info: PGIInterfaceInfo; n: dword): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_interface_info_find_method(info: PGIInterfaceInfo; name: pchar): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_interface_info_get_n_signals(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_signal(info: PGIInterfaceInfo; n: dword): PGISignalInfo; cdecl; external libgirepository2;
function gi_interface_info_find_signal(info: PGIInterfaceInfo; name: pchar): PGISignalInfo; cdecl; external libgirepository2;
function gi_interface_info_get_n_vfuncs(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_vfunc(info: PGIInterfaceInfo; n: dword): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_interface_info_find_vfunc(info: PGIInterfaceInfo; name: pchar): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_interface_info_get_n_constants(info: PGIInterfaceInfo): dword; cdecl; external libgirepository2;
function gi_interface_info_get_constant(info: PGIInterfaceInfo; n: dword): PGIConstantInfo; cdecl; external libgirepository2;
function gi_interface_info_get_iface_struct(info: PGIInterfaceInfo): PGIStructInfo; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:25 ===

function GI_TYPE_INTERFACE_INFO: TGType;
function GI_INTERFACE_INFO(obj: Pointer): PGIInterfaceInfo;
function GI_IS_INTERFACE_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_INTERFACE_INFO: TGType;
begin
  GI_TYPE_INTERFACE_INFO := gi_interface_info_get_type;
end;

function GI_INTERFACE_INFO(obj: Pointer): PGIInterfaceInfo;
begin
  Result := PGIInterfaceInfo(g_type_check_instance_cast(obj, GI_TYPE_INTERFACE_INFO));
end;

function GI_IS_INTERFACE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_INTERFACE_INFO);
end;



{$ENDIF read_implementation}
