unit colormap;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function AcquireImageColormap(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function CycleColormapImage(para1: PImage; para2: Tssize_t): TMagickBooleanType; cdecl; external libmagiccore;
function SortColormapByIntensity(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:23:03 ===


implementation



end.
