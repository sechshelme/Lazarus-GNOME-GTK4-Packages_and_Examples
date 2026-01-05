
unit MagickWand;
interface

{
  Automatically converted by H2Pas 1.0.0 from MagickWand.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    MagickWand.h
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
Pchar  = ^char;
PExceptionType  = ^ExceptionType;
PImage  = ^Image;
PMagickWand  = ^MagickWand;
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
(* Const before type ignored *)

function MagickGetException(para1:PMagickWand; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetExceptionType(para1:PMagickWand):TExceptionType;cdecl;external;
(* Const before type ignored *)
function IsMagickWand(para1:PMagickWand):TMagickBooleanType;cdecl;external;
function IsMagickWandInstantiated:TMagickBooleanType;cdecl;external;
function MagickClearException(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetIteratorIndex(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function CloneMagickWand(para1:PMagickWand):PMagickWand;cdecl;external;
function DestroyMagickWand(para1:PMagickWand):PMagickWand;cdecl;external;
function NewMagickWand:PMagickWand;cdecl;external;
(* Const before type ignored *)
function NewMagickWandFromImage(para1:PImage):PMagickWand;cdecl;external;
function MagickGetIteratorIndex(para1:PMagickWand):Tssize_t;cdecl;external;
procedure ClearMagickWand(para1:PMagickWand);cdecl;external;
procedure MagickWandGenesis;cdecl;external;
procedure MagickWandTerminus;cdecl;external;
function MagickRelinquishMemory(para1:pointer):pointer;cdecl;external;
procedure MagickResetIterator(para1:PMagickWand);cdecl;external;
procedure MagickSetFirstIterator(para1:PMagickWand);cdecl;external;
procedure MagickSetLastIterator(para1:PMagickWand);cdecl;external;
{$endif}

implementation


end.
