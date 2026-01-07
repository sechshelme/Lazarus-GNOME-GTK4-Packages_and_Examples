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

function GetImagePixelCacheType(para1: PImage): TCacheType; cdecl; external libmagiccore;
function GetPixelCacheFilename(para1: PImage): pchar; cdecl; external libmagiccore;
function GetVirtualIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagiccore;
function GetVirtualPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagiccore;
function GetVirtualPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagiccore;
function AcquirePixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagiccore;
function GetAuthenticIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagiccore;
function CacheComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function GetOneVirtualMagickPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PMagickPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetOneVirtualPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetOneVirtualMethodPixel(para1: PImage; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetOneAuthenticPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function PersistPixelCache(para1: PImage; para2: pchar; para3: TMagickBooleanType; para4: PMagickOffsetType; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function SyncAuthenticPixels(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetImageExtent(para1: PImage): TMagickSizeType; cdecl; external libmagiccore;
function GetAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagiccore;
function GetAuthenticPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagiccore;
function QueueAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagiccore;
function GetPixelCacheVirtualMethod(para1: PImage): TVirtualPixelMethod; cdecl; external libmagiccore;
function SetPixelCacheVirtualMethod(para1: PImage; para2: TVirtualPixelMethod): TVirtualPixelMethod; cdecl; external libmagiccore;
procedure CacheComponentTerminus; cdecl; external libmagiccore;
function GetPixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:22 ===


implementation



end.
