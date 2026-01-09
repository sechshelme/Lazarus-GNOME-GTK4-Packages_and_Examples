{$IFDEF read_interface}


type
  PWandView = type Pointer;

  TDuplexTransferWandViewMethod = function(para1: PWandView; para2: PWandView; para3: PWandView; para4: Tssize_t; para5: longint; para6: pointer): TMagickBooleanType; cdecl;
  TGetWandViewMethod = function(para1: PWandView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TSetWandViewMethod = function(para1: PWandView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TTransferWandViewMethod = function(para1: PWandView; para2: PWandView; para3: Tssize_t; para4: longint; para5: pointer): TMagickBooleanType; cdecl;
  TUpdateWandViewMethod = function(para1: PWandView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;

function GetWandViewException(para1: PWandView; para2: PExceptionType): pchar; cdecl; external libmagickwand;
function DuplexTransferWandViewIterator(para1: PWandView; para2: PWandView; para3: PWandView; para4: TDuplexTransferWandViewMethod; para5: pointer): TMagickBooleanType; cdecl; external libmagickwand;
function GetWandViewIterator(para1: PWandView; para2: TGetWandViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickwand;
function IsWandView(para1: PWandView): TMagickBooleanType; cdecl; external libmagickwand;
function SetWandViewIterator(para1: PWandView; para2: TSetWandViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickwand;
function TransferWandViewIterator(para1: PWandView; para2: PWandView; para3: TTransferWandViewMethod; para4: pointer): TMagickBooleanType; cdecl; external libmagickwand;
function UpdateWandViewIterator(para1: PWandView; para2: TUpdateWandViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickwand;
function GetWandViewWand(para1: PWandView): PMagickWand; cdecl; external libmagickwand;
function GetWandViewPixels(para1: PWandView): PPPixelWand; cdecl; external libmagickwand;
function GetWandViewExtent(para1: PWandView): TRectangleInfo; cdecl; external libmagickwand;
procedure SetWandViewDescription(para1: PWandView; para2: pchar); cdecl; external libmagickwand;
procedure SetWandViewThreads(para1: PWandView; para2: Tsize_t); cdecl; external libmagickwand;
function CloneWandView(para1: PWandView): PWandView; cdecl; external libmagickwand;
function DestroyWandView(para1: PWandView): PWandView; cdecl; external libmagickwand;
function NewWandView(para1: PMagickWand): PWandView; cdecl; external libmagickwand;
function NewWandViewExtent(para1: PMagickWand; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PWandView; cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
