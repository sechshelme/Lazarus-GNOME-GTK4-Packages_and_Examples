unit magick;

interface

uses
  fp_magiccore, magick_type, semaphore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMagickFormatType = ^TMagickFormatType;
  TMagickFormatType = longint;

const
  UndefinedFormatType = 0;
  ImplicitFormatType = 1;
  ExplicitFormatType = 2;

type
  PMagickThreadSupport = ^TMagickThreadSupport;
  TMagickThreadSupport = longint;

const
  NoThreadSupport = $0000;
  DecoderThreadSupport = $0001;
  EncoderThreadSupport = $0002;

type
  TDecodeImageHandler = function(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl;
  TEncodeImageHandler = function(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl;
  TIsImageFormatHandler = function(para1: pbyte; para2: Tsize_t): TMagickBooleanType; cdecl;

  PPMagickInfo = ^PMagickInfo;
  PMagickInfo = ^TMagickInfo;

  TMagickInfo = record
    name: pchar;
    description: pchar;
    version: pchar;
    note: pchar;
    magick_module: pchar;
    image_info: PImageInfo;
    decoder: TDecodeImageHandler;
    encoder: TEncodeImageHandler;
    magick: TIsImageFormatHandler;
    client_data: pointer;
    adjoin: TMagickBooleanType;
    raw: TMagickBooleanType;
    endian_support: TMagickBooleanType;
    blob_support: TMagickBooleanType;
    seekable_stream: TMagickBooleanType;
    format_type: TMagickFormatType;
    thread_support: TMagickStatusType;
    stealth: TMagickBooleanType;
    previous: PMagickInfo;
    next: PMagickInfo;
    signature: Tsize_t;
    mime_type: pchar;
    semaphore: PSemaphoreInfo;
  end;

function GetMagickList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetMagickDescription(para1: PMagickInfo): pchar; cdecl; external libmagickcore;
function GetMagickMimeType(para1: PMagickInfo): pchar; cdecl; external libmagickcore;
function GetImageDecoder(para1: PMagickInfo): TDecodeImageHandler; cdecl; external libmagickcore;
function GetImageEncoder(para1: PMagickInfo): TEncodeImageHandler; cdecl; external libmagickcore;
function GetMagickPrecision: longint; cdecl; external libmagickcore;
function SetMagickPrecision(para1: longint): longint; cdecl; external libmagickcore;
function GetImageMagick(para1: pbyte; para2: Tsize_t; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickAdjoin(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickBlobSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickEndianSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickRawSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickSeekableStream(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickCoreInstantiated: TMagickBooleanType; cdecl; external libmagickcore;
function MagickComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function UnregisterMagickInfo(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickInfo(para1: pchar; para2: PExceptionInfo): PMagickInfo; cdecl; external libmagickcore;
function GetMagickInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMagickInfo; cdecl; external libmagickcore;
function RegisterMagickInfo(para1: PMagickInfo): PMagickInfo; cdecl; external libmagickcore;
function SetMagickInfo(para1: pchar): PMagickInfo; cdecl; external libmagickcore;
function GetMagickThreadSupport(para1: PMagickInfo): TMagickStatusType; cdecl; external libmagickcore;
procedure MagickComponentTerminus; cdecl; external libmagickcore;
procedure MagickCoreGenesis(para1: pchar; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure MagickCoreTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:23 ===


implementation



end.
