/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   19:53                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPlaySignalAdapter = record
  end;
  PGstPlaySignalAdapter = ^TGstPlaySignalAdapter;

  TGstPlaySignalAdapterClass = record
  end;
  PGstPlaySignalAdapterClass = ^TGstPlaySignalAdapterClass;

function gst_play_signal_adapter_get_type: TGType; cdecl; external libgstplay;
function gst_play_signal_adapter_new(play: PGstPlay): PGstPlaySignalAdapter; cdecl; external libgstplay;
function gst_play_signal_adapter_new_with_main_context(play: PGstPlay; context: PGMainContext): PGstPlaySignalAdapter; cdecl; external libgstplay;
function gst_play_signal_adapter_new_sync_emit(play: PGstPlay): PGstPlaySignalAdapter; cdecl; external libgstplay;
function gst_play_signal_adapter_get_play(adapter: PGstPlaySignalAdapter): PGstPlay; cdecl; external libgstplay;

function GST_PLAY_SIGNAL_ADAPTER_CAST(obj: Pointer): PGstPlaySignalAdapter;

// === Konventiert am: 11-10-24 19:17:21 ===

function GST_TYPE_PLAY_SIGNAL_ADAPTER: TGType;
function GST_PLAY_SIGNAL_ADAPTER(obj: Pointer): PGstPlaySignalAdapter;
function GST_PLAY_SIGNAL_ADAPTER_CLASS(klass: Pointer): PGstPlaySignalAdapterClass;
function GST_IS_PLAY_SIGNAL_ADAPTER(obj: Pointer): Tgboolean;
function GST_IS_PLAY_SIGNAL_ADAPTER_CLASS(klass: Pointer): Tgboolean;
function GST_PLAY_SIGNAL_ADAPTER_GET_CLASS(obj: Pointer): PGstPlaySignalAdapterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAY_SIGNAL_ADAPTER: TGType;
begin
  GST_TYPE_PLAY_SIGNAL_ADAPTER := gst_play_signal_adapter_get_type;
end;

function GST_PLAY_SIGNAL_ADAPTER(obj: Pointer): PGstPlaySignalAdapter;
begin
  Result := PGstPlaySignalAdapter(g_type_check_instance_cast(obj, GST_TYPE_PLAY_SIGNAL_ADAPTER));
end;

function GST_PLAY_SIGNAL_ADAPTER_CLASS(klass: Pointer): PGstPlaySignalAdapterClass;
begin
  Result := PGstPlaySignalAdapterClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_SIGNAL_ADAPTER));
end;

function GST_IS_PLAY_SIGNAL_ADAPTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_SIGNAL_ADAPTER);
end;

function GST_IS_PLAY_SIGNAL_ADAPTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_SIGNAL_ADAPTER);
end;

function GST_PLAY_SIGNAL_ADAPTER_GET_CLASS(obj: Pointer): PGstPlaySignalAdapterClass;
begin
  Result := PGstPlaySignalAdapterClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLAY_SIGNAL_ADAPTER_CAST(obj: Pointer): PGstPlaySignalAdapter;
begin
  GST_PLAY_SIGNAL_ADAPTER_CAST := PGstPlaySignalAdapter(obj);
end;


{$ENDIF read_implementation}
