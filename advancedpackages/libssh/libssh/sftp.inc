{$IFDEF read_interface}


type
  Puid_t = ^Tuid_t;
  Tuid_t = uint32;

type
  Pgid_t = ^Tgid_t;
  Tgid_t = uint32;

const
  LIBSFTP_VERSION = 3;

type
  Psftp_attributes = ^Tsftp_attributes;
  Psftp_client_message = Pointer; //   ^Tftp_client_message_struct;
  Psftp_dir = Pointer; //  ^Tftp_dir_struct;
  Psftp_ext = Pointer; //   ^Tsftp_ext_struct;
  Psftp_file = ^Tsftp_file;
  Psftp_message = ^Tsftp_message;
  Psftp_packet = ^Tsftp_packet;
  Psftp_request_queue = ^Tsftp_request_queue;
  Psftp_session = ^Tsftp_session;
  Psftp_status_message = ^Tsftp_status_message;
  PTsftp_statvfs_t = ^Tsftp_statvfs;

  Tsftp_session = record
    session: Tssh_session;
    channel: Tssh_channel;
    server_version: longint;
    client_version: longint;
    version: longint;
    queue: Psftp_request_queue;
    id_counter: Tuint32_t;
    errnum: longint;
    handles: ^pointer;
    ext: Psftp_ext;
    read_packet: Psftp_packet;
  end;

  Tsftp_packet = record
    sftp: Psftp_session;
    _type: Tuint8_t;
    payload: Tssh_buffer;
  end;

  Tsftp_file = record
    sftp: Psftp_session;
    name: pchar;
    offset: Tuint64_t;
    handle: Tssh_string;
    eof: longint;
    nonblocking: longint;
  end;

  Tsftp_dir_struct = record
    sftp: Psftp_session;
    name: pchar;
    handle: Tssh_string;
    buffer: Tssh_buffer;
    count: Tuint32_t;
    eof: longint;
  end;

  Tsftp_message = record
    sftp: Psftp_session;
    packet_type: Tuint8_t;
    payload: Tssh_buffer;
    id: Tuint32_t;
  end;

  Tsftp_client_message = record
    sftp: Psftp_session;
    _type: Tuint8_t;
    id: Tuint32_t;
    filename: pchar;
    flags: Tuint32_t;
    attr: Psftp_attributes;
    handle: Tssh_string;
    offset: Tuint64_t;
    len: Tuint32_t;
    attr_num: longint;
    attrbuf: Tssh_buffer;
    data: Tssh_string;
    complete_message: Tssh_buffer;
    str_data: pchar;
    submessage: pchar;
  end;

  Tsftp_request_queue = record
    next: Psftp_request_queue;
    message: Psftp_message;
  end;

  Tsftp_status_message = record
    id: Tuint32_t;
    status: Tuint32_t;
    error_unused: Tssh_string;
    lang_unused: Tssh_string;
    errormsg: pchar;
    langmsg: pchar;
  end;

  Tsftp_attributes = record
    name: pchar;
    longname: pchar;
    flags: Tuint32_t;
    _type: Tuint8_t;
    size: Tuint64_t;
    uid: Tuint32_t;
    gid: Tuint32_t;
    owner: pchar;
    group: pchar;
    permissions: Tuint32_t;
    atime64: Tuint64_t;
    atime: Tuint32_t;
    atime_nseconds: Tuint32_t;
    createtime: Tuint64_t;
    createtime_nseconds: Tuint32_t;
    mtime64: Tuint64_t;
    mtime: Tuint32_t;
    mtime_nseconds: Tuint32_t;
    acl: Tssh_string;
    extended_count: Tuint32_t;
    extended_type: Tssh_string;
    extended_data: Tssh_string;
  end;

  Tsftp_statvfs = record
    f_bsize: Tuint64_t;
    f_frsize: Tuint64_t;
    f_blocks: Tuint64_t;
    f_bfree: Tuint64_t;
    f_bavail: Tuint64_t;
    f_files: Tuint64_t;
    f_ffree: Tuint64_t;
    f_favail: Tuint64_t;
    f_fsid: Tuint64_t;
    f_flag: Tuint64_t;
    f_namemax: Tuint64_t;
  end;

function sftp_new(session: Tssh_session): Psftp_session; cdecl; external libssh;
function sftp_new_channel(session: Tssh_session; channel: Tssh_channel): Psftp_session; cdecl; external libssh;
procedure sftp_free(sftp: Psftp_session); cdecl; external libssh;
function sftp_init(sftp: Psftp_session): longint; cdecl; external libssh;
function sftp_get_error(sftp: Psftp_session): longint; cdecl; external libssh;
function sftp_extensions_get_count(sftp: Psftp_session): dword; cdecl; external libssh;
function sftp_extensions_get_name(sftp: Psftp_session; indexn: dword): pchar; cdecl; external libssh;
function sftp_extensions_get_data(sftp: Psftp_session; indexn: dword): pchar; cdecl; external libssh;
function sftp_extension_supported(sftp: Psftp_session; name: pchar; data: pchar): longint; cdecl; external libssh;
function sftp_opendir(session: Psftp_session; path: pchar): Psftp_dir; cdecl; external libssh;
function sftp_readdir(session: Psftp_session; dir: Psftp_dir): Psftp_attributes; cdecl; external libssh;
function sftp_dir_eof(dir: Psftp_dir): longint; cdecl; external libssh;
function sftp_stat(session: Psftp_session; path: pchar): Psftp_attributes; cdecl; external libssh;
function sftp_lstat(session: Psftp_session; path: pchar): Psftp_attributes; cdecl; external libssh;
function sftp_fstat(file_: Psftp_file): Psftp_attributes; cdecl; external libssh;
procedure sftp_attributes_free(file_: Psftp_attributes); cdecl; external libssh;
function sftp_closedir(dir: Psftp_dir): longint; cdecl; external libssh;
function sftp_close(file_: Psftp_file): longint; cdecl; external libssh;
function sftp_open(session: Psftp_session; file_: pchar; accesstype: longint; mode: Tmode_t): Psftp_file; cdecl; external libssh;
procedure sftp_file_set_nonblocking(handle: Psftp_file); cdecl; external libssh;
procedure sftp_file_set_blocking(handle: Psftp_file); cdecl; external libssh;
function sftp_read(file_: Psftp_file; buf: pointer; count: Tsize_t): Tssize_t; cdecl; external libssh;
function sftp_async_read_begin(file_: Psftp_file; len: Tuint32_t): longint; cdecl; external libssh;
function sftp_async_read(file_: Psftp_file; data: pointer; len: Tuint32_t; id: Tuint32_t): longint; cdecl; external libssh;
function sftp_write(file_: Psftp_file; buf: pointer; count: Tsize_t): Tssize_t; cdecl; external libssh;
function sftp_seek(file_: Psftp_file; new_offset: Tuint32_t): longint; cdecl; external libssh;
function sftp_seek64(file_: Psftp_file; new_offset: Tuint64_t): longint; cdecl; external libssh;
function sftp_tell(file_: Psftp_file): dword; cdecl; external libssh;
function sftp_tell64(file_: Psftp_file): Tuint64_t; cdecl; external libssh;
procedure sftp_rewind(file_: Psftp_file); cdecl; external libssh;
function sftp_unlink(sftp: Psftp_session; file_: pchar): longint; cdecl; external libssh;
function sftp_rmdir(sftp: Psftp_session; directory: pchar): longint; cdecl; external libssh;
function sftp_mkdir(sftp: Psftp_session; directory: pchar; mode: Tmode_t): longint; cdecl; external libssh;
function sftp_rename(sftp: Psftp_session; original: pchar; newname: pchar): longint; cdecl; external libssh;
function sftp_setstat(sftp: Psftp_session; file_: pchar; attr: Psftp_attributes): longint; cdecl; external libssh;
function sftp_chown(sftp: Psftp_session; file_: pchar; owner: Tuid_t; group: Tgid_t): longint; cdecl; external libssh;
function sftp_chmod(sftp: Psftp_session; file_: pchar; mode: Tmode_t): longint; cdecl; external libssh;
function sftp_utimes(sftp: Psftp_session; file_: pchar; times: Ptimeval): longint; cdecl; external libssh;
function sftp_symlink(sftp: Psftp_session; target: pchar; dest: pchar): longint; cdecl; external libssh;
function sftp_readlink(sftp: Psftp_session; path: pchar): pchar; cdecl; external libssh;
function sftp_statvfs(sftp: Psftp_session; path: pchar): PTsftp_statvfs_t; cdecl; external libssh;
function sftp_fstatvfs(file_: Psftp_file): PTsftp_statvfs_t; cdecl; external libssh;
procedure sftp_statvfs_free(statvfs_o: PTsftp_statvfs_t); cdecl; external libssh;
function sftp_fsync(file_: Psftp_file): longint; cdecl; external libssh;
function sftp_canonicalize_path(sftp: Psftp_session; path: pchar): pchar; cdecl; external libssh;
function sftp_server_version(sftp: Psftp_session): longint; cdecl; external libssh;

function sftp_server_new(session: Tssh_session; chan: Tssh_channel): Psftp_session; cdecl; external libssh;
function sftp_server_init(sftp: Psftp_session): longint; cdecl; external libssh;
procedure sftp_server_free(sftp: Psftp_session); cdecl; external libssh;

function sftp_get_client_message(sftp: Psftp_session): Psftp_client_message; cdecl; external libssh;
procedure sftp_client_message_free(msg: Psftp_client_message); cdecl; external libssh;
function sftp_client_message_get_type(msg: Psftp_client_message): Tuint8_t; cdecl; external libssh;
function sftp_client_message_get_filename(msg: Psftp_client_message): pchar; cdecl; external libssh;
procedure sftp_client_message_set_filename(msg: Psftp_client_message; newname: pchar); cdecl; external libssh;
function sftp_client_message_get_data(msg: Psftp_client_message): pchar; cdecl; external libssh;
function sftp_client_message_get_flags(msg: Psftp_client_message): Tuint32_t; cdecl; external libssh;
function sftp_client_message_get_submessage(msg: Psftp_client_message): pchar; cdecl; external libssh;
function sftp_send_client_message(sftp: Psftp_session; msg: Psftp_client_message): longint; cdecl; external libssh;
function sftp_reply_name(msg: Psftp_client_message; name: pchar; attr: Psftp_attributes): longint; cdecl; external libssh;
function sftp_reply_handle(msg: Psftp_client_message; handle: Tssh_string): longint; cdecl; external libssh;
function sftp_handle_alloc(sftp: Psftp_session; info: pointer): Tssh_string; cdecl; external libssh;
function sftp_reply_attr(msg: Psftp_client_message; attr: Psftp_attributes): longint; cdecl; external libssh;
function sftp_handle(sftp: Psftp_session; handle: Tssh_string): pointer; cdecl; external libssh;
function sftp_reply_status(msg: Psftp_client_message; status: Tuint32_t; message: pchar): longint; cdecl; external libssh;
function sftp_reply_names_add(msg: Psftp_client_message; file_: pchar; longname: pchar; attr: Psftp_attributes): longint; cdecl; external libssh;
function sftp_reply_names(msg: Psftp_client_message): longint; cdecl; external libssh;
function sftp_reply_data(msg: Psftp_client_message; data: pointer; len: longint): longint; cdecl; external libssh;
procedure sftp_handle_remove(sftp: Psftp_session; handle: pointer); cdecl; external libssh;

const
  SSH_FXP_INIT = 1;
  SSH_FXP_VERSION = 2;
  SSH_FXP_OPEN = 3;
  SSH_FXP_CLOSE = 4;
  SSH_FXP_READ = 5;
  SSH_FXP_WRITE = 6;
  SSH_FXP_LSTAT = 7;
  SSH_FXP_FSTAT = 8;
  SSH_FXP_SETSTAT = 9;
  SSH_FXP_FSETSTAT = 10;
  SSH_FXP_OPENDIR = 11;
  SSH_FXP_READDIR = 12;
  SSH_FXP_REMOVE = 13;
  SSH_FXP_MKDIR = 14;
  SSH_FXP_RMDIR = 15;
  SSH_FXP_REALPATH = 16;
  SSH_FXP_STAT = 17;
  SSH_FXP_RENAME = 18;
  SSH_FXP_READLINK = 19;
  SSH_FXP_SYMLINK = 20;
  SSH_FXP_STATUS = 101;
  SSH_FXP_HANDLE = 102;
  SSH_FXP_DATA = 103;
  SSH_FXP_NAME = 104;
  SSH_FXP_ATTRS = 105;
  SSH_FXP_EXTENDED = 200;
  SSH_FXP_EXTENDED_REPLY = 201;

  SSH_FILEXFER_ATTR_SIZE = $00000001;
  SSH_FILEXFER_ATTR_PERMISSIONS = $00000004;
  SSH_FILEXFER_ATTR_ACCESSTIME = $00000008;
  SSH_FILEXFER_ATTR_ACMODTIME = $00000008;
  SSH_FILEXFER_ATTR_CREATETIME = $00000010;
  SSH_FILEXFER_ATTR_MODIFYTIME = $00000020;
  SSH_FILEXFER_ATTR_ACL = $00000040;
  SSH_FILEXFER_ATTR_OWNERGROUP = $00000080;
  SSH_FILEXFER_ATTR_SUBSECOND_TIMES = $00000100;
  SSH_FILEXFER_ATTR_EXTENDED = $80000000;
  SSH_FILEXFER_ATTR_UIDGID = $00000002;

  SSH_FILEXFER_TYPE_REGULAR = 1;
  SSH_FILEXFER_TYPE_DIRECTORY = 2;
  SSH_FILEXFER_TYPE_SYMLINK = 3;
  SSH_FILEXFER_TYPE_SPECIAL = 4;
  SSH_FILEXFER_TYPE_UNKNOWN = 5;

  SSH_FX_OK = 0;
  SSH_FX_EOF = 1;
  SSH_FX_NO_SUCH_FILE = 2;
  SSH_FX_PERMISSION_DENIED = 3;
  SSH_FX_FAILURE = 4;
  SSH_FX_BAD_MESSAGE = 5;
  SSH_FX_NO_CONNECTION = 6;
  SSH_FX_CONNECTION_LOST = 7;
  SSH_FX_OP_UNSUPPORTED = 8;
  SSH_FX_INVALID_HANDLE = 9;
  SSH_FX_NO_SUCH_PATH = 10;
  SSH_FX_FILE_ALREADY_EXISTS = 11;
  SSH_FX_WRITE_PROTECT = 12;
  SSH_FX_NO_MEDIA = 13;

  SSH_FXF_READ = $01;
  SSH_FXF_WRITE = $02;
  SSH_FXF_APPEND = $04;
  SSH_FXF_CREAT = $08;
  SSH_FXF_TRUNC = $10;
  SSH_FXF_EXCL = $20;
  SSH_FXF_TEXT = $40;

  SSH_S_IFMT = 00170000;
  SSH_S_IFSOCK = 0140000;
  SSH_S_IFLNK = 0120000;
  SSH_S_IFREG = 0100000;
  SSH_S_IFBLK = 0060000;
  SSH_S_IFDIR = 0040000;
  SSH_S_IFCHR = 0020000;
  SSH_S_IFIFO = 0010000;

  SSH_FXF_RENAME_OVERWRITE = $00000001;
  SSH_FXF_RENAME_ATOMIC = $00000002;
  SSH_FXF_RENAME_NATIVE = $00000004;
  SFTP_OPEN_ = SSH_FXP_OPEN;
  SFTP_CLOSE_ = SSH_FXP_CLOSE;
  SFTP_READ_ = SSH_FXP_READ;
  SFTP_WRITE_ = SSH_FXP_WRITE;
  SFTP_LSTAT_ = SSH_FXP_LSTAT;
  SFTP_FSTAT_ = SSH_FXP_FSTAT;
  SFTP_SETSTAT_ = SSH_FXP_SETSTAT;
  SFTP_FSETSTAT = SSH_FXP_FSETSTAT;
  SFTP_OPENDIR_ = SSH_FXP_OPENDIR;
  SFTP_READDIR_ = SSH_FXP_READDIR;
  SFTP_REMOVE = SSH_FXP_REMOVE;
  SFTP_MKDIR_ = SSH_FXP_MKDIR;
  SFTP_RMDIR_ = SSH_FXP_RMDIR;
  SFTP_REALPATH = SSH_FXP_REALPATH;
  SFTP_STAT_ = SSH_FXP_STAT;
  SFTP_RENAME_ = SSH_FXP_RENAME;
  SFTP_READLINK_ = SSH_FXP_READLINK;
  SFTP_SYMLINK_ = SSH_FXP_SYMLINK;
  SFTP_EXTENDED = SSH_FXP_EXTENDED;

  SSH_FXE_STATVFS_ST_RDONLY = $1;
  SSH_FXE_STATVFS_ST_NOSUID = $2;

  // === Konventiert am: 2-7-25 17:32:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
