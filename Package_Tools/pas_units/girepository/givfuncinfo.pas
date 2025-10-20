unit givfuncinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_VFUNC_INFO(info: Pointer): boolean;

function g_vfunc_info_get_flags(info: PGIVFuncInfo): TGIVFuncInfoFlags; cdecl; external libgirepository;
function g_vfunc_info_get_offset(info: PGIVFuncInfo): Tgint; cdecl; external libgirepository;
function g_vfunc_info_get_signal(info: PGIVFuncInfo): PGISignalInfo; cdecl; external libgirepository;
function g_vfunc_info_get_invoker(info: PGIVFuncInfo): PGIFunctionInfo; cdecl; external libgirepository;
function g_vfunc_info_get_address(info: PGIVFuncInfo; implementor_gtype: TGType; error: PPGError): Tgpointer; cdecl; external libgirepository;
function g_vfunc_info_invoke(info: PGIVFuncInfo; implementor: TGType; in_args: PGIArgument; n_in_args: longint; out_args: PGIArgument;
  n_out_args: longint; return_value: PGIArgument; error: PPGError): Tgboolean; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:35 ===


implementation


function GI_IS_VFUNC_INFO(info: Pointer): boolean;
begin
  GI_IS_VFUNC_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_VFUNC;
end;


end.
