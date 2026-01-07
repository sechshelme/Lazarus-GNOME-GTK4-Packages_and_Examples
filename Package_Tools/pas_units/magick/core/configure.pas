unit configure;

interface

uses
  fp_magiccore, magick_type, hashmap;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function GetConfigureList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagiccore;
function GetConfigureOption(para1: pchar): pchar; cdecl; external libmagiccore;
function GetConfigureValue(para1: PConfigureInfo): pchar; cdecl; external libmagiccore;
function GetConfigureInfo(para1: pchar; para2: PExceptionInfo): PConfigureInfo; cdecl; external libmagiccore;
function GetConfigureInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPConfigureInfo; cdecl; external libmagiccore;
function DestroyConfigureOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagiccore;
function GetConfigurePaths(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagiccore;
function GetConfigureOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagiccore;
function ConfigureComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function ListConfigureInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
procedure ConfigureComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:54:31 ===


implementation



end.
