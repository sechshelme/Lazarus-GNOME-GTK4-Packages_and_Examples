unit resize;

interface

uses
  fp_magiccore, magick_type, pixel, resample;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PResizeFilter = type Pointer;

function AdaptiveResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function InterpolativeResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TInterpolatePixelMethod; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function LiquidRescaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function MagnifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function MinifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ResampleImage(para1: PImage; para2: double; para3: double; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SampleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ScaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ThumbnailImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:35 ===


implementation



end.
