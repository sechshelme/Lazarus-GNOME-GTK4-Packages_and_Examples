{$IFDEF read_interface}


function GI_IS_FIELD_INFO(info: Pointer): boolean;

function g_field_info_get_flags(info: PGIFieldInfo): TGIFieldInfoFlags; cdecl; external libgirepository;
function g_field_info_get_size(info: PGIFieldInfo): Tgint; cdecl; external libgirepository;
function g_field_info_get_offset(info: PGIFieldInfo): Tgint; cdecl; external libgirepository;
function g_field_info_get_type(info: PGIFieldInfo): PGITypeInfo; cdecl; external libgirepository;
function g_field_info_get_field(field_info: PGIFieldInfo; mem: Tgpointer; value: PGIArgument): Tgboolean; cdecl; external libgirepository;
function g_field_info_set_field(field_info: PGIFieldInfo; mem: Tgpointer; value: PGIArgument): Tgboolean; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_FIELD_INFO(info: Pointer): boolean;
begin
  GI_IS_FIELD_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_FIELD;
end;


{$ENDIF read_implementation}
