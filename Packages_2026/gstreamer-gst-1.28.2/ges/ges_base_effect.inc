

  {$IFDEF read_struct}
type
  PGESBaseEffectClass = ^TGESBaseEffectClass;
  TGESBaseEffectClass = record
    parent_class: TGESOperationClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;

  TGESBaseEffectTimeTranslationFunc = function(effect: PGESBaseEffect; time: TGstClockTime; time_property_values: PGHashTable; user_data: Tgpointer): TGstClockTime; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_base_effect_get_type: TGType; cdecl; external libges;
function ges_base_effect_register_time_property(effect: PGESBaseEffect; child_property_name: Pgchar): Tgboolean; cdecl; external libges;
function ges_base_effect_set_time_translation_funcs(effect: PGESBaseEffect; source_to_sink_func: TGESBaseEffectTimeTranslationFunc; sink_to_source_func: TGESBaseEffectTimeTranslationFunc; user_data: Tgpointer; destroy: TGDestroyNotify): Tgboolean; cdecl; external libges;
function ges_base_effect_is_time_effect(effect: PGESBaseEffect): Tgboolean; cdecl; external libges;

// === Konventiert am: 27-7-26 19:48:09 ===

function GES_TYPE_BASE_EFFECT: TGType;
function GES_BASE_EFFECT(obj: Pointer): PGESBaseEffect;
function GES_IS_BASE_EFFECT(obj: Pointer): Tgboolean;
function GES_BASE_EFFECT_CLASS(klass: Pointer): PGESBaseEffectClass;
function GES_IS_BASE_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_EFFECT_GET_CLASS(obj: Pointer): PGESBaseEffectClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_BASE_EFFECT: TGType;
begin
  Result := ges_base_effect_get_type;
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

{$ENDIF read_implementation}
