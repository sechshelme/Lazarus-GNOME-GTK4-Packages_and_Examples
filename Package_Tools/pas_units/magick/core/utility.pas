unit utility;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPathType = ^TPathType;
  TPathType = longint;

const
  UndefinedPath = 0;
  MagickPath = 1;
  RootPath = 2;
  HeadPath = 3;
  TailPath = 4;
  BasePath = 5;
  ExtensionPath = 6;
  SubimagePath = 7;
  CanonicalPath = 8;
  SubcanonicalPath = 9;
  BasePathSansCompressExtension = 10;

function Base64Encode(para1: pbyte; para2: Tsize_t; para3: Psize_t): pchar; cdecl; external libmagiccore;
function GetPathComponents(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagiccore;
function ListFiles(para1: pchar; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagiccore;
function AcquireUniqueFilename(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function AcquireUniqueSymbolicLink(para1: pchar; para2: pchar): char; cdecl; external libmagiccore;
function ExpandFilenames(para1: Plongint; para2: PPPchar): char; cdecl; external libmagiccore;
function GetPathAttributes(para1: pchar; para2: pointer): char; cdecl; external libmagiccore;
function GetExecutionPath(para1: pchar; para2: Tsize_t): char; cdecl; external libmagiccore;
function IsPathAccessible(para1: pchar): char; cdecl; external libmagiccore;
function MultilineCensus(para1: pchar): Tsize_t; cdecl; external libmagiccore;
function GetMagickPageSize: Tssize_t; cdecl; external libmagiccore;
function Base64Decode(para1: pchar; para2: Psize_t): pbyte; cdecl; external libmagiccore;
procedure AppendImageFormat(para1: pchar; para2: pchar); cdecl; external libmagiccore;
procedure ChopPathComponents(para1: pchar; para2: Tsize_t); cdecl; external libmagiccore;
procedure ExpandFilename(para1: pchar); cdecl; external libmagiccore;
procedure GetPathComponent(para1: pchar; para2: TPathType; para3: pchar); cdecl; external libmagiccore;
procedure MagickDelay(para1: TMagickSizeType); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:40 ===


implementation



end.
