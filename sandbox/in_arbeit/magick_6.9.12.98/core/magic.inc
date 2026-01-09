{$IFDEF read_interface}



function GetMagicList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetMagicName(para1: PMagicInfo): pchar; cdecl; external libmagickcore;
function ListMagicInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MagicComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetMagicInfo(para1: pbyte; para2: Tsize_t; para3: PExceptionInfo): PMagicInfo; cdecl; external libmagickcore;
function GetMagicInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMagicInfo; cdecl; external libmagickcore;
procedure MagicComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:39:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
