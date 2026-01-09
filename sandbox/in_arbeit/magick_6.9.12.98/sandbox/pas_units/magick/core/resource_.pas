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

function AcquireUniqueFileResource(para1: pchar): longint; cdecl; external libmagickcore;
function AcquireMagickResource(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function GetPathTemplate(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListMagickResourceInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function RelinquishUniqueFileResource(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ResourceComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickResourceLimit(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickResource(para1: TResourceType): TMagickSizeType; cdecl; external libmagickcore;
function GetMagickResourceLimit(para1: TResourceType): TMagickSizeType; cdecl; external libmagickcore;
procedure AsynchronousResourceComponentTerminus; cdecl; external libmagickcore;
procedure RelinquishMagickResource(para1: TResourceType; para2: TMagickSizeType); cdecl; external libmagickcore;
procedure ResourceComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:37 ===


implementation


function MagickResourceInfinity: DWord;
begin
  MagickResourceInfinity := (not 0) shr 1;
end;


end.
