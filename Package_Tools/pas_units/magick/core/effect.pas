unit effect;

interface

uses
  fp_magiccore, magick_type, morphology;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPreviewType = ^TPreviewType;
  TPreviewType = longint;

const
  UndefinedPreview = 0;
  RotatePreview = 1;
  ShearPreview = 2;
  RollPreview = 3;
  HuePreview = 4;
  SaturationPreview = 5;
  BrightnessPreview = 6;
  GammaPreview = 7;
  SpiffPreview = 8;
  DullPreview = 9;
  GrayscalePreview = 10;
  QuantizePreview = 11;
  DespecklePreview = 12;
  ReduceNoisePreview = 13;
  AddNoisePreview = 14;
  SharpenPreview = 15;
  BlurPreview = 16;
  ThresholdPreview = 17;
  EdgeDetectPreview = 18;
  SpreadPreview = 19;
  SolarizePreview = 20;
  ShadePreview = 21;
  RaisePreview = 22;
  SegmentPreview = 23;
  SwirlPreview = 24;
  ImplodePreview = 25;
  WavePreview = 26;
  OilPaintPreview = 27;
  CharcoalDrawingPreview = 28;
  JPEGPreview = 29;

function AdaptiveBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function AdaptiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function AdaptiveSharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function AdaptiveSharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function BlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function BlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ConvolveImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ConvolveImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function DespeckleImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function EdgeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function EmbossImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FilterImage(para1: PImage; para2: PKernelInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FilterImageChannel(para1: PImage; para2: TChannelType; para3: PKernelInfo; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function GaussianBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function GaussianBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function KuwaharaImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function KuwaharaImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function LocalContrastImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function MotionBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function MotionBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function PreviewImage(para1: PImage; para2: TPreviewType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function RotationalBlurImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function RotationalBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SelectiveBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SelectiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ShadeImage(para1: PImage; para2: TMagickBooleanType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SpreadImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function UnsharpMaskImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
function UnsharpMaskImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: double; para7: PExceptionInfo): PImage; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:03:16 ===


implementation



end.
