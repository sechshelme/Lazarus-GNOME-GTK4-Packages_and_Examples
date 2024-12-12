unit ges_types;

interface

uses
  fp_glib2, fp_gst, ges_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GES_PADDING = 4;
  GES_PADDING_LARGE = 20;
  GES_FRAME_NUMBER_NONE = Tgint64(9223372036854775807);

  // ==== Ausgelagertes

type
  TGESTrackPrivate = record
  end;
  PGESTrackPrivate = ^TGESTrackPrivate;

  PGESTrack = ^TGESTrack;

  TGESTrack = record
    parent: TGstBin;
    _type: TGESTrackType;
    priv: PGESTrackPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;

  TGESExtractable = record
  end;
  PGESExtractable = ^TGESExtractable;

type
  PGESAssetLoadingReturn = ^TGESAssetLoadingReturn;
  TGESAssetLoadingReturn = longint;

const
  GES_ASSET_LOADING_ERROR = 0;
  GES_ASSET_LOADING_ASYNC = 1;
  GES_ASSET_LOADING_OK = 2;

type
  TGESAssetPrivate = record
  end;
  PGESAssetPrivate = ^TGESAssetPrivate;

  TGESAsset = record
    parent: TGObject;
    priv: PGESAssetPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAsset = ^TGESAsset;

  TGESAssetClass = record
    parent: TGObjectClass;
    start_loading: function(self: PGESAsset; error: PPGError): TGESAssetLoadingReturn; cdecl;
    extract: function(self: PGESAsset; error: PPGError): PGESExtractable; cdecl;
    inform_proxy: procedure(self: PGESAsset; proxy_id: Pgchar); cdecl;
    proxied: procedure(self: PGESAsset; proxy: PGESAsset); cdecl;
    request_id_update: function(self: PGESAsset; proposed_new_id: PPgchar; error: PGError): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESAssetClass = ^TGESAssetClass;

  TGESTimelinePrivate = record
  end;
  PGESTimelinePrivate = ^TGESTimelinePrivate;

  TGESTimeline = record
    parent: TGstBin;
    layers: PGList;
    tracks: PGList;
    priv: PGESTimelinePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTimeline = ^TGESTimeline;

  TGESLayerPrivate = record
  end;
  PGESLayerPrivate = ^TGESLayerPrivate;

  TGESLayer = record
    parent: TGInitiallyUnowned;
    timeline: PGESTimeline;
    min_nle_priority: Tguint32;
    max_nle_priority: Tguint32;
    priv: PGESLayerPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESLayer = ^TGESLayer;

  TGESProjectPrivate = record
  end;
  PGESProjectPrivate = ^TGESProjectPrivate;

  TGESProject = record
    parent: TGESAsset;
    priv: PGESProjectPrivate;
    __ges_reserved: array[0..(GES_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGESProject = ^TGESProject;


  // ====



type
  PGESFrameNumber = ^TGESFrameNumber;
  TGESFrameNumber = Tgint64;

function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): Tgboolean;

const
  GES_TYPE_FRAME_NUMBER = G_TYPE_UINT64;

  // === Konventiert am: 12-12-24 17:06:00 ===


implementation


function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): Tgboolean;
begin
  GES_FRAME_NUMBER_IS_VALID := (TGESFrameNumber(frames)) <> GES_FRAME_NUMBER_NONE;
end;


end.
