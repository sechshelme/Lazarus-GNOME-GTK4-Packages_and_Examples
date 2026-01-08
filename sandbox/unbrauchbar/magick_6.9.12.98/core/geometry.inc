{$IFDEF read_interface}


type
  PGeometryFlags = ^TGeometryFlags;
  TGeometryFlags = longint;

const
  NoValue = $0000;
  XValue = $0001;
  XiValue = $0001;
  YValue = $0002;
  PsiValue = $0002;
  WidthValue = $0004;
  RhoValue = $0004;
  HeightValue = $0008;
  SigmaValue = $0008;
  ChiValue = $0010;
  XiNegative = $0020;
  XNegative = $0020;
  PsiNegative = $0040;
  YNegative = $0040;
  ChiNegative = $0080;
  PercentValue = $1000;
  AspectValue = $2000;
  NormalizeValue = $2000;
  LessValue = $4000;
  GreaterValue = $8000;
  MinimumValue = $10000;
  CorrelateNormalizeValue = $10000;
  AreaValue = $20000;
  DecimalValue = $40000;
  SeparatorValue = $80000;
  AspectRatioValue = $100000;
  AlphaValue = $200000;
  AllValues = $7fffffff;

type
  PGravityType = ^TGravityType;
  TGravityType = longint;

const
  UndefinedGravity = 0;
  ForgetGravity = 0;
  NorthWestGravity = 1;
  NorthGravity = 2;
  NorthEastGravity = 3;
  WestGravity = 4;
  CenterGravity = 5;
  EastGravity = 6;
  SouthWestGravity = 7;
  SouthGravity = 8;
  SouthEastGravity = 9;
  StaticGravity = 10;

type
  TAffineMatrix = record
    sx: double;
    rx: double;
    ry: double;
    sy: double;
    tx: double;
    ty: double;
  end;
  PAffineMatrix = ^TAffineMatrix;

  TGeometryInfo = record
    rho: double;
    sigma: double;
    xi: double;
    psi: double;
    chi: double;
  end;
  PGeometryInfo = ^TGeometryInfo;

  TOffsetInfo = record
    x: Tssize_t;
    y: Tssize_t;
  end;
  POffsetInfo = ^TOffsetInfo;

  TRectangleInfo = record
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
  end;
  PRectangleInfo = ^TRectangleInfo;

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
