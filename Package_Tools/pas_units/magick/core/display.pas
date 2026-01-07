unit display;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function DisplayImages(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function RemoteDisplayCommand(para1: PImageInfo; para2: pchar; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:05 ===


implementation



end.
