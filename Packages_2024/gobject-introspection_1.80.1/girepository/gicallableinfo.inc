{$IFDEF read_interface}


function GI_IS_CALLABLE_INFO(info: PGIBaseInfo): boolean; inline;

function g_callable_info_is_method(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository;
function g_callable_info_can_throw_gerror(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository;
function g_callable_info_get_return_type(info: PGICallableInfo): PGITypeInfo; cdecl; external libgirepository;
procedure g_callable_info_load_return_type(info: PGICallableInfo; _type: PGITypeInfo); cdecl; external libgirepository;
function g_callable_info_get_return_attribute(info: PGICallableInfo; name: Pgchar): Pgchar; cdecl; external libgirepository;
function g_callable_info_iterate_return_attributes(info: PGICallableInfo; iterator: PGIAttributeIter; name: PPchar; value: PPchar): Tgboolean; cdecl; external libgirepository;
function g_callable_info_get_caller_owns(info: PGICallableInfo): TGITransfer; cdecl; external libgirepository;
function g_callable_info_may_return_null(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository;
function g_callable_info_skip_return(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository;
function g_callable_info_get_n_args(info: PGICallableInfo): Tgint; cdecl; external libgirepository;
function g_callable_info_get_arg(info: PGICallableInfo; n: Tgint): PGIArgInfo; cdecl; external libgirepository;
procedure g_callable_info_load_arg(info: PGICallableInfo; n: Tgint; arg: PGIArgInfo); cdecl; external libgirepository;
function g_callable_info_invoke(info: PGICallableInfo; _function: Tgpointer; in_args: PGIArgument; n_in_args: longint; out_args: PGIArgument;
  n_out_args: longint; return_value: PGIArgument; is_method: Tgboolean; throws: Tgboolean; error: PPGError): Tgboolean; cdecl; external libgirepository;
function g_callable_info_get_instance_ownership_transfer(info: PGICallableInfo): TGITransfer; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_IS_CALLABLE_INFO(info: PGIBaseInfo): boolean;
begin
  Result :=
    (g_base_info_get_type(info) = GI_INFO_TYPE_FUNCTION) or
    (g_base_info_get_type(info) = GI_INFO_TYPE_CALLBACK) or
    (g_base_info_get_type(info) = GI_INFO_TYPE_SIGNAL) or
    (g_base_info_get_type(info) = GI_INFO_TYPE_VFUNC);
end;


{$ENDIF read_implementation}
