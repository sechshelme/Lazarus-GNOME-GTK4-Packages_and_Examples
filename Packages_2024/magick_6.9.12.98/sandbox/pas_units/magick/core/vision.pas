unit vision;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ConnectedComponentsImage(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:20 ===


implementation



end.
