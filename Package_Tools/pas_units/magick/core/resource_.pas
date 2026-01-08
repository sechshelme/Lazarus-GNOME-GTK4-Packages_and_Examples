unit resource_;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PResourceType = ^TResourceType;
  TResourceType = longint;

const
  UndefinedResource = 0;
  AreaResource = 1;
  DiskResource = 2;
  FileResource = 3;
  MapResource = 4;
  MemoryResource = 5;
  ThreadResource = 6;
  TimeResource = 7;
  ThrottleResource = 8;
  WidthResource = 9;
  HeightResource = 10;
  ListLengthResource = 11;

function MagickResourceInfinity: DWord;

function AcquireUniqueFileResource(para1: pchar): longint; cdecl; external libmagiccore;
function AcquireMagickResource(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagiccore;
function GetPathTemplate(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function ListMagickResourceInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function RelinquishUniqueFileResource(para1: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function ResourceComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function SetMagickResourceLimit(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagiccore;
function GetMagickResource(para1: TResourceType): TMagickSizeType; cdecl; external libmagiccore;
function GetMagickResourceLimit(para1: TResourceType): TMagickSizeType; cdecl; external libmagiccore;
procedure AsynchronousResourceComponentTerminus; cdecl; external libmagiccore;
procedure RelinquishMagickResource(para1: TResourceType; para2: TMagickSizeType); cdecl; external libmagiccore;
procedure ResourceComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:37 ===


implementation


function MagickResourceInfinity: DWord;
begin
  MagickResourceInfinity := (not 0) shr 1;
end;


end.
