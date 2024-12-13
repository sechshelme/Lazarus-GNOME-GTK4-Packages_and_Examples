unit ges_effect;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_base_effect;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (Effect, effect, EFFECT); }
type
  TGESEffectPrivate = record
  end;
  PGESEffectPrivate = ^TGESEffectPrivate;

  TGESEffect = record
    parent: TGESBaseEffect;
    priv: PGESEffectPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESEffect = ^TGESEffect;

  TGESEffectClass = record
    parent_class: TGESBaseEffectClass;
    rate_properties: PGList;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESEffectClass = ^TGESEffectClass;

function ges_effect_get_type: TGType; cdecl; external libges;
function ges_effect_new(bin_description: Pgchar): PGESEffect; cdecl; external libges;
function ges_effect_class_register_rate_property(klass: PGESEffectClass; element_name: Pgchar; property_name: Pgchar): Tgboolean; cdecl; external libges;

// === Konventiert am: 13-12-24 16:37:52 ===

function GES_TYPE_EFFECT: TGType;
function GES_EFFECT(obj: Pointer): PGESEffect;
function GES_IS_EFFECT(obj: Pointer): Tgboolean;
function GES_EFFECT_CLASS(klass: Pointer): PGESEffectClass;
function GES_IS_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_GET_CLASS(obj: Pointer): PGESEffectClass;

implementation

function GES_TYPE_EFFECT: TGType;
begin
  Result := ges_effect_get_type;
end;

function GES_EFFECT(obj: Pointer): PGESEffect;
begin
  Result := PGESEffect(g_type_check_instance_cast(obj, GES_TYPE_EFFECT));
end;

function GES_IS_EFFECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT);
end;

function GES_EFFECT_CLASS(klass: Pointer): PGESEffectClass;
begin
  Result := PGESEffectClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT));
end;

function GES_IS_EFFECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT);
end;

function GES_EFFECT_GET_CLASS(obj: Pointer): PGESEffectClass;
begin
  Result := PGESEffectClass(PGTypeInstance(obj)^.g_class);
end;




end.
