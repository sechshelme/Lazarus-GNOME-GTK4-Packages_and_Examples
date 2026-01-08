{$IFDEF read_interface}


type
  PPConfigureInfo = ^PConfigureInfo;
  PConfigureInfo = ^TConfigureInfo;
  TConfigureInfo = record
    path: pchar;
    name: pchar;
    value: pchar;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PConfigureInfo;
    next: PConfigureInfo;
    signature: Tsize_t;
  end;

function GetConfigureList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetConfigureOption(para1: pchar): pchar; cdecl; external libmagickcore;
function GetConfigureValue(para1: PConfigureInfo): pchar; cdecl; external libmagickcore;
function GetConfigureInfo(para1: pchar; para2: PExceptionInfo): PConfigureInfo; cdecl; external libmagickcore;
function GetConfigureInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPConfigureInfo; cdecl; external libmagickcore;
function DestroyConfigureOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetConfigurePaths(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetConfigureOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function ConfigureComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function ListConfigureInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure ConfigureComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:54:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
