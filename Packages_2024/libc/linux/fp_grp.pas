unit fp_grp;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgroup = record
    gr_name: pchar;
    gr_passwd: pchar;
    gr_gid: Tgid_t;
    gr_mem: ^pchar;
  end;
  Pgroup = ^Tgroup;
  PPgroup = ^Pgroup;

procedure setgrent; cdecl; external libc;
procedure endgrent; cdecl; external libc;
function getgrent: Pgroup; cdecl; external libc;
function fgetgrent(__stream: PFILE): Pgroup; cdecl; external libc;
function putgrent(__p: Pgroup; __f: PFILE): longint; cdecl; external libc;
function getgrgid(__gid: Tgid_t): Pgroup; cdecl; external libc;
function getgrnam(__name: pchar): Pgroup; cdecl; external libc;

const
  NSS_BUFLEN_GROUP = 1024;

function getgrent_r(__resultbuf: Pgroup; __buffer: pchar; __buflen: Tsize_t; __result: PPgroup): longint; cdecl; external libc;
function getgrgid_r(__gid: Tgid_t; __resultbuf: Pgroup; __buffer: pchar; __buflen: Tsize_t; __result: PPgroup): longint; cdecl; external libc;
function getgrnam_r(__name: pchar; __resultbuf: Pgroup; __buffer: pchar; __buflen: Tsize_t; __result: PPgroup): longint; cdecl; external libc;
function fgetgrent_r(__stream: PFILE; __resultbuf: Pgroup; __buffer: pchar; __buflen: Tsize_t; __result: PPgroup): longint; cdecl; external libc;
function setgroups(__n: Tsize_t; __groups: Pgid_t): longint; cdecl; external libc;
function getgrouplist(__user: pchar; __group: Tgid_t; __groups: Pgid_t; __ngroups: Plongint): longint; cdecl; external libc;
function initgroups(__user: pchar; __group: Tgid_t): longint; cdecl; external libc;

// === Konventiert am: 14-7-25 19:56:01 ===


implementation



end.
