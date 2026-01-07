unit coder;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function GetCoderList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetCoderInfo(para1: pchar; para2: PExceptionInfo): PCoderInfo; cdecl; external libmagiccore;
function GetCoderInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPCoderInfo; cdecl; external libmagiccore;
function CoderComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function ListCoderInfo(para1: PFILE; para2: PExceptionInfo): TCoderInfo; cdecl; external libmagiccore;
procedure CoderComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:39:51 ===


implementation



end.
