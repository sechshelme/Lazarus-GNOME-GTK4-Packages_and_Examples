unit eina_xattr;

interface

uses
  ctypes, efl, eina_types, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Xattr_Flags = ^TEina_Xattr_Flags;
  TEina_Xattr_Flags = longint;

const
  EINA_XATTR_INSERT = 0;
  EINA_XATTR_REPLACE = 1;
  EINA_XATTR_CREATED = 2;
  EINA_XATTR_FLAGS_INSERT = 0;
  EINA_XATTR_FLAGS_REPLACE = 1;
  EINA_XATTR_FLAGS_CREATED = 2;

type
  TEina_Xattr = record
    name: pchar;
    value: pchar;
    length: Tsize_t;
  end;
  PEina_Xattr = ^TEina_Xattr;

function eina_xattr_ls(file_: pchar): PEina_Iterator; cdecl; external libeina;
function eina_xattr_value_ls(file_: pchar): PEina_Iterator; cdecl; external libeina;
function eina_xattr_fd_ls(fd: longint): PEina_Iterator; cdecl; external libeina;
function eina_xattr_value_fd_ls(fd: longint): PEina_Iterator; cdecl; external libeina;
function eina_xattr_copy(src: pchar; dst: pchar): TEina_Bool; cdecl; external libeina;
function eina_xattr_fd_copy(src: longint; dst: longint): TEina_Bool; cdecl; external libeina;
function eina_xattr_get(file_: pchar; attribute: pchar; size: Pssize_t): pointer; cdecl; external libeina;
function eina_xattr_fd_get(fd: longint; attribute: pchar; size: Pssize_t): pointer; cdecl; external libeina;
function eina_xattr_set(file_: pchar; attribute: pchar; data: pointer; length: Tssize_t; flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeina;
function eina_xattr_fd_set(fd: longint; attribute: pchar; data: pointer; length: Tssize_t; flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeina;
function eina_xattr_del(file_: pchar; attribute: pchar): TEina_Bool; cdecl; external libeina;
function eina_xattr_fd_del(fd: longint; attribute: pchar): TEina_Bool; cdecl; external libeina;
function eina_xattr_string_set(file_: pchar; attribute: pchar; data: pchar; flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeina;
function eina_xattr_string_get(file_: pchar; attribute: pchar): pchar; cdecl; external libeina;
function eina_xattr_double_set(file_: pchar; attribute: pchar; value: double; flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeina;
function eina_xattr_double_get(file_: pchar; attribute: pchar; value: Pdouble): TEina_Bool; cdecl; external libeina;
function eina_xattr_int_set(file_: pchar; attribute: pchar; value: longint; flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeina;
function eina_xattr_int_get(file_: pchar; attribute: pchar; value: Plongint): TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 15:25:59 ===


implementation



end.
