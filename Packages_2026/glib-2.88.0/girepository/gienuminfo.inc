{$IFDEF read_interface}


function gi_enum_info_get_n_values(info: PGIEnumInfo): dword; cdecl; external libgirepository2;
function gi_enum_info_get_value(info: PGIEnumInfo; n: dword): PGIValueInfo; cdecl; external libgirepository2;
function gi_enum_info_get_n_methods(info: PGIEnumInfo): dword; cdecl; external libgirepository2;
function gi_enum_info_get_method(info: PGIEnumInfo; n: dword): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_enum_info_get_storage_type(info: PGIEnumInfo): TGITypeTag; cdecl; external libgirepository2;
function gi_enum_info_get_error_domain(info: PGIEnumInfo): pchar; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:34:56 ===

function GI_TYPE_ENUM_INFO: TGType;
function GI_ENUM_INFO(obj: Pointer): PGIEnumInfo;
function GI_IS_ENUM_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_ENUM_INFO: TGType;
begin
  GI_TYPE_ENUM_INFO := gi_enum_info_get_type;
end;

function GI_ENUM_INFO(obj: Pointer): PGIEnumInfo;
begin
  Result := PGIEnumInfo(g_type_check_instance_cast(obj, GI_TYPE_ENUM_INFO));
end;

function GI_IS_ENUM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_ENUM_INFO);
end;



{$ENDIF read_implementation}
