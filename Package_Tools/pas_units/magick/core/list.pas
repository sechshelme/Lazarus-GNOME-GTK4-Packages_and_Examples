unit list;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CloneImageList(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function CloneImages(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function DestroyImageList(para1: PImage): PImage; cdecl; external libmagiccore;
function DuplicateImages(para1: PImage; para2: Tsize_t; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function GetFirstImageInList(para1: PImage): PImage; cdecl; external libmagiccore;
function GetImageFromList(para1: PImage; para2: Tssize_t): PImage; cdecl; external libmagiccore;
function GetLastImageInList(para1: PImage): PImage; cdecl; external libmagiccore;
function GetNextImageInList(para1: PImage): PImage; cdecl; external libmagiccore;
function GetPreviousImageInList(para1: PImage): PImage; cdecl; external libmagiccore;
function ImageListToArray(para1: PImage; para2: PExceptionInfo): PPImage; cdecl; external libmagiccore;
function NewImageList: PImage; cdecl; external libmagiccore;
function RemoveImageFromList(para1: PPImage): PImage; cdecl; external libmagiccore;
function RemoveLastImageFromList(para1: PPImage): PImage; cdecl; external libmagiccore;
function RemoveFirstImageFromList(para1: PPImage): PImage; cdecl; external libmagiccore;
function SpliceImageIntoList(para1: PPImage; para2: Tsize_t; para3: PImage): PImage; cdecl; external libmagiccore;
function SplitImageList(para1: PImage): PImage; cdecl; external libmagiccore;
function SyncNextImageInList(para1: PImage): PImage; cdecl; external libmagiccore;
function GetImageListLength(para1: PImage): Tsize_t; cdecl; external libmagiccore;
function GetImageIndexInList(para1: PImage): Tssize_t; cdecl; external libmagiccore;
procedure AppendImageToList(para1: PPImage; para2: PImage); cdecl; external libmagiccore;
procedure DeleteImageFromList(para1: PPImage); cdecl; external libmagiccore;
procedure DeleteImages(para1: PPImage; para2: pchar; para3: PExceptionInfo); cdecl; external libmagiccore;
procedure InsertImageInList(para1: PPImage; para2: PImage); cdecl; external libmagiccore;
procedure PrependImageToList(para1: PPImage; para2: PImage); cdecl; external libmagiccore;
procedure ReplaceImageInList(para1: PPImage; para2: PImage); cdecl; external libmagiccore;
procedure ReplaceImageInListReturnLast(para1: PPImage; para2: PImage); cdecl; external libmagiccore;
procedure ReverseImageList(para1: PPImage); cdecl; external libmagiccore;
procedure SyncImageList(para1: PImage); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:47:31 ===


implementation



end.
