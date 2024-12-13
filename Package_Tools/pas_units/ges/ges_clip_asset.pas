unit ges_clip_asset;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (ClipAsset, clip_asset, CLIP_ASSET); }
type
  TGESClipAssetPrivate = record
  end;
  PGESClipAssetPrivate = ^TGESClipAssetPrivate;

  TGESClipAsset = record
    parent: TGESAsset;
    priv: PGESClipAssetPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESClipAsset = ^TGESClipAsset;

  TGESClipAssetClass = record
    parent: TGESAssetClass;
    get_natural_framerate: function(self: PGESClipAsset; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING - 1) - 1] of Tgpointer;
  end;
  PGESClipAssetClass = ^TGESClipAssetClass;

function ges_clip_asset_get_type: TGType; cdecl; external libges;
procedure ges_clip_asset_set_supported_formats(self: PGESClipAsset; supportedformats: TGESTrackType); cdecl; external libges;
function ges_clip_asset_get_supported_formats(self: PGESClipAsset): TGESTrackType; cdecl; external libges;
function ges_clip_asset_get_natural_framerate(self: PGESClipAsset; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl; external libges;
function ges_clip_asset_get_frame_time(self: PGESClipAsset; frame_number: TGESFrameNumber): TGstClockTime; cdecl; external libges;

// === Konventiert am: 13-12-24 15:07:59 ===

function GES_TYPE_CLIP_ASSET: TGType;
function GES_CLIP_ASSET(obj: Pointer): PGESClipAsset;
function GES_IS_CLIP_ASSET(obj: Pointer): Tgboolean;
function GES_CLIP_ASSET_CLASS(klass: Pointer): PGESClipAssetClass;
function GES_IS_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESClipAssetClass;

implementation

function GES_TYPE_CLIP_ASSET: TGType;
begin
  Result := ges_clip_asset_get_type;
end;

function GES_CLIP_ASSET(obj: Pointer): PGESClipAsset;
begin
  Result := PGESClipAsset(g_type_check_instance_cast(obj, GES_TYPE_CLIP_ASSET));
end;

function GES_IS_CLIP_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_CLIP_ASSET);
end;

function GES_CLIP_ASSET_CLASS(klass: Pointer): PGESClipAssetClass;
begin
  Result := PGESClipAssetClass(g_type_check_class_cast(klass, GES_TYPE_CLIP_ASSET));
end;

function GES_IS_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_CLIP_ASSET);
end;

function GES_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESClipAssetClass;
begin
  Result := PGESClipAssetClass(PGTypeInstance(obj)^.g_class);
end;


end.
