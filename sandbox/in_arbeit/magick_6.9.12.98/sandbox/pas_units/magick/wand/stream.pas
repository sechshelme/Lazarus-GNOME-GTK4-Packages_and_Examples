unit stream;

interface

uses
  fp_magiccore, fp_magicwand;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function StreamImageCommand(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:17 ===


implementation



end.
