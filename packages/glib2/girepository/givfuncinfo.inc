{$IFDEF read_interface}


function gi_vfunc_info_get_flags(info: PGIVFuncInfo): TGIVFuncInfoFlags; cdecl; external libgirepository2;
function gi_vfunc_info_get_offset(info: PGIVFuncInfo): Tsize_t; cdecl; external libgirepository2;
function gi_vfunc_info_get_signal(info: PGIVFuncInfo): PGISignalInfo; cdecl; external libgirepository2;
function gi_vfunc_info_get_invoker(info: PGIVFuncInfo): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_vfunc_info_get_address(info: PGIVFuncInfo; implementor_gtype: TGType; error: PPGError): pointer; cdecl; external libgirepository2;
function gi_vfunc_info_invoke(info: PGIVFuncInfo; implementor: TGType; in_args: PGIArgument; n_in_args: Tsize_t; out_args: PGIArgument;
  n_out_args: Tsize_t; return_value: PGIArgument; error: PPGError): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:37:31 ===

function GI_TYPE_VFUNC_INFO: TGType;
function GI_VFUNC_INFO(obj: Pointer): PGIVFuncInfo;
function GI_IS_VFUNC_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_VFUNC_INFO: TGType;
begin
  GI_TYPE_VFUNC_INFO := gi_vfunc_info_get_type;
end;

function GI_VFUNC_INFO(obj: Pointer): PGIVFuncInfo;
begin
  Result := PGIVFuncInfo(g_type_check_instance_cast(obj, GI_TYPE_VFUNC_INFO));
end;

function GI_IS_VFUNC_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_VFUNC_INFO);
end;



{$ENDIF read_implementation}
