{$IFDEF read_interface}




function GetCommandOptions(para1: TCommandOption): PPchar; cdecl; external libmagickcore;
function GetNextImageOption(para1: PImageInfo): pchar; cdecl; external libmagickcore;
function RemoveImageOption(para1: PImageInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function CommandOptionToMnemonic(para1: TCommandOption; para2: Tssize_t): pchar; cdecl; external libmagickcore;
function GetImageOption(para1: PImageInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function CloneImageOptions(para1: PImageInfo; para2: PImageInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DefineImageOption(para1: PImageInfo; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageOption(para1: PImageInfo; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsCommandOption(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsOptionMember(para1: pchar; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListCommandOptions(para1: PFILE; para2: TCommandOption; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageOption(para1: PImageInfo; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetCommandOptionFlags(para1: TCommandOption; para2: TMagickBooleanType; para3: pchar): Tssize_t; cdecl; external libmagickcore;
function ParseChannelOption(para1: pchar): Tssize_t; cdecl; external libmagickcore;
function ParseCommandOption(para1: TCommandOption; para2: TMagickBooleanType; para3: pchar): Tssize_t; cdecl; external libmagickcore;
procedure DestroyImageOptions(para1: PImageInfo); cdecl; external libmagickcore;
procedure ResetImageOptions(para1: PImageInfo); cdecl; external libmagickcore;
procedure ResetImageOptionIterator(para1: PImageInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
