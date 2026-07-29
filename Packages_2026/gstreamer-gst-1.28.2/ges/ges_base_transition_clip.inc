

  {$IFDEF read_struct}
type
  PGESBaseTransitionClipClass = ^TGESBaseTransitionClipClass;
  TGESBaseTransitionClipClass = record
    parent_class: TGESOperationClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_base_transition_clip_get_type: TGType; cdecl; external libges;


// === Konventiert am: 27-7-26 19:47:58 ===

function GES_TYPE_BASE_TRANSITION_CLIP: TGType;
function GES_BASE_TRANSITION_CLIP(obj: Pointer): PGESBaseTransitionClip;
function GES_IS_BASE_TRANSITION_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): PGESBaseTransitionClipClass;
function GES_IS_BASE_TRANSITION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_TRANSITION_CLIP_GET_CLASS(obj: Pointer): PGESBaseTransitionClipClass;
{$ENDIF read_function}


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
