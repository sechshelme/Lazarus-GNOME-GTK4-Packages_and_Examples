{$IFDEF read_interface}


type
  PCompositeOperator = ^TCompositeOperator;
  TCompositeOperator = longint;

const
  UndefinedCompositeOp = 0;
  NoCompositeOp = 1;
  ModulusAddCompositeOp = 2;
  AtopCompositeOp = 3;
  BlendCompositeOp = 4;
  BumpmapCompositeOp = 5;
  ChangeMaskCompositeOp = 6;
  ClearCompositeOp = 7;
  ColorBurnCompositeOp = 8;
  ColorDodgeCompositeOp = 9;
  ColorizeCompositeOp = 10;
  CopyBlackCompositeOp = 11;
  CopyBlueCompositeOp = 12;
  CopyCompositeOp = 13;
  CopyCyanCompositeOp = 14;
  CopyGreenCompositeOp = 15;
  CopyMagentaCompositeOp = 16;
  CopyOpacityCompositeOp = 17;
  CopyRedCompositeOp = 18;
  CopyYellowCompositeOp = 19;
  DarkenCompositeOp = 20;
  DstAtopCompositeOp = 21;
  DstCompositeOp = 22;
  DstInCompositeOp = 23;
  DstOutCompositeOp = 24;
  DstOverCompositeOp = 25;
  DifferenceCompositeOp = 26;
  DisplaceCompositeOp = 27;
  DissolveCompositeOp = 28;
  ExclusionCompositeOp = 29;
  HardLightCompositeOp = 30;
  HueCompositeOp = 31;
  InCompositeOp = 32;
  LightenCompositeOp = 33;
  LinearLightCompositeOp = 34;
  LuminizeCompositeOp = 35;
  MinusDstCompositeOp = 36;
  ModulateCompositeOp = 37;
  MultiplyCompositeOp = 38;
  OutCompositeOp = 39;
  OverCompositeOp = 40;
  OverlayCompositeOp = 41;
  PlusCompositeOp = 42;
  ReplaceCompositeOp = 43;
  SaturateCompositeOp = 44;
  ScreenCompositeOp = 45;
  SoftLightCompositeOp = 46;
  SrcAtopCompositeOp = 47;
  SrcCompositeOp = 48;
  SrcInCompositeOp = 49;
  SrcOutCompositeOp = 50;
  SrcOverCompositeOp = 51;
  ModulusSubtractCompositeOp = 52;
  ThresholdCompositeOp = 53;
  XorCompositeOp = 54;
  DivideDstCompositeOp = 55;
  DistortCompositeOp = 56;
  BlurCompositeOp = 57;
  PegtopLightCompositeOp = 58;
  VividLightCompositeOp = 59;
  PinLightCompositeOp = 60;
  LinearDodgeCompositeOp = 61;
  LinearBurnCompositeOp = 62;
  MathematicsCompositeOp = 63;
  DivideSrcCompositeOp = 64;
  MinusSrcCompositeOp = 65;
  DarkenIntensityCompositeOp = 66;
  LightenIntensityCompositeOp = 67;
  HardMixCompositeOp = 68;
  StereoCompositeOp = 69;

  AddCompositeOp = ModulusAddCompositeOp;
  SubtractCompositeOp = ModulusSubtractCompositeOp;
  MinusCompositeOp = MinusDstCompositeOp;
  DivideCompositeOp = DivideDstCompositeOp;

function CompositeImage(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function CompositeImageChannel(para1: PImage; para2: TChannelType; para3: TCompositeOperator; para4: PImage; para5: Tssize_t;
  para6: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function TextureImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
