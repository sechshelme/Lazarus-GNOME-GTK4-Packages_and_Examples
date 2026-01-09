unit cache;

interface

uses
  fp_magiccore, magick_type, pixel, cache_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCacheType = ^TCacheType;
  TCacheType = longint;

const
  UndefinedCache = 0;
  MemoryCache = 1;
  MapCache = 2;
  DiskCache = 3;
  PingCache = 4;
  DistributedCache = 5;

function GetImagePixelCacheType(para1: PImage): TCacheType; cdecl; external libmagickcore;
function GetPixelCacheFilename(para1: PImage): pchar; cdecl; external libmagickcore;
function GetVirtualIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagickcore;
function GetVirtualPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetVirtualPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagickcore;
function AcquirePixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;
function GetAuthenticIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagickcore;
function CacheComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualMagickPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PMagickPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualMethodPixel(para1: PImage; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneAuthenticPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PersistPixelCache(para1: PImage; para2: pchar; para3: TMagickBooleanType; para4: PMagickOffsetType; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SyncAuthenticPixels(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageExtent(para1: PImage): TMagickSizeType; cdecl; external libmagickcore;
function GetAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetAuthenticPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagickcore;
function QueueAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetPixelCacheVirtualMethod(para1: PImage): TVirtualPixelMethod; cdecl; external libmagickcore;
function SetPixelCacheVirtualMethod(para1: PImage; para2: TVirtualPixelMethod): TVirtualPixelMethod; cdecl; external libmagickcore;
procedure CacheComponentTerminus; cdecl; external libmagickcore;
function GetPixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:22 ===


implementation



end.
