{$IFDEF read_interface}

  {GES_DECLARE_TYPE (AudioSource, audio_source, AUDIO_SOURCE); }
type
  TGESAudioSourcePrivate = record
  end;
  PGESAudioSourcePrivate = ^TGESAudioSourcePrivate;

  TGESAudioSource = record
    parent: TGESSource;
    priv: PGESAudioSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioSource = ^TGESAudioSource;

  TGESAudioSourceClass = record
    parent_class: TGESSourceClass;
    create_source: function(obj: PGESTrackElement): PGstElement; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioSourceClass = ^TGESAudioSourceClass;

function ges_audio_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:49:52 ===

function GES_TYPE_AUDIO_SOURCE: TGType;
function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_AUDIO_SOURCE: TGType;
begin
  Result := ges_audio_source_get_type;
end;

function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
begin
  Result := PGESAudioSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
