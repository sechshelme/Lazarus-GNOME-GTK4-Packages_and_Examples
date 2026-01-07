unit enhance;

interface

uses
  fp_magiccore, magick_type, pixel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function AutoGammaImage(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function AutoGammaImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function AutoLevelImage(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function AutoLevelImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function BrightnessContrastImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagiccore;
function BrightnessContrastImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagiccore;
function ClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function ClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function ColorDecisionListImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function ContrastImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function ContrastStretchImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function ContrastStretchImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagiccore;
function EqualizeImage(image: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function EqualizeImageChannel(image: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function GammaImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function GammaImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagiccore;
function GrayscaleImage(para1: PImage; para2: TPixelIntensityMethod): TMagickBooleanType; cdecl; external libmagiccore;
function HaldClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function HaldClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function LevelImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function LevelImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagiccore;
function LevelizeImage(para1: PImage; para2: double; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagiccore;
function LevelizeImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagiccore;
function LevelColorsImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function LevelColorsImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function LinearStretchImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagiccore;
function ModulateImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function NegateImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function NegateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagiccore;
function NormalizeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function NormalizeImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function SigmoidalContrastImage(para1: PImage; para2: TMagickBooleanType; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function SigmoidalContrastImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagiccore;
function EnhanceImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:29 ===


implementation



end.
