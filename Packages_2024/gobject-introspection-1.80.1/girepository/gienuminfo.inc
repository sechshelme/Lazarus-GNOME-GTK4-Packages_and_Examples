{$IFDEF read_interface}


function GI_IS_ENUM_INFO(info: PGIBaseInfo): boolean; inline;
function GI_IS_VALUE_INFO(info: Pointer): boolean;

function g_enum_info_get_n_values(info: PGIEnumInfo): Tgint; cdecl; external libgirepository;
function g_enum_info_get_value(info: PGIEnumInfo; n: Tgint): PGIValueInfo; cdecl; external libgirepository;
function g_enum_info_get_n_methods(info: PGIEnumInfo): Tgint; cdecl; external libgirepository;
function g_enum_info_get_method(info: PGIEnumInfo; n: Tgint): PGIFunctionInfo; cdecl; external libgirepository;
function g_enum_info_get_storage_type(info: PGIEnumInfo): TGITypeTag; cdecl; external libgirepository;
function g_enum_info_get_error_domain(info: PGIEnumInfo): Pgchar; cdecl; external libgirepository;
function g_value_info_get_value(info: PGIValueInfo): Tgint64; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_ENUM_INFO(info: PGIBaseInfo): boolean;
begin
  Result :=
    (g_base_info_get_type(info) = GI_INFO_TYPE_ENUM) or
    (g_base_info_get_type(info) = GI_INFO_TYPE_FLAGS);
end;

function GI_IS_VALUE_INFO(info: Pointer): boolean;
begin
  GI_IS_VALUE_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_VALUE;
end;


{$ENDIF read_implementation}
