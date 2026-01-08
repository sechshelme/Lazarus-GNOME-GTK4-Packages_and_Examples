{$IFDEF read_interface}



function AnnotateComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AnnotateImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMultilineTypeMetrics(para1: PImage; para2: PDrawInfo; para3: PTypeMetric): TMagickBooleanType; cdecl; external libmagickcore;
function GetTypeMetrics(para1: PImage; para2: PDrawInfo; para3: PTypeMetric): TMagickBooleanType; cdecl; external libmagickcore;
function FormatMagickCaption(para1: PImage; para2: PDrawInfo; para3: TMagickBooleanType; para4: PTypeMetric; para5: PPchar): Tssize_t; cdecl; external libmagickcore;
procedure AnnotateComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
