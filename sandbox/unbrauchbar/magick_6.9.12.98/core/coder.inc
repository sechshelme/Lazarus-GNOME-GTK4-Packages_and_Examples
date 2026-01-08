{$IFDEF read_interface}


type
  PPCoderInfo = ^PCoderInfo;
  PCoderInfo = ^TCoderInfo;
  TCoderInfo = record
    path: pchar;
    magick: pchar;
    name: pchar;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PCoderInfo;
    next: PCoderInfo;
    signature: Tsize_t;
  end;

function GetCoderList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetCoderInfo(para1: pchar; para2: PExceptionInfo): PCoderInfo; cdecl; external libmagickcore;
function GetCoderInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPCoderInfo; cdecl; external libmagickcore;
function CoderComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function ListCoderInfo(para1: PFILE; para2: PExceptionInfo): TCoderInfo; cdecl; external libmagickcore;
procedure CoderComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:39:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
