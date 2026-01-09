{$IFDEF read_interface}



function MontageImages(para1: PImage; para2: PMontageInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MontageImageList(para1: PImageInfo; para2: PMontageInfo; para3: PImage; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneMontageInfo(para1: PImageInfo; para2: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
function DestroyMontageInfo(para1: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
procedure GetMontageInfo(para1: PImageInfo; para2: PMontageInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
