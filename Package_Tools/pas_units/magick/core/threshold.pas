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

function AdaptiveThresholdImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tssize_t; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function DestroyThresholdMap(para1: PThresholdMap): PThresholdMap; cdecl; external libmagiccore;
function GetThresholdMap(para1: pchar; para2: PExceptionInfo): PThresholdMap; cdecl; external libmagiccore;
function AutoThresholdImage(para1: PImage; para2: TAutoThresholdMethod; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function BilevelImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagiccore;
function BilevelImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagiccore;
function BlackThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function BlackThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function ClampImage(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function ClampImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function ListThresholdMaps(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function OrderedDitherImage(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function OrderedDitherImageChannel(para1: PImage; para2: TChannelType; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function OrderedPosterizeImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function OrderedPosterizeImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function PerceptibleImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagiccore;
function PerceptibleImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagiccore;
function RandomThresholdImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function RandomThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function WhiteThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function WhiteThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:47:41 ===


implementation



end.
