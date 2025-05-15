unit eina_file;

interface

uses
  ctypes, efl, eina_types, eina_array, eina_tmpstr, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_File_Dir_List_Cb = procedure(name: pchar; path: pchar; data: pointer); cdecl;

  PEina_File_Type = ^TEina_File_Type;
  TEina_File_Type = longint;

const
  EINA_FILE_UNKNOWN = 0;
  EINA_FILE_FIFO = 1;
  EINA_FILE_CHR = 2;
  EINA_FILE_DIR = 3;
  EINA_FILE_BLK = 4;
  EINA_FILE_REG = 5;
  EINA_FILE_LNK = 6;
  EINA_FILE_SOCK = 7;
  EINA_FILE_WHT = 8;

type
  PEina_File_Populate = ^TEina_File_Populate;
  TEina_File_Populate = longint;

const
  EINA_FILE_RANDOM = 0;
  EINA_FILE_SEQUENTIAL = 1;
  EINA_FILE_WILLNEED = 2;
  EINA_FILE_POPULATE = 3;
  EINA_FILE_DONTNEED = 4;
  EINA_FILE_REMOVE = 5;

const
  EINA_PATH_MAX = 8192;
  {$ifdef mswindows}
  EINA_PATH_SEP_C = '\\';
  EINA_PATH_SEP_S = '\\';
  {$else}
  EINA_PATH_SEP_C = '/';
  EINA_PATH_SEP_S = '/';
  {$endif}
type
  TEina_File_Direct_Info = record
    path_length: Tsize_t;
    name_length: Tsize_t;
    name_start: Tsize_t;
    _type: TEina_File_Type;
    path: array[0..(EINA_PATH_MAX) - 1] of char;
  end;
  PEina_File_Direct_Info = ^TEina_File_Direct_Info;

  TEina_Stat = record
    dev: QWord;
    ino: QWord;
    mode: longword;
    nlink: longword;
    uid: longword;
    gid: longword;
    rdev: QWord;
    size: QWord;
    blksize: QWord;
    blocks: QWord;
    atime: QWord;
    atimensec: QWord;
    mtime: QWord;
    mtimensec: QWord;
    ctime: QWord;
    ctimensec: QWord;
  end;
  PEina_Stat = ^TEina_Stat;

  TEina_File_Line = record
    start: pchar;
    end_: pchar;
    index: dword;
    length: qword;
  end;
  PEina_File_Line = ^TEina_File_Line;

function EINA_FILE_DIR_LIST_CB(_function: Pointer): TEina_File_Dir_List_Cb;

function eina_file_path_relative(path: pchar): TEina_Bool; cdecl; external libeina;
function eina_file_dir_list(dir: pchar; recursive: TEina_Bool; cb: TEina_File_Dir_List_Cb; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_file_split(path: pchar): PEina_Array; cdecl; external libeina;
function eina_file_ls(dir: pchar): PEina_Iterator; cdecl; external libeina;
function eina_file_stat_ls(dir: pchar): PEina_Iterator; cdecl; external libeina;
function eina_file_statat(container: pointer; info: PEina_File_Direct_Info; buf: PEina_Stat): longint; cdecl; external libeina;
procedure eina_file_close_from(fd: longint; except_fd: Plongint); cdecl; external libeina;
function eina_file_mkstemp(templatename: pchar; path: PPEina_Tmpstr): longint; cdecl; external libeina;
function eina_file_mkdtemp(templatename: pchar; path: PPEina_Tmpstr): TEina_Bool; cdecl; external libeina;
function eina_file_direct_ls(dir: pchar): PEina_Iterator; cdecl; external libeina;
function eina_file_path_sanitize(path: pchar): pchar; cdecl; external libeina;

type
  TEina_File_Copy_Progress = function(data: pointer; done: qword; total: qword): TEina_Bool; cdecl;

  PEina_File_Copy_Flags = ^TEina_File_Copy_Flags;
  TEina_File_Copy_Flags = longint;

const
  EINA_FILE_COPY_DATA = 0;
  EINA_FILE_COPY_PERMISSION = 1 shl 0;
  EINA_FILE_COPY_XATTR = 1 shl 1;

function eina_file_copy(src: pchar; dst: pchar; flags: TEina_File_Copy_Flags; cb: TEina_File_Copy_Progress; cb_data: pointer): TEina_Bool; cdecl; external libeina;
function eina_file_open(name: pchar; shared: TEina_Bool): PEina_File; cdecl; external libeina;
function eina_file_virtualize(virtual_name: pchar; data: pointer; length: qword; copy: TEina_Bool): PEina_File; cdecl; external libeina;
function eina_file_virtual(file_: PEina_File): TEina_Bool; cdecl; external libeina;
function eina_file_refresh(file_: PEina_File): TEina_Bool; cdecl; external libeina;
function eina_file_dup(file_: PEina_File): PEina_File; cdecl; external libeina;
procedure eina_file_close(file_: PEina_File); cdecl; external libeina;
function eina_file_size_get(file_: PEina_File): Tsize_t; cdecl; external libeina;
function eina_file_mtime_get(file_: PEina_File): Ttime_t; cdecl; external libeina;
function eina_file_filename_get(file_: PEina_File): pchar; cdecl; external libeina;
function eina_file_xattr_get(file_: PEina_File): PEina_Iterator; cdecl; external libeina;
function eina_file_xattr_value_get(file_: PEina_File): PEina_Iterator; cdecl; external libeina;
function eina_file_map_all(file_: PEina_File; rule: TEina_File_Populate): pointer; cdecl; external libeina;
function eina_file_map_new(file_: PEina_File; rule: TEina_File_Populate; offset: dword; length: dword): pointer; cdecl; external libeina;
procedure eina_file_map_free(file_: PEina_File; map: pointer); cdecl; external libeina;
procedure eina_file_map_populate(file_: PEina_File; rule: TEina_File_Populate; map: pointer; offset: dword; length: dword); cdecl; external libeina;
function eina_file_map_lines(file_: PEina_File): PEina_Iterator; cdecl; external libeina;
function eina_file_map_faulted(file_: PEina_File; map: pointer): TEina_Bool; cdecl; external libeina;
function eina_file_unlink(pathname: pchar): TEina_Bool; cdecl; external libeina;
function eina_file_close_on_exec(fd: longint; on: TEina_Bool): TEina_Bool; cdecl; external libeina;

type
  PEina_Statgen = ^TEina_Statgen;
  TEina_Statgen = dword;

procedure eina_file_statgen_next; cdecl; external libeina;
function eina_file_statgen_get: TEina_Statgen; cdecl; external libeina;
procedure eina_file_statgen_enable; cdecl; external libeina;
procedure eina_file_statgen_disable; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:45 ===


implementation


function EINA_FILE_DIR_LIST_CB(_function: Pointer): TEina_File_Dir_List_Cb;
begin
  EINA_FILE_DIR_LIST_CB := TEina_File_Dir_List_Cb(_function);
end;


end.
