unit MagickWand;

interface

uses
  fp_magiccore, fp_magicwand;

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

  MagickWand Application Programming Interface declarations.
 }
{$ifndef _MAGICK_WAND_H}
{$define _MAGICK_WAND_H}
{$include <stdio.h>}
{$include <stdarg.h>}
{$include <stdlib.h>}
{$include <stdint.h>}
{$include <math.h>}
{$include <sys/types.h>}
{$include <time.h>}
type
{$include "wand/method-attribute.h"}
{$include "magick/MagickCore.h"}
{$include "wand/animate.h"}
{$include "wand/compare.h"}
{$include "wand/composite.h"}
{$include "wand/conjure.h"}
{$include "wand/convert.h"}
{$include "wand/deprecate.h"}
{$include "wand/display.h"}
{$include "wand/drawing-wand.h"}
{$include "wand/identify.h"}
{$include "wand/import.h"}
{$include "wand/magick-property.h"}
{$include "wand/magick-image.h"}
{$include "wand/mogrify.h"}
{$include "wand/montage.h"}
{$include "wand/pixel-iterator.h"}
{$include "wand/pixel-wand.h"}
{$include "wand/stream.h"}
{$include "wand/wand-view.h"}

function MagickGetException(para1:PMagickWand; para2:PExceptionType):Pchar;cdecl;external libmagickwand;
function MagickGetExceptionType(para1:PMagickWand):TExceptionType;cdecl;external libmagickwand;
function IsMagickWand(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagickwand;
function IsMagickWandInstantiated:TMagickBooleanType;cdecl;external libmagickwand;
function MagickClearException(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagickwand;
function MagickSetIteratorIndex(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external libmagickwand;
function CloneMagickWand(para1:PMagickWand):PMagickWand;cdecl;external libmagickwand;
function DestroyMagickWand(para1:PMagickWand):PMagickWand;cdecl;external libmagickwand;
function NewMagickWand:PMagickWand;cdecl;external libmagickwand;
function NewMagickWandFromImage(para1:PImage):PMagickWand;cdecl;external libmagickwand;
function MagickGetIteratorIndex(para1:PMagickWand):Tssize_t;cdecl;external libmagickwand;
procedure ClearMagickWand(para1:PMagickWand);cdecl;external libmagickwand;
procedure MagickWandGenesis;cdecl;external libmagickwand;
procedure MagickWandTerminus;cdecl;external libmagickwand;
function MagickRelinquishMemory(para1:pointer):pointer;cdecl;external libmagickwand;
procedure MagickResetIterator(para1:PMagickWand);cdecl;external libmagickwand;
procedure MagickSetFirstIterator(para1:PMagickWand);cdecl;external libmagickwand;
procedure MagickSetLastIterator(para1:PMagickWand);cdecl;external libmagickwand;
{$endif}

// === Konventiert am: 5-1-26 19:40:07 ===


implementation



end.
