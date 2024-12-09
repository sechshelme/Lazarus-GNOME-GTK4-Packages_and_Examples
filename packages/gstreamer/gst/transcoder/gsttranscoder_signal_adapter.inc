
{$IFDEF read_interface}

  {G_DECLARE_FINAL_TYPE (GstTranscoderSignalAdapter, gst_transcoder_signal_adapter, GST, TRANSCODER_SIGNAL_ADAPTER, GObject) }
type
  TGstTranscoderSignalAdapterClass = record
    parent_class: TGObjectClass;
  end;
  PGstTranscoderSignalAdapterClass = ^TGstTranscoderSignalAdapterClass;

function gst_transcoder_signal_adapter_get_type: TGType; cdecl; external libgsttranscoder;
function gst_transcoder_signal_adapter_get_transcoder(self: PGstTranscoderSignalAdapter): PGstTranscoder; cdecl; external libgsttranscoder;

// === Konventiert am: 12-10-24 17:57:31 ===

function GST_TYPE_TRANSCODER_SIGNAL_ADAPTER: TGType;
function GST_TRANSCODER_SIGNAL_ADAPTER(obj: Pointer): PGstTranscoderSignalAdapter;
function GST_IS_TRANSCODER_SIGNAL_ADAPTER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TRANSCODER_SIGNAL_ADAPTER: TGType;
begin
  Result := gst_transcoder_signal_adapter_get_type;
end;

function GST_TRANSCODER_SIGNAL_ADAPTER(obj: Pointer): PGstTranscoderSignalAdapter;
begin
  Result := PGstTranscoderSignalAdapter(g_type_check_instance_cast(obj, GST_TYPE_TRANSCODER_SIGNAL_ADAPTER));
end;

function GST_IS_TRANSCODER_SIGNAL_ADAPTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRANSCODER_SIGNAL_ADAPTER);
end;




{$ENDIF read_implementation}
