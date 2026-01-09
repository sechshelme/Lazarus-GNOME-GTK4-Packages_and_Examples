{$IFDEF read_interface}



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


{$ENDIF read_interface}


{$IFDEF read_implementation}


function MagickResourceInfinity: DWord;
begin
  MagickResourceInfinity := (not 0) shr 1;
end;


{$ENDIF read_implementation}
