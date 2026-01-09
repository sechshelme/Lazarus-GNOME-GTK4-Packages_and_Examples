unit shear;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function DeskewImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function IntegralRotateImage(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShearImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShearRotateImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:34 ===


implementation



end.
