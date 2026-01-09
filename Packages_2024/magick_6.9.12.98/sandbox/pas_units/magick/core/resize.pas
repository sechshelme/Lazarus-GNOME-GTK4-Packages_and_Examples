unit resize;

interface

uses
  fp_magiccore, magick_type, pixel, resample;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PResizeFilter = type Pointer;

function AdaptiveResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function InterpolativeResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TInterpolatePixelMethod; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function LiquidRescaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MagnifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MinifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ResampleImage(para1: PImage; para2: double; para3: double; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SampleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ScaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ThumbnailImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:35 ===


implementation



end.
