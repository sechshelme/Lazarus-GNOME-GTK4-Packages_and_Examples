unit quantize;

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

  MagickCore image quantization methods.
 }
{$ifndef MAGICKCORE_QUANTIZE_H}
{$define MAGICKCORE_QUANTIZE_H}
{$include "magick/colorspace.h"}
type
  PDitherMethod = ^TDitherMethod;
  TDitherMethod =  Longint;
  Const
    UndefinedDitherMethod = 0;
    NoDitherMethod = 1;
    RiemersmaDitherMethod = 2;
    FloydSteinbergDitherMethod = 3;
;
type
  PQuantizeInfo = ^TQuantizeInfo;
  TQuantizeInfo = record
      number_colors : Tsize_t;
      tree_depth : Tsize_t;
      dither : TMagickBooleanType;
      colorspace : TColorspaceType;
      measure_error : TMagickBooleanType;
      signature : Tsize_t;
      dither_method : TDitherMethod;
    end;

function CompressImageColormap(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageQuantizeError(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function PosterizeImage(para1:PImage; para2:Tsize_t; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function PosterizeImageChannel(para1:PImage; para2:TChannelType; para3:Tsize_t; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function QuantizeImage(para1:PQuantizeInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function QuantizeImages(para1:PQuantizeInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function RemapImage(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function RemapImages(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function AcquireQuantizeInfo(para1:PImageInfo):PQuantizeInfo;cdecl;external libmagiccore;
function CloneQuantizeInfo(para1:PQuantizeInfo):PQuantizeInfo;cdecl;external libmagiccore;
function DestroyQuantizeInfo(para1:PQuantizeInfo):PQuantizeInfo;cdecl;external libmagiccore;
procedure GetQuantizeInfo(para1:PQuantizeInfo);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:54:33 ===


implementation



end.
