
{$IFDEF read_interface}

type
  TGstTranscoderSignalAdapter = record
  end;
  PGstTranscoderSignalAdapter = ^TGstTranscoderSignalAdapter;

type
  PGstTranscoderError = ^TGstTranscoderError;
  TGstTranscoderError = longint;

const
  GST_TRANSCODER_ERROR_FAILED = 0;

function gst_transcoder_error_quark: TGQuark; cdecl; external libgsttranscoder;
function gst_transcoder_error_get_name(error: TGstTranscoderError): Pgchar; cdecl; external libgsttranscoder;

type
  PGstTranscoderState = ^TGstTranscoderState;
  TGstTranscoderState = longint;

const
  GST_TRANSCODER_STATE_STOPPED = 0;
  GST_TRANSCODER_STATE_PAUSED = 1;
  GST_TRANSCODER_STATE_PLAYING = 2;

function gst_transcoder_state_get_name(state: TGstTranscoderState): Pgchar; cdecl; external libgsttranscoder;

type
  PGstTranscoderMessage = ^TGstTranscoderMessage;
  TGstTranscoderMessage = longint;

const
  GST_TRANSCODER_MESSAGE_POSITION_UPDATED = 0;
  GST_TRANSCODER_MESSAGE_DURATION_CHANGED = 1;
  GST_TRANSCODER_MESSAGE_STATE_CHANGED = 2;
  GST_TRANSCODER_MESSAGE_DONE = 3;
  GST_TRANSCODER_MESSAGE_ERROR = 4;
  GST_TRANSCODER_MESSAGE_WARNING = 5;

function gst_transcoder_is_transcoder_message(msg: PGstMessage): Tgboolean; cdecl; external libgsttranscoder;
function gst_transcoder_message_get_name(message: TGstTranscoderMessage): Pgchar; cdecl; external libgsttranscoder;
procedure gst_transcoder_message_parse_position(msg: PGstMessage; position: PGstClockTime); cdecl; external libgsttranscoder;
procedure gst_transcoder_message_parse_duration(msg: PGstMessage; duration: PGstClockTime); cdecl; external libgsttranscoder;
procedure gst_transcoder_message_parse_state(msg: PGstMessage; state: PGstTranscoderState); cdecl; external libgsttranscoder;
procedure gst_transcoder_message_parse_error(msg: PGstMessage; error: PGError; details: PPGstStructure); cdecl; external libgsttranscoder;
procedure gst_transcoder_message_parse_warning(msg: PGstMessage; error: PGError; details: PPGstStructure); cdecl; external libgsttranscoder;

type
  TGstTranscoder = record
  end;
  PGstTranscoder = ^TGstTranscoder;

  TGstTranscoderClass = record
    parent_class: TGstObjectClass;
  end;
  PGstTranscoderClass = ^TGstTranscoderClass;

function gst_transcoder_get_type: TGType; cdecl; external libgsttranscoder;
{G_DECLARE_FINAL_TYPE (GstTranscoder, gst_transcoder, GST, TRANSCODER, GstObject) }
function gst_transcoder_new(source_uri: Pgchar; dest_uri: Pgchar; encoding_profile: Pgchar): PGstTranscoder; cdecl; external libgsttranscoder;
function gst_transcoder_new_full(source_uri: Pgchar; dest_uri: Pgchar; profile: PGstEncodingProfile): PGstTranscoder; cdecl; external libgsttranscoder;
function gst_transcoder_run(self: PGstTranscoder; error: PPGError): Tgboolean; cdecl; external libgsttranscoder;
function gst_transcoder_get_message_bus(transcoder: PGstTranscoder): PGstBus; cdecl; external libgsttranscoder;
procedure gst_transcoder_set_cpu_usage(self: PGstTranscoder; cpu_usage: Tgint); cdecl; external libgsttranscoder;
procedure gst_transcoder_run_async(self: PGstTranscoder); cdecl; external libgsttranscoder;
procedure gst_transcoder_set_position_update_interval(self: PGstTranscoder; interval: Tguint); cdecl; external libgsttranscoder;
function gst_transcoder_get_source_uri(self: PGstTranscoder): Pgchar; cdecl; external libgsttranscoder;
function gst_transcoder_get_dest_uri(self: PGstTranscoder): Pgchar; cdecl; external libgsttranscoder;
function gst_transcoder_get_position_update_interval(self: PGstTranscoder): Tguint; cdecl; external libgsttranscoder;
function gst_transcoder_get_position(self: PGstTranscoder): TGstClockTime; cdecl; external libgsttranscoder;
function gst_transcoder_get_duration(self: PGstTranscoder): TGstClockTime; cdecl; external libgsttranscoder;
function gst_transcoder_get_pipeline(self: PGstTranscoder): PGstElement; cdecl; external libgsttranscoder;
function gst_transcoder_get_avoid_reencoding(self: PGstTranscoder): Tgboolean; cdecl; external libgsttranscoder;
procedure gst_transcoder_set_avoid_reencoding(self: PGstTranscoder; avoid_reencoding: Tgboolean); cdecl; external libgsttranscoder;
function gst_transcoder_get_signal_adapter(self: PGstTranscoder; context: PGMainContext): PGstTranscoderSignalAdapter; cdecl; external libgsttranscoder;
function gst_transcoder_get_sync_signal_adapter(self: PGstTranscoder): PGstTranscoderSignalAdapter; cdecl; external libgsttranscoder;

// === Konventiert am: 12-10-24 17:57:20 ===

function GST_TYPE_TRANSCODER: TGType;
function GST_TRANSCODER(obj: Pointer): PGstTranscoder;
function GST_IS_TRANSCODER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TRANSCODER: TGType;
begin
  Result := gst_transcoder_get_type;
end;

function GST_TRANSCODER(obj: Pointer): PGstTranscoder;
begin
  Result := PGstTranscoder(g_type_check_instance_cast(obj, GST_TYPE_TRANSCODER));
end;

function GST_IS_TRANSCODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRANSCODER);
end;



{$ENDIF read_implementation}
