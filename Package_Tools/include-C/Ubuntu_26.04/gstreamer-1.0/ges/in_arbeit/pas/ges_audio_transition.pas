unit ges_audio_transition;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_transition;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESAudioTransitionClass = ^TGESAudioTransitionClass;
  TGESAudioTransitionClass = record
    parent_class: TGESTransitionClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_audio_transition_get_type: TGType; cdecl; external libges;
function ges_audio_transition_new: PGESAudioTransition; cdecl; external libges; deprecated;

// === Konventiert am: 27-7-26 19:48:23 ===

function GES_TYPE_AUDIO_TRANSITION: TGType;
function GES_AUDIO_TRANSITION(obj: Pointer): PGESAudioTransition;
function GES_IS_AUDIO_TRANSITION(obj: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_CLASS(klass: Pointer): PGESAudioTransitionClass;
function GES_IS_AUDIO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TRANSITION_GET_CLASS(obj: Pointer): PGESAudioTransitionClass;
{$ENDIF read_function}

implementation

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

end.
