{$IFDEF read_interface}


function gi_function_info_get_symbol(info: PGIFunctionInfo): pchar; cdecl; external libgirepository2;
function gi_function_info_get_flags(info: PGIFunctionInfo): TGIFunctionInfoFlags; cdecl; external libgirepository2;
function gi_function_info_get_property(info: PGIFunctionInfo): PGIPropertyInfo; cdecl; external libgirepository2;
function gi_function_info_get_vfunc(info: PGIFunctionInfo): PGIVFuncInfo; cdecl; external libgirepository2;

function GI_INVOKE_ERROR: TGQuark;

function gi_invoke_error_quark: TGQuark; cdecl; external libgirepository2;

type
  PGIInvokeError = ^TGIInvokeError;
  TGIInvokeError = longint;

const
  GI_INVOKE_ERROR_FAILED = 0;
  GI_INVOKE_ERROR_SYMBOL_NOT_FOUND = 1;
  GI_INVOKE_ERROR_ARGUMENT_MISMATCH = 2;

function gi_function_info_invoke(info: PGIFunctionInfo; in_args: PGIArgument; n_in_args: Tsize_t; out_args: PGIArgument; n_out_args: Tsize_t;
  return_value: PGIArgument; error: PPGError): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:17 ===

function GI_TYPE_FUNCTION_INFO: TGType;
function GI_FUNCTION_INFO(obj: Pointer): PGIFunctionInfo;
function GI_IS_FUNCTION_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_FUNCTION_INFO: TGType;
begin
  GI_TYPE_FUNCTION_INFO := gi_function_info_get_type;
end;

function GI_FUNCTION_INFO(obj: Pointer): PGIFunctionInfo;
begin
  Result := PGIFunctionInfo(g_type_check_instance_cast(obj, GI_TYPE_FUNCTION_INFO));
end;

function GI_IS_FUNCTION_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_FUNCTION_INFO);
end;


function GI_INVOKE_ERROR: TGQuark;
begin
  GI_INVOKE_ERROR := gi_invoke_error_quark;
end;


{$ENDIF read_implementation}
