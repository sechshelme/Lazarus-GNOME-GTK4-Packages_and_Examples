{$IFDEF read_interface}



function GetNextImageArtifact(para1:PImage):Pchar;cdecl;external libmagickcore;
function RemoveImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagickcore;
function GetImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external libmagickcore;
function CloneImageArtifacts(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function DefineImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function DeleteImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageArtifact(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
procedure DestroyImageArtifacts(para1:PImage);cdecl;external libmagickcore;
procedure ResetImageArtifactIterator(para1:PImage);cdecl;external libmagickcore;

// === Konventiert am: 6-1-26 19:17:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
