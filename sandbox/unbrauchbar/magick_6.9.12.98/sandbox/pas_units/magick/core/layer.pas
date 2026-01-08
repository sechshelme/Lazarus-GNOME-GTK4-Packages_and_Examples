unit layer;

interface

uses
  fp_magiccore, magick_type, composite;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDisposeType = ^TDisposeType;
  TDisposeType = longint;

const
  UnrecognizedDispose = 0;
  UndefinedDispose = 0;
  NoneDispose = 1;
  BackgroundDispose = 2;
  PreviousDispose = 3;

type
  PImageLayerMethod = ^TImageLayerMethod;
  TImageLayerMethod = longint;

const
  UndefinedLayer = 0;
  CoalesceLayer = 1;
  CompareAnyLayer = 2;
  CompareClearLayer = 3;
  CompareOverlayLayer = 4;
  DisposeLayer = 5;
  OptimizeLayer = 6;
  OptimizeImageLayer = 7;
  OptimizePlusLayer = 8;
  OptimizeTransLayer = 9;
  RemoveDupsLayer = 10;
  RemoveZeroLayer = 11;
  CompositeLayer = 12;
  MergeLayer = 13;
  FlattenLayer = 14;
  MosaicLayer = 15;
  TrimBoundsLayer = 16;

function CoalesceImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DisposeImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CompareImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DeconstructImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MergeImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizeImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizePlusImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
procedure CompositeLayers(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo); cdecl; external libmagickcore;
procedure OptimizeImageTransparency(para1: PImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveDuplicateLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveZeroDelayLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:52 ===


implementation



end.
