unit ges_base_effect_clip;

interface

uses
  fp_glib2, fp_gst, ges_types, ges_operation_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (BaseEffectClip, base_effect_clip, BASE_EFFECT_CLIP); }
type
  TGESBaseEffectClipPrivate = record
  end;
  PGESBaseEffectClipPrivate = ^TGESBaseEffectClipPrivate;

  TGESBaseEffectClip = record
    parent: TGESOperationClip;
    priv: PGESBaseEffectClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESBaseEffectClip = ^TGESBaseEffectClip;

  TGESBaseEffectClipClass = record
    parent_class: TGESOperationClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESBaseEffectClipClass = ^TGESBaseEffectClipClass;

function ges_base_effect_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 16:14:30 ===

function GES_TYPE_BASE_EFFECT_CLIP: TGType;
function GES_BASE_EFFECT_CLIP(obj: Pointer): PGESBaseEffectClip;
function GES_IS_BASE_EFFECT_CLIP(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_CLASS(klass: Pointer): PGESBaseEffectClipClass;
function GES_IS_BASE_EFFECT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLIP_GET_CLASS(obj: Pointer): PGESBaseEffectClipClass;

implementation

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




end.
