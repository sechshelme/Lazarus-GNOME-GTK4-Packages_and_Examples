{$IFDEF read_interface}



function ConstituteImage(para1: Tsize_t; para2: Tsize_t; para3: pchar; para4: TStorageType; para5: pointer;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadInlineImage(para1: PImageInfo; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WriteImage(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function WriteImages(para1: PImageInfo; para2: PImage; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:39:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
