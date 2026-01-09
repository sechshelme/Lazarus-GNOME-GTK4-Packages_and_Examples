unit threshold;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAutoThresholdMethod = ^TAutoThresholdMethod;
  TAutoThresholdMethod = longint;

const
  UndefinedThresholdMethod = 0;
  KapurThresholdMethod = 1;
  OTSUThresholdMethod = 2;
  TriangleThresholdMethod = 3;

type
  PThresholdMap = type Pointer;

function AdaptiveThresholdImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tssize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyThresholdMap(para1: PThresholdMap): PThresholdMap; cdecl; external libmagickcore;
function GetThresholdMap(para1: pchar; para2: PExceptionInfo): PThresholdMap; cdecl; external libmagickcore;
function AutoThresholdImage(para1: PImage; para2: TAutoThresholdMethod; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function BilevelImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function BilevelImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function BlackThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function BlackThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ClampImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ClampImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function ListThresholdMaps(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedDitherImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedDitherImageChannel(para1: PImage; para2: TChannelType; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedPosterizeImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedPosterizeImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PerceptibleImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function PerceptibleImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function RandomThresholdImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function RandomThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function WhiteThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function WhiteThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:41 ===


implementation



end.
