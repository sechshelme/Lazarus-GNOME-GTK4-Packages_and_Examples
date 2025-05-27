{$IFDEF read_interface}


type
  PEfl_Io_Buffered_Stream = ^TEfl_Io_Buffered_Stream;
  TEfl_Io_Buffered_Stream = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_BUFFERED_STREAM_CLASS: PEfl_Class;

function efl_io_buffered_stream_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_io_buffered_stream_inner_io_set(obj: PEo; io: PEfl_Object); cdecl; external libecore;
function efl_io_buffered_stream_inner_io_get(obj: PEo): PEfl_Object; cdecl; external libecore;
procedure efl_io_buffered_stream_max_queue_size_input_set(obj: PEo; max_queue_size_input: Tsize_t); cdecl; external libecore;
function efl_io_buffered_stream_max_queue_size_input_get(obj: PEo): Tsize_t; cdecl; external libecore;
procedure efl_io_buffered_stream_max_queue_size_output_set(obj: PEo; max_queue_size_output: Tsize_t); cdecl; external libecore;
function efl_io_buffered_stream_max_queue_size_output_get(obj: PEo): Tsize_t; cdecl; external libecore;
procedure efl_io_buffered_stream_line_delimiter_set(obj: PEo; slice: TEina_Slice); cdecl; external libecore;
function efl_io_buffered_stream_line_delimiter_get(obj: PEo): TEina_Slice; cdecl; external libecore;
procedure efl_io_buffered_stream_timeout_inactivity_set(obj: PEo; seconds: double); cdecl; external libecore;
function efl_io_buffered_stream_timeout_inactivity_get(obj: PEo): double; cdecl; external libecore;
procedure efl_io_buffered_stream_read_chunk_size_set(obj: PEo; size: Tsize_t); cdecl; external libecore;
function efl_io_buffered_stream_read_chunk_size_get(obj: PEo): Tsize_t; cdecl; external libecore;
function efl_io_buffered_stream_pending_write_get(obj: PEo): Tsize_t; cdecl; external libecore;
function efl_io_buffered_stream_pending_read_get(obj: PEo): Tsize_t; cdecl; external libecore;
procedure efl_io_buffered_stream_progress_get(obj: PEo; read_bytes: Psize_t; written_bytes: Psize_t); cdecl; external libecore;
function efl_io_buffered_stream_slice_get(obj: PEo): TEina_Slice; cdecl; external libecore;
procedure efl_io_buffered_stream_discard(obj: PEo; amount: Tsize_t); cdecl; external libecore;
procedure efl_io_buffered_stream_clear(obj: PEo); cdecl; external libecore;
procedure efl_io_buffered_stream_eos_mark(obj: PEo); cdecl; external libecore;
function efl_io_buffered_stream_flush(obj: PEo; may_block: TEina_Bool; ignore_line_delimiter: TEina_Bool): TEina_Bool; cdecl; external libecore;

var
  _EFL_IO_BUFFERED_STREAM_EVENT_WRITE_FINISHED: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_READ_FINISHED: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_FINISHED: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_ERROR: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_PROGRESS: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_SLICE_CHANGED: TEfl_Event_Description; cvar;external libecore;
  _EFL_IO_BUFFERED_STREAM_EVENT_LINE: TEfl_Event_Description; cvar;external libecore;

function EFL_IO_BUFFERED_STREAM_EVENT_WRITE_FINISHED: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_READ_FINISHED: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_FINISHED: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_ERROR: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_PROGRESS: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_SLICE_CHANGED: PEfl_Event_Description;
function EFL_IO_BUFFERED_STREAM_EVENT_LINE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 13:42:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_BUFFERED_STREAM_CLASS: PEfl_Class;
begin
  EFL_IO_BUFFERED_STREAM_CLASS := efl_io_buffered_stream_class_get;
end;

function EFL_IO_BUFFERED_STREAM_EVENT_WRITE_FINISHED: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_WRITE_FINISHED := @(_EFL_IO_BUFFERED_STREAM_EVENT_WRITE_FINISHED);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_READ_FINISHED: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_READ_FINISHED := @(_EFL_IO_BUFFERED_STREAM_EVENT_READ_FINISHED);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_FINISHED: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_FINISHED := @(_EFL_IO_BUFFERED_STREAM_EVENT_FINISHED);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_ERROR: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_ERROR := @(_EFL_IO_BUFFERED_STREAM_EVENT_ERROR);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_PROGRESS: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_PROGRESS := @(_EFL_IO_BUFFERED_STREAM_EVENT_PROGRESS);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_SLICE_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_SLICE_CHANGED := @(_EFL_IO_BUFFERED_STREAM_EVENT_SLICE_CHANGED);
end;

function EFL_IO_BUFFERED_STREAM_EVENT_LINE: PEfl_Event_Description;
begin
  EFL_IO_BUFFERED_STREAM_EVENT_LINE := @(_EFL_IO_BUFFERED_STREAM_EVENT_LINE);
end;
{$endif}


{$ENDIF read_implementation}
