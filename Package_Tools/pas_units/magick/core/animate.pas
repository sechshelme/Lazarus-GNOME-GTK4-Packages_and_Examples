unit animate;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function AnimateImages(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:22:58 ===


implementation



end.
