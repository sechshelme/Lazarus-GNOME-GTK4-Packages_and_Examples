{$IFDEF read_interface}


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

function Base64Encode(para1: pbyte; para2: Tsize_t; para3: Psize_t): pchar; cdecl; external libmagickcore;
function GetPathComponents(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagickcore;
function ListFiles(para1: pchar; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickcore;
function AcquireUniqueFilename(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireUniqueSymbolicLink(para1: pchar; para2: pchar): char; cdecl; external libmagickcore;
function ExpandFilenames(para1: Plongint; para2: PPPchar): char; cdecl; external libmagickcore;
function GetPathAttributes(para1: pchar; para2: pointer): char; cdecl; external libmagickcore;
function GetExecutionPath(para1: pchar; para2: Tsize_t): char; cdecl; external libmagickcore;
function IsPathAccessible(para1: pchar): char; cdecl; external libmagickcore;
function MultilineCensus(para1: pchar): Tsize_t; cdecl; external libmagickcore;
function GetMagickPageSize: Tssize_t; cdecl; external libmagickcore;
function Base64Decode(para1: pchar; para2: Psize_t): pbyte; cdecl; external libmagickcore;
procedure AppendImageFormat(para1: pchar; para2: pchar); cdecl; external libmagickcore;
procedure ChopPathComponents(para1: pchar; para2: Tsize_t); cdecl; external libmagickcore;
procedure ExpandFilename(para1: pchar); cdecl; external libmagickcore;
procedure GetPathComponent(para1: pchar; para2: TPathType; para3: pchar); cdecl; external libmagickcore;
procedure MagickDelay(para1: TMagickSizeType); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
