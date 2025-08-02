unit fp_pidfd;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PIDFD_NONBLOCK = O_NONBLOCK;

function pidfd_open(__pid: Tpid_t; __flags: dword): longint; cdecl; external libc;
function pidfd_getfd(__pidfd: longint; __targetfd: longint; __flags: dword): longint; cdecl; external libc;
function pidfd_send_signal(__pidfd: longint; __sig: longint; __info: Psiginfo_t; __flags: dword): longint; cdecl; external libc;
function pidfd_getpid(__fd: longint): Tpid_t; cdecl; external libc;

// === Konventiert am: 2-8-25 19:43:17 ===


implementation



end.
