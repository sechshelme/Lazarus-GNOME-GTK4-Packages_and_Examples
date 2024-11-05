/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioRingBufferState = ^TGstAudioRingBufferState;
  TGstAudioRingBufferState = longint;

const
  GST_AUDIO_RING_BUFFER_STATE_STOPPED = 0;
  GST_AUDIO_RING_BUFFER_STATE_PAUSED = 1;
  GST_AUDIO_RING_BUFFER_STATE_STARTED = 2;
  GST_AUDIO_RING_BUFFER_STATE_ERROR = 3;

type
  PGstAudioRingBufferFormatType = ^TGstAudioRingBufferFormatType;
  TGstAudioRingBufferFormatType = longint;

const
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_RAW = 0;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MU_LAW = 1;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_A_LAW = 2;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IMA_ADPCM = 3;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG = 4;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_GSM = 5;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IEC958 = 6;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_AC3 = 7;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_EAC3 = 8;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DTS = 9;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC = 10;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC = 11;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC_RAW = 12;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC_RAW = 13;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_FLAC = 14;
  GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD = 15;

type
  PGstAudioRingBufferSpec = ^TGstAudioRingBufferSpec;

  TGstAudioRingBufferSpec = record
    caps: PGstCaps;
    _type: TGstAudioRingBufferFormatType;
    info: TGstAudioInfo;
    latency_time: Tguint64;
    buffer_time: Tguint64;
    segsize: Tgint;
    segtotal: Tgint;
    seglatency: Tgint;
    ABI: record
      case longint of
        0: (abi: record
            dsd_format: TGstDsdFormat;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
      end;
  end;

type
  PGstAudioRingBuffer = ^TGstAudioRingBuffer;
  TGstAudioRingBufferCallback = procedure(rbuf: PGstAudioRingBuffer; Data: Pguint8; len: Tguint; user_data: Tgpointer); cdecl;

  TGstAudioRingBuffer = record
    obj: TGstObject;
    cond: TGCond;
    Open: Tgboolean;
    acquired: Tgboolean;
    memory: Pguint8;
    size: Tgsize;
    timestamps: PGstClockTime;
    spec: TGstAudioRingBufferSpec;
    samples_per_seg: Tgint;
    empty_seg: Pguint8;
    state: Tgint;
    segdone: Tgint;
    segbase: Tgint;
    waiting: Tgint;
    callback: TGstAudioRingBufferCallback;
    cb_data: Tgpointer;
    need_reorder: Tgboolean;
    channel_reorder_map: array[0..63] of Tgint;
    flushing: Tgboolean;
    may_start: Tgint;
    active: Tgboolean;
    cb_data_notify: TGDestroyNotify;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;

  PGstAudioRingBufferClass = ^TGstAudioRingBufferClass;

  TGstAudioRingBufferClass = record
    parent_class: TGstObjectClass;
    open_device: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    acquire: function(buf: PGstAudioRingBuffer; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl;
    Release: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    close_device: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    start: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    pause: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    resume: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    stop: function(buf: PGstAudioRingBuffer): Tgboolean; cdecl;
    delay: function(buf: PGstAudioRingBuffer): Tguint; cdecl;
    activate: function(buf: PGstAudioRingBuffer; active: Tgboolean): Tgboolean; cdecl;
    commit: function(buf: PGstAudioRingBuffer; sample: Pguint64; Data: Pguint8; in_samples: Tgint; out_samples: Tgint;
      accum: Pgint): Tguint; cdecl;
    clear_all: procedure(buf: PGstAudioRingBuffer); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_audio_ring_buffer_get_type: TGType; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_callback(buf: PGstAudioRingBuffer; cb: TGstAudioRingBufferCallback; user_data: Tgpointer); cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_callback_full(buf: PGstAudioRingBuffer; cb: TGstAudioRingBufferCallback; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstaudio;
function gst_audio_ring_buffer_parse_caps(spec: PGstAudioRingBufferSpec; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_debug_spec_caps(spec: PGstAudioRingBufferSpec); cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_debug_spec_buff(spec: PGstAudioRingBufferSpec); cdecl; external libgstaudio;
function gst_audio_ring_buffer_convert(buf: PGstAudioRingBuffer; src_fmt: TGstFormat; src_val: Tgint64; dest_fmt: TGstFormat; dest_val: Pgint64): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_open_device(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_close_device(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_device_is_open(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_acquire(buf: PGstAudioRingBuffer; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_release(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_is_acquired(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_channel_positions(buf: PGstAudioRingBuffer; position: PGstAudioChannelPosition); cdecl; external libgstaudio;
function gst_audio_ring_buffer_activate(buf: PGstAudioRingBuffer; active: Tgboolean): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_is_active(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_flushing(buf: PGstAudioRingBuffer; flushing: Tgboolean); cdecl; external libgstaudio;
function gst_audio_ring_buffer_is_flushing(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_start(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_pause(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
function gst_audio_ring_buffer_stop(buf: PGstAudioRingBuffer): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_errored(buf: PGstAudioRingBuffer); cdecl; external libgstaudio;
function gst_audio_ring_buffer_delay(buf: PGstAudioRingBuffer): Tguint; cdecl; external libgstaudio;
function gst_audio_ring_buffer_samples_done(buf: PGstAudioRingBuffer): Tguint64; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_sample(buf: PGstAudioRingBuffer; sample: Tguint64); cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_clear_all(buf: PGstAudioRingBuffer); cdecl; external libgstaudio;
function gst_audio_ring_buffer_commit(buf: PGstAudioRingBuffer; sample: Pguint64; Data: Pguint8; in_samples: Tgint; out_samples: Tgint;
  accum: Pgint): Tguint; cdecl; external libgstaudio;
function gst_audio_ring_buffer_read(buf: PGstAudioRingBuffer; sample: Tguint64; Data: Pguint8; len: Tguint; timestamp: PGstClockTime): Tguint; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_set_timestamp(buf: PGstAudioRingBuffer; readseg: Tgint; timestamp: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_ring_buffer_prepare_read(buf: PGstAudioRingBuffer; segment: Pgint; readptr: PPguint8; len: Pgint): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_clear(buf: PGstAudioRingBuffer; segment: Tgint); cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_advance(buf: PGstAudioRingBuffer; advance: Tguint); cdecl; external libgstaudio;
procedure gst_audio_ring_buffer_may_start(buf: PGstAudioRingBuffer; allowed: Tgboolean); cdecl; external libgstaudio;

function GST_AUDIO_RING_BUFFER_CAST(obj: Pointer): PGstAudioRingBuffer;

function GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE(spec: PGstAudioRingBufferSpec): TGstAudioRingBufferFormatType;
function GST_AUDIO_RING_BUFFER_SPEC_INFO(spec: PGstAudioRingBufferSpec): TGstAudioInfo;
function GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME(spec: PGstAudioRingBufferSpec): Tguint64;
function GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME(spec: PGstAudioRingBufferSpec): Tguint64;
function GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE(spec: PGstAudioRingBufferSpec): Tgint;
function GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL(spec: PGstAudioRingBufferSpec): Tgint;
function GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY(spec: PGstAudioRingBufferSpec): Tgint;
function GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT(spec: PGstAudioRingBufferSpec): TGstDsdFormat;
function GST_AUDIO_RING_BUFFER_GET_COND(buf: Pointer): PGCond;
procedure GST_AUDIO_RING_BUFFER_WAIT(buf: Pointer);
procedure GST_AUDIO_RING_BUFFER_SIGNAL(buf: Pointer);
procedure GST_AUDIO_RING_BUFFER_BROADCAST(buf: Pointer);



// === Konventiert am: 28-9-24 15:05:10 ===

function GST_TYPE_AUDIO_RING_BUFFER: TGType;
function GST_AUDIO_RING_BUFFER(obj: Pointer): PGstAudioRingBuffer;
function GST_AUDIO_RING_BUFFER_CLASS(klass: Pointer): PGstAudioRingBufferClass;
function GST_IS_AUDIO_RING_BUFFER(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_RING_BUFFER_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_RING_BUFFER_GET_CLASS(obj: Pointer): PGstAudioRingBufferClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_RING_BUFFER: TGType;
begin
  GST_TYPE_AUDIO_RING_BUFFER := gst_audio_ring_buffer_get_type;
end;

function GST_AUDIO_RING_BUFFER(obj: Pointer): PGstAudioRingBuffer;
begin
  Result := PGstAudioRingBuffer(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_RING_BUFFER));
end;

function GST_AUDIO_RING_BUFFER_CLASS(klass: Pointer): PGstAudioRingBufferClass;
begin
  Result := PGstAudioRingBufferClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_RING_BUFFER));
end;

function GST_IS_AUDIO_RING_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_RING_BUFFER);
end;

function GST_IS_AUDIO_RING_BUFFER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_RING_BUFFER);
end;

function GST_AUDIO_RING_BUFFER_GET_CLASS(obj: Pointer): PGstAudioRingBufferClass;
begin
  Result := PGstAudioRingBufferClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_AUDIO_RING_BUFFER_CAST(obj: Pointer): PGstAudioRingBuffer;
begin
  GST_AUDIO_RING_BUFFER_CAST := PGstAudioRingBuffer(obj);
end;

function GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE(spec: PGstAudioRingBufferSpec): TGstAudioRingBufferFormatType;
begin
  GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE := spec^._type;
end;

function GST_AUDIO_RING_BUFFER_SPEC_INFO(spec: PGstAudioRingBufferSpec): TGstAudioInfo;
begin
  GST_AUDIO_RING_BUFFER_SPEC_INFO := spec^.info;
end;

function GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME(spec: PGstAudioRingBufferSpec): Tguint64;
begin
  GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME := spec^.latency_time;
end;

function GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME(spec: PGstAudioRingBufferSpec): Tguint64;
begin
  GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME := spec^.buffer_time;
end;

function GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE(spec: PGstAudioRingBufferSpec): Tgint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE := spec^.segsize;
end;

function GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL(spec: PGstAudioRingBufferSpec): Tgint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL := spec^.segtotal;
end;

function GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY(spec: PGstAudioRingBufferSpec): Tgint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY := spec^.seglatency;
end;

function GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT(spec: PGstAudioRingBufferSpec): TGstDsdFormat;
begin
  GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT := spec^.ABI.abi.dsd_format;
end;

function GST_AUDIO_RING_BUFFER_GET_COND(buf: Pointer): PGCond;
begin
  GST_AUDIO_RING_BUFFER_GET_COND := @((PGstAudioRingBuffer(buf))^.cond);
end;

procedure GST_AUDIO_RING_BUFFER_WAIT(buf: Pointer);
begin
  g_cond_wait(GST_AUDIO_RING_BUFFER_GET_COND(buf), GST_OBJECT_GET_LOCK(buf));
end;

procedure GST_AUDIO_RING_BUFFER_SIGNAL(buf: Pointer);
begin
  g_cond_signal(GST_AUDIO_RING_BUFFER_GET_COND(buf));
end;

procedure GST_AUDIO_RING_BUFFER_BROADCAST(buf: Pointer);
begin
  g_cond_broadcast(GST_AUDIO_RING_BUFFER_GET_COND(buf));
end;


{$ENDIF read_implementation}
