unit magick;

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
type

  TDecodeImageHandler = function (para1:PImageInfo; para2:PExceptionInfo):TImage;cdecl;
{ xxxxxxxxxx }

  TEncodeImageHandler = function (para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;
{ xxxxxxxxxx }

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

function GetMagickList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetMagickDescription(para1:PMagickInfo):Pchar;cdecl;external libmagiccore;
function GetMagickMimeType(para1:PMagickInfo):Pchar;cdecl;external libmagiccore;
function GetImageDecoder(para1:PMagickInfo):PDecodeImageHandler;cdecl;external libmagiccore;
function GetImageEncoder(para1:PMagickInfo):PEncodeImageHandler;cdecl;external libmagiccore;
function GetMagickPrecision:longint;cdecl;external libmagiccore;
function SetMagickPrecision(para1:longint):longint;cdecl;external libmagiccore;
function GetImageMagick(para1:Pbyte; para2:Tsize_t; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickAdjoin(para1:PMagickInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickBlobSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickEndianSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickRawSupport(para1:PMagickInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickSeekableStream(para1:PMagickInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsMagickCoreInstantiated:TMagickBooleanType;cdecl;external libmagiccore;
function MagickComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function UnregisterMagickInfo(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickInfo(para1:Pchar; para2:PExceptionInfo):PMagickInfo;cdecl;external libmagiccore;
function GetMagickInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PMagickInfo;cdecl;external libmagiccore;
function RegisterMagickInfo(para1:PMagickInfo):PMagickInfo;cdecl;external libmagiccore;
function SetMagickInfo(para1:Pchar):PMagickInfo;cdecl;external libmagiccore;
function GetMagickThreadSupport(para1:PMagickInfo):TMagickStatusType;cdecl;external libmagiccore;
procedure MagickComponentTerminus;cdecl;external libmagiccore;
procedure MagickCoreGenesis(para1:Pchar; para2:TMagickBooleanType);cdecl;external libmagiccore;
procedure MagickCoreTerminus;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:03:23 ===


implementation



end.
