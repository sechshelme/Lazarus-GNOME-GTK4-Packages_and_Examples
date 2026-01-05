unit pixel_iterator;

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

  Pixel Iterator Methods.
 }
{$ifndef MAGICKWAND_PIXEL_ITERATOR_H}
{$define MAGICKWAND_PIXEL_ITERATOR_H}
{$include "wand/magick-wand.h"}
{$include "wand/pixel-wand.h"}
type

function PixelGetIteratorException(para1:PPixelIterator; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function PixelGetIteratorExceptionType(para1:PPixelIterator):TExceptionType;cdecl;external libmagicwand;
function IsPixelIterator(para1:PPixelIterator):TMagickBooleanType;cdecl;external libmagicwand;
function PixelClearIteratorException(para1:PPixelIterator):TMagickBooleanType;cdecl;external libmagicwand;
function PixelSetIteratorRow(para1:PPixelIterator; para2:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function PixelSyncIterator(para1:PPixelIterator):TMagickBooleanType;cdecl;external libmagicwand;
function ClonePixelIterator(para1:PPixelIterator):PPixelIterator;cdecl;external libmagicwand;
function DestroyPixelIterator(para1:PPixelIterator):PPixelIterator;cdecl;external libmagicwand;
function NewPixelIterator(para1:PMagickWand):PPixelIterator;cdecl;external libmagicwand;
function NewPixelRegionIterator(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelIterator;cdecl;external libmagicwand;
function PixelGetCurrentIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external libmagicwand;
function PixelGetNextIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external libmagicwand;
function PixelGetPreviousIteratorRow(para1:PPixelIterator; para2:Psize_t):^PPixelWand;cdecl;external libmagicwand;
function PixelGetIteratorRow(para1:PPixelIterator):Tssize_t;cdecl;external libmagicwand;
procedure ClearPixelIterator(para1:PPixelIterator);cdecl;external libmagicwand;
procedure PixelResetIterator(para1:PPixelIterator);cdecl;external libmagicwand;
procedure PixelSetFirstIteratorRow(para1:PPixelIterator);cdecl;external libmagicwand;
procedure PixelSetLastIteratorRow(para1:PPixelIterator);cdecl;external libmagicwand;
{$endif}

// === Konventiert am: 5-1-26 19:40:13 ===


implementation



end.
