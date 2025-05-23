{$IFDEF read_interface}


type
  PEfl_Task = ^TEfl_Task;
  TEfl_Task = TEo;

type
  PEfl_Task_Priority = ^TEfl_Task_Priority;
  TEfl_Task_Priority = longint;

const
  EFL_TASK_PRIORITY_NORMAL = 0;
  EFL_TASK_PRIORITY_BACKGROUND = 1;
  EFL_TASK_PRIORITY_LOW = 2;
  EFL_TASK_PRIORITY_HIGH = 3;
  EFL_TASK_PRIORITY_ULTRA = 4;

type
  PEfl_Task_Flags = ^TEfl_Task_Flags;
  TEfl_Task_Flags = longint;

const
  EFL_TASK_FLAGS_NONE = 0;
  EFL_TASK_FLAGS_USE_STDIN = 1;
  EFL_TASK_FLAGS_USE_STDOUT = 2;
  EFL_TASK_FLAGS_NO_EXIT_CODE_ERROR = 4;
  EFL_TASK_FLAGS_EXIT_WITH_PARENT = 8;

function EFL_TASK_CLASS: PEfl_Class;

function efl_task_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_task_priority_set(obj: PEo; priority: TEfl_Task_Priority); cdecl; external libecore;
function efl_task_priority_get(obj: PEo): TEfl_Task_Priority; cdecl; external libecore;
function efl_task_exit_code_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_task_flags_set(obj: PEo; flags: TEfl_Task_Flags); cdecl; external libecore;
function efl_task_flags_get(obj: PEo): TEfl_Task_Flags; cdecl; external libecore;
function efl_task_run(obj: PEo): TEina_Bool; cdecl; external libecore;
procedure efl_task_end(obj: PEo); cdecl; external libecore;

var
  _EFL_TASK_EVENT_EXIT: TEfl_Event_Description; cvar;external libecore;

function EFL_TASK_EVENT_EXIT: PEfl_Event_Description;

// === Konventiert am: 21-5-25 15:25:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_TASK_CLASS: PEfl_Class;
begin
  EFL_TASK_CLASS := efl_task_class_get;
end;

function EFL_TASK_EVENT_EXIT: PEfl_Event_Description;
begin
  EFL_TASK_EVENT_EXIT := @(_EFL_TASK_EVENT_EXIT);
end;


{$ENDIF read_implementation}
