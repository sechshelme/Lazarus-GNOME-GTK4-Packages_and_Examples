{$IFDEF read_interface}



function GetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitImageMagickOpenCL(para1: TImageMagickOpenCLMode; para2: pointer; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitOpenCLEnv(para1: TMagickCLEnv; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetDefaultOpenCLEnv: TMagickCLEnv; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
