{$IFDEF read_interface}



function GetColorList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetColorInfo(para1: pchar; para2: PExceptionInfo): PColorInfo; cdecl; external libmagickcore;
function GetColorInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPColorInfo; cdecl; external libmagickcore;
function ColorComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function IsColorSimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function IsImageSimilar(para1: PImage; para2: PImage; x: Pssize_t; y: Pssize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickColorSimilar(para1: PMagickPixelPacket; para2: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function IsOpacitySimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function ListColorInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorCompliance(para1: pchar; para2: TComplianceType; para3: PPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorDatabase(para1: pchar; para2: PPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorname(para1: PImage; para2: PPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColorCompliance(para1: pchar; para2: TComplianceType; para3: PMagickPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColor(para1: pchar; para2: PMagickPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColorname(para1: PImage; para2: PMagickPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure ColorComponentTerminus; cdecl; external libmagickcore;
procedure ConcatenateColorComponent(para1: PMagickPixelPacket; para2: TChannelType; para3: TComplianceType; para4: pchar); cdecl; external libmagickcore;
procedure GetColorTuple(para1: PMagickPixelPacket; para2: TMagickBooleanType; para3: pchar); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
