{$IFDEF read_interface}

function GI_IS_FUNCTION_INFO(info: Pointer): boolean;

function g_function_info_get_symbol(info: PGIFunctionInfo): Pgchar; cdecl; external libgirepository;
function g_function_info_get_flags(info: PGIFunctionInfo): TGIFunctionInfoFlags; cdecl; external libgirepository;
function g_function_info_get_property(info: PGIFunctionInfo): PGIPropertyInfo; cdecl; external libgirepository;
function g_function_info_get_vfunc(info: PGIFunctionInfo): PGIVFuncInfo; cdecl; external libgirepository;

function G_INVOKE_ERROR: TGQuark;

function g_invoke_error_quark: TGQuark; cdecl; external libgirepository;

type
  PGInvokeError = ^TGInvokeError;
  TGInvokeError = longint;

const
  G_INVOKE_ERROR_FAILED = 0;
  G_INVOKE_ERROR_SYMBOL_NOT_FOUND = 1;
  G_INVOKE_ERROR_ARGUMENT_MISMATCH = 2;

function g_function_info_invoke(info: PGIFunctionInfo; in_args: PGIArgument; n_in_args: longint; out_args: PGIArgument; n_out_args: longint;
  return_value: PGIArgument; error: PPGError): Tgboolean; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_FUNCTION_INFO(info: Pointer): boolean;
begin
  GI_IS_FUNCTION_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_FUNCTION;
end;

function G_INVOKE_ERROR: TGQuark;
begin
  G_INVOKE_ERROR := g_invoke_error_quark;
end;


{$ENDIF read_implementation}
