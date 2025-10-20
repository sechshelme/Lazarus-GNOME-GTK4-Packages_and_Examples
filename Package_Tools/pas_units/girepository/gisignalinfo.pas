unit gisignalinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_SIGNAL_INFO(info: Pointer): Boolean;

function g_signal_info_get_flags(info: PGISignalInfo): TGSignalFlags; cdecl; external libgirepository;
function g_signal_info_get_class_closure(info: PGISignalInfo): PGIVFuncInfo; cdecl; external libgirepository;
function g_signal_info_true_stops_emit(info: PGISignalInfo): Tgboolean; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:15 ===


implementation


function GI_IS_SIGNAL_INFO(info: Pointer): Boolean;
begin
  GI_IS_SIGNAL_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_SIGNAL;
end;


end.
