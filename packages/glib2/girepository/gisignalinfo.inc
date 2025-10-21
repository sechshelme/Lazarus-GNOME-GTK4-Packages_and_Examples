{$IFDEF read_interface}


function gi_signal_info_get_flags(info: PGISignalInfo): TGSignalFlags; cdecl; external libgirepository2;
function gi_signal_info_get_class_closure(info: PGISignalInfo): PGIVFuncInfo; cdecl; external libgirepository2;
function gi_signal_info_true_stops_emit(info: PGISignalInfo): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:36:22 ===

function GI_TYPE_SIGNAL_INFO: TGType;
function GI_SIGNAL_INFO(obj: Pointer): PGISignalInfo;
function GI_IS_SIGNAL_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_SIGNAL_INFO: TGType;
begin
  GI_TYPE_SIGNAL_INFO := gi_signal_info_get_type;
end;

function GI_SIGNAL_INFO(obj: Pointer): PGISignalInfo;
begin
  Result := PGISignalInfo(g_type_check_instance_cast(obj, GI_TYPE_SIGNAL_INFO));
end;

function GI_IS_SIGNAL_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_SIGNAL_INFO);
end;



{$ENDIF read_implementation}
