unit pixel;

interface

uses
  fp_magiccore, magick_type, colorspace, constitute;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PInterpolatePixelMethod = ^TInterpolatePixelMethod;
  TInterpolatePixelMethod = longint;

const
  UndefinedInterpolatePixel = 0;
  AverageInterpolatePixel = 1;
  BicubicInterpolatePixel = 2;
  BilinearInterpolatePixel = 3;
  FilterInterpolatePixel = 4;
  IntegerInterpolatePixel = 5;
  MeshInterpolatePixel = 6;
  NearestNeighborInterpolatePixel = 7;
  SplineInterpolatePixel = 8;
  Average9InterpolatePixel = 9;
  Average16InterpolatePixel = 10;
  BlendInterpolatePixel = 11;
  BackgroundInterpolatePixel = 12;
  CatromInterpolatePixel = 13;

type
  PPixelComponent = ^TPixelComponent;
  TPixelComponent = longint;

const
  PixelRed = 0;
  PixelCyan = 0;
  PixelGray = 0;
  PixelY = 0;
  PixelGreen = 1;
  PixelMagenta = 1;
  PixelCb = 1;
  PixelBlue = 2;
  PixelYellow = 2;
  PixelCr = 2;
  PixelAlpha = 3;
  PixelBlack = 4;
  PixelIndex = 4;
  MaskPixelComponent = 5;

type
  PPixelIntensityMethod = ^TPixelIntensityMethod;
  TPixelIntensityMethod = longint;

const
  UndefinedPixelIntensityMethod = 0;
  AveragePixelIntensityMethod = 1;
  BrightnessPixelIntensityMethod = 2;
  LightnessPixelIntensityMethod = 3;
  Rec601LumaPixelIntensityMethod = 4;
  Rec601LuminancePixelIntensityMethod = 5;
  Rec709LumaPixelIntensityMethod = 6;
  Rec709LuminancePixelIntensityMethod = 7;
  RMSPixelIntensityMethod = 8;
  MSPixelIntensityMethod = 9;

type
  TDoublePixelPacket = record
    red: double;
    green: double;
    blue: double;
    opacity: double;
    index: double;
  end;
  PDoublePixelPacket = ^TDoublePixelPacket;

  TLongPixelPacket = record
    red: dword;
    green: dword;
    blue: dword;
    opacity: dword;
    index: dword;
  end;
  PLongPixelPacket = ^TLongPixelPacket;

  TMagickPixelPacket = record
    storage_class: TClassType;
    colorspace: TColorspaceType;
    matte: TMagickBooleanType;
    fuzz: double;
    depth: Tsize_t;
    red: TMagickRealType;
    green: TMagickRealType;
    blue: TMagickRealType;
    opacity: TMagickRealType;
    index: TMagickRealType;
  end;
  PMagickPixelPacket = ^TMagickPixelPacket;

  PIndexPacket = ^TIndexPacket;
  TIndexPacket = TQuantum;

  TPixelPacket = record
    blue: TQuantum;
    green: TQuantum;
    red: TQuantum;
    opacity: TQuantum;
  end;
  PPixelPacket = ^TPixelPacket;

  TQuantumPixelPacket = record
    red: TQuantum;
    green: TQuantum;
    blue: TQuantum;
    opacity: TQuantum;
    index: TQuantum;
  end;
  PQuantumPixelPacket = ^TQuantumPixelPacket;

  PCacheView = type Pointer;

function ExportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer; para9: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function ImportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function InterpolateMagickPixelPacket(magick_restrict: PImage; para2: PCacheView; para3: TInterpolatePixelMethod; para4: double; para5: double;
  para6: PMagickPixelPacket; para7: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function CloneMagickPixelPacket(para1: PMagickPixelPacket): PMagickPixelPacket; cdecl; external libmagiccore;
function DecodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagiccore;
function EncodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagiccore;
function GetMagickPixelIntensity(image: PImage; magick_restrict: PMagickPixelPacket): TMagickRealType; cdecl; external libmagiccore;
function GetPixelIntensity(image: PImage; magick_restrict: PPixelPacket): TMagickRealType; cdecl; external libmagiccore;
procedure ConformMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: PExceptionInfo); cdecl; external libmagiccore;
procedure GetMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 14:40:27 ===


implementation



end.
