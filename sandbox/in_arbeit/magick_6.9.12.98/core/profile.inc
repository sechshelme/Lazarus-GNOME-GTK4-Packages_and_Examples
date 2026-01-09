{$IFDEF read_interface}




function GetNextImageProfile(para1: PImage): pchar; cdecl; external libmagickcore;
function GetImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
function CloneImageProfiles(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageProfile(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ProfileImage(para1: PImage; para2: pchar; para3: pointer; para4: Tsize_t; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProfile(para1: PImage; para2: pchar; para3: PStringInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImageProfiles(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemoveImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
procedure DestroyImageProfiles(para1: PImage); cdecl; external libmagickcore;
procedure ResetImageProfileIterator(para1: PImage); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
