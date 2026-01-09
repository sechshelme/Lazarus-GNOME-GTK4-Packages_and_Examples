unit convert;

interface

uses
  fp_magiccore, fp_magicwand;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ConvertImageCommand(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:39:45 ===


implementation



end.
