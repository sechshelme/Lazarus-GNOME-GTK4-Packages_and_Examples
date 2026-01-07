unit channel;

interface

uses
  fp_magiccore, magick_type, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CombineImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SeparateImage(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SeparateImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function GetImageAlphaChannel(para1: PImage): TMagickBooleanType; cdecl; external libmagiccore;
function SeparateImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageAlphaChannel(para1: PImage; para2: TAlphaChannelType): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:18 ===


implementation



end.
