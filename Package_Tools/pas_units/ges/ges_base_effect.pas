unit ges_base_effect;

interface

uses
  fp_glib2, fp_gst, ges_types, ges_operation;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

{GES_DECLARE_TYPE (BaseEffect, base_effect, BASE_EFFECT); }
type
  TGESBaseEffectPrivate = record
  end;
  PGESBaseEffectPrivate = ^TGESBaseEffectPrivate;

  TGESBaseEffect = record
      parent : TGESOperation;
      priv : PGESBaseEffectPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  PGESBaseEffect = ^TGESBaseEffect;

  TGESBaseEffectClass = record
      parent_class : TGESOperationClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  PGESBaseEffectClass = ^TGESBaseEffectClass;

  TGESBaseEffectTimeTranslationFunc = function (effect:PGESBaseEffect; time:TGstClockTime; time_property_values:PGHashTable; user_data:Tgpointer):TGstClockTime;cdecl;

function gesbase_effect_get_type: TGType; cdecl; external libges;
function ges_base_effect_register_time_property(effect:PGESBaseEffect; child_property_name:Pgchar):Tgboolean;cdecl;external libges;
function ges_base_effect_set_time_translation_funcs(effect:PGESBaseEffect; source_to_sink_func:TGESBaseEffectTimeTranslationFunc; sink_to_source_func:TGESBaseEffectTimeTranslationFunc; user_data:Tgpointer; destroy:TGDestroyNotify):Tgboolean;cdecl;external libges;
function ges_base_effect_is_time_effect(effect:PGESBaseEffect):Tgboolean;cdecl;external libges;

// === Konventiert am: 12-12-24 19:31:50 ===

function GES_TYPE_BASE_EFFECT: TGType;
function GES_BASE_EFFECT(obj: Pointer): PGESBaseEffect;
function GES_IS_BASE_EFFECT(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLASS(klass: Pointer): PGESBaseEffectClass;
function GES_IS_BASE_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_GET_CLASS(obj: Pointer): PGESBaseEffectClass;

implementation

function GES_TYPE_BASE_EFFECT: TGType;
begin
  Result := gesbase_effect_get_type;
end;

function GES_BASE_EFFECT(obj: Pointer): PGESBaseEffect;
begin
  Result := PGESBaseEffect(g_type_check_instance_cast(obj, GES_TYPE_BASE_EFFECT));
end;

function GES_IS_BASE_EFFECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_EFFECT);
end;

function GES_BASE_EFFECT_CLASS(klass: Pointer): PGESBaseEffectClass;
begin
  Result := PGESBaseEffectClass(g_type_check_class_cast(klass, GES_TYPE_BASE_EFFECT));
end;

function GES_IS_BASE_EFFECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_EFFECT);
end;

function GES_BASE_EFFECT_GET_CLASS(obj: Pointer): PGESBaseEffectClass;
begin
  Result := PGESBaseEffectClass(PGTypeInstance(obj)^.g_class);
end;




end.
