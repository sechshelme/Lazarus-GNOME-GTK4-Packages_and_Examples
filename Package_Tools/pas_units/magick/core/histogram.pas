unit histogram;

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

  MagickCore histogram methods.
 }
{$ifndef MAGICKCORE_HISTOGRAM_H}
{$define MAGICKCORE_HISTOGRAM_H}
type
  PColorPacket = ^TColorPacket;
  TColorPacket = record
      pixel : TPixelPacket;
      index : TIndexPacket;
      count : TMagickSizeType;
    end;

function GetImageHistogram(para1:PImage; para2:Psize_t; para3:PExceptionInfo):PColorPacket;cdecl;external libmagiccore;
function UniqueImageColors(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function IdentifyPaletteImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsHistogramImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsPaletteImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function MinMaxStretchImage(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function GetNumberColors(para1:PImage; para2:PFILE; para3:PExceptionInfo):Tsize_t;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:39:57 ===


implementation



end.
