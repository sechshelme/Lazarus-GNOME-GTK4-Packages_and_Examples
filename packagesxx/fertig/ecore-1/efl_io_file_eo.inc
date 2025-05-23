{$IFDEF read_interface}


type
  PEfl_Io_File = ^TEfl_Io_File;
  TEfl_Io_File = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_FILE_CLASS: PEfl_Class;

function efl_io_file_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_io_file_flags_set(obj: PEo; flags: uint32); cdecl; external libecore;
function efl_io_file_flags_get(obj: PEo): uint32; cdecl; external libecore;
procedure efl_io_file_mode_set(obj: PEo; mode: uint32); cdecl; external libecore;
function efl_io_file_mode_get(obj: PEo): uint32; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 16:49:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_FILE_CLASS: PEfl_Class;
begin
  EFL_IO_FILE_CLASS := efl_io_file_class_get;
end;
{$endif}


{$ENDIF read_implementation}
