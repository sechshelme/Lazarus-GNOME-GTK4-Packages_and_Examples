{$IFDEF read_interface}


type
  PEfl_Loop_Handler = ^TEfl_Loop_Handler;
  TEfl_Loop_Handler = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Loop_Handler_Flags = ^TEfl_Loop_Handler_Flags;
  TEfl_Loop_Handler_Flags = longint;

const
  EFL_LOOP_HANDLER_FLAGS_NONE = 0;
  EFL_LOOP_HANDLER_FLAGS_READ = 1;
  EFL_LOOP_HANDLER_FLAGS_WRITE = 2;
  EFL_LOOP_HANDLER_FLAGS_ERROR = 4;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_HANDLER_CLASS: PEfl_Class;

function efl_loop_handler_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_handler_active_set(obj: PEo; flags: TEfl_Loop_Handler_Flags); cdecl; external libecore;
function efl_loop_handler_active_get(obj: PEo): TEfl_Loop_Handler_Flags; cdecl; external libecore;
procedure efl_loop_handler_fd_set(obj: PEo; fd: longint); cdecl; external libecore;
function efl_loop_handler_fd_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_loop_handler_fd_file_set(obj: PEo; fd: longint); cdecl; external libecore;
function efl_loop_handler_fd_file_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_loop_handler_win32_set(obj: PEo; handle: pointer); cdecl; external libecore;
function efl_loop_handler_win32_get(obj: PEo): pointer; cdecl; external libecore;

var
  _EFL_LOOP_HANDLER_EVENT_READ: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_HANDLER_EVENT_WRITE: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_HANDLER_EVENT_ERROR: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_HANDLER_EVENT_BUFFER: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_HANDLER_EVENT_PREPARE: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_HANDLER_EVENT_READ: PEfl_Event_Description;
function EFL_LOOP_HANDLER_EVENT_WRITE: PEfl_Event_Description;
function EFL_LOOP_HANDLER_EVENT_ERROR: PEfl_Event_Description;
function EFL_LOOP_HANDLER_EVENT_BUFFER: PEfl_Event_Description;
function EFL_LOOP_HANDLER_EVENT_PREPARE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 15:25:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_HANDLER_CLASS: PEfl_Class;
begin
  EFL_LOOP_HANDLER_CLASS := efl_loop_handler_class_get;
end;

function EFL_LOOP_HANDLER_EVENT_READ: PEfl_Event_Description;
begin
  EFL_LOOP_HANDLER_EVENT_READ := @(_EFL_LOOP_HANDLER_EVENT_READ);
end;

function EFL_LOOP_HANDLER_EVENT_WRITE: PEfl_Event_Description;
begin
  EFL_LOOP_HANDLER_EVENT_WRITE := @(_EFL_LOOP_HANDLER_EVENT_WRITE);
end;

function EFL_LOOP_HANDLER_EVENT_ERROR: PEfl_Event_Description;
begin
  EFL_LOOP_HANDLER_EVENT_ERROR := @(_EFL_LOOP_HANDLER_EVENT_ERROR);
end;

function EFL_LOOP_HANDLER_EVENT_BUFFER: PEfl_Event_Description;
begin
  EFL_LOOP_HANDLER_EVENT_BUFFER := @(_EFL_LOOP_HANDLER_EVENT_BUFFER);
end;

function EFL_LOOP_HANDLER_EVENT_PREPARE: PEfl_Event_Description;
begin
  EFL_LOOP_HANDLER_EVENT_PREPARE := @(_EFL_LOOP_HANDLER_EVENT_PREPARE);
end;
{$endif}


{$ENDIF read_implementation}
