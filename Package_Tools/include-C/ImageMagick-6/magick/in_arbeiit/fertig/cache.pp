
unit cache;
interface

{
  Automatically converted by H2Pas 1.0.0 from cache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cache.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PCacheType  = ^CacheType;
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PIndexPacket  = ^IndexPacket;
PMagickOffsetType  = ^MagickOffsetType;
PMagickPixelPacket  = ^MagickPixelPacket;
PMagickSizeType  = ^MagickSizeType;
PPixelPacket  = ^PixelPacket;
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
(* Const before type ignored *)

function GetImagePixelCacheType(para1:PImage):TCacheType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetPixelCacheFilename(para1:PImage):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetVirtualIndexQueue(para1:PImage):PIndexPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetVirtualPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetVirtualPixelQueue(para1:PImage):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquirePixelCachePixels(para1:PImage; para2:PMagickSizeType; para3:PExceptionInfo):pointer;cdecl;external;
(* Const before type ignored *)
function GetAuthenticIndexQueue(para1:PImage):PIndexPacket;cdecl;external;
function CacheComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetOneVirtualMagickPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PMagickPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetOneVirtualPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetOneVirtualMethodPixel(para1:PImage; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PPixelPacket; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetOneAuthenticPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PersistPixelCache(para1:PImage; para2:Pchar; para3:TMagickBooleanType; para4:PMagickOffsetType; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
function SyncAuthenticPixels(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetImageExtent(para1:PImage):TMagickSizeType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetAuthenticPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external;
(* Const before type ignored *)
function GetAuthenticPixelQueue(para1:PImage):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function QueueAuthenticPixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external;
(* Const before type ignored *)
function GetPixelCacheVirtualMethod(para1:PImage):TVirtualPixelMethod;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetPixelCacheVirtualMethod(para1:PImage; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external;
procedure CacheComponentTerminus;cdecl;external;
function GetPixelCachePixels(para1:PImage; para2:PMagickSizeType; para3:PExceptionInfo):pointer;cdecl;external;

implementation


end.
