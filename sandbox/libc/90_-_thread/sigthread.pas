unit sigthread;

interface

uses
 clib, pthreadtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/sigthread.h

function pthread_sigmask(__how: longint; __newmask: Psigset_t; __oldmask: Psigset_t): longint; cdecl; external libc;
function pthread_kill(__threadid: Tpthread_t; __signo: longint): longint; cdecl; external libc;
function pthread_sigqueue(__threadid: Tpthread_t; __signo: longint; __value: Tsigval): longint; cdecl; external libc;

// === Konventiert am: 8-8-25 14:52:51 ===


implementation



end.
