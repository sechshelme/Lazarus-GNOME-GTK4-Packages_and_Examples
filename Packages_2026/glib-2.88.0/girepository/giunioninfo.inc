{$IFDEF read_interface}


function gi_union_info_get_n_fields(info: PGIUnionInfo): dword; cdecl; external libgirepository2;
function gi_union_info_get_field(info: PGIUnionInfo; n: dword): PGIFieldInfo; cdecl; external libgirepository2;
function gi_union_info_get_n_methods(info: PGIUnionInfo): dword; cdecl; external libgirepository2;
function gi_union_info_get_method(info: PGIUnionInfo; n: dword): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_union_info_is_discriminated(info: PGIUnionInfo): Tgboolean; cdecl; external libgirepository2;
function gi_union_info_get_discriminator_offset(info: PGIUnionInfo; out_offset: Psize_t): Tgboolean; cdecl; external libgirepository2;
function gi_union_info_get_discriminator_type(info: PGIUnionInfo): PGITypeInfo; cdecl; external libgirepository2;
function gi_union_info_get_discriminator(info: PGIUnionInfo; n: Tsize_t): PGIConstantInfo; cdecl; external libgirepository2;
function gi_union_info_find_method(info: PGIUnionInfo; name: pchar): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_union_info_get_size(info: PGIUnionInfo): Tsize_t; cdecl; external libgirepository2;
function gi_union_info_get_alignment(info: PGIUnionInfo): Tsize_t; cdecl; external libgirepository2;
function gi_union_info_get_copy_function_name(info: PGIUnionInfo): pchar; cdecl; external libgirepository2;
function gi_union_info_get_free_function_name(info: PGIUnionInfo): pchar; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:37:09 ===

function GI_TYPE_UNION_INFO: TGType;
function GI_UNION_INFO(obj: Pointer): PGIUnionInfo;
function GI_IS_UNION_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_UNION_INFO: TGType;
begin
  GI_TYPE_UNION_INFO := gi_union_info_get_type;
end;

function GI_UNION_INFO(obj: Pointer): PGIUnionInfo;
begin
  Result := PGIUnionInfo(g_type_check_instance_cast(obj, GI_TYPE_UNION_INFO));
end;

function GI_IS_UNION_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_UNION_INFO);
end;



{$ENDIF read_implementation}
