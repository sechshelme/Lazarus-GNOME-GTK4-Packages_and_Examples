{$IFDEF read_interface}


function GI_IS_CONSTANT_INFO(info: Pointer): boolean;

function g_constant_info_get_type(info: PGIConstantInfo): PGITypeInfo; cdecl; external libgirepository;
procedure g_constant_info_free_value(info: PGIConstantInfo; value: PGIArgument); cdecl; external libgirepository;
function g_constant_info_get_value(info: PGIConstantInfo; value: PGIArgument): Tgint; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_CONSTANT_INFO(info: Pointer): boolean;
begin
  GI_IS_CONSTANT_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_CONSTANT;
end;


{$ENDIF read_implementation}
