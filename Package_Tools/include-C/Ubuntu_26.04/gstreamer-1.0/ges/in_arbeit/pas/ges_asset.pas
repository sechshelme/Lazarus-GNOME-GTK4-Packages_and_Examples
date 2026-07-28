unit ges_asset;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_ges, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGESAssetLoadingReturn = ^TGESAssetLoadingReturn;
  TGESAssetLoadingReturn = longint;
const
  GES_ASSET_LOADING_ERROR = 0;
  GES_ASSET_LOADING_ASYNC = 1;
  GES_ASSET_LOADING_OK = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGESAssetClass = ^TGESAssetClass;
  TGESAssetClass = record
    parent: TGObjectClass;
    start_loading: function(self: PGESAsset; error: PPGError): TGESAssetLoadingReturn; cdecl;
    extract: function(self: PGESAsset; error: PPGError): PGESExtractable; cdecl;
    inform_proxy: procedure(self: PGESAsset; proxy_id: Pgchar); cdecl;
    proxied: procedure(self: PGESAsset; proxy: PGESAsset); cdecl;
    request_id_update: function(self: PGESAsset; proposed_new_id: PPgchar; error: PGError): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_asset_get_type: TGType; cdecl; external libges;
function ges_asset_get_extractable_type(self: PGESAsset): TGType; cdecl; external libges;
procedure ges_asset_request_async(extractable_type: TGType; id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libges;
function ges_asset_request(extractable_type: TGType; id: Pgchar; error: PPGError): PGESAsset; cdecl; external libges;
function ges_asset_get_id(self: PGESAsset): Pgchar; cdecl; external libges;
function ges_asset_request_finish(res: PGAsyncResult; error: PPGError): PGESAsset; cdecl; external libges;
function ges_asset_get_error(self: PGESAsset): PGError; cdecl; external libges;
function ges_asset_extract(self: PGESAsset; error: PPGError): PGESExtractable; cdecl; external libges;
function ges_list_assets(filter: TGType): PGList; cdecl; external libges;
function ges_asset_set_proxy(asset: PGESAsset; proxy: PGESAsset): Tgboolean; cdecl; external libges;
function ges_asset_unproxy(asset: PGESAsset; proxy: PGESAsset): Tgboolean; cdecl; external libges;
function ges_asset_list_proxies(asset: PGESAsset): PGList; cdecl; external libges;
function ges_asset_get_proxy_target(proxy: PGESAsset): PGESAsset; cdecl; external libges;
function ges_asset_get_proxy(asset: PGESAsset): PGESAsset; cdecl; external libges;
function ges_asset_needs_reload(extractable_type: TGType; id: Pgchar): Tgboolean; cdecl; external libges;

// === Konventiert am: 27-7-26 19:49:04 ===

function GES_TYPE_ASSET: TGType;
function GES_ASSET(obj: Pointer): PGESAsset;
function GES_IS_ASSET(obj: Pointer): Tgboolean;
function GES_ASSET_CLASS(klass: Pointer): PGESAssetClass;
function GES_IS_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_ASSET_GET_CLASS(obj: Pointer): PGESAssetClass;
{$ENDIF read_function}

implementation

function GES_TYPE_ASSET: TGType;
begin
  Result := ges_asset_get_type;
end;

function GES_ASSET(obj: Pointer): PGESAsset;
begin
  Result := PGESAsset(g_type_check_instance_cast(obj, GES_TYPE_ASSET));
end;

function GES_IS_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_ASSET);
end;

function GES_ASSET_CLASS(klass: Pointer): PGESAssetClass;
begin
  Result := PGESAssetClass(g_type_check_class_cast(klass, GES_TYPE_ASSET));
end;

function GES_IS_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_ASSET);
end;

function GES_ASSET_GET_CLASS(obj: Pointer): PGESAssetClass;
begin
  Result := PGESAssetClass(PGTypeInstance(obj)^.g_class);
end;

end.
