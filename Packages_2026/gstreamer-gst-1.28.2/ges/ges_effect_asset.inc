

  {$IFDEF read_struct}
type
  PGESEffectAssetClass = ^TGESEffectAssetClass;
  TGESEffectAssetClass = record
    parent_class: TGESTrackElementAssetClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_effect_asset_get_type: TGType; cdecl; external libges;

// === Konventiert am: 27-7-26 19:54:56 ===

function GES_TYPE_EFFECT_ASSET: TGType;
function GES_EFFECT_ASSET(obj: Pointer): PGESEffectAsset;
function GES_IS_EFFECT_ASSET(obj: Pointer): Tgboolean;
function GES_EFFECT_ASSET_CLASS(klass: Pointer): PGESEffectAssetClass;
function GES_IS_EFFECT_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_ASSET_GET_CLASS(obj: Pointer): PGESEffectAssetClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_EFFECT_ASSET: TGType;
begin
  Result := ges_effect_asset_get_type;
end;

function GES_EFFECT_ASSET(obj: Pointer): PGESEffectAsset;
begin
  Result := PGESEffectAsset(g_type_check_instance_cast(obj, GES_TYPE_EFFECT_ASSET));
end;

function GES_IS_EFFECT_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT_ASSET);
end;

function GES_EFFECT_ASSET_CLASS(klass: Pointer): PGESEffectAssetClass;
begin
  Result := PGESEffectAssetClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT_ASSET));
end;

function GES_IS_EFFECT_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT_ASSET);
end;

function GES_EFFECT_ASSET_GET_CLASS(obj: Pointer): PGESEffectAssetClass;
begin
  Result := PGESEffectAssetClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
