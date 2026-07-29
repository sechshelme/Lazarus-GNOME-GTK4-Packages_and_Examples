

  {$IFDEF read_struct}
type
  PGESEffectClass = ^TGESEffectClass;
  TGESEffectClass = record
    parent_class: TGESBaseEffectClass;
    rate_properties: PGList;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_effect_get_type: TGType; cdecl; external libges;
function ges_effect_new(bin_description: Pgchar): PGESEffect; cdecl; external libges;
function ges_effect_class_register_rate_property(klass: PGESEffectClass; element_name: Pgchar; property_name: Pgchar): Tgboolean; cdecl; external libges;

// === Konventiert am: 27-7-26 19:54:59 ===

function GES_TYPE_EFFECT: TGType;
function GES_EFFECT(obj: Pointer): PGESEffect;
function GES_IS_EFFECT(obj: Pointer): Tgboolean;
function GES_EFFECT_CLASS(klass: Pointer): PGESEffectClass;
function GES_IS_EFFECT_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_GET_CLASS(obj: Pointer): PGESEffectClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

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

{$ENDIF read_implementation}
