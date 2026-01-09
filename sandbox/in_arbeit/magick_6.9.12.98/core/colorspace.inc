{$IFDEF read_interface}



function GetImageColorspaceType(para1: PImage; para2: PExceptionInfo): TColorspaceType; cdecl; external libmagickcore;
function RGBTransformImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageGray(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TransformImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function TransformRGBImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
