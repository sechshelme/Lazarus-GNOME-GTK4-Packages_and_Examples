unit blob;

interface

uses
  fp_magiccore, magick_type, stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MagickMaxBufferExtent = 81920;
  MagickMinBufferExtent = 16384;

type
  PMapMode = ^TMapMode;
  TMapMode = longint;

const
  ReadMode = 0;
  WriteMode = 1;
  IOMode = 2;
  PersistMode = 3;

function GetBlobFileHandle(para1: PImage): PFILE; cdecl; external libmagiccore;
function BlobToImage(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function PingBlob(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function BlobToFile(para1: pchar; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function FileToImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function GetBlobError(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function ImageToFile(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function InjectImageBlob(para1: PImageInfo; para2: PImage; para3: PImage; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsBlobExempt(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function IsBlobSeekable(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function IsBlobTemporary(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function GetBlobSize(para1: PImage): TMagickSizeType; cdecl; external libmagiccore;
function GetBlobStreamHandler(para1: PImage): TStreamHandler; cdecl; external libmagiccore;
function FileToBlob(para1: pchar; para2: Tsize_t; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagiccore;
function GetBlobStreamData(para1: PImage): pbyte; cdecl; external libmagiccore;
function ImageToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagiccore;
function ImagesToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagiccore;
procedure DestroyBlob(para1: PImage); cdecl; external libmagiccore;
procedure DuplicateBlob(para1: PImage; para2: PImage); cdecl; external libmagiccore;
procedure SetBlobExempt(para1: PImage; para2: TMagickBooleanType); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:47:25 ===


implementation



end.
