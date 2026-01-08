{$IFDEF read_interface}


function GetNextImageProperty(para1: PImage): pchar; cdecl; external libmagickcore;
function InterpretImageProperties(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore;
function RemoveImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function GetImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function GetMagickProperty(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore;
function CloneImageProperties(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DefineImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar; args: array of const): TMagickBooleanType; cdecl; external libmagickcore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
procedure DestroyImageProperties(para1: PImage); cdecl; external libmagickcore;
procedure ResetImagePropertyIterator(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:40:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
