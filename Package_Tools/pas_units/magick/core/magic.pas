unit magic;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPMagicInfo = ^PMagicInfo;
  PMagicInfo = ^TMagicInfo;

  TMagicInfo = record
    path: pchar;
    name: pchar;
    target: pchar;
    magic: pbyte;
    length: Tsize_t;
    offset: TMagickOffsetType;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PMagicInfo;
    next: PMagicInfo;
    signature: Tsize_t;
  end;

function GetMagicList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetMagicName(para1: PMagicInfo): pchar; cdecl; external libmagiccore;
function ListMagicInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function MagicComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function GetMagicInfo(para1: pbyte; para2: Tsize_t; para3: PExceptionInfo): PMagicInfo; cdecl; external libmagiccore;
function GetMagicInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMagicInfo; cdecl; external libmagiccore;
procedure MagicComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:39:59 ===


implementation



end.
