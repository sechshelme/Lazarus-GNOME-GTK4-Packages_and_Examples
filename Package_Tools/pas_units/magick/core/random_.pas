unit random_;

interface

uses
  fp_magiccore, magick_type, string_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PRandomInfo = type Pointer;

function GetRandomValue(para1: PRandomInfo): double; cdecl; external libmagickcore;
function GetPseudoRandomValue(magick_restrict: PRandomInfo): double; cdecl; external libmagickcore;
function RandomComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AcquireRandomInfo: PRandomInfo; cdecl; external libmagickcore;
function DestroyRandomInfo(para1: PRandomInfo): PRandomInfo; cdecl; external libmagickcore;
function GetRandomKey(para1: PRandomInfo; para2: Tsize_t): PStringInfo; cdecl; external libmagickcore;
function GetRandomSecretKey(para1: PRandomInfo): dword; cdecl; external libmagickcore;
procedure RandomComponentTerminus; cdecl; external libmagickcore;
procedure SeedPseudoRandomGenerator(para1: dword); cdecl; external libmagickcore;
procedure SetRandomKey(para1: PRandomInfo; para2: Tsize_t; para3: pbyte); cdecl; external libmagickcore;
procedure SetRandomSecretKey(para1: dword); cdecl; external libmagickcore;
procedure SetRandomTrueRandom(para1: TMagickBooleanType); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:40:06 ===


implementation



end.
