unit efl_exe_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, efl_core_env_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Exe = ^TEfl_Exe;
  TEfl_Exe = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Exe_Signal = ^TEfl_Exe_Signal;
  TEfl_Exe_Signal = longint;

const
  EFL_EXE_SIGNAL_INT = 0;
  EFL_EXE_SIGNAL_QUIT = 1;
  EFL_EXE_SIGNAL_TERM = 2;
  EFL_EXE_SIGNAL_KILL = 3;
  EFL_EXE_SIGNAL_CONT = 4;
  EFL_EXE_SIGNAL_STOP = 5;
  EFL_EXE_SIGNAL_HUP = 6;
  EFL_EXE_SIGNAL_USR1 = 7;
  EFL_EXE_SIGNAL_USR2 = 8;

type
  PEfl_Exe_Flags = ^TEfl_Exe_Flags;
  TEfl_Exe_Flags = longint;

const
  EFL_EXE_FLAGS_NONE = 0;
  EFL_EXE_FLAGS_GROUP_LEADER = 1;
  EFL_EXE_FLAGS_HIDE_IO = 4;
  EFL_EXE_FLAGS_TERM_WITH_PARENT = 8;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_EXE_CLASS: PEfl_Class;

function efl_exe_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_exe_signal(obj: PEo; sig: TEfl_Exe_Signal); cdecl; external libecore;
procedure efl_exe_flags_set(obj: PEo; flags: TEfl_Exe_Flags); cdecl; external libecore;
function efl_exe_flags_get(obj: PEo): TEfl_Exe_Flags; cdecl; external libecore;
function efl_exe_exit_signal_get(obj: PEo): longint; cdecl; external libecore;
function efl_exe_pid_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_exe_env_set(obj: PEo; env: PEfl_Core_Env); cdecl; external libecore;
function efl_exe_env_get(obj: PEo): PEfl_Core_Env; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 15:25:19 ===


implementation


function EFL_EXE_CLASS: PEfl_Class;
begin
  EFL_EXE_CLASS := efl_exe_class_get;
end;


end.
