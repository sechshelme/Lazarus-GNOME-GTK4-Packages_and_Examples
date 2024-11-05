/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAudioSink = record
    element: TGstAudioBaseSink;
    thread: PGThread;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioSink = ^TGstAudioSink;

  TGstAudioSinkClassExtension = record
    clear_all: procedure(sink: PGstAudioSink); cdecl;
  end;
  PGstAudioSinkClassExtension = ^TGstAudioSinkClassExtension;

  TGstAudioSinkClass = record
    parent_class: TGstAudioBaseSinkClass;
    Open: function(sink: PGstAudioSink): Tgboolean; cdecl;
    prepare: function(sink: PGstAudioSink; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl;
    unprepare: function(sink: PGstAudioSink): Tgboolean; cdecl;
    Close: function(sink: PGstAudioSink): Tgboolean; cdecl;
    Write: function(sink: PGstAudioSink; Data: Tgpointer; length: Tguint): Tgint; cdecl;
    delay: function(sink: PGstAudioSink): Tguint; cdecl;
    reset: procedure(sink: PGstAudioSink); cdecl;
    pause: procedure(sink: PGstAudioSink); cdecl;
    resume: procedure(sink: PGstAudioSink); cdecl;
    stop: procedure(sink: PGstAudioSink); cdecl;
    extension: PGstAudioSinkClassExtension;
  end;
  PGstAudioSinkClass = ^TGstAudioSinkClass;


function gst_audio_sink_get_type: TGType; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:16:28 ===

function GST_TYPE_AUDIO_SINK: TGType;
function GST_AUDIO_SINK(obj: Pointer): PGstAudioSink;
function GST_AUDIO_SINK_CLASS(klass: Pointer): PGstAudioSinkClass;
function GST_IS_AUDIO_SINK(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_SINK_GET_CLASS(obj: Pointer): PGstAudioSinkClass;

{$ENDIF read_interface}


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
