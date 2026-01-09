{$IFDEF read_interface}


type
  PPixelIterator = type Pointer;

function PixelGetIteratorException(para1: PPixelIterator; para2: PExceptionType): pchar; cdecl; external libmagickwand;
function PixelGetIteratorExceptionType(para1: PPixelIterator): TExceptionType; cdecl; external libmagickwand;
function IsPixelIterator(para1: PPixelIterator): TMagickBooleanType; cdecl; external libmagickwand;
function PixelClearIteratorException(para1: PPixelIterator): TMagickBooleanType; cdecl; external libmagickwand;
function PixelSetIteratorRow(para1: PPixelIterator; para2: Tssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function PixelSyncIterator(para1: PPixelIterator): TMagickBooleanType; cdecl; external libmagickwand;
function ClonePixelIterator(para1: PPixelIterator): PPixelIterator; cdecl; external libmagickwand;
function DestroyPixelIterator(para1: PPixelIterator): PPixelIterator; cdecl; external libmagickwand;
function NewPixelIterator(para1: PMagickWand): PPixelIterator; cdecl; external libmagickwand;
function NewPixelRegionIterator(para1: PMagickWand; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelIterator; cdecl; external libmagickwand;
function PixelGetCurrentIteratorRow(para1: PPixelIterator; para2: Psize_t): PPPixelWand; cdecl; external libmagickwand;
function PixelGetNextIteratorRow(para1: PPixelIterator; para2: Psize_t): PPPixelWand; cdecl; external libmagickwand;
function PixelGetPreviousIteratorRow(para1: PPixelIterator; para2: Psize_t): PPPixelWand; cdecl; external libmagickwand;
function PixelGetIteratorRow(para1: PPixelIterator): Tssize_t; cdecl; external libmagickwand;
procedure ClearPixelIterator(para1: PPixelIterator); cdecl; external libmagickwand;
procedure PixelResetIterator(para1: PPixelIterator); cdecl; external libmagickwand;
procedure PixelSetFirstIteratorRow(para1: PPixelIterator); cdecl; external libmagickwand;
procedure PixelSetLastIteratorRow(para1: PPixelIterator); cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
