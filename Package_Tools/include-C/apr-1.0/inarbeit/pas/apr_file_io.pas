unit apr_file_io;

interface

uses
  fp_apr, apr, apr_errno, apr_time, apr_file_info, apr_want;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APR_FOPEN_READ = $00001;
  APR_FOPEN_WRITE = $00002;
  APR_FOPEN_CREATE = $00004;
  APR_FOPEN_APPEND = $00008;
  APR_FOPEN_TRUNCATE = $00010;
  APR_FOPEN_BINARY = $00020;
  APR_FOPEN_EXCL = $00040;
  APR_FOPEN_BUFFERED = $00080;
  APR_FOPEN_DELONCLOSE = $00100;
  APR_FOPEN_XTHREAD = $00200;
  APR_FOPEN_SHARELOCK = $00400;
  APR_FOPEN_NOCLEANUP = $00800;
  APR_FOPEN_SENDFILE_ENABLED = $01000;
  APR_FOPEN_LARGEFILE = $04000;
  APR_FOPEN_SPARSE = $08000;
  APR_FOPEN_NONBLOCK = $40000;
  APR_READ = APR_FOPEN_READ;

  APR_WRITE = APR_FOPEN_WRITE;
  APR_CREATE = APR_FOPEN_CREATE;
  APR_APPEND = APR_FOPEN_APPEND;
  APR_TRUNCATE = APR_FOPEN_TRUNCATE;
  APR_BINARY = APR_FOPEN_BINARY;
  APR_EXCL = APR_FOPEN_EXCL;
  APR_BUFFERED = APR_FOPEN_BUFFERED;
  APR_DELONCLOSE = APR_FOPEN_DELONCLOSE;
  APR_XTHREAD = APR_FOPEN_XTHREAD;
  APR_SHARELOCK = APR_FOPEN_SHARELOCK;
  APR_FILE_NOCLEANUP = APR_FOPEN_NOCLEANUP;
  APR_SENDFILE_ENABLED = APR_FOPEN_SENDFILE_ENABLED;
  APR_LARGEFILE = APR_FOPEN_LARGEFILE;

  APR_SET = SEEK_SET;
  APR_CUR = SEEK_CUR;
  APR_END = SEEK_END;

  APR_FILE_ATTR_READONLY = $01;
  APR_FILE_ATTR_EXECUTABLE = $02;
  APR_FILE_ATTR_HIDDEN = $04;

  APR_MAX_IOVEC_SIZE = 1024;

type
  Papr_fileattrs_t = ^Tapr_fileattrs_t;
  Tapr_fileattrs_t = Tapr_uint32_t;

  Papr_seek_where_t = ^Tapr_seek_where_t;
  Tapr_seek_where_t = longint;

const
  APR_FLOCK_SHARED = 1;
  APR_FLOCK_EXCLUSIVE = 2;

  APR_FLOCK_TYPEMASK = $000F;
  APR_FLOCK_NONBLOCK = $0010;

function apr_file_open(newf: PPapr_file_t; fname: pchar; flag: Tapr_int32_t; perm: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_close(file_: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_remove(path: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_rename(from_path: pchar; to_path: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_link(from_path: pchar; to_path: pchar): Tapr_status_t; cdecl; external libapr;
function apr_file_copy(from_path: pchar; to_path: pchar; perms: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_append(from_path: pchar; to_path: pchar; perms: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_eof(fptr: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_stderr(thefile: PPapr_file_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_stdout(thefile: PPapr_file_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_stdin(thefile: PPapr_file_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_flags_stderr(thefile: PPapr_file_t; flags: Tapr_int32_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_flags_stdout(thefile: PPapr_file_t; flags: Tapr_int32_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_open_flags_stdin(thefile: PPapr_file_t; flags: Tapr_int32_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_read(thefile: Papr_file_t; buf: pointer; nbytes: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_write(thefile: Papr_file_t; buf: pointer; nbytes: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_writev(thefile: Papr_file_t; vec: Piovec; nvec: Tapr_size_t; nbytes: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_read_full(thefile: Papr_file_t; buf: pointer; nbytes: Tapr_size_t; bytes_read: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_write_full(thefile: Papr_file_t; buf: pointer; nbytes: Tapr_size_t; bytes_written: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_writev_full(thefile: Papr_file_t; vec: Piovec; nvec: Tapr_size_t; nbytes: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_putc(ch: char; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_getc(ch: pchar; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_ungetc(ch: char; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_gets(str: pchar; len: longint; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_puts(str: pchar; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_flush(thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_sync(thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_datasync(thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_dup(new_file: PPapr_file_t; old_file: Papr_file_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_dup2(new_file: Papr_file_t; old_file: Papr_file_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_setaside(new_file: PPapr_file_t; old_file: Papr_file_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_buffer_set(thefile: Papr_file_t; buffer: pchar; bufsize: Tapr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_file_buffer_size_get(thefile: Papr_file_t): Tapr_size_t; cdecl; external libapr;
function apr_file_seek(thefile: Papr_file_t; where: Tapr_seek_where_t; offset: Papr_off_t): Tapr_status_t; cdecl; external libapr;
function apr_file_pipe_create(in_: PPapr_file_t; out_: PPapr_file_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_pipe_create_ex(in_: PPapr_file_t; out_: PPapr_file_t; blocking: Tapr_int32_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_pipe_create_pools(in_: PPapr_file_t; out_: PPapr_file_t; blocking: Tapr_int32_t; pool_in: Papr_pool_t; pool_out: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_namedpipe_create(filename: pchar; perm: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_pipe_timeout_get(thepipe: Papr_file_t; timeout: Papr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_file_pipe_timeout_set(thepipe: Papr_file_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_file_lock(thefile: Papr_file_t; _type: longint): Tapr_status_t; cdecl; external libapr;
function apr_file_unlock(thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_name_get(new_path: PPchar; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_data_get(data: Ppointer; key: pchar; file_: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_data_set(file_: Papr_file_t; data: pointer; key: pchar; cleanup: Pointer): Tapr_status_t; cdecl; external libapr;
function apr_file_printf(fptr: Papr_file_t; format: pchar): longint; cdecl; varargs; external libapr;
function apr_file_perms_set(fname: pchar; perms: Tapr_fileperms_t): Tapr_status_t; cdecl; external libapr;
function apr_file_attrs_set(fname: pchar; attributes: Tapr_fileattrs_t; attr_mask: Tapr_fileattrs_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_mtime_set(fname: pchar; mtime: Tapr_time_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_make(path: pchar; perm: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_make_recursive(path: pchar; perm: Tapr_fileperms_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_remove(path: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_file_info_get(finfo: Papr_finfo_t; wanted: Tapr_int32_t; thefile: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_file_trunc(fp: Papr_file_t; offset: Tapr_off_t): Tapr_status_t; cdecl; external libapr;
function apr_file_flags_get(f: Papr_file_t): Tapr_int32_t; cdecl; external libapr;
function apr_file_mktemp(fp: PPapr_file_t; templ: pchar; flags: Tapr_int32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_temp_dir_get(temp_dir: PPchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:27 ===


implementation



end.
