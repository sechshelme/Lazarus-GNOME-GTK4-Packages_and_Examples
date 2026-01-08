{$IFDEF read_interface}



function DecipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function EncipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PasskeyDecipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PasskeyEncipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
