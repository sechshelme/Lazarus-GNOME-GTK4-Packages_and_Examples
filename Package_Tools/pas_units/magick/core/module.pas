unit module;

interface

uses
  fp_magiccore, magick_type, version;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function MagickImageCoderSignature: Tsize_t;
function MagickImageFilterSignature: Tsize_t;

type
  PMagickModuleType = ^TMagickModuleType;
  TMagickModuleType = longint;

const
  MagickImageCoderModule = 0;
  MagickImageFilterModule = 1;

type
  PPModuleInfo = ^PModuleInfo;
  PModuleInfo = ^TModuleInfo;

  TModuleInfo = record
    path: pchar;
    tag: pchar;
    handle: pointer;
    unregister_module: procedure; cdecl;
    register_module: function: Tsize_t; cdecl;
    timestamp: Ttime_t;
    stealth: TMagickBooleanType;
    previous: PModuleInfo;
    next: PModuleInfo;
    signature: Tsize_t;
  end;

  TImageFilterHandler = function(para1: PPImage; para2: longint; para3: PPchar; para4: PExceptionInfo): Tsize_t; cdecl;

function GetModuleList(para1: pchar; para2: TMagickModuleType; para3: Psize_t; para4: PExceptionInfo): PPchar; cdecl; external libmagiccore;
function GetModuleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPModuleInfo; cdecl; external libmagiccore;
function InvokeDynamicImageFilter(para1: pchar; para2: PPImage; para3: longint; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function ListModuleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function ModuleComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function OpenModule(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function OpenModules(para1: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function GetModuleInfo(para1: pchar; para2: PExceptionInfo): PModuleInfo; cdecl; external libmagiccore;
procedure DestroyModuleList; cdecl; external libmagiccore;
procedure ModuleComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:47:37 ===


implementation


function MagickImageCoderSignature: Tsize_t;
begin
  MagickImageCoderSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;

function MagickImageFilterSignature: Tsize_t;
begin
  MagickImageFilterSignature := Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
end;


end.
