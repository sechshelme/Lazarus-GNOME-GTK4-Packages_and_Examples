unit montage;

interface

uses
  fp_magiccore, magick_type, pixel, geometry, method_attribute;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMontageMode = ^TMontageMode;
  TMontageMode = longint;

const
  UndefinedMode = 0;
  FrameMode = 1;
  UnframeMode = 2;
  ConcatenateMode = 3;

type
  TMontageInfo = record
    geometry: pchar;
    tile: pchar;
    title: pchar;
    frame: pchar;
    texture: pchar;
    font: pchar;
    pointsize: double;
    border_width: Tsize_t;
    shadow: TMagickBooleanType;
    fill: TPixelPacket;
    stroke: TPixelPacket;
    background_color: TPixelPacket;
    border_color: TPixelPacket;
    matte_color: TPixelPacket;
    gravity: TGravityType;
    filename: array[0..(MaxTextExtent) - 1] of char;
    debug: TMagickBooleanType;
    signature: Tsize_t;
  end;
  PMontageInfo = ^TMontageInfo;

function MontageImages(para1: PImage; para2: PMontageInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MontageImageList(para1: PImageInfo; para2: PMontageInfo; para3: PImage; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneMontageInfo(para1: PImageInfo; para2: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
function DestroyMontageInfo(para1: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
procedure GetMontageInfo(para1: PImageInfo; para2: PMontageInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:25 ===


implementation



end.
