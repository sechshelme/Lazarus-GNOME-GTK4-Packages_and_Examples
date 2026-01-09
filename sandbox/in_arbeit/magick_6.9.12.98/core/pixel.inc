{$IFDEF read_interface}




function ExportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer; para9: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ImportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function InterpolateMagickPixelPacket(magick_restrict: PImage; para2: PCacheView; para3: TInterpolatePixelMethod; para4: double; para5: double;
  para6: PMagickPixelPacket; para7: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function CloneMagickPixelPacket(para1: PMagickPixelPacket): PMagickPixelPacket; cdecl; external libmagickcore;
function DecodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore;
function EncodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore;
function GetMagickPixelIntensity(image: PImage; magick_restrict: PMagickPixelPacket): TMagickRealType; cdecl; external libmagickcore;
function GetPixelIntensity(image: PImage; magick_restrict: PPixelPacket): TMagickRealType; cdecl; external libmagickcore;
procedure ConformMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: PExceptionInfo); cdecl; external libmagickcore;
procedure GetMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
