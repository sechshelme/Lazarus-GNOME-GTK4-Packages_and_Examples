{$IFDEF read_interface}

  {GES_DECLARE_TYPE (BaseTransitionClip, base_transition_clip, BASE_TRANSITION_CLIP); }
type
  TGESBaseTransitionClipPrivate = record
  end;
  PGESBaseTransitionClipPrivate = ^TGESBaseTransitionClipPrivate;

  TGESBaseTransitionClip = record
    parent: TGESOperationClip;
    priv: PGESBaseTransitionClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESBaseTransitionClip = ^TGESBaseTransitionClip;

  TGESBaseTransitionClipClass = record
    parent_class: TGESOperationClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESBaseTransitionClipClass = ^TGESBaseTransitionClipClass;

function ges_base_transition_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 16:09:30 ===

function GES_TYPE_BASE_TRANSITION_CLIP: TGType;
function GES_BASE_TRANSITION_CLIP(obj: Pointer): PGESBaseTransitionClip;
function GES_IS_BASE_TRANSITION_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): PGESBaseTransitionClipClass;
function GES_IS_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESBaseTransitionClipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_BASE_TRANSITION_CLIP: TGType;
begin
  Result := ges_base_transition_clip_get_type;
end;

function GES_BASE_TRANSITION_CLIP(obj: Pointer): PGESBaseTransitionClip;
begin
  Result := PGESBaseTransitionClip(g_type_check_instance_cast(obj, GES_TYPE_BASE_TRANSITION_CLIP));
end;

function GES_IS_BASE_TRANSITION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_TRANSITION_CLIP);
end;

function GES_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): PGESBaseTransitionClipClass;
begin
  Result := PGESBaseTransitionClipClass(g_type_check_class_cast(klass, GES_TYPE_BASE_TRANSITION_CLIP));
end;

function GES_IS_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_TRANSITION_CLIP);
end;

function GES_BASE_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESBaseTransitionClipClass;
begin
  Result := PGESBaseTransitionClipClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
