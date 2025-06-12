{$IFDEF read_interface}


type
  PEfl_Io_Manager = ^TEfl_Io_Manager;
  TEfl_Io_Manager = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEio_Data = record
    data: pointer;
    size: dword;
  end;
  PEio_Data = ^TEio_Data;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEflIoPath = procedure(data: pointer; paths: PEina_Array); cdecl;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEflIoDirectInfo = procedure(data: pointer; entries: PEina_Array); cdecl;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_MANAGER_CLASS: PEfl_Class;

function efl_io_manager_class_get: PEfl_Class; cdecl; external libeio;
function efl_io_manager_ls(obj: PEo; path: pchar; paths_data: pointer; paths: TEflIoPath; paths_free_cb: TEina_Free_Cb): PEina_Future; cdecl; external libeio;
function efl_io_manager_direct_ls(obj: PEo; path: pchar; recursive: TEina_Bool; info_data: pointer; info: TEflIoDirectInfo;
  info_free_cb: TEina_Free_Cb): PEina_Future; cdecl; external libeio;
function efl_io_manager_stat_ls(obj: PEo; path: pchar; recursive: TEina_Bool; info_data: pointer; info: TEflIoDirectInfo;
  info_free_cb: TEina_Free_Cb): PEina_Future; cdecl; external libeio;
function efl_io_manager_xattr_ls(obj: PEo; path: pchar; paths_data: pointer; paths: TEflIoPath; paths_free_cb: TEina_Free_Cb): PEina_Future; cdecl; external libeio;
function efl_io_manager_stat(obj: PEo; path: pchar): PEina_Future; cdecl; external libeio;
function efl_io_manager_xattr_set(obj: PEo; path: pchar; attribute: pchar; data: PEina_Binbuf; flags: TEina_Xattr_Flags): PEina_Future; cdecl; external libeio;
function efl_io_manager_xattr_get(obj: PEo; path: pchar; attribute: pchar): PEina_Future; cdecl; external libeio;
function efl_io_manager_open(obj: PEo; path: pchar; shared: TEina_Bool): PEina_Future; cdecl; external libeio;
function efl_io_manager_close(obj: PEo; file_: PEina_File): PEina_Future; cdecl; external libeio;
{$endif}

// === Konventiert am: 12-6-25 16:09:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_MANAGER_CLASS: PEfl_Class;
begin
  EFL_IO_MANAGER_CLASS := efl_io_manager_class_get;
end;
{$endif}


{$ENDIF read_implementation}
