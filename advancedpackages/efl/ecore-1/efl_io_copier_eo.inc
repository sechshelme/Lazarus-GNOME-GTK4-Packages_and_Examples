{$IFDEF read_interface}


type
  PEfl_Io_Copier = ^TEfl_Io_Copier;
  TEfl_Io_Copier = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_COPIER_CLASS: PEfl_Class;

function efl_io_copier_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_io_copier_source_set(obj: PEo; source: PEfl_Io_Reader); cdecl; external libecore;
function efl_io_copier_source_get(obj: PEo): PEfl_Io_Reader; cdecl; external libecore;
procedure efl_io_copier_destination_set(obj: PEo; destination: PEfl_Io_Writer); cdecl; external libecore;
function efl_io_copier_destination_get(obj: PEo): PEfl_Io_Writer; cdecl; external libecore;
procedure efl_io_copier_line_delimiter_set(obj: PEo; slice: TEina_Slice); cdecl; external libecore;
function efl_io_copier_line_delimiter_get(obj: PEo): TEina_Slice; cdecl; external libecore;
procedure efl_io_copier_buffer_limit_set(obj: PEo; size: Tsize_t); cdecl; external libecore;
function efl_io_copier_buffer_limit_get(obj: PEo): Tsize_t; cdecl; external libecore;
procedure efl_io_copier_read_chunk_size_set(obj: PEo; size: Tsize_t); cdecl; external libecore;
function efl_io_copier_read_chunk_size_get(obj: PEo): Tsize_t; cdecl; external libecore;
procedure efl_io_copier_progress_get(obj: PEo; read: Puint64; written: Puint64; total: Puint64); cdecl; external libecore;
procedure efl_io_copier_timeout_inactivity_set(obj: PEo; seconds: double); cdecl; external libecore;
function efl_io_copier_timeout_inactivity_get(obj: PEo): double; cdecl; external libecore;
procedure efl_io_copier_done_set(obj: PEo; done: TEina_Bool); cdecl; external libecore;
function efl_io_copier_done_get(obj: PEo): TEina_Bool; cdecl; external libecore;
function efl_io_copier_binbuf_steal(obj: PEo): PEina_Binbuf; cdecl; external libecore;
function efl_io_copier_pending_size_get(obj: PEo): Tsize_t; cdecl; external libecore;
function efl_io_copier_flush(obj: PEo; may_block: TEina_Bool; ignore_line_delimiter: TEina_Bool): TEina_Bool; cdecl; external libecore;

var
  _EFL_IO_COPIER_EVENT_DONE: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_COPIER_EVENT_ERROR: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_COPIER_EVENT_PROGRESS: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_COPIER_EVENT_DATA: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_COPIER_EVENT_LINE: TEfl_Event_Description; cvar;external libecore;

function EFL_IO_COPIER_EVENT_DONE: PEfl_Event_Description;
function EFL_IO_COPIER_EVENT_ERROR: PEfl_Event_Description;
function EFL_IO_COPIER_EVENT_PROGRESS: PEfl_Event_Description;
function EFL_IO_COPIER_EVENT_DATA: PEfl_Event_Description;
function EFL_IO_COPIER_EVENT_LINE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 13:42:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_COPIER_CLASS: PEfl_Class;
begin
  EFL_IO_COPIER_CLASS := efl_io_copier_class_get;
end;

function EFL_IO_COPIER_EVENT_DONE: PEfl_Event_Description;
begin
  EFL_IO_COPIER_EVENT_DONE := @(_EFL_IO_COPIER_EVENT_DONE);
end;

function EFL_IO_COPIER_EVENT_ERROR: PEfl_Event_Description;
begin
  EFL_IO_COPIER_EVENT_ERROR := @(_EFL_IO_COPIER_EVENT_ERROR);
end;

function EFL_IO_COPIER_EVENT_PROGRESS: PEfl_Event_Description;
begin
  EFL_IO_COPIER_EVENT_PROGRESS := @(_EFL_IO_COPIER_EVENT_PROGRESS);
end;

function EFL_IO_COPIER_EVENT_DATA: PEfl_Event_Description;
begin
  EFL_IO_COPIER_EVENT_DATA := @(_EFL_IO_COPIER_EVENT_DATA);
end;

function EFL_IO_COPIER_EVENT_LINE: PEfl_Event_Description;
begin
  EFL_IO_COPIER_EVENT_LINE := @(_EFL_IO_COPIER_EVENT_LINE);
end;
{$endif}


{$ENDIF read_implementation}
