{$IFDEF read_interface}



function GetNextImageRegistry: pchar; cdecl; external libmagickcore;
function DefineImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageRegistry(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function RegistryComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetImageRegistry(para1: TRegistryType; para2: pchar; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;
procedure RegistryComponentTerminus; cdecl; external libmagickcore;
function RemoveImageRegistry(para1: pchar): pointer; cdecl; external libmagickcore;
procedure ResetImageRegistryIterator; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:40:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
