{$IFDEF read_interface}


function CloneImageList(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneImages(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyImageList(para1: PImage): PImage; cdecl; external libmagickcore;
function DuplicateImages(para1: PImage; para2: Tsize_t; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetFirstImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetImageFromList(para1: PImage; para2: Tssize_t): PImage; cdecl; external libmagickcore;
function GetLastImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetNextImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetPreviousImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function ImageListToArray(para1: PImage; para2: PExceptionInfo): PPImage; cdecl; external libmagickcore;
function NewImageList: PImage; cdecl; external libmagickcore;
function RemoveImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function RemoveLastImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function RemoveFirstImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function SpliceImageIntoList(para1: PPImage; para2: Tsize_t; para3: PImage): PImage; cdecl; external libmagickcore;
function SplitImageList(para1: PImage): PImage; cdecl; external libmagickcore;
function SyncNextImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetImageListLength(para1: PImage): Tsize_t; cdecl; external libmagickcore;
function GetImageIndexInList(para1: PImage): Tssize_t; cdecl; external libmagickcore;
procedure AppendImageToList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure DeleteImageFromList(para1: PPImage); cdecl; external libmagickcore;
procedure DeleteImages(para1: PPImage; para2: pchar; para3: PExceptionInfo); cdecl; external libmagickcore;
procedure InsertImageInList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure PrependImageToList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReplaceImageInList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReplaceImageInListReturnLast(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReverseImageList(para1: PPImage); cdecl; external libmagickcore;
procedure SyncImageList(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
