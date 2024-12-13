unit ges_transition_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_base_transition_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (TransitionClip, transition_clip, TRANSITION_CLIP); }
type
  TGESTransitionClipPrivate = record
  end;
  PGESTransitionClipPrivate = ^TGESTransitionClipPrivate;

  TGESTransitionClip = record
    parent: TGESBaseTransitionClip;
    vtype: TGESVideoStandardTransitionType;
    priv: PGESTransitionClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTransitionClip = ^TGESTransitionClip;

  TGESTransitionClipClass = record
    parent_class: TGESBaseTransitionClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTransitionClipClass = ^TGESTransitionClipClass;

function ges_transition_clip_get_type: TGType; cdecl; external libges;
function ges_transition_clip_new(vtype: TGESVideoStandardTransitionType): PGESTransitionClip; cdecl; external libges;
function ges_transition_clip_new_for_nick(nick: pchar): PGESTransitionClip; cdecl; external libges;

// === Konventiert am: 13-12-24 17:01:56 ===

function GES_TYPE_TRANSITION_CLIP: TGType;
function GES_TRANSITION_CLIP(obj: Pointer): PGESTransitionClip;
function GES_IS_TRANSITION_CLIP(obj: Pointer): Tgboolean;
function GES_TRANSITION_CLIP_CLASS(klass: Pointer): PGESTransitionClipClass;
function GES_IS_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESTransitionClipClass;

implementation

function GES_TYPE_TRANSITION_CLIP: TGType;
begin
  Result := ges_transition_clip_get_type;
end;

function GES_TRANSITION_CLIP(obj: Pointer): PGESTransitionClip;
begin
  Result := PGESTransitionClip(g_type_check_instance_cast(obj, GES_TYPE_TRANSITION_CLIP));
end;

function GES_IS_TRANSITION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRANSITION_CLIP);
end;

function GES_TRANSITION_CLIP_CLASS(klass: Pointer): PGESTransitionClipClass;
begin
  Result := PGESTransitionClipClass(g_type_check_class_cast(klass, GES_TYPE_TRANSITION_CLIP));
end;

function GES_IS_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRANSITION_CLIP);
end;

function GES_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESTransitionClipClass;
begin
  Result := PGESTransitionClipClass(PGTypeInstance(obj)^.g_class);
end;




end.
