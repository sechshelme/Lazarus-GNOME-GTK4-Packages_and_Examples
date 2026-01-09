{$IFDEF read_interface}


function GetMagickHomeURL: pchar; cdecl; external libmagickcore;
function GetMagickCopyright: pchar; cdecl; external libmagickcore;
function GetMagickDelegates: pchar; cdecl; external libmagickcore;
function GetMagickFeatures: pchar; cdecl; external libmagickcore;
function GetMagickLicense: pchar; cdecl; external libmagickcore;
function GetMagickPackageName: pchar; cdecl; external libmagickcore;
function GetMagickQuantumDepth(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickQuantumRange(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickReleaseDate: pchar; cdecl; external libmagickcore;
function GetMagickVersion(para1: Psize_t): pchar; cdecl; external libmagickcore;
procedure ListMagickVersion(para1: PFILE); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
