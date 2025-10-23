{$IFDEF read_interface}

  {GES_DECLARE_TYPE (EffectClip, effect_clip, EFFECT_CLIP); }
type
  TGESEffectClipPrivate = record
  end;
  PGESEffectClipPrivate = ^TGESEffectClipPrivate;

  TGESEffectClip = record
    parent: TGESBaseEffectClip;
    priv: PGESEffectClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESEffectClip = ^TGESEffectClip;

  TGESEffectClipClass = record
    parent_class: TGESBaseEffectClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESEffectClipClass = ^TGESEffectClipClass;

function ges_effect_clip_get_type: TGType; cdecl; external libges;

function ges_effect_clip_new(video_bin_description: Pgchar; audio_bin_description: Pgchar): PGESEffectClip; cdecl; external libges;

// === Konventiert am: 13-12-24 16:37:59 ===

function GES_TYPE_EFFECT_CLIP: TGType;
function GES_EFFECT_CLIP(obj: Pointer): PGESEffectClip;
function GES_IS_EFFECT_CLIP(obj: Pointer): Tgboolean;
function GES_EFFECT_CLIP_CLASS(klass: Pointer): PGESEffectClipClass;
function GES_IS_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESEffectClipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_EFFECT_CLIP: TGType;
begin
  Result := ges_effect_clip_get_type;
end;

function GES_EFFECT_CLIP(obj: Pointer): PGESEffectClip;
begin
  Result := PGESEffectClip(g_type_check_instance_cast(obj, GES_TYPE_EFFECT_CLIP));
end;

function GES_IS_EFFECT_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT_CLIP);
end;

function GES_EFFECT_CLIP_CLASS(klass: Pointer): PGESEffectClipClass;
begin
  Result := PGESEffectClipClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT_CLIP));
end;

function GES_IS_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT_CLIP);
end;

function GES_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESEffectClipClass;
begin
  Result := PGESEffectClipClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
