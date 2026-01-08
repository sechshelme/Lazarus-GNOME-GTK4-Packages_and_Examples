unit identify;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function IdentifyImage(para1: PImage; para2: PFILE; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:12 ===


implementation



end.
