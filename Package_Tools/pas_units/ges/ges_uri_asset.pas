unit ges_uri_asset;

interface

uses
  fp_glib2, fp_gst, fp_gst_pbutils, ges_types, ges_source_clip_asset, ges_track_element_asset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (UriClipAsset, uri_clip_asset, URI_CLIP_ASSET); }
type
  TGESUriClipAssetPrivate = record
  end;
  PGESUriClipAssetPrivate = ^TGESUriClipAssetPrivate;

  TGESUriClipAsset = record
    parent: TGESSourceClipAsset;
    priv: PGESUriClipAssetPrivate;
    __ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESUriClipAsset = ^TGESUriClipAsset;

  TGESUriClipAssetClass = record
    parent_class: TGESSourceClipAssetClass;
    discoverer: PGstDiscoverer;
    sync_discoverer: PGstDiscoverer;
    discovered: procedure(discoverer: PGstDiscoverer; info: PGstDiscovererInfo; err: PGError; user_data: Tgpointer); cdecl;
    _ges_reserved: array[0..(GES_PADDING - 1) - 1] of Tgpointer;
  end;
  PGESUriClipAssetClass = ^TGESUriClipAssetClass;

function ges_uri_clip_asset_get_type: TGType; cdecl; external libges;
function ges_uri_clip_asset_get_info(self: PGESUriClipAsset): PGstDiscovererInfo; cdecl; external libges;
function ges_uri_clip_asset_get_duration(self: PGESUriClipAsset): TGstClockTime; cdecl; external libges;
function ges_uri_clip_asset_get_max_duration(self: PGESUriClipAsset): TGstClockTime; cdecl; external libges;
function ges_uri_clip_asset_is_image(self: PGESUriClipAsset): Tgboolean; cdecl; external libges;
procedure ges_uri_clip_asset_new(uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libges;
function ges_uri_clip_asset_finish(res: PGAsyncResult; error: PPGError): PGESUriClipAsset; cdecl; external libges;
function ges_uri_clip_asset_request_sync(uri: Pgchar; error: PPGError): PGESUriClipAsset; cdecl; external libges;
procedure ges_uri_clip_asset_class_set_timeout(klass: PGESUriClipAssetClass; timeout: TGstClockTime); cdecl; external libges;
function ges_uri_clip_asset_get_stream_assets(self: PGESUriClipAsset): PGList; cdecl; external libges;

{GES_DECLARE_TYPE (UriSourceAsset, uri_source_asset, URI_SOURCE_ASSET); }
type
  TGESUriSourceAssetPrivate = record
  end;
  PGESUriSourceAssetPrivate = ^TGESUriSourceAssetPrivate;

  TGESUriSourceAsset = record
    parent: TGESTrackElementAsset;
    priv: PGESUriSourceAssetPrivate;
    __ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESUriSourceAsset = ^TGESUriSourceAsset;

  TGESUriSourceAssetClass = record
    parent_class: TGESTrackElementAssetClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESUriSourceAssetClass = ^TGESUriSourceAssetClass;

function ges_uri_source_asset_get_type: TGType; cdecl; external libges;
function ges_uri_source_asset_get_stream_info(asset: PGESUriSourceAsset): PGstDiscovererStreamInfo; cdecl; external libges;
function ges_uri_source_asset_get_stream_uri(asset: PGESUriSourceAsset): Pgchar; cdecl; external libges;
function ges_uri_source_asset_get_filesource_asset(asset: PGESUriSourceAsset): PGESUriClipAsset; cdecl; external libges;
function ges_uri_source_asset_is_image(asset: PGESUriSourceAsset): Tgboolean; cdecl; external libges;

// === Konventiert am: 13-12-24 15:01:02 ===

function GES_TYPE_URI_CLIP_ASSET: TGType;
function GES_URI_CLIP_ASSET(obj: Pointer): PGESUriClipAsset;
function GES_IS_URI_CLIP_ASSET(obj: Pointer): Tgboolean;
function GES_URI_CLIP_ASSET_CLASS(klass: Pointer): PGESUriClipAssetClass;
function GES_IS_URI_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_URI_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESUriClipAssetClass;

function GES_TYPE_URI_SOURCE_ASSET: TGType;
function GES_URI_SOURCE_ASSET(obj: Pointer): PGESUriSourceAsset;
function GES_IS_URI_SOURCE_ASSET(obj: Pointer): Tgboolean;
function GES_URI_SOURCE_ASSET_CLASS(klass: Pointer): PGESUriSourceAssetClass;
function GES_IS_URI_SOURCE_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_URI_SOURCE_ASSET_GET_CLASS(obj: Pointer): PGESUriSourceAssetClass;


implementation

function GES_TYPE_URI_CLIP_ASSET: TGType;
begin
  Result := ges_uri_clip_asset_get_type;
end;

function GES_URI_CLIP_ASSET(obj: Pointer): PGESUriClipAsset;
begin
  Result := PGESUriClipAsset(g_type_check_instance_cast(obj, GES_TYPE_URI_CLIP_ASSET));
end;

function GES_IS_URI_CLIP_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_URI_CLIP_ASSET);
end;

function GES_URI_CLIP_ASSET_CLASS(klass: Pointer): PGESUriClipAssetClass;
begin
  Result := PGESUriClipAssetClass(g_type_check_class_cast(klass, GES_TYPE_URI_CLIP_ASSET));
end;

function GES_IS_URI_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_URI_CLIP_ASSET);
end;

function GES_URI_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESUriClipAssetClass;
begin
  Result := PGESUriClipAssetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GES_TYPE_URI_SOURCE_ASSET: TGType;
begin
  Result := ges_uri_source_asset_get_type;
end;

function GES_URI_SOURCE_ASSET(obj: Pointer): PGESUriSourceAsset;
begin
  Result := PGESUriSourceAsset(g_type_check_instance_cast(obj, GES_TYPE_URI_SOURCE_ASSET));
end;

function GES_IS_URI_SOURCE_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_URI_SOURCE_ASSET);
end;

function GES_URI_SOURCE_ASSET_CLASS(klass: Pointer): PGESUriSourceAssetClass;
begin
  Result := PGESUriSourceAssetClass(g_type_check_class_cast(klass, GES_TYPE_URI_SOURCE_ASSET));
end;

function GES_IS_URI_SOURCE_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_URI_SOURCE_ASSET);
end;

function GES_URI_SOURCE_ASSET_GET_CLASS(obj: Pointer): PGESUriSourceAssetClass;
begin
  Result := PGESUriSourceAssetClass(PGTypeInstance(obj)^.g_class);
end;

end.
