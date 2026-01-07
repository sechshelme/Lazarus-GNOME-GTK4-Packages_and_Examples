unit histogram;

interface

uses
  fp_magiccore, magick_type, pixel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TColorPacket = record
    pixel: TPixelPacket;
    index: TIndexPacket;
    count: TMagickSizeType;
  end;
  PColorPacket = ^TColorPacket;

function GetImageHistogram(para1: PImage; para2: Psize_t; para3: PExceptionInfo): PColorPacket; cdecl; external libmagiccore;
function UniqueImageColors(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function IdentifyPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsHistogramImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function MinMaxStretchImage(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagiccore;
function GetNumberColors(para1: PImage; para2: PFILE; para3: PExceptionInfo): Tsize_t; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:39:57 ===


implementation



end.
