

  {$IFDEF read_struct}
type
  PGstAudioSink = ^TGstAudioSink;
  TGstAudioSink = record
    element: TGstAudioBaseSink;
    thread: PGThread;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstAudioSinkClassExtension = ^TGstAudioSinkClassExtension;

  PGstAudioSinkClass = ^TGstAudioSinkClass;
  TGstAudioSinkClass = record
    parent_class: TGstAudioBaseSinkClass;
    open: function(sink: PGstAudioSink): Tgboolean; cdecl;
    prepare: function(sink: PGstAudioSink; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl;
    unprepare: function(sink: PGstAudioSink): Tgboolean; cdecl;
    close: function(sink: PGstAudioSink): Tgboolean; cdecl;
    write: function(sink: PGstAudioSink; data: Tgpointer; length: Tguint): Tgint; cdecl;
    delay: function(sink: PGstAudioSink): Tguint; cdecl;
    reset: procedure(sink: PGstAudioSink); cdecl;
    pause: procedure(sink: PGstAudioSink); cdecl;
    resume: procedure(sink: PGstAudioSink); cdecl;
    stop: procedure(sink: PGstAudioSink); cdecl;
    extension: PGstAudioSinkClassExtension;
  end;

  TGstAudioSinkClassExtension = record
    clear_all: procedure(sink: PGstAudioSink); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_audio_sink_get_type: TGType; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:25:18 ===

function GST_TYPE_AUDIO_SINK: TGType;
function GST_AUDIO_SINK(obj: Pointer): PGstAudioSink;
function GST_AUDIO_SINK_CLASS(klass: Pointer): PGstAudioSinkClass;
function GST_IS_AUDIO_SINK(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_SINK_GET_CLASS(obj: Pointer): PGstAudioSinkClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_SINK: TGType;
begin
  GST_TYPE_AUDIO_SINK := gst_audio_sink_get_type;
end;

function GST_AUDIO_SINK(obj: Pointer): PGstAudioSink;
begin
  Result := PGstAudioSink(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_SINK));
end;

function GST_AUDIO_SINK_CLASS(klass: Pointer): PGstAudioSinkClass;
begin
  Result := PGstAudioSinkClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_SINK));
end;

function GST_IS_AUDIO_SINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_SINK);
end;

function GST_IS_AUDIO_SINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_SINK);
end;

function GST_AUDIO_SINK_GET_CLASS(obj: Pointer): PGstAudioSinkClass;
begin
  Result := PGstAudioSinkClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
