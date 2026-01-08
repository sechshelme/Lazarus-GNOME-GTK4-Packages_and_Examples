{$IFDEF read_interface}


function CombineImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SeparateImage(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SeparateImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetImageAlphaChannel(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SeparateImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageAlphaChannel(para1: PImage; para2: TAlphaChannelType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
