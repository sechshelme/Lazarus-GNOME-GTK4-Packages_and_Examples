{$IFDEF read_interface}


function MagickImageCoderSignature: Tsize_t;
function MagickImageFilterSignature: Tsize_t;



function GetModuleList(para1: pchar; para2: TMagickModuleType; para3: Psize_t; para4: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetModuleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPModuleInfo; cdecl; external libmagickcore;
function InvokeDynamicImageFilter(para1: pchar; para2: PPImage; para3: longint; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ListModuleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ModuleComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function OpenModule(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OpenModules(para1: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetModuleInfo(para1: pchar; para2: PExceptionInfo): PModuleInfo; cdecl; external libmagickcore;
procedure DestroyModuleList; cdecl; external libmagickcore;
procedure ModuleComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function MagickImageCoderSignature: Tsize_t;
begin
  MagickImageCoderSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;

function MagickImageFilterSignature: Tsize_t;
begin
  MagickImageFilterSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;


{$ENDIF read_implementation}
