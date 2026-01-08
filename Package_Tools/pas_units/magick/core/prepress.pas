unit prepress;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function GetImageTotalInkDensity(image: PImage): double; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:15 ===


implementation



end.
