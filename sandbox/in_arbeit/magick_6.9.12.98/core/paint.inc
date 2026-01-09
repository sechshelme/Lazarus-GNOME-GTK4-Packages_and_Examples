{$IFDEF read_interface}



function OilPaintImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FloodfillPaintImage(para1: PImage; para2: TChannelType; para3: PDrawInfo; para4: PMagickPixelPacket; para5: Tssize_t;
  para6: Tssize_t; para7: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function GradientImage(para1: PImage; para2: TGradientType; para3: TSpreadMethod; para4: PPixelPacket; para5: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function OpaquePaintImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function OpaquePaintImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function TransparentPaintImage(para1: PImage; para2: PMagickPixelPacket; para3: TQuantum; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function TransparentPaintImageChroma(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TQuantum; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
