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

function GetImageHistogram(para1: PImage; para2: Psize_t; para3: PExceptionInfo): PColorPacket; cdecl; external libmagickcore;
function UniqueImageColors(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function IdentifyPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsHistogramImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MinMaxStretchImage(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function GetNumberColors(para1: PImage; para2: PFILE; para3: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:39:57 ===


implementation



end.
