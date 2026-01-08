{$IFDEF read_interface}


type
  PImageView = type Pointer;

  TDuplexTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: PImageView; para4: Tssize_t; para5: longint; para6: pointer): TMagickBooleanType; cdecl;
  TGetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TSetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: Tssize_t; para4: longint; para5: pointer): TMagickBooleanType; cdecl;
  TUpdateImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;

function GetImageViewException(para1: PImageView; para2: PExceptionType): pchar; cdecl; external libmagickcore;
function GetImageViewVirtualIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagickcore;
function GetImageViewVirtualPixels(para1: PImageView): PPixelPacket; cdecl; external libmagickcore;
function GetImageViewImage(para1: PImageView): PImage; cdecl; external libmagickcore;
function CloneImageView(para1: PImageView): PImageView; cdecl; external libmagickcore;
function DestroyImageView(para1: PImageView): PImageView; cdecl; external libmagickcore;
function NewImageView(para1: PImage): PImageView; cdecl; external libmagickcore;
function NewImageViewRegion(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PImageView; cdecl; external libmagickcore;
function GetImageViewAuthenticIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagickcore;
function DuplexTransferImageViewIterator(para1: PImageView; para2: PImageView; para3: PImageView; para4: TDuplexTransferImageViewMethod; para5: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageViewIterator(para1: PImageView; para2: TGetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function IsImageView(para1: PImageView): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageViewIterator(para1: PImageView; para2: TSetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function TransferImageViewIterator(para1: PImageView; para2: PImageView; para3: TTransferImageViewMethod; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function UpdateImageViewIterator(para1: PImageView; para2: TUpdateImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageViewAuthenticPixels(para1: PImageView): PPixelPacket; cdecl; external libmagickcore;
function GetImageViewExtent(para1: PImageView): TRectangleInfo; cdecl; external libmagickcore;
procedure SetImageViewDescription(para1: PImageView; para2: pchar); cdecl; external libmagickcore;
procedure SetImageViewThreads(para1: PImageView; para2: Tsize_t); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
