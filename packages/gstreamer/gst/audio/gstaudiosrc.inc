/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAudioSrc = record
    element: TGstAudioBaseSrc;
    thread: PGThread;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioSrc = ^TGstAudioSrc;

  TGstAudioSrcClass = record
    parent_class: TGstAudioBaseSrcClass;
    Open: function(src: PGstAudioSrc): Tgboolean; cdecl;
    prepare: function(src: PGstAudioSrc; spec: PGstAudioRingBufferSpec): Tgboolean; cdecl;
    unprepare: function(src: PGstAudioSrc): Tgboolean; cdecl;
    Close: function(src: PGstAudioSrc): Tgboolean; cdecl;
    Read: function(src: PGstAudioSrc; Data: Tgpointer; length: Tguint; timestamp: PGstClockTime): Tguint; cdecl;
    delay: function(src: PGstAudioSrc): Tguint; cdecl;
    reset: procedure(src: PGstAudioSrc); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioSrcClass = ^TGstAudioSrcClass;

function gst_audio_src_get_type: TGType; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:49:32 ===

function GST_TYPE_AUDIO_SRC: TGType;
function GST_AUDIO_SRC(obj: Pointer): PGstAudioSrc;
function GST_AUDIO_SRC_CLASS(klass: Pointer): PGstAudioSrcClass;
function GST_IS_AUDIO_SRC(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_SRC_GET_CLASS(obj: Pointer): PGstAudioSrcClass;

{$ENDIF read_interface}


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
