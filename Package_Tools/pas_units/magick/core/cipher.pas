unit cipher;

interface

uses
  fp_magiccore, magick_type, string_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function DecipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function EncipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function PasskeyDecipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function PasskeyEncipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:20 ===


implementation



end.
