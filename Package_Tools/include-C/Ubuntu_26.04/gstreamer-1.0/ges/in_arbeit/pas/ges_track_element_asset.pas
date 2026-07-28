unit ges_track_element_asset;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_asset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGESTrackElementAssetClass = ^TGESTrackElementAssetClass;
  TGESTrackElementAssetClass = record
    parent_class: TGESAssetClass;
    get_natural_framerate: function(self: PGESTrackElementAsset; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_track_element_asset_get_type: TGType; cdecl; external libges;
function ges_track_element_asset_get_track_type(asset: PGESTrackElementAsset): TGESTrackType; cdecl; external libges;
procedure ges_track_element_asset_set_track_type(asset: PGESTrackElementAsset; _type: TGESTrackType); cdecl; external libges;
function ges_track_element_asset_get_natural_framerate(self: PGESTrackElementAsset; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl; external libges;

// === Konventiert am: 28-7-26 13:18:18 ===

function GES_TYPE_TRACK_ELEMENT_ASSET: TGType;
function GES_TRACK_ELEMENT_ASSET(obj: Pointer): PGESTrackElementAsset;
function GES_IS_TRACK_ELEMENT_ASSET(obj: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): PGESTrackElementAssetClass;
function GES_IS_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_ASSET_GET_CLASS(obj: Pointer): PGESTrackElementAssetClass;
{$ENDIF read_function}

implementation

function GES_TYPE_TRACK_ELEMENT_ASSET: TGType;
begin
  Result := ges_track_element_asset_get_type;
end;

function GES_TRACK_ELEMENT_ASSET(obj: Pointer): PGESTrackElementAsset;
begin
  Result := PGESTrackElementAsset(g_type_check_instance_cast(obj, GES_TYPE_TRACK_ELEMENT_ASSET));
end;

function GES_IS_TRACK_ELEMENT_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRACK_ELEMENT_ASSET);
end;

function GES_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): PGESTrackElementAssetClass;
begin
  Result := PGESTrackElementAssetClass(g_type_check_class_cast(klass, GES_TYPE_TRACK_ELEMENT_ASSET));
end;

function GES_IS_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRACK_ELEMENT_ASSET);
end;

function GES_TRACK_ELEMENT_ASSET_GET_CLASS(obj: Pointer): PGESTrackElementAssetClass;
begin
  Result := PGESTrackElementAssetClass(PGTypeInstance(obj)^.g_class);
end;

end.
