unit color;

interface

uses
  fp_magiccore, magick_type, pixel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PComplianceType = ^TComplianceType;
  TComplianceType = longint;

const
  UndefinedCompliance = 0;
  NoCompliance = $0000;
  CSSCompliance = $0001;
  SVGCompliance = $0001;
  X11Compliance = $0002;
  XPMCompliance = $0004;
  MVGCompliance = $0008;
  AllCompliance = $7fffffff;

type
  PPColorInfo = ^PColorInfo;
  PColorInfo = ^TColorInfo;
  TColorInfo = record
    path: pchar;
    name: pchar;
    compliance: TComplianceType;
    color: TMagickPixelPacket;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PColorInfo;
    next: PColorInfo;
    signature: Tsize_t;
  end;

  TErrorInfo = record
    mean_error_per_pixel: double;
    normalized_mean_error: double;
    normalized_maximum_error: double;
  end;
  PErrorInfo = ^TErrorInfo;

function GetColorList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetColorInfo(para1: pchar; para2: PExceptionInfo): PColorInfo; cdecl; external libmagiccore;
function GetColorInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPColorInfo; cdecl; external libmagiccore;
function ColorComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function IsColorSimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagiccore;
function IsImageSimilar(para1: PImage; para2: PImage; x: Pssize_t; y: Pssize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsMagickColorSimilar(para1: PMagickPixelPacket; para2: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagiccore;
function IsOpacitySimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagiccore;
function ListColorInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryColorCompliance(para1: pchar; para2: TComplianceType; para3: PPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryColorDatabase(para1: pchar; para2: PPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryColorname(para1: PImage; para2: PPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryMagickColorCompliance(para1: pchar; para2: TComplianceType; para3: PMagickPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryMagickColor(para1: pchar; para2: PMagickPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function QueryMagickColorname(para1: PImage; para2: PMagickPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
procedure ColorComponentTerminus; cdecl; external libmagiccore;
procedure ConcatenateColorComponent(para1: PMagickPixelPacket; para2: TChannelType; para3: TComplianceType; para4: pchar); cdecl; external libmagiccore;
procedure GetColorTuple(para1: PMagickPixelPacket; para2: TMagickBooleanType; para3: pchar); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:24 ===


implementation



end.
