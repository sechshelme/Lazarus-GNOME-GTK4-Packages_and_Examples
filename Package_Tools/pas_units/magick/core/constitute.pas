unit constitute;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PStorageType = ^TStorageType;
  TStorageType = longint;

const
  UndefinedPixel = 0;
  CharPixel = 1;
  DoublePixel = 2;
  FloatPixel = 3;
  IntegerPixel = 4;
  LongPixel = 5;
  QuantumPixel = 6;
  ShortPixel = 7;

function ConstituteImage(para1: Tsize_t; para2: Tsize_t; para3: pchar; para4: TStorageType; para5: pointer;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function PingImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function PingImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ReadImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ReadImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ReadInlineImage(para1: PImageInfo; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function WriteImage(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function WriteImages(para1: PImageInfo; para2: PImage; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:39:54 ===


implementation



end.
