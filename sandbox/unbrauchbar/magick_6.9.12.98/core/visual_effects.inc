{$IFDEF read_interface}


type
  PNoiseType = ^TNoiseType;
  TNoiseType = longint;

const
  UndefinedNoise = 0;
  UniformNoise = 1;
  GaussianNoise = 2;
  MultiplicativeGaussianNoise = 3;
  ImpulseNoise = 4;
  LaplacianNoise = 5;
  PoissonNoise = 6;
  RandomNoise = 7;

function AddNoiseImage(para1: PImage; para2: TNoiseType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AddNoiseImageChannel(para1: PImage; para2: TChannelType; para3: TNoiseType; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlueShiftImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CharcoalImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ColorizeImage(para1: PImage; para2: pchar; para3: TPixelPacket; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ColorMatrixImage(para1: PImage; kernel: PKernelInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ImplodeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MorphImages(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolaroidImage(para1: PImage; para2: PDrawInfo; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SepiaToneImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShadowImage(para1: PImage; para2: double; para3: double; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SketchImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SteganoImage(para1: PImage; para2: PImage; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StereoImage(para1: PImage; para2: PImage; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StereoAnaglyphImage(para1: PImage; para2: PImage; para3: Tssize_t; para4: Tssize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SwirlImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TintImage(para1: PImage; para2: pchar; para3: TPixelPacket; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function VignetteImage(para1: PImage; para2: double; para3: double; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WaveImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WaveletDenoiseImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PlasmaImage(para1: PImage; para2: PSegmentInfo; para3: Tsize_t; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SolarizeImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function SolarizeImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
