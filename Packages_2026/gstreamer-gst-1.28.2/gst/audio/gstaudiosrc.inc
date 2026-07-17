

  {$IFDEF read_struct}
type
  PGstAudioSrc = ^TGstAudioSrc;
  TGstAudioSrc = record
    element: TGstAudioBaseSrc;
    thread: PGThread;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstAudioSrcClass = ^TGstAudioSrcClass;
  TGstAudioSrcClass = record
    parent_class: TGstAudioBaseSrcClass;
    open: function(src: PGstAudioSrc): Tgboolean; cdecl;
    prepare: function(src: PGstAudioSrc; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl;
    unprepare: function(src: PGstAudioSrc): Tgboolean; cdecl;
    close: function(src: PGstAudioSrc): Tgboolean; cdecl;
    read: function(src: PGstAudioSrc; data: Tgpointer; length: Tguint; timestamp: PGstClockTime): Tguint; cdecl;
    delay: function(src: PGstAudioSrc): Tguint; cdecl;
    reset: procedure(src: PGstAudioSrc); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_audio_src_get_type: TGType; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:25:25 ===

function GST_TYPE_AUDIO_SRC: TGType;
function GST_AUDIO_SRC(obj: Pointer): PGstAudioSrc;
function GST_AUDIO_SRC_CLASS(klass: Pointer): PGstAudioSrcClass;
function GST_IS_AUDIO_SRC(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_SRC_GET_CLASS(obj: Pointer): PGstAudioSrcClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_SRC: TGType;
begin
  GST_TYPE_AUDIO_SRC := gst_audio_src_get_type;
end;

function GST_AUDIO_SRC(obj: Pointer): PGstAudioSrc;
begin
  Result := PGstAudioSrc(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_SRC));
end;

function GST_AUDIO_SRC_CLASS(klass: Pointer): PGstAudioSrcClass;
begin
  Result := PGstAudioSrcClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_SRC));
end;

function GST_IS_AUDIO_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_SRC);
end;

function GST_IS_AUDIO_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_SRC);
end;

function GST_AUDIO_SRC_GET_CLASS(obj: Pointer): PGstAudioSrcClass;
begin
  Result := PGstAudioSrcClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
