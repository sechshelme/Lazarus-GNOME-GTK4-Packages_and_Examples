{$IFDEF read_interface}


function GetImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageGray(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsGrayImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMonochromeImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsOpaqueImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageChannelDepth(para1: PImage; para2: TChannelType; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageDepth(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageType(para1: PImage; para2: TImageType): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageBoundingBox(para1: PImage; exception: PExceptionInfo): TRectangleInfo; cdecl; external libmagickcore;
function GetImageChannelDepth(para1: PImage; para2: TChannelType; para3: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetImageDepth(para1: PImage; para2: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetImageQuantumDepth(para1: PImage; para2: TMagickBooleanType): Tsize_t; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
