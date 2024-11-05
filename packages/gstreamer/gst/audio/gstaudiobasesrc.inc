/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioBaseSrcSlaveMethod = ^TGstAudioBaseSrcSlaveMethod;
  TGstAudioBaseSrcSlaveMethod = longint;

const
  GST_AUDIO_BASE_SRC_SLAVE_RESAMPLE = 0;
  GST_AUDIO_BASE_SRC_SLAVE_RE_TIMESTAMP = 1;
  GST_AUDIO_BASE_SRC_SLAVE_SKEW = 2;
  GST_AUDIO_BASE_SRC_SLAVE_NONE = 3;

const
  GST_AUDIO_BASE_SRC_SLAVE_RETIMESTAMP = GST_AUDIO_BASE_SRC_SLAVE_RE_TIMESTAMP;

type
  TGstAudioBaseSrcPrivate = record
  end;
  PGstAudioBaseSrcPrivate = ^TGstAudioBaseSrcPrivate;

  TGstAudioBaseSrc = record
    element: TGstPushSrc;
    ringbuffer: PGstAudioRingBuffer;
    buffer_time: TGstClockTime;
    latency_time: TGstClockTime;
    next_sample: Tguint64;
    clock: PGstClock;
    priv: PGstAudioBaseSrcPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioBaseSrc = ^TGstAudioBaseSrc;

  TGstAudioBaseSrcClass = record
    parent_class: TGstPushSrcClass;
    create_ringbuffer: function(src: PGstAudioBaseSrc): PGstAudioRingBuffer; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioBaseSrcClass = ^TGstAudioBaseSrcClass;


function gst_audio_base_src_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_base_src_create_ringbuffer(src: PGstAudioBaseSrc): PGstAudioRingBuffer; cdecl; external libgstaudio;
procedure gst_audio_base_src_set_provide_clock(src: PGstAudioBaseSrc; provide: Tgboolean); cdecl; external libgstaudio;
function gst_audio_base_src_get_provide_clock(src: PGstAudioBaseSrc): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_base_src_set_slave_method(src: PGstAudioBaseSrc; method: TGstAudioBaseSrcSlaveMethod); cdecl; external libgstaudio;
function gst_audio_base_src_get_slave_method(src: PGstAudioBaseSrc): TGstAudioBaseSrcSlaveMethod; cdecl; external libgstaudio;

function GST_AUDIO_BASE_SRC_CAST(obj: Pointer): PGstAudioBaseSrc;
function GST_AUDIO_BASE_SRC_CLOCK(obj: Pointer): PGstClock;
function GST_AUDIO_BASE_SRC_PAD(obj: Pointer): PGstPad;

// === Konventiert am: 28-9-24 19:15:05 ===

function GST_TYPE_AUDIO_BASE_SRC: TGType;
function GST_AUDIO_BASE_SRC(obj: Pointer): PGstAudioBaseSrc;
function GST_AUDIO_BASE_SRC_CLASS(klass: Pointer): PGstAudioBaseSrcClass;
function GST_IS_AUDIO_BASE_SRC(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_BASE_SRC_GET_CLASS(obj: Pointer): PGstAudioBaseSrcClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_BASE_SRC: TGType;
begin
  GST_TYPE_AUDIO_BASE_SRC := gst_audio_base_src_get_type;
end;

function GST_AUDIO_BASE_SRC(obj: Pointer): PGstAudioBaseSrc;
begin
  Result := PGstAudioBaseSrc(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_BASE_SRC));
end;

function GST_AUDIO_BASE_SRC_CLASS(klass: Pointer): PGstAudioBaseSrcClass;
begin
  Result := PGstAudioBaseSrcClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_BASE_SRC));
end;

function GST_IS_AUDIO_BASE_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_BASE_SRC);
end;

function GST_IS_AUDIO_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_BASE_SRC);
end;

function GST_AUDIO_BASE_SRC_GET_CLASS(obj: Pointer): PGstAudioBaseSrcClass;
begin
  Result := PGstAudioBaseSrcClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_AUDIO_BASE_SRC_CAST(obj: Pointer): PGstAudioBaseSrc;
begin
  GST_AUDIO_BASE_SRC_CAST := PGstAudioBaseSrc(obj);
end;

function GST_AUDIO_BASE_SRC_CLOCK(obj: Pointer): PGstClock;
begin
  GST_AUDIO_BASE_SRC_CLOCK := GST_AUDIO_BASE_SRC(obj)^.clock;
end;

function GST_AUDIO_BASE_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_BASE_SRC_PAD := GST_BASE_SRC(obj)^.srcpad;
end;


{$ENDIF read_implementation}
