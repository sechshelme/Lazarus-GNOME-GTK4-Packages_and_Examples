{$IFDEF read_interface}



function GetPolicyValue(name: pchar): pchar; cdecl; external libmagickcore;
function GetPolicyList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetPolicyInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPPolicyInfo; cdecl; external libmagickcore;
function IsRightsAuthorized(para1: TPolicyDomain; para2: TPolicyRights; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListPolicyInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PolicyComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickSecurityPolicy(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure PolicyComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
