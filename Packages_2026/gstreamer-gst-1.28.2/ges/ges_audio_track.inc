

  {$IFDEF read_struct}
type
  PGESAudioTrackClass = ^TGESAudioTrackClass;
  TGESAudioTrackClass = record
    parent_class: TGESTrackClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_audio_track_get_type: TGType; cdecl; external libges;
function ges_audio_track_new: PGESAudioTrack; cdecl; external libges;

// === Konventiert am: 27-7-26 19:48:27 ===

function GES_TYPE_AUDIO_TRACK: TGType;
function GES_AUDIO_TRACK(obj: Pointer): PGESAudioTrack;
function GES_IS_AUDIO_TRACK(obj: Pointer): Tgboolean;
function GES_AUDIO_TRACK_CLASS(klass: Pointer): PGESAudioTrackClass;
function GES_IS_AUDIO_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRACK_GET_CLASS(obj: Pointer): PGESAudioTrackClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_AUDIO_TRACK: TGType;
begin
  Result := ges_audio_track_get_type;
end;

function GES_AUDIO_TRACK(obj: Pointer): PGESAudioTrack;
begin
  Result := PGESAudioTrack(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TRACK));
end;

function GES_IS_AUDIO_TRACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TRACK);
end;

function GES_AUDIO_TRACK_CLASS(klass: Pointer): PGESAudioTrackClass;
begin
  Result := PGESAudioTrackClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TRACK));
end;

function GES_IS_AUDIO_TRACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TRACK);
end;

function GES_AUDIO_TRACK_GET_CLASS(obj: Pointer): PGESAudioTrackClass;
begin
  Result := PGESAudioTrackClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
