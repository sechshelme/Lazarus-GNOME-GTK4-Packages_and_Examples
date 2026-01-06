unit transform;

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

  MagickCore image transform methods.
 }
{$ifndef MAGICKCORE_TRANSFORM_H}
{$define MAGICKCORE_TRANSFORM_H}

function AutoOrientImage(para1:PImage; para2:TOrientationType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ChopImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ConsolidateCMYKImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CropImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CropImageToTiles(para1:PImage; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ExcerptImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ExtentImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function FlipImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function FlopImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function RollImage(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ShaveImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function SpliceImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function TransposeImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function TransverseImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function TrimImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function TransformImage(para1:PPImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function TransformImages(para1:PPImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:54:38 ===


implementation



end.
