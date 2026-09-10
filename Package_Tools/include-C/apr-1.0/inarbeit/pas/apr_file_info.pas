unit apr_file_info;

interface

uses
  fp_apr, apr, apr_user, apr_time, apr_errno, apr_tables;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_filetype_e = ^Tapr_filetype_e;
  Tapr_filetype_e = longint;
const
  APR_NOFILE = 0;
  APR_REG = 1;
  APR_DIR = 2;
  APR_CHR = 3;
  APR_BLK = 4;
  APR_PIPE = 5;
  APR_LNK = 6;
  APR_SOCK = 7;
  APR_UNKFILE = 127;

  APR_FPROT_USETID = $8000;
  APR_FPROT_UREAD = $0400;
  APR_FPROT_UWRITE = $0200;
  APR_FPROT_UEXECUTE = $0100;
  APR_FPROT_GSETID = $4000;
  APR_FPROT_GREAD = $0040;
  APR_FPROT_GWRITE = $0020;
  APR_FPROT_GEXECUTE = $0010;
  APR_FPROT_WSTICKY = $2000;
  APR_FPROT_WREAD = $0004;
  APR_FPROT_WWRITE = $0002;
  APR_FPROT_WEXECUTE = $0001;
  APR_FPROT_OS_DEFAULT = $0FFF;
  APR_FPROT_FILE_SOURCE_PERMS = $1000;
  APR_USETID = APR_FPROT_USETID;
  APR_UREAD = APR_FPROT_UREAD;
  APR_UWRITE = APR_FPROT_UWRITE;
  APR_UEXECUTE = APR_FPROT_UEXECUTE;
  APR_GSETID = APR_FPROT_GSETID;
  APR_GREAD = APR_FPROT_GREAD;
  APR_GWRITE = APR_FPROT_GWRITE;
  APR_GEXECUTE = APR_FPROT_GEXECUTE;
  APR_WSTICKY = APR_FPROT_WSTICKY;
  APR_WREAD = APR_FPROT_WREAD;
  APR_WWRITE = APR_FPROT_WWRITE;
  APR_WEXECUTE = APR_FPROT_WEXECUTE;
  APR_OS_DEFAULT = APR_FPROT_OS_DEFAULT;
  APR_FILE_SOURCE_PERMS = APR_FPROT_FILE_SOURCE_PERMS;

type
  Papr_dir_t = type Pointer;
  PPapr_dir_t = ^Papr_dir_t;

  Papr_fileperms_t = ^Tapr_fileperms_t;
  Tapr_fileperms_t = Tapr_int32_t;

type
  Papr_dev_t = ^Tapr_dev_t;
  Tapr_dev_t = Tapr_uint32_t;
const
  APR_FINFO_LINK = $00000001;
  APR_FINFO_MTIME = $00000010;
  APR_FINFO_CTIME = $00000020;
  APR_FINFO_ATIME = $00000040;
  APR_FINFO_SIZE = $00000100;
  APR_FINFO_CSIZE = $00000200;
  APR_FINFO_DEV = $00001000;
  APR_FINFO_INODE = $00002000;
  APR_FINFO_NLINK = $00004000;
  APR_FINFO_TYPE = $00008000;
  APR_FINFO_USER = $00010000;
  APR_FINFO_GROUP = $00020000;
  APR_FINFO_UPROT = $00100000;
  APR_FINFO_GPROT = $00200000;
  APR_FINFO_WPROT = $00400000;
  APR_FINFO_ICASE = $01000000;
  APR_FINFO_NAME = $02000000;
  APR_FINFO_MIN = $00008170;
  APR_FINFO_IDENT = $00003000;
  APR_FINFO_OWNER = $00030000;
  APR_FINFO_PROT = $00700000;
  APR_FINFO_NORM = $0073b170;
  APR_FINFO_DIRENT = $02000000;

type
  Papr_finfo_t = ^Tapr_finfo_t;
  Tapr_finfo_t = record
    pool: Papr_pool_t;
    valid: Tapr_int32_t;
    protection: Tapr_fileperms_t;
    filetype: Tapr_filetype_e;
    user: Tapr_uid_t;
    group: Tapr_gid_t;
    inode: Tapr_ino_t;
    device: Tapr_dev_t;
    nlink: Tapr_int32_t;
    size: Tapr_off_t;
    csize: Tapr_off_t;
    atime: Tapr_time_t;
    mtime: Tapr_time_t;
    ctime: Tapr_time_t;
    fname: pchar;
    name: pchar;
    filehand: Papr_file_t;
  end;

function apr_stat(finfo: Papr_finfo_t; fname: pchar; wanted: Tapr_int32_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_open(new_dir: PPapr_dir_t; dirname: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_close(thedir: Papr_dir_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_read(finfo: Papr_finfo_t; wanted: Tapr_int32_t; thedir: Papr_dir_t): Tapr_status_t; cdecl; external libapr;
function apr_dir_rewind(thedir: Papr_dir_t): Tapr_status_t; cdecl; external libapr;

const
  APR_FILEPATH_NOTABOVEROOT = $01;
  APR_FILEPATH_SECUREROOTTEST = $02;
  APR_FILEPATH_SECUREROOT = $03;
  APR_FILEPATH_NOTRELATIVE = $04;
  APR_FILEPATH_NOTABSOLUTE = $08;
  APR_FILEPATH_NATIVE = $10;
  APR_FILEPATH_TRUENAME = $20;

function apr_filepath_root(rootpath: PPchar; filepath: PPchar; flags: Tapr_int32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_filepath_merge(newpath: PPchar; rootpath: pchar; addpath: pchar; flags: Tapr_int32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_filepath_list_split(pathelts: PPapr_array_header_t; liststr: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_filepath_list_merge(liststr: PPchar; pathelts: Papr_array_header_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_filepath_get(path: PPchar; flags: Tapr_int32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_filepath_set(path: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

const
  APR_FILEPATH_ENCODING_UNKNOWN = 0;
  APR_FILEPATH_ENCODING_LOCALE = 1;
  APR_FILEPATH_ENCODING_UTF8 = 2;

function apr_filepath_encoding(style: Plongint; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:31 ===


implementation



end.
