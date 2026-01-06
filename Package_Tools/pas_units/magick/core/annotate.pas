unit annotate;

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

  MagickCore image annotation methods.
 }
{$ifndef MAGICKCORE_ANNOTATE_H}
{$define MAGICKCORE_ANNOTATE_H}
{$include "magick/draw.h"}

function AnnotateComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function AnnotateImage(para1:PImage; para2:PDrawInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetMultilineTypeMetrics(para1:PImage; para2:PDrawInfo; para3:PTypeMetric):TMagickBooleanType;cdecl;external libmagiccore;
function GetTypeMetrics(para1:PImage; para2:PDrawInfo; para3:PTypeMetric):TMagickBooleanType;cdecl;external libmagiccore;
function FormatMagickCaption(para1:PImage; para2:PDrawInfo; para3:TMagickBooleanType; para4:PTypeMetric; para5:PPchar):Tssize_t;cdecl;external libmagiccore;
procedure AnnotateComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:12 ===


implementation



end.
