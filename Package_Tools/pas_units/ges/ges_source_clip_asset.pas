unit ges_source_clip_asset;

interface

uses
  fp_glib2, fp_gst, ges_clip_asset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (GESSourceClipAsset, ges_source_clip_asset, GES, SOURCE_CLIP_ASSET, GESClipAsset); }
type
  TGESSourceClipAssetClass = record
    parent_class: TGESClipAssetClass;
  end;
  PGESSourceClipAssetClass = ^TGESSourceClipAssetClass;

  TGESSourceClipAsset = record
    parent_instance: TGESClipAsset
  end;
  PGESSourceClipAsset = ^TGESSourceClipAsset;

function ges_source_clip_asset_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:05:32 ===

function GES_TYPE_SOURCE_CLIP_ASSET: TGType;
function GES_SOURCE_CLIP_ASSET(obj: Pointer): PGESSourceClipAsset;
function GES_IS_SOURCE_CLIP_ASSET(obj: Pointer): Tgboolean;
function GES_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): PGESSourceClipAssetClass;
function GES_IS_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESSourceClipAssetClass;

implementation

function GES_TYPE_SOURCE_CLIP_ASSET: TGType;
begin
  Result := ges_source_clip_asset_get_type;
end;

function GES_SOURCE_CLIP_ASSET(obj: Pointer): PGESSourceClipAsset;
begin
  Result := PGESSourceClipAsset(g_type_check_instance_cast(obj, GES_TYPE_SOURCE_CLIP_ASSET));
end;

function GES_IS_SOURCE_CLIP_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_SOURCE_CLIP_ASSET);
end;

function GES_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): PGESSourceClipAssetClass;
begin
  Result := PGESSourceClipAssetClass(g_type_check_class_cast(klass, GES_TYPE_SOURCE_CLIP_ASSET));
end;

function GES_IS_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_SOURCE_CLIP_ASSET);
end;

function GES_SOURCE_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESSourceClipAssetClass;
begin
  Result := PGESSourceClipAssetClass(PGTypeInstance(obj)^.g_class);
end;


end.
