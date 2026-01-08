{$IFDEF read_interface}


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

function GetBlobFileHandle(para1: PImage): PFILE; cdecl; external libmagickcore;
function BlobToImage(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingBlob(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlobToFile(para1: pchar; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FileToImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetBlobError(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ImageToFile(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InjectImageBlob(para1: PImageInfo; para2: PImage; para3: PImage; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobExempt(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobSeekable(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobTemporary(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function GetBlobSize(para1: PImage): TMagickSizeType; cdecl; external libmagickcore;
function GetBlobStreamHandler(para1: PImage): TStreamHandler; cdecl; external libmagickcore;
function FileToBlob(para1: pchar; para2: Tsize_t; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
function GetBlobStreamData(para1: PImage): pbyte; cdecl; external libmagickcore;
function ImageToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
function ImagesToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
procedure DestroyBlob(para1: PImage); cdecl; external libmagickcore;
procedure DuplicateBlob(para1: PImage; para2: PImage); cdecl; external libmagickcore;
procedure SetBlobExempt(para1: PImage; para2: TMagickBooleanType); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
