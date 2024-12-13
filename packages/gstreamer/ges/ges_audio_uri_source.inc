{$IFDEF read_interface}

  {GES_DECLARE_TYPE (AudioUriSource, audio_uri_source, AUDIO_URI_SOURCE); }
type
  TGESUriSource = record
  end;
  PGESUriSource = ^TGESUriSource;

  TGESAudioUriSourcePrivate = record
  end;
  PGESAudioUriSourcePrivate = ^TGESAudioUriSourcePrivate;

  TGESAudioUriSource = record
    parent: TGESAudioSource;
    uri: Pgchar;
    priv: PGESUriSource;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioUriSource = ^TGESAudioUriSource;

  TGESAudioUriSourceClass = record
    parent_class: TGESAudioSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioUriSourceClass = ^TGESAudioUriSourceClass;

function ges_audio_uri_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:46:51 ===

function GES_TYPE_AUDIO_URI_SOURCE: TGType;
function GES_AUDIO_URI_SOURCE(obj: Pointer): PGESAudioUriSource;
function GES_IS_AUDIO_URI_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_URI_SOURCE_CLASS(klass: Pointer): PGESAudioUriSourceClass;
function GES_IS_AUDIO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESAudioUriSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_AUDIO_URI_SOURCE: TGType;
begin
  Result := ges_audio_uri_source_get_type;
end;

function GES_AUDIO_URI_SOURCE(obj: Pointer): PGESAudioUriSource;
begin
  Result := PGESAudioUriSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_URI_SOURCE));
end;

function GES_IS_AUDIO_URI_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_URI_SOURCE);
end;

function GES_AUDIO_URI_SOURCE_CLASS(klass: Pointer): PGESAudioUriSourceClass;
begin
  Result := PGESAudioUriSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_URI_SOURCE));
end;

function GES_IS_AUDIO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_URI_SOURCE);
end;

function GES_AUDIO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESAudioUriSourceClass;
begin
  Result := PGESAudioUriSourceClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
