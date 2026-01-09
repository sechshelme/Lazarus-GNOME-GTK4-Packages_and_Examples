{$IFDEF read_interface}



function GetPageGeometry(para1: pchar): pchar; cdecl; external libmagickcore;
function IsGeometry(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsSceneGeometry(para1: pchar; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function GetGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): TMagickStatusType; cdecl; external libmagickcore;
function ParseAbsoluteGeometry(para1: pchar; para2: PRectangleInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseAffineGeometry(para1: pchar; para2: PAffineMatrix; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseGeometry(para1: pchar; para2: PGeometryInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseGravityGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseMetaGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): TMagickBooleanType; cdecl; external libmagickcore;
function ParsePageGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseRegionGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure GravityAdjustGeometry(para1: Tsize_t; para2: Tsize_t; para3: TGravityType; para4: PRectangleInfo); cdecl; external libmagickcore;
function SetGeometry(para1: PImage; para2: PRectangleInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetGeometryInfo(para1: PGeometryInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
