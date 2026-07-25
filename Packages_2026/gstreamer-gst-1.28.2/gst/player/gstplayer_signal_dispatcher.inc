{$IFDEF read_interface}



type
  PGstPlayerSignalDispatcher = type Pointer;

  TGstPlayerSignalDispatcherFunc = procedure(data: Tgpointer); cdecl;
  PGstPlayerSignalDispatcherInterface = ^TGstPlayerSignalDispatcherInterface;
  TGstPlayerSignalDispatcherInterface = record
    parent_iface: TGTypeInterface;
    dispatch: procedure(self: PGstPlayerSignalDispatcher; player: PGstPlayer; emitter: TGstPlayerSignalDispatcherFunc; data: Tgpointer; destroy: TGDestroyNotify); cdecl;
  end;

function gst_player_signal_dispatcher_get_type: TGType; cdecl; external libgstplayer;

// === Konventiert am: 24-7-26 19:52:01 ===

function GST_TYPE_PLAYER_SIGNAL_DISPATCHER: TGType;
function GST_PLAYER_SIGNAL_DISPATCHER(obj: Pointer): PGstPlayerSignalDispatcher;
function GST_IS_PLAYER_SIGNAL_DISPATCHER(obj: Pointer): Tgboolean;
function GST_PLAYER_SIGNAL_DISPATCHER_GET_INTERFACE(obj: Pointer): PGstPlayerSignalDispatcherInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER_SIGNAL_DISPATCHER: TGType;
begin
  GST_TYPE_PLAYER_SIGNAL_DISPATCHER := gst_player_signal_dispatcher_get_type;
end;

function GST_PLAYER_SIGNAL_DISPATCHER(obj: Pointer): PGstPlayerSignalDispatcher;
begin
  Result := PGstPlayerSignalDispatcher(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_SIGNAL_DISPATCHER));
end;

function GST_IS_PLAYER_SIGNAL_DISPATCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_SIGNAL_DISPATCHER);
end;

function GST_PLAYER_SIGNAL_DISPATCHER_GET_INTERFACE(obj: Pointer): PGstPlayerSignalDispatcherInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PLAYER_SIGNAL_DISPATCHER);
end;



{$ENDIF read_implementation}
