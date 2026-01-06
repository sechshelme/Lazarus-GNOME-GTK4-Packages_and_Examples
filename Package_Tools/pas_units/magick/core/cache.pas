unit cache;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore cache methods.
 }
{$ifndef MAGICKCORE_CACHE_H}
{$define MAGICKCORE_CACHE_H}
{$include "magick/blob.h"}
type
  PCacheType = ^TCacheType;
  TCacheType =  Longint;
  Const
    UndefinedCache = 0;
    MemoryCache = 1;
    MapCache = 2;
    DiskCache = 3;
    PingCache = 4;
    DistributedCache = 5;
;

function GetImagePixelCacheType(para1:PImage):TCacheType;cdecl;external libmagiccore;
function GetPixelCacheFilename(para1:PImage):Pchar;cdecl;external libmagiccore;
function GetVirtualIndexQueue(para1:PImage):PIndexPacket;cdecl;external libmagiccore;
function GetVirtualPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function GetVirtualPixelQueue(para1:PImage):PPixelPacket;cdecl;external libmagiccore;
function AcquirePixelCachePixels(para1:PImage; para2:PMagickSizeType; para3:PExceptionInfo):pointer;cdecl;external libmagiccore;
function GetAuthenticIndexQueue(para1:PImage):PIndexPacket;cdecl;external libmagiccore;
function CacheComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function GetOneVirtualMagickPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PMagickPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetOneVirtualPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetOneVirtualMethodPixel(para1:PImage; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PPixelPacket; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetOneAuthenticPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function PersistPixelCache(para1:PImage; para2:Pchar; para3:TMagickBooleanType; para4:PMagickOffsetType; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SyncAuthenticPixels(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageExtent(para1:PImage):TMagickSizeType;cdecl;external libmagiccore;
function GetAuthenticPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function GetAuthenticPixelQueue(para1:PImage):PPixelPacket;cdecl;external libmagiccore;
function QueueAuthenticPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function GetPixelCacheVirtualMethod(para1:PImage):TVirtualPixelMethod;cdecl;external libmagiccore;
function SetPixelCacheVirtualMethod(para1:PImage; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external libmagiccore;
procedure CacheComponentTerminus;cdecl;external libmagiccore;
function GetPixelCachePixels(para1:PImage; para2:PMagickSizeType; para3:PExceptionInfo):pointer;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:36:22 ===


implementation



end.
