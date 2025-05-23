{$IFDEF read_interface}


type
  PEfl_Io_Closer = ^TEfl_Io_Closer;
  TEfl_Io_Closer = TEo;

function EFL_IO_CLOSER_INTERFACE: PEfl_Class;

function efl_io_closer_interface_get: PEfl_Class; cdecl; external libefl;
function efl_io_closer_close(obj: PEo): TEina_Error; cdecl; external libefl;
function efl_io_closer_closed_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_io_closer_close_on_exec_set(obj: PEo; close_on_exec: TEina_Bool): TEina_Bool; cdecl; external libefl;
function efl_io_closer_close_on_exec_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_io_closer_close_on_invalidate_set(obj: PEo; close_on_invalidate: TEina_Bool); cdecl; external libefl;
function efl_io_closer_close_on_invalidate_get(obj: PEo): TEina_Bool; cdecl; external libefl;

var
  _EFL_IO_CLOSER_EVENT_CLOSED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_CLOSER_EVENT_CLOSED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_IO_CLOSER_INTERFACE: PEfl_Class;
begin
  EFL_IO_CLOSER_INTERFACE := efl_io_closer_interface_get;
end;

function EFL_IO_CLOSER_EVENT_CLOSED: PEfl_Event_Description;
begin
  EFL_IO_CLOSER_EVENT_CLOSED := @(_EFL_IO_CLOSER_EVENT_CLOSED);
end;


{$ENDIF read_implementation}
