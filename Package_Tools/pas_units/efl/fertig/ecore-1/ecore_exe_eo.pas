unit ecore_exe_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEcore_Exe = ^TEcore_Exe;
  TEcore_Exe = TEo;

type
  TEcore_Exe_Event_Data_Line = record
    line: pchar;
    size: longint;
  end;
  PEcore_Exe_Event_Data_Line = ^TEcore_Exe_Event_Data_Line;

  TEcore_Exe_Event_Data = record
    exe: PEfl_Object;
    data: pointer;
    size: longint;
    lines: PEcore_Exe_Event_Data_Line;
  end;
  PEcore_Exe_Event_Data = ^TEcore_Exe_Event_Data;

  PEcore_Exe_Flags = ^TEcore_Exe_Flags;
  TEcore_Exe_Flags = longint;

const
  ECORE_EXE_NONE = 0;
  ECORE_EXE_PIPE_READ = 1;
  ECORE_EXE_PIPE_WRITE = 2;
  ECORE_EXE_PIPE_ERROR = 4;
  ECORE_EXE_PIPE_READ_LINE_BUFFERED = 8;
  ECORE_EXE_PIPE_ERROR_LINE_BUFFERED = 16;
  ECORE_EXE_PIPE_AUTO = 32;
  ECORE_EXE_RESPAWN = 64;
  ECORE_EXE_USE_SH = 128;
  ECORE_EXE_NOT_LEADER = 256;
  ECORE_EXE_TERM_WITH_PARENT = 512;
  ECORE_EXE_ISOLATE_IO = 1024;

function ECORE_EXE_CLASS: PEfl_Class;

function ecore_exe_class_get: PEfl_Class; cdecl; external libecore;
procedure ecore_obj_exe_command_set(obj: PEo; exe_cmd: pchar; flags: TEcore_Exe_Flags); cdecl; external libecore;
procedure ecore_obj_exe_command_get(obj: PEo; exe_cmd: PPchar; flags: PEcore_Exe_Flags); cdecl; external libecore;

var
  _ECORE_EXE_EVENT_DATA_GET: TEfl_Event_Description; cvar;external libecore;
  _ECORE_EXE_EVENT_DATA_ERROR: TEfl_Event_Description; cvar;external libecore;

function ECORE_EXE_EVENT_DATA_GET: PEfl_Event_Description;
function ECORE_EXE_EVENT_DATA_ERROR: PEfl_Event_Description;


// === Konventiert am: 20-5-25 19:57:46 ===


implementation


function ECORE_EXE_CLASS: PEfl_Class; unimplemented;
begin
//  ECORE_EXE_CLASS := ecore_exe_class_get;
end;

function ECORE_EXE_EVENT_DATA_GET: PEfl_Event_Description; unimplemented;
begin
//  ECORE_EXE_EVENT_DATA_GET := @(_ECORE_EXE_EVENT_DATA_GET);
end;

function ECORE_EXE_EVENT_DATA_ERROR: PEfl_Event_Description; unimplemented;
begin
//  ECORE_EXE_EVENT_DATA_ERROR := @(_ECORE_EXE_EVENT_DATA_ERROR);
end;


end.
