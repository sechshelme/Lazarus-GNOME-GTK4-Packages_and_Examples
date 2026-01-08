unit mogrify;

interface

uses
  fp_magiccore, fp_magicwand;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TMagickCommand = function(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl;

function MagickCommandGenesis(para1: PImageInfo; para2: TMagickCommand; para3: longint; para4: PPchar; para5: PPchar;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;
function MogrifyImage(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPImage; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;
function MogrifyImageCommand(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;
function MogrifyImageInfo(para1: PImageInfo; para2: longint; para3: PPchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;
function MogrifyImageList(para1: PImageInfo; para2: longint; para3: PPchar; para4: PPImage; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;
function MogrifyImages(para1: PImageInfo; para2: TMagickBooleanType; para3: longint; para4: PPchar; para5: PPImage;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:09 ===


implementation



end.
