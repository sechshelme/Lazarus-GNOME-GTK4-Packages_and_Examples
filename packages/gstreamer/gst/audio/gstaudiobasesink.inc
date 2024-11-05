/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioBaseSinkSlaveMethod = ^TGstAudioBaseSinkSlaveMethod;
  TGstAudioBaseSinkSlaveMethod = longint;

const
  GST_AUDIO_BASE_SINK_SLAVE_RESAMPLE = 0;
  GST_AUDIO_BASE_SINK_SLAVE_SKEW = 1;
  GST_AUDIO_BASE_SINK_SLAVE_NONE = 2;
  GST_AUDIO_BASE_SINK_SLAVE_CUSTOM = 3;

type

  PGstAudioBaseSinkDiscontReason = ^TGstAudioBaseSinkDiscontReason;
  TGstAudioBaseSinkDiscontReason = longint;

const
  GST_AUDIO_BASE_SINK_DISCONT_REASON_NO_DISCONT = 0;
  GST_AUDIO_BASE_SINK_DISCONT_REASON_NEW_CAPS = 1;
  GST_AUDIO_BASE_SINK_DISCONT_REASON_FLUSH = 2;
  GST_AUDIO_BASE_SINK_DISCONT_REASON_SYNC_LATENCY = 3;
  GST_AUDIO_BASE_SINK_DISCONT_REASON_ALIGNMENT = 4;
  GST_AUDIO_BASE_SINK_DISCONT_REASON_DEVICE_FAILURE = 5;

type
  TGstAudioBaseSinkPrivate = record
  end;
  PGstAudioBaseSinkPrivate = ^tGstAudioBaseSinkPrivate;

  TGstAudioBaseSink = record
    element: TGstBaseSink;
    ringbuffer: PGstAudioRingBuffer;
    buffer_time: Tguint64;
    latency_time: Tguint64;
    next_sample: Tguint64;
    provided_clock: PGstClock;
    eos_rendering: Tgboolean;
    priv: PGstAudioBaseSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioBaseSink = ^TGstAudioBaseSink;

  TGstAudioBaseSinkCustomSlavingCallback = procedure(sink: PGstAudioBaseSink; etime: TGstClockTime; itime: TGstClockTime; requested_skew: PGstClockTimeDiff; discont_reason: TGstAudioBaseSinkDiscontReason;
    user_data: Tgpointer); cdecl;

  TGstAudioBaseSinkClass = record
    parent_class: TGstBaseSinkClass;
    create_ringbuffer: function(sink: PGstAudioBaseSink): PGstAudioRingBuffer; cdecl;
    payload: function(sink: PGstAudioBaseSink; buffer: PGstBuffer): PGstBuffer; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioBaseSinkClass = ^TGstAudioBaseSinkClass;

function gst_audio_base_sink_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_base_sink_create_ringbuffer(sink: PGstAudioBaseSink): PGstAudioRingBuffer; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_provide_clock(sink: PGstAudioBaseSink; provide: Tgboolean); cdecl; external libgstaudio;
function gst_audio_base_sink_get_provide_clock(sink: PGstAudioBaseSink): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_slave_method(sink: PGstAudioBaseSink; method: TGstAudioBaseSinkSlaveMethod); cdecl; external libgstaudio;
function gst_audio_base_sink_get_slave_method(sink: PGstAudioBaseSink): TGstAudioBaseSinkSlaveMethod; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_drift_tolerance(sink: PGstAudioBaseSink; drift_tolerance: Tgint64); cdecl; external libgstaudio;
function gst_audio_base_sink_get_drift_tolerance(sink: PGstAudioBaseSink): Tgint64; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_alignment_threshold(sink: PGstAudioBaseSink; alignment_threshold: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_base_sink_get_alignment_threshold(sink: PGstAudioBaseSink): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_discont_wait(sink: PGstAudioBaseSink; discont_wait: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_base_sink_get_discont_wait(sink: PGstAudioBaseSink): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_base_sink_set_custom_slaving_callback(sink: PGstAudioBaseSink; callback: TGstAudioBaseSinkCustomSlavingCallback; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstaudio;
procedure gst_audio_base_sink_report_device_failure(sink: PGstAudioBaseSink); cdecl; external libgstaudio;

function GST_AUDIO_BASE_SINK_CAST(obj: Pointer): PGstAudioBaseSink;
function GST_AUDIO_BASE_SINK_CLOCK(obj: Pointer): PGstClock;
function GST_AUDIO_BASE_SINK_PAD(obj: Pointer): PGstPad;

// === Konventiert am: 28-9-24 16:57:04 ===

function GST_TYPE_AUDIO_BASE_SINK: TGType;
function GST_AUDIO_BASE_SINK(obj: Pointer): PGstAudioBaseSink;
function GST_AUDIO_BASE_SINK_CLASS(klass: Pointer): PGstAudioBaseSinkClass;
function GST_IS_AUDIO_BASE_SINK(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_BASE_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_BASE_SINK_GET_CLASS(obj: Pointer): PGstAudioBaseSinkClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_BASE_SINK: TGType;
begin
  GST_TYPE_AUDIO_BASE_SINK := gst_audio_base_sink_get_type;
end;

function GST_AUDIO_BASE_SINK(obj: Pointer): PGstAudioBaseSink;
begin
  Result := PGstAudioBaseSink(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_BASE_SINK));
end;

function GST_AUDIO_BASE_SINK_CLASS(klass: Pointer): PGstAudioBaseSinkClass;
begin
  Result := PGstAudioBaseSinkClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_BASE_SINK));
end;

function GST_IS_AUDIO_BASE_SINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_BASE_SINK);
end;

function GST_IS_AUDIO_BASE_SINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_BASE_SINK);
end;

function GST_AUDIO_BASE_SINK_GET_CLASS(obj: Pointer): PGstAudioBaseSinkClass;
begin
  Result := PGstAudioBaseSinkClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_AUDIO_BASE_SINK_CAST(obj: Pointer): PGstAudioBaseSink;
begin
  GST_AUDIO_BASE_SINK_CAST := PGstAudioBaseSink(obj);
end;

function GST_AUDIO_BASE_SINK_CLOCK(obj: Pointer): PGstClock;
begin
  GST_AUDIO_BASE_SINK_CLOCK := GST_AUDIO_BASE_SINK(obj)^.provided_clock;
  //  GST_AUDIO_BASE_SINK_CLOCK:=GST_AUDIO_BASE_SINK(obj)^.clock;
end;

function GST_AUDIO_BASE_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_BASE_SINK_PAD := (GST_BASE_SINK(obj))^.sinkpad;
end;


{$ENDIF read_implementation}
