{$IFDEF read_interface}


type
  PEfl_Io_Queue = ^TEfl_Io_Queue;
  TEfl_Io_Queue = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_QUEUE_CLASS: PEfl_Class;

function efl_io_queue_class_get: PEfl_Class; cdecl; external libefl;
procedure efl_io_queue_preallocate(obj: PEo; size: Tsize_t); cdecl; external libefl;
procedure efl_io_queue_limit_set(obj: PEo; size: Tsize_t); cdecl; external libefl;
function efl_io_queue_limit_get(obj: PEo): Tsize_t; cdecl; external libefl;
function efl_io_queue_usage_get(obj: PEo): Tsize_t; cdecl; external libefl;
function efl_io_queue_slice_get(obj: PEo): TEina_Slice; cdecl; external libefl;
procedure efl_io_queue_discard(obj: PEo; amount: Tsize_t); cdecl; external libefl;
procedure efl_io_queue_clear(obj: PEo); cdecl; external libefl;
procedure efl_io_queue_eos_mark(obj: PEo); cdecl; external libefl;

var
  _EFL_IO_QUEUE_EVENT_SLICE_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_QUEUE_EVENT_SLICE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 19-5-25 19:44:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_QUEUE_CLASS: PEfl_Class;
begin
  EFL_IO_QUEUE_CLASS := efl_io_queue_class_get;
end;

function EFL_IO_QUEUE_EVENT_SLICE_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_QUEUE_EVENT_SLICE_CHANGED := @(_EFL_IO_QUEUE_EVENT_SLICE_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
