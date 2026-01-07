unit fx;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function FxImage(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FxImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:10 ===


implementation



end.
