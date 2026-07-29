

  {$IFDEF read_struct}
type
  PGESBaseEffectClipClass = ^TGESBaseEffectClipClass;
  TGESBaseEffectClipClass = record
    parent_class: TGESOperationClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function ges_base_effect_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 27-7-26 19:48:04 ===

function GES_TYPE_BASE_EFFECT_CLIP: TGType;
function GES_BASE_EFFECT_CLIP(obj: Pointer): PGESBaseEffectClip;
function GES_IS_BASE_EFFECT_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_CLASS(klass: Pointer): PGESBaseEffectClipClass;
function GES_IS_BASE_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESBaseEffectClipClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_BASE_EFFECT_CLIP: TGType;
begin
  Result := ges_base_effect_clip_get_type;
end;

function GES_BASE_EFFECT_CLIP(obj: Pointer): PGESBaseEffectClip;
begin
  Result := PGESBaseEffectClip(g_type_check_instance_cast(obj, GES_TYPE_BASE_EFFECT_CLIP));
end;

function GES_IS_BASE_EFFECT_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_EFFECT_CLIP);
end;

function GES_BASE_EFFECT_CLIP_CLASS(klass: Pointer): PGESBaseEffectClipClass;
begin
  Result := PGESBaseEffectClipClass(g_type_check_class_cast(klass, GES_TYPE_BASE_EFFECT_CLIP));
end;

function GES_IS_BASE_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_EFFECT_CLIP);
end;

function GES_BASE_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESBaseEffectClipClass;
begin
  Result := PGESBaseEffectClipClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
