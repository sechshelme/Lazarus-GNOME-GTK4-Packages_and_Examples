unit fp_pwd;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tpasswd = record
    pw_name: pchar;
    pw_passwd: pchar;
    pw_uid: Tuid_t;
    pw_gid: Tgid_t;
    pw_gecos: pchar;
    pw_dir: pchar;
    pw_shell: pchar;
  end;
  Ppasswd = ^Tpasswd;
  PPpasswd = ^Ppasswd;

procedure setpwent; cdecl; external libc;
procedure endpwent; cdecl; external libc;
function getpwent: Ppasswd; cdecl; external libc;
function fgetpwent(__stream: PFILE): Ppasswd; cdecl; external libc;
function putpwent(__p: Ppasswd; __f: PFILE): longint; cdecl; external libc;
function getpwuid(__uid: Tuid_t): Ppasswd; cdecl; external libc;
function getpwnam(__name: pchar): Ppasswd; cdecl; external libc;

const
  NSS_BUFLEN_PASSWD = 1024;

function getpwent_r(__resultbuf: Ppasswd; __buffer: pchar; __buflen: Tsize_t; __result: PPpasswd): longint; cdecl; external libc;
function getpwuid_r(__uid: Tuid_t; __resultbuf: Ppasswd; __buffer: pchar; __buflen: Tsize_t; __result: PPpasswd): longint; cdecl; external libc;
function getpwnam_r(__name: pchar; __resultbuf: Ppasswd; __buffer: pchar; __buflen: Tsize_t; __result: PPpasswd): longint; cdecl; external libc;
function fgetpwent_r(__stream: PFILE; __resultbuf: Ppasswd; __buffer: pchar; __buflen: Tsize_t; __result: PPpasswd): longint; cdecl; external libc;
function getpw(__uid: Tuid_t; __buffer: pchar): longint; cdecl; external libc;

// === Konventiert am: 14-7-25 19:34:58 ===


implementation



end.
