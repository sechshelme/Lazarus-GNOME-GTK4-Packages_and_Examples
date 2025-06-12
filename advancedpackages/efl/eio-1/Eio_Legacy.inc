{$IFDEF read_interface}


type
  TEio_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEio_Version = ^TEio_Version;

var
  eio_version: PEio_Version; cvar;external libeio;

type
  PEio_File_Op = ^TEio_File_Op;
  TEio_File_Op = longint;

const
  EIO_FILE_COPY_ = 0;
  EIO_FILE_MOVE_ = 1;
  EIO_DIR_COPY_ = 2;
  EIO_DIR_MOVE_ = 3;
  EIO_UNLINK = 4;
  EIO_FILE_GETPWNAM = 5;
  EIO_FILE_GETGRNAM = 6;

type
  TEio_Progress = record
    op: TEio_File_Op;
    current: int64;
    max: int64;
    percent: single;
    source: pchar;
    dest: pchar;
  end;
  PEio_Progress = ^TEio_Progress;

  TEio_Filter_Cb = function(data: pointer; handler: PEio_File; file_: pchar): TEina_Bool; cdecl;
  TEio_Main_Cb = procedure(data: pointer; handler: PEio_File; file_: pchar); cdecl;
  TEio_Filter_Dir_Cb = function(data: pointer; handler: PEio_File; info: PEina_File_Direct_Info): TEina_Bool; cdecl;
  TEio_Main_Direct_Cb = procedure(data: pointer; handler: PEio_File; info: PEina_File_Direct_Info); cdecl;
  TEio_Stat_Cb = procedure(data: pointer; handler: PEio_File; stat: PEina_Stat); cdecl;
  TEio_Progress_Cb = procedure(data: pointer; handler: PEio_File; info: PEio_Progress); cdecl;
  TEio_Eet_Open_Cb = procedure(data: pointer; handler: PEio_File; file_: PEet_File); cdecl;
  TEio_Open_Cb = procedure(data: pointer; handler: PEio_File; file_: PEina_File); cdecl;
  TEio_Filter_Map_Cb = function(data: pointer; handler: PEio_File; map: pointer; length: Tsize_t): TEina_Bool; cdecl;
  TEio_Map_Cb = procedure(data: pointer; handler: PEio_File; map: pointer; length: Tsize_t); cdecl;
  TEio_Done_Data_Cb = procedure(data: pointer; handler: PEio_File; read_data: pchar; size: dword); cdecl;
  TEio_Done_String_Cb = procedure(data: pointer; handler: PEio_File; xattr_string: pchar); cdecl;
  TEio_Done_Double_Cb = procedure(data: pointer; handler: PEio_File; xattr_double: double); cdecl;
  TEio_Done_Int_Cb = procedure(data: pointer; handler: PEio_File; i: longint); cdecl;
  TEio_Done_ERead_Cb = procedure(data: pointer; handler: PEio_File; decoded: pointer); cdecl;
  TEio_Done_Read_Cb = procedure(data: pointer; handler: PEio_File; read_data: pointer; size: dword); cdecl;
  TEio_Done_Cb = procedure(data: pointer; handler: PEio_File); cdecl;
  TEio_Error_Cb = procedure(data: pointer; handler: PEio_File; error: longint); cdecl;
  TEio_Eet_Error_Cb = procedure(data: pointer; handler: PEio_File; err: TEet_Error); cdecl;


function eio_file_ls(dir: pchar; filter_cb: TEio_Filter_Cb; main_cb: TEio_Main_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_direct_ls(dir: pchar; filter_cb: TEio_Filter_Direct_Cb; main_cb: TEio_Main_Direct_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_stat_ls(dir: pchar; filter_cb: TEio_Filter_Direct_Cb; main_cb: TEio_Main_Direct_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_dir_stat_ls(dir: pchar; filter_cb: TEio_Filter_Direct_Cb; main_cb: TEio_Main_Direct_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_dir_direct_ls(dir: pchar; filter_cb: TEio_Filter_Dir_Cb; main_cb: TEio_Main_Direct_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_direct_stat(path: pchar; done_cb: TEio_Stat_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_chmod(path: pchar; mode: Tmode_t; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_chown(path: pchar; user: pchar; group: pchar; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_unlink(path: pchar; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_mkdir(path: pchar; mode: Tmode_t; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_move(source: pchar; dest: pchar; progress_cb: TEio_Progress_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_copy(source: pchar; dest: pchar; progress_cb: TEio_Progress_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_dir_move(source: pchar; dest: pchar; filter_cb: TEio_Filter_Direct_Cb; progress_cb: TEio_Progress_Cb; done_cb: TEio_Done_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_dir_copy(source: pchar; dest: pchar; filter_cb: TEio_Filter_Direct_Cb; progress_cb: TEio_Progress_Cb; done_cb: TEio_Done_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_dir_unlink(path: pchar; filter_cb: TEio_Filter_Direct_Cb; progress_cb: TEio_Progress_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr(path: pchar; filter_cb: TEio_Filter_Cb; main_cb: TEio_Main_Cb; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_int_set(path: pchar; attribute: pchar; xattr_int: longint; flags: TEina_Xattr_Flags; done_cb: TEio_Done_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_double_set(path: pchar; attribute: pchar; xattr_double: double; flags: TEina_Xattr_Flags; done_cb: TEio_Done_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_string_set(path: pchar; attribute: pchar; xattr_string: pchar; flags: TEina_Xattr_Flags; done_cb: TEio_Done_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_set(path: pchar; attribute: pchar; xattr_data: pchar; xattr_size: dword; flags: TEina_Xattr_Flags;
  done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_get(path: pchar; attribute: pchar; done_cb: TEio_Done_Data_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_int_get(path: pchar; attribute: pchar; done_cb: TEio_Done_Int_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_double_get(path: pchar; attribute: pchar; done_cb: TEio_Done_Double_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_xattr_string_get(path: pchar; attribute: pchar; done_cb: TEio_Done_String_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_init: longint; cdecl; external libeio;
function eio_shutdown: longint; cdecl; external libeio;
procedure eio_memory_burst_limit_set(limit: Tsize_t); cdecl; external libeio;
function eio_memory_burst_limit_get: Tsize_t; cdecl; external libeio;
function eio_file_container_get(ls: PEio_File): pointer; cdecl; external libeio;
function eio_file_cancel(ls: PEio_File): TEina_Bool; cdecl; external libeio;
function eio_file_check(ls: PEio_File): TEina_Bool; cdecl; external libeio;
function eio_file_associate_add(ls: PEio_File; key: pchar; data: pointer; free_cb: TEina_Free_Cb): TEina_Bool; cdecl; external libeio;
function eio_file_associate_direct_add(ls: PEio_File; key: pchar; data: pointer; free_cb: TEina_Free_Cb): TEina_Bool; cdecl; external libeio;
function eio_file_associate_find(ls: PEio_File; key: pchar): pointer; cdecl; external libeio;
function eio_file_open(name: pchar; shared: TEina_Bool; open_cb: TEio_Open_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_close(f: PEina_File; done_cb: TEio_Done_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_file_map_all(f: PEina_File; rule: TEina_File_Populate; filter_cb: TEio_Filter_Map_Cb; map_cb: TEio_Map_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_file_map_new(f: PEina_File; rule: TEina_File_Populate; offset: dword; length: dword; filter_cb: TEio_Filter_Map_Cb;
  map_cb: TEio_Map_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_open(filename: pchar; mode: TEet_File_Mode; eet_cb: TEio_Eet_Open_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_close(ef: PEet_File; done_cb: TEio_Done_Cb; error_cb: TEio_Eet_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_sync(ef: PEet_File; done_cb: TEio_Done_Cb; error_cb: TEio_Eet_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_data_write_cipher(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; cipher_key: pchar; write_data: pointer;
  compress: longint; done_cb: TEio_Done_Int_Cb; error_cb: TEio_Error_Cb; user_data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_data_read_cipher(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; cipher_key: pchar; done_cb: TEio_Done_ERead_Cb;
  error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_data_image_write_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; write_data: pointer; w: dword;
  h: dword; alpha: longint; compress: longint; quality: longint; lossy: longint;
  done_cb: TEio_Done_Int_Cb; error_cb: TEio_Error_Cb; user_data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_read_direct(ef: PEet_File; name: pchar; done_cb: TEio_Done_Data_Cb; error_cb: TEio_Error_Cb; data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_read_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; done_cb: TEio_Done_Read_Cb; error_cb: TEio_Error_Cb;
  data: pointer): PEio_File; cdecl; external libeio;
function eio_eet_write_cipher(ef: PEet_File; name: pchar; write_data: pointer; size: longint; compress: longint;
  cipher_key: pchar; done_cb: TEio_Done_Int_Cb; error_cb: TEio_Error_Cb; user_data: pointer): PEio_File; cdecl; external libeio;

var
  EIO_MONITOR_FILE_CREATED: longint; cvar;external libeio;
  EIO_MONITOR_FILE_DELETED: longint; cvar;external libeio;
  EIO_MONITOR_FILE_MODIFIED: longint; cvar;external libeio;
  EIO_MONITOR_FILE_CLOSED: longint; cvar;external libeio;
  EIO_MONITOR_DIRECTORY_CREATED: longint; cvar;external libeio;
  EIO_MONITOR_DIRECTORY_DELETED: longint; cvar;external libeio;
  EIO_MONITOR_DIRECTORY_MODIFIED: longint; cvar;external libeio;
  EIO_MONITOR_DIRECTORY_CLOSED: longint; cvar;external libeio;
  EIO_MONITOR_SELF_RENAME: longint; cvar;external libeio;
  EIO_MONITOR_SELF_DELETED: longint; cvar;external libeio;
  EIO_MONITOR_ERROR: longint; cvar;external libeio;

type
  TEio_Monitor = record
  end;
  PEio_Monitor = ^TEio_Monitor;

  TEio_Monitor_Error = record
    monitor: PEio_Monitor;
    error: longint;
  end;
  PEio_Monitor_Error = ^TEio_Monitor_Error;

  TEio_Monitor_Event = record
    monitor: PEio_Monitor;
    filename: pchar;
  end;
  PEio_Monitor_Event = ^TEio_Monitor_Event;

function eio_monitor_add(path: pchar): PEio_Monitor; cdecl; external libeio;
function eio_monitor_stringshared_add(path: pchar): PEio_Monitor; cdecl; external libeio;
procedure eio_monitor_del(monitor: PEio_Monitor); cdecl; external libeio;
function eio_monitor_path_get(monitor: PEio_Monitor): pchar; cdecl; external libeio;

{$ifdef EFL_BETA_API_SUPPORT}
function eio_monitor_fallback_check(monitor: PEio_Monitor): TEina_Bool; cdecl; external libeio;
function eio_monitor_has_context(monitor: PEio_Monitor; path: pchar): TEina_Bool; cdecl; external libeio;
{$endif}

// === Konventiert am: 12-6-25 16:09:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
