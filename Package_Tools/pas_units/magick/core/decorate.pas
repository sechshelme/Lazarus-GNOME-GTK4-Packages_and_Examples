unit decorate;

interface

uses
  fp_magiccore, magick_type, geometry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFrameInfo = record
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
    inner_bevel: Tssize_t;
    outer_bevel: Tssize_t;
  end;
  PFrameInfo = ^TFrameInfo;

function BorderImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FrameImage(para1: PImage; para2: PFrameInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function RaiseImage(para1: PImage; para2: PRectangleInfo; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:22 ===


implementation



end.
