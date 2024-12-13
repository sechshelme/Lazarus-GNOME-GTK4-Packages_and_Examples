{$IFDEF read_interface}

  {GES_DECLARE_TYPE (AudioTransition, audio_transition, AUDIO_TRANSITION); }
type
  TGESAudioTransitionPrivate = record
  end;
  PGESAudioTransitionPrivate = ^TGESAudioTransitionPrivate;

  TGESAudioTransition = record
    parent: TGESTransition;
    priv: PGESAudioTransitionPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioTransition = ^TGESAudioTransition;

  TGESAudioTransitionClass = record
    parent_class: TGESTransitionClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAudioTransitionClass = ^TGESAudioTransitionClass;

function ges_audio_transition_get_type: TGType; cdecl; external libges;
function ges_audio_transition_new: PGESAudioTransition; cdecl; external libges;

// === Konventiert am: 13-12-24 16:03:49 ===

function GES_TYPE_AUDIO_TRANSITION: TGType;
function GES_AUDIO_TRANSITION(obj: Pointer): PGESAudioTransition;
function GES_IS_AUDIO_TRANSITION(obj: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_CLASS(klass: Pointer): PGESAudioTransitionClass;
function GES_IS_AUDIO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_GET_CLASS(obj: Pointer): PGESAudioTransitionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_AUDIO_TRANSITION: TGType;
begin
  Result := ges_audio_transition_get_type;
end;

function GES_AUDIO_TRANSITION(obj: Pointer): PGESAudioTransition;
begin
  Result := PGESAudioTransition(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TRANSITION));
end;

function GES_IS_AUDIO_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TRANSITION);
end;

function GES_AUDIO_TRANSITION_CLASS(klass: Pointer): PGESAudioTransitionClass;
begin
  Result := PGESAudioTransitionClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TRANSITION));
end;

function GES_IS_AUDIO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TRANSITION);
end;

function GES_AUDIO_TRANSITION_GET_CLASS(obj: Pointer): PGESAudioTransitionClass;
begin
  Result := PGESAudioTransitionClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
