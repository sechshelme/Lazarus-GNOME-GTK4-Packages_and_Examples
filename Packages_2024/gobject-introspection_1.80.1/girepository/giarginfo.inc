{$IFDEF read_interface}


function GI_IS_ARG_INFO(info: Pointer): boolean;

function g_arg_info_get_direction(info: PGIArgInfo): TGIDirection; cdecl; external libgirepository;
function g_arg_info_is_return_value(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository;
function g_arg_info_is_optional(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository;
function g_arg_info_is_caller_allocates(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository;
function g_arg_info_may_be_null(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository;
function g_arg_info_is_skip(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository;
function g_arg_info_get_ownership_transfer(info: PGIArgInfo): TGITransfer; cdecl; external libgirepository;
function g_arg_info_get_scope(info: PGIArgInfo): TGIScopeType; cdecl; external libgirepository;
function g_arg_info_get_closure(info: PGIArgInfo): Tgint; cdecl; external libgirepository;
function g_arg_info_get_destroy(info: PGIArgInfo): Tgint; cdecl; external libgirepository;
function g_arg_info_get_type(info: PGIArgInfo): PGITypeInfo; cdecl; external libgirepository;
procedure g_arg_info_load_type(info: PGIArgInfo; _type: PGITypeInfo); cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_ARG_INFO(info: Pointer): boolean;
begin
  GI_IS_ARG_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_ARG;
end;


{$ENDIF read_implementation}
