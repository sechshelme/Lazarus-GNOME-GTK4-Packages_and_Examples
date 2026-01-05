
unit pixel_iterator;
interface

{
  Automatically converted by H2Pas 1.0.0 from pixel_iterator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pixel_iterator.h
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
PMagickWand  = ^MagickWand;
PPixelIterator  = ^PixelIterator;
PPixelWand  = ^PixelWand;
Psize_t  = ^size_t;
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

  Pixel Iterator Methods.
 }
{$ifndef MAGICKWAND_PIXEL_ITERATOR_H}
{$define MAGICKWAND_PIXEL_ITERATOR_H}
{$include "wand/magick-wand.h"}
{$include "wand/pixel-wand.h"}
type
(* Const before type ignored *)

function PixelGetIteratorException(para1:PPixelIterator; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
function PixelGetIteratorExceptionType(para1:PPixelIterator):TExceptionType;cdecl;external;
(* Const before type ignored *)
function IsPixelIterator(para1:PPixelIterator):TMagickBooleanType;cdecl;external;
function PixelClearIteratorException(para1:PPixelIterator):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function PixelSetIteratorRow(para1:PPixelIterator; para2:Tssize_t):TMagickBooleanType;cdecl;external;
function PixelSyncIterator(para1:PPixelIterator):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ClonePixelIterator(para1:PPixelIterator):PPixelIterator;cdecl;external;
function DestroyPixelIterator(para1:PPixelIterator):PPixelIterator;cdecl;external;
function NewPixelIterator(para1:PMagickWand):PPixelIterator;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function NewPixelRegionIterator(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelIterator;cdecl;external;
function PixelGetCurrentIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external;
function PixelGetNextIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external;
function PixelGetPreviousIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external;
function PixelGetIteratorRow(para1:PPixelIterator):Tssize_t;cdecl;external;
procedure ClearPixelIterator(para1:PPixelIterator);cdecl;external;
procedure PixelResetIterator(para1:PPixelIterator);cdecl;external;
procedure PixelSetFirstIteratorRow(para1:PPixelIterator);cdecl;external;
procedure PixelSetLastIteratorRow(para1:PPixelIterator);cdecl;external;
{$endif}

implementation


end.
