{$IFDEF read_interface}


function GI_IS_SIGNAL_INFO(info: Pointer): Boolean;

function g_signal_info_get_flags(info: PGISignalInfo): TGSignalFlags; cdecl; external libgirepository;
function g_signal_info_get_class_closure(info: PGISignalInfo): PGIVFuncInfo; cdecl; external libgirepository;
function g_signal_info_true_stops_emit(info: PGISignalInfo): Tgboolean; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_SIGNAL_INFO(info: Pointer): Boolean;
begin
  GI_IS_SIGNAL_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_SIGNAL;
end;


{$ENDIF read_implementation}
