/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   19:23                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPlayerSignalDispatcherFunc = procedure(Data: Tgpointer); cdecl;
  TGstPlayerSignalDispatcherInterface = record
    parent_iface: TGTypeInterface;
    dispatch: procedure(self: PGstPlayerSignalDispatcher; player: PGstPlayer; emitter: TGstPlayerSignalDispatcherFunc; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl;
  end;
  PGstPlayerSignalDispatcherInterface = ^TGstPlayerSignalDispatcherInterface;

function gst_player_signal_dispatcher_get_type: TGType; cdecl; external libgstplayer;

// === Konventiert am: 8-10-24 18:49:57 ===

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
