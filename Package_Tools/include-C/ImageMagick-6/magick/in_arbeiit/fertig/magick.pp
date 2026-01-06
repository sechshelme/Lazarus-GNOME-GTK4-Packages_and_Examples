
unit magick;
interface

{
  Automatically converted by H2Pas 1.0.0 from magick.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    magick.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PDecodeImageHandler  = ^DecodeImageHandler;
PEncodeImageHandler  = ^EncodeImageHandler;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
PIsImageFormatHandler  = ^IsImageFormatHandler;
PMagickFormatType  = ^MagickFormatType;
PMagickInfo  = ^MagickInfo;
PMagickThreadSupport  = ^MagickThreadSupport;
PSemaphoreInfo  = ^SemaphoreInfo;
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

  MagickCore magick methods.
 }
{$ifndef MAGICKCORE_MAGICK_H}
{$define MAGICKCORE_MAGICK_H}
{$include <stdarg.h>}
{$include "magick/semaphore.h"}
type
  PMagickFormatType = ^TMagickFormatType;
  TMagickFormatType =  Longint;
  Const
    UndefinedFormatType = 0;
    ImplicitFormatType = 1;
    ExplicitFormatType = 2;
;
type
  PMagickThreadSupport = ^TMagickThreadSupport;
  TMagickThreadSupport =  Longint;
  Const
    NoThreadSupport = $0000;
    DecoderThreadSupport = $0001;
    EncoderThreadSupport = $0002;
;
(* Const before type ignored *)
type

  TDecodeImageHandler = function (para1:PImageInfo; para2:PExceptionInfo):TImage;cdecl;
{ xxxxxxxxxx }
(* Const before type ignored *)

  TEncodeImageHandler = function (para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;
{ xxxxxxxxxx }
(* Const before type ignored *)
(* Const before type ignored *)

  TIsImageFormatHandler = function (para1:Pbyte; para2:Tsize_t):TMagickBooleanType;cdecl;
{ deprecated, use GetMagickInfoList()  }

  PMagickInfo = ^TMagickInfo;
  TMagickInfo = record
      name : Pchar;
      description : Pchar;
      version : Pchar;
      note : Pchar;
      magick_module : Pchar;
      image_info : PImageInfo;
      decoder : PDecodeImageHandler;
      encoder : PEncodeImageHandler;
      magick : PIsImageFormatHandler;
      client_data : pointer;
      adjoin : TMagickBooleanType;
      raw : TMagickBooleanType;
      endian_support : TMagickBooleanType;
      blob_support : TMagickBooleanType;
      seekable_stream : TMagickBooleanType;
      format_type : TMagickFormatType;
      thread_support : TMagickStatusType;
      stealth : TMagickBooleanType;
      previous : PMagickInfo;
      next : PMagickInfo;
      signature : Tsize_t;
      mime_type : Pchar;
      semaphore : PSemaphoreInfo;
    end;
(* Const before type ignored *)

function GetMagickList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickDescription(para1:PMagickInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickMimeType(para1:PMagickInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function GetImageDecoder(para1:PMagickInfo):PDecodeImageHandler;cdecl;external;
(* Const before type ignored *)
function GetImageEncoder(para1:PMagickInfo):PEncodeImageHandler;cdecl;external;
function GetMagickPrecision:longint;cdecl;external;
(* Const before type ignored *)
function SetMagickPrecision(para1:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageMagick(para1:Pbyte; para2:Tsize_t; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickAdjoin(para1:PMagickInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickBlobSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickEndianSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickRawSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickSeekableStream(para1:PMagickInfo):TMagickBooleanType;cdecl;external;
function IsMagickCoreInstantiated:TMagickBooleanType;cdecl;external;
function MagickComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function UnregisterMagickInfo(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickInfo(para1:Pchar; para2:PExceptionInfo):PMagickInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PMagickInfo;cdecl;external;
function RegisterMagickInfo(para1:PMagickInfo):PMagickInfo;cdecl;external;
(* Const before type ignored *)
function SetMagickInfo(para1:Pchar):PMagickInfo;cdecl;external;
(* Const before type ignored *)
function GetMagickThreadSupport(para1:PMagickInfo):TMagickStatusType;cdecl;external;
procedure MagickComponentTerminus;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure MagickCoreGenesis(para1:Pchar; para2:TMagickBooleanType);cdecl;external;
procedure MagickCoreTerminus;cdecl;external;
{$endif}

implementation


end.
