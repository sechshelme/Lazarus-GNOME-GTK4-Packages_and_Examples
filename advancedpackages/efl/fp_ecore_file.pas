unit fp_ecore_file;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEcore_File_Monitor = record
  end;
  PEcore_File_Monitor = ^TEcore_File_Monitor;

  TEcore_File_Download_Job = record
  end;
  PEcore_File_Download_Job = ^TEcore_File_Download_Job;
  PPEcore_File_Download_Job = ^PEcore_File_Download_Job;

type
  PEcore_File_Event = ^TEcore_File_Event;
  TEcore_File_Event = longint;

const
  ECORE_FILE_EVENT_NONE = 0;
  ECORE_FILE_EVENT_CREATED_FILE = 1;
  ECORE_FILE_EVENT_CREATED_DIRECTORY = 2;
  ECORE_FILE_EVENT_DELETED_FILE = 3;
  ECORE_FILE_EVENT_DELETED_DIRECTORY = 4;
  ECORE_FILE_EVENT_DELETED_SELF = 5;
  ECORE_FILE_EVENT_MODIFIED = 6;
  ECORE_FILE_EVENT_CLOSED = 7;

type
  TEcore_File_Monitor_Cb = procedure(data: pointer; em: PEcore_File_Monitor; event: TEcore_File_Event; path: pchar); cdecl;
  TEcore_File_Download_Completion_Cb = procedure(data: pointer; file_: pchar; status: longint); cdecl;

type
  PEcore_File_Progress_Return = ^TEcore_File_Progress_Return;
  TEcore_File_Progress_Return = longint;

const
  ECORE_FILE_PROGRESS_CONTINUE = 0;
  ECORE_FILE_PROGRESS_ABORT = 1;

type
  TEcore_File_Download_Progress_Cb = function(data: pointer; file_: pchar; dltotal: longint; dlnow: longint; ultotal: longint; ulnow: longint): longint; cdecl;

function ecore_file_init: longint; cdecl; external libecore_file;
function ecore_file_shutdown: longint; cdecl; external libecore_file;
function ecore_file_mod_time(file_: pchar): int64; cdecl; external libecore_file;
function ecore_file_size(file_: pchar): int64; cdecl; external libecore_file;
function ecore_file_exists(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_is_dir(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_mkdir(dir: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_mkdirs(dirs: PPchar): longint; cdecl; external libecore_file;
function ecore_file_mksubdirs(base: pchar; subdirs: PPchar): longint; cdecl; external libecore_file;
function ecore_file_rmdir(dir: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_recursive_rm(dir: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_mkpath(path: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_mkpaths(paths: PPchar): longint; cdecl; external libecore_file;
function ecore_file_cp(src: pchar; dst: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_mv(src: pchar; dst: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_symlink(src: pchar; dest: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_realpath(file_: pchar): pchar; cdecl; external libecore_file;
function ecore_file_unlink(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_remove(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_file_get(path: pchar): pchar; cdecl; external libecore_file;
function ecore_file_dir_get(file_: pchar): pchar; cdecl; external libecore_file;
function ecore_file_can_read(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_can_write(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_can_exec(file_: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_readlink(link: pchar): pchar; cdecl; external libecore_file;
function ecore_file_ls(dir: pchar): PEina_List; cdecl; external libecore_file;
function ecore_file_app_exe_get(app: pchar): pchar; cdecl; external libecore_file;
function ecore_file_escape_name(filename: pchar): pchar; cdecl; external libecore_file;
function ecore_file_strip_ext(path: pchar): pchar; cdecl; external libecore_file;
function ecore_file_dir_is_empty(dir: pchar): longint; cdecl; external libecore_file;
function ecore_file_monitor_add(path: pchar; func: TEcore_File_Monitor_Cb; data: pointer): PEcore_File_Monitor; cdecl; external libecore_file;
procedure ecore_file_monitor_del(em: PEcore_File_Monitor); cdecl; external libecore_file;
function ecore_file_monitor_path_get(em: PEcore_File_Monitor): pchar; cdecl; external libecore_file;
function ecore_file_path_dir_exists(in_dir: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_app_installed(exe: pchar): TEina_Bool; cdecl; external libecore_file;
function ecore_file_app_list: PEina_List; cdecl; external libecore_file;
function ecore_file_download(url: pchar; dst: pchar; completion_cb: TEcore_File_Download_Completion_Cb; progress_cb: TEcore_File_Download_Progress_Cb; data: pointer;
  job_ret: PPEcore_File_Download_Job): TEina_Bool; cdecl; external libecore_file;
function ecore_file_download_full(url: pchar; dst: pchar; completion_cb: TEcore_File_Download_Completion_Cb; progress_cb: TEcore_File_Download_Progress_Cb; data: pointer;
  job_ret: PPEcore_File_Download_Job; headers: PEina_Hash): TEina_Bool; cdecl; external libecore_file;
procedure ecore_file_download_abort_all; cdecl; external libecore_file;
procedure ecore_file_download_abort(job: PEcore_File_Download_Job); cdecl; external libecore_file;
function ecore_file_download_protocol_available(protocol: pchar): TEina_Bool; cdecl; external libecore_file;

// === Konventiert am: 27-5-25 16:32:23 ===


implementation



end.
