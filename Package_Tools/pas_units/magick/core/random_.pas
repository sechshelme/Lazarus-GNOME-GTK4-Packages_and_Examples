unit random_;

interface

uses
  fp_magiccore, magick_type, string_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PRandomInfo = type Pointer;

function GetRandomValue(para1: PRandomInfo): double; cdecl; external libmagiccore;
function GetPseudoRandomValue(magick_restrict: PRandomInfo): double; cdecl; external libmagiccore;
function RandomComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function AcquireRandomInfo: PRandomInfo; cdecl; external libmagiccore;
function DestroyRandomInfo(para1: PRandomInfo): PRandomInfo; cdecl; external libmagiccore;
function GetRandomKey(para1: PRandomInfo; para2: Tsize_t): PStringInfo; cdecl; external libmagiccore;
function GetRandomSecretKey(para1: PRandomInfo): dword; cdecl; external libmagiccore;
procedure RandomComponentTerminus; cdecl; external libmagiccore;
procedure SeedPseudoRandomGenerator(para1: dword); cdecl; external libmagiccore;
procedure SetRandomKey(para1: PRandomInfo; para2: Tsize_t; para3: pbyte); cdecl; external libmagiccore;
procedure SetRandomSecretKey(para1: dword); cdecl; external libmagiccore;
procedure SetRandomTrueRandom(para1: TMagickBooleanType); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:40:06 ===


implementation



end.
