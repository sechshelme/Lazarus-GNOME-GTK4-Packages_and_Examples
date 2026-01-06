unit montage;

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

  MagickCore montage methods.
 }
{$ifndef MAGICKCORE_MONTAGE_H}
{$define MAGICKCORE_MONTAGE_H}
type
  PMontageMode = ^TMontageMode;
  TMontageMode =  Longint;
  Const
    UndefinedMode = 0;
    FrameMode = 1;
    UnframeMode = 2;
    ConcatenateMode = 3;
;
type
  PMontageInfo = ^TMontageInfo;
  TMontageInfo = record
      geometry : Pchar;
      tile : Pchar;
      title : Pchar;
      frame : Pchar;
      texture : Pchar;
      font : Pchar;
      pointsize : Tdouble;
      border_width : Tsize_t;
      shadow : TMagickBooleanType;
      fill : TPixelPacket;
      stroke : TPixelPacket;
      background_color : TPixelPacket;
      border_color : TPixelPacket;
      matte_color : TPixelPacket;
      gravity : TGravityType;
      filename : array[0..(MaxTextExtent)-1] of char;
      debug : TMagickBooleanType;
      signature : Tsize_t;
    end;

function MontageImages(para1:PImage; para2:PMontageInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MontageImageList(para1:PImageInfo; para2:PMontageInfo; para3:PImage; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CloneMontageInfo(para1:PImageInfo; para2:PMontageInfo):PMontageInfo;cdecl;external libmagiccore;
function DestroyMontageInfo(para1:PMontageInfo):PMontageInfo;cdecl;external libmagiccore;
procedure GetMontageInfo(para1:PImageInfo; para2:PMontageInfo);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:33:25 ===


implementation



end.
