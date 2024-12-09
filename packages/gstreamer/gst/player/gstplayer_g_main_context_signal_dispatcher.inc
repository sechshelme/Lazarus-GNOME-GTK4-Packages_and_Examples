
{$IFDEF read_interface}

type
  TGstPlayerGMainContextSignalDispatcher = record
  end;
  PGstPlayerGMainContextSignalDispatcher = ^TGstPlayerGMainContextSignalDispatcher;

  TGstPlayerGMainContextSignalDispatcherClass = record
  end;
  PGstPlayerGMainContextSignalDispatcherClass = ^TGstPlayerGMainContextSignalDispatcherClass;

function gst_player_g_main_context_signal_dispatcher_get_type: TGType; cdecl; external libgstplayer;
function gst_player_g_main_context_signal_dispatcher_new(application_context: PGMainContext): PGstPlayerSignalDispatcher; cdecl; external libgstplayer;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj: Pointer): PGstPlayerGMainContextSignalDispatcher;

// === Konventiert am: 8-10-24 18:48:18 ===

function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER: TGType;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj: Pointer): PGstPlayerGMainContextSignalDispatcher;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass: Pointer): PGstPlayerGMainContextSignalDispatcherClass;
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass: Pointer): Tgboolean;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj: Pointer): PGstPlayerGMainContextSignalDispatcherClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER: TGType;
begin
  GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER := gst_player_g_main_context_signal_dispatcher_get_type;
end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj: Pointer): PGstPlayerGMainContextSignalDispatcher;
begin
  Result := PGstPlayerGMainContextSignalDispatcher(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER));
end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass: Pointer): PGstPlayerGMainContextSignalDispatcherClass;
begin
  Result := PGstPlayerGMainContextSignalDispatcherClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER));
end;

function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj: Pointer): PGstPlayerGMainContextSignalDispatcherClass;
begin
  Result := PGstPlayerGMainContextSignalDispatcherClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj: Pointer): PGstPlayerGMainContextSignalDispatcher;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST := PGstPlayerGMainContextSignalDispatcher(obj);
end;


{$ENDIF read_implementation}
