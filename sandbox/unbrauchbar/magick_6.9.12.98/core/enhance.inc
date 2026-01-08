{$IFDEF read_interface}


function AutoGammaImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AutoGammaImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function AutoLevelImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AutoLevelImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function BrightnessContrastImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function BrightnessContrastImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function ClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ColorDecisionListImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastStretchImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastStretchImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function EqualizeImage(image: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function EqualizeImageChannel(image: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function GammaImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GammaImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function GrayscaleImage(para1: PImage; para2: TPixelIntensityMethod): TMagickBooleanType; cdecl; external libmagickcore;
function HaldClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function HaldClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function LevelImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function LevelImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelizeImage(para1: PImage; para2: double; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelizeImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelColorsImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function LevelColorsImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function LinearStretchImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function ModulateImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function NegateImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function NegateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function NormalizeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function NormalizeImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function SigmoidalContrastImage(para1: PImage; para2: TMagickBooleanType; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SigmoidalContrastImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function EnhanceImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
