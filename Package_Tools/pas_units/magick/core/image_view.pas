unit image_view;

interface

uses
  fp_magiccore, magick_type, exception, pixel_accessor, pixel, geometry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PImageView = type Pointer;

  TDuplexTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: PImageView; para4: Tssize_t; para5: longint; para6: pointer): TMagickBooleanType; cdecl;
  TGetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TSetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: Tssize_t; para4: longint; para5: pointer): TMagickBooleanType; cdecl;
  TUpdateImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;

function GetImageViewException(para1: PImageView; para2: PExceptionType): pchar; cdecl; external libmagiccore;
function GetImageViewVirtualIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagiccore;
function GetImageViewVirtualPixels(para1: PImageView): PPixelPacket; cdecl; external libmagiccore;
function GetImageViewImage(para1: PImageView): PImage; cdecl; external libmagiccore;
function CloneImageView(para1: PImageView): PImageView; cdecl; external libmagiccore;
function DestroyImageView(para1: PImageView): PImageView; cdecl; external libmagiccore;
function NewImageView(para1: PImage): PImageView; cdecl; external libmagiccore;
function NewImageViewRegion(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PImageView; cdecl; external libmagiccore;
function GetImageViewAuthenticIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagiccore;
function DuplexTransferImageViewIterator(para1: PImageView; para2: PImageView; para3: PImageView; para4: TDuplexTransferImageViewMethod; para5: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function GetImageViewIterator(para1: PImageView; para2: TGetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function IsImageView(para1: PImageView): TMagickBooleanType; cdecl; external libmagiccore;
function SetImageViewIterator(para1: PImageView; para2: TSetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function TransferImageViewIterator(para1: PImageView; para2: PImageView; para3: TTransferImageViewMethod; para4: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function UpdateImageViewIterator(para1: PImageView; para2: TUpdateImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function GetImageViewAuthenticPixels(para1: PImageView): PPixelPacket; cdecl; external libmagiccore;
function GetImageViewExtent(para1: PImageView): TRectangleInfo; cdecl; external libmagiccore;
procedure SetImageViewDescription(para1: PImageView; para2: pchar); cdecl; external libmagiccore;
procedure SetImageViewThreads(para1: PImageView; para2: Tsize_t); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:35 ===


implementation



end.
