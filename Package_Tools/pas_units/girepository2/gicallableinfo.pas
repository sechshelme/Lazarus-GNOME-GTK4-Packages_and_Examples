unit gicallableinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_callable_info_is_method(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_can_throw_gerror(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_get_return_type(info: PGICallableInfo): PGITypeInfo; cdecl; external libgirepository2;
procedure gi_callable_info_load_return_type(info: PGICallableInfo; _type: PGITypeInfo); cdecl; external libgirepository2;
function gi_callable_info_get_return_attribute(info: PGICallableInfo; name: pchar): pchar; cdecl; external libgirepository2;
function gi_callable_info_iterate_return_attributes(info: PGICallableInfo; iterator: PGIAttributeIter; name: PPchar; value: PPchar): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_get_caller_owns(info: PGICallableInfo): TGITransfer; cdecl; external libgirepository2;
function gi_callable_info_may_return_null(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_skip_return(info: PGICallableInfo): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_get_n_args(info: PGICallableInfo): dword; cdecl; external libgirepository2;
function gi_callable_info_get_arg(info: PGICallableInfo; n: dword): PGIArgInfo; cdecl; external libgirepository2;
procedure gi_callable_info_load_arg(info: PGICallableInfo; n: dword; arg: PGIArgInfo); cdecl; external libgirepository2;
function gi_callable_info_invoke(info: PGICallableInfo; _function: pointer; in_args: PGIArgument; n_in_args: Tsize_t; out_args: PGIArgument;
  n_out_args: Tsize_t; return_value: PGIArgument; error: PPGError): Tgboolean; cdecl; external libgirepository2;
function gi_callable_info_get_instance_ownership_transfer(info: PGICallableInfo): TGITransfer; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:34:34 ===

function GI_TYPE_CALLABLE_INFO: TGType;
function GI_CALLABLE_INFO(obj: Pointer): PGICallableInfo;
function GI_IS_CALLABLE_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_CALLABLE_INFO: TGType;
begin
  GI_TYPE_CALLABLE_INFO := gi_callable_info_get_type;
end;

function GI_CALLABLE_INFO(obj: Pointer): PGICallableInfo;
begin
  Result := PGICallableInfo(g_type_check_instance_cast(obj, GI_TYPE_CALLABLE_INFO));
end;

function GI_IS_CALLABLE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_CALLABLE_INFO);
end;



end.
