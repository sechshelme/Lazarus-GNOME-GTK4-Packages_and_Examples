{$IFDEF read_interface}


type
  PVirtualPixelMethod = ^TVirtualPixelMethod;
  TVirtualPixelMethod = longint;

const
  UndefinedVirtualPixelMethod = 0;
  BackgroundVirtualPixelMethod = 1;
  ConstantVirtualPixelMethod = 2;
  DitherVirtualPixelMethod = 3;
  EdgeVirtualPixelMethod = 4;
  MirrorVirtualPixelMethod = 5;
  RandomVirtualPixelMethod = 6;
  TileVirtualPixelMethod = 7;
  TransparentVirtualPixelMethod = 8;
  MaskVirtualPixelMethod = 9;
  BlackVirtualPixelMethod = 10;
  GrayVirtualPixelMethod = 11;
  WhiteVirtualPixelMethod = 12;
  HorizontalTileVirtualPixelMethod = 13;
  VerticalTileVirtualPixelMethod = 14;
  HorizontalTileEdgeVirtualPixelMethod = 15;
  VerticalTileEdgeVirtualPixelMethod = 16;
  CheckerTileVirtualPixelMethod = 17;

function AcquireAuthenticCacheView(para1: PImage; para2: PExceptionInfo): PCacheView; cdecl; external libmagickcore;
function AcquireCacheView(para1: PImage): PCacheView; cdecl; external libmagickcore;
function AcquireVirtualCacheView(para1: PImage; para2: PExceptionInfo): PCacheView; cdecl; external libmagickcore;
function CloneCacheView(para1: PCacheView): PCacheView; cdecl; external libmagickcore;
function DestroyCacheView(para1: PCacheView): PCacheView; cdecl; external libmagickcore;
function GetCacheViewStorageClass(para1: PCacheView): TClassType; cdecl; external libmagickcore;
function GetCacheViewColorspace(para1: PCacheView): TColorspaceType; cdecl; external libmagickcore;
function GetCacheViewVirtualIndexQueue(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore;
function GetCacheViewVirtualPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewVirtualPixelQueue(para1: PCacheView): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewException(para1: PCacheView): PExceptionInfo; cdecl; external libmagickcore;
function GetCacheViewAuthenticIndexQueue(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore;
function GetOneCacheViewAuthenticPixel(magick_restrict: PCacheView; para2: Tssize_t; para3: Tssize_t; magick_restrict2: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneCacheViewVirtualMethodPixel(para1: PCacheView; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneCacheViewVirtualPixel(magick_restrict: PCacheView; para2: Tssize_t; para3: Tssize_t; magick_restrict2: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetCacheViewStorageClass(para1: PCacheView; para2: TClassType): TMagickBooleanType; cdecl; external libmagickcore;
function SetCacheViewVirtualPixelMethod(magick_restrict: PCacheView; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function SyncCacheViewAuthenticPixels(magick_restrict: PCacheView; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetCacheViewExtent(para1: PCacheView): TMagickSizeType; cdecl; external libmagickcore;
function GetCacheViewChannels(para1: PCacheView): Tsize_t; cdecl; external libmagickcore;
function GetCacheViewAuthenticPixelQueue(para1: PCacheView): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewAuthenticPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function QueueCacheViewAuthenticPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
