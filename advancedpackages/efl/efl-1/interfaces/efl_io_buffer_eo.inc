{$IFDEF read_interface}


type
  PEfl_Io_Buffer = ^TEfl_Io_Buffer;
  TEfl_Io_Buffer = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_BUFFER_CLASS: PEfl_Class;

function efl_io_buffer_class_get: PEfl_Class; cdecl; external libefl;
procedure efl_io_buffer_preallocate(obj: PEo; size: Tsize_t); cdecl; external libefl;
procedure efl_io_buffer_adopt_readonly(obj: PEo; slice: TEina_Slice); cdecl; external libefl;
procedure efl_io_buffer_adopt_readwrite(obj: PEo; slice: TEina_Rw_Slice); cdecl; external libefl;
procedure efl_io_buffer_limit_set(obj: PEo; size: Tsize_t); cdecl; external libefl;
function efl_io_buffer_limit_get(obj: PEo): Tsize_t; cdecl; external libefl;
function efl_io_buffer_position_read_set(obj: PEo; position: uint64): TEina_Bool; cdecl; external libefl;
function efl_io_buffer_position_read_get(obj: PEo): uint64; cdecl; external libefl;
function efl_io_buffer_position_write_set(obj: PEo; position: uint64): TEina_Bool; cdecl; external libefl;
function efl_io_buffer_position_write_get(obj: PEo): uint64; cdecl; external libefl;
function efl_io_buffer_slice_get(obj: PEo): TEina_Slice; cdecl; external libefl;
function efl_io_buffer_binbuf_steal(obj: PEo): PEina_Binbuf; cdecl; external libefl;

var
  _EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_IO_BUFFER_EVENT_REALLOCATED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED: PEfl_Event_Description;
function EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED: PEfl_Event_Description;
function EFL_IO_BUFFER_EVENT_REALLOCATED: PEfl_Event_Description;

{$endif}

// === Konventiert am: 19-5-25 17:35:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_IO_BUFFER_CLASS: PEfl_Class;
begin
  EFL_IO_BUFFER_CLASS := efl_io_buffer_class_get;
end;

function EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED := @(_EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED);
end;

function EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED := @(_EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED);
end;

function EFL_IO_BUFFER_EVENT_REALLOCATED: PEfl_Event_Description;
begin
  EFL_IO_BUFFER_EVENT_REALLOCATED := @(_EFL_IO_BUFFER_EVENT_REALLOCATED);
end;


{$ENDIF read_implementation}
