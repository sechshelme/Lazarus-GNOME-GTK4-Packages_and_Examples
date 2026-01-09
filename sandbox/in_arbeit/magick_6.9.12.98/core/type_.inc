{$IFDEF read_interface}




function GetTypeList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function ListTypeInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TypeComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetTypeInfo(para1: pchar; para2: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoByFamily(para1: pchar; para2: TStyleType; para3: TStretchType; para4: Tsize_t; para5: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPTypeInfo; cdecl; external libmagickcore;
procedure TypeComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
