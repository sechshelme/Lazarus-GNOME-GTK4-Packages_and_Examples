unit constitute;

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

  MagickCore image constitute methods.
 }
{$ifndef MAGICKCORE_CONSTITUTE_H}
{$define MAGICKCORE_CONSTITUTE_H}
type
  PStorageType = ^TStorageType;
  TStorageType =  Longint;
  Const
    UndefinedPixel = 0;
    CharPixel = 1;
    DoublePixel = 2;
    FloatPixel = 3;
    IntegerPixel = 4;
    LongPixel = 5;
    QuantumPixel = 6;
    ShortPixel = 7;
;

function ConstituteImage(para1:Tsize_t; para2:Tsize_t; para3:Pchar; para4:TStorageType; para5:pointer; 
           para6:PExceptionInfo):PImage;cdecl;external libmagiccore;
function PingImage(para1:PImageInfo; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function PingImages(para1:PImageInfo; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ReadImage(para1:PImageInfo; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ReadImages(para1:PImageInfo; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ReadInlineImage(para1:PImageInfo; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function WriteImage(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function WriteImages(para1:PImageInfo; para2:PImage; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:39:54 ===


implementation



end.
