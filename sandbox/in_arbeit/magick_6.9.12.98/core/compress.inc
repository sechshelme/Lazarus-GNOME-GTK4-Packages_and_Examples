{$IFDEF read_interface}



function HuffmanDecodeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function HuffmanEncodeImage(para1: PImageInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function LZWEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function PackbitsEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function ZLIBEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
procedure Ascii85Encode(para1: PImage; para2: byte); cdecl; external libmagickcore;
procedure Ascii85Flush(para1: PImage); cdecl; external libmagickcore;
procedure Ascii85Initialize(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
