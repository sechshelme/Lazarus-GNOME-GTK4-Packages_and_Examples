unit attribute;

interface

uses
  fp_magiccore, magick_type, image, geometry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GetImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagiccore;
function IdentifyImageGray(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagiccore;
function IdentifyImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagiccore;
function IdentifyImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsGrayImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsMonochromeImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function IsOpaqueImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageChannelDepth(para1: PImage; para2: TChannelType; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageDepth(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageType(para1: PImage; para2: TImageType): TMagickBooleanType; cdecl; external libmagiccore;
function GetImageBoundingBox(para1: PImage; exception: PExceptionInfo): TRectangleInfo; cdecl; external libmagiccore;
function GetImageChannelDepth(para1: PImage; para2: TChannelType; para3: PExceptionInfo): Tsize_t; cdecl; external libmagiccore;
function GetImageDepth(para1: PImage; para2: PExceptionInfo): Tsize_t; cdecl; external libmagiccore;
function GetImageQuantumDepth(para1: PImage; para2: TMagickBooleanType): Tsize_t; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:17 ===


implementation



end.
