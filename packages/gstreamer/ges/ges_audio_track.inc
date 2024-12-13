{$IFDEF read_interface}

  {GES_DECLARE_TYPE (AudioTrack, audio_track, AUDIO_TRACK); }
type
  TGESAudioTrackPrivate = record
  end;
  PGESAudioTrackPrivate = ^TGESAudioTrackPrivate;

  TGESAudioTrackClass = record
    parent_class: TGESTrackClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioTrackClass = ^TGESAudioTrackClass;

  TGESAudioTrack = record
    parent_instance: TGESTrack;
    priv: PGESAudioTrackPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioTrack = ^TGESAudioTrack;

function ges_audio_track_get_type: TGType; cdecl; external libges;
function ges_audio_track_new: PGESAudioTrack; cdecl; external libges;

// === Konventiert am: 13-12-24 16:03:45 ===

function GES_TYPE_AUDIO_TRACK: TGType;
function GES_AUDIO_TRACK(obj: Pointer): PGESAudioTrack;
function GES_IS_AUDIO_TRACK(obj: Pointer): Tgboolean;
function GES_AUDIO_TRACK_CLASS(klass: Pointer): PGESAudioTrackClass;
function GES_IS_AUDIO_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRACK_GET_CLASS(obj: Pointer): PGESAudioTrackClass;

{$ENDIF read_interface}


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
