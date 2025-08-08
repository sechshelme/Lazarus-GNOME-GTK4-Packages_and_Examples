unit fp_threads;

interface

uses
  clib, pthreadtypes_arch;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  // /usr/include/threads.h

const
  TSS_DTOR_ITERATIONS = 4;

type
  Ptss_t = ^Ttss_t;
  Ttss_t = int32;

  Ttss_dtor_t = procedure(para1: pointer); cdecl;

  Pthrd_t = ^Tthrd_t;
  Tthrd_t = longint;

  Tthrd_start_t = function(para1: pointer): longint; cdecl;

const
  thrd_success = 0;
  thrd_busy = 1;
  thrd_error = 2;
  thrd_nomem = 3;
  thrd_timedout = 4;

const
  mtx_plain = 0;
  mtx_recursive = 1;
  mtx_timed = 2;

type
  Ponce_flag = type Pointer; // ????

const
  ONCE_FLAG_INIT = 0; // ????

type
  Tmtx_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_MUTEX_T) - 1] of char);
      1: (__align: longint);
  end;
  Pmtx_t = ^Tmtx_t;

  Tcnd_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_COND_T) - 1] of char);
      1: (__align: int64);
  end;
  Pcnd_t = ^Tcnd_t;

function thrd_create(__thr: Pthrd_t; __func: Tthrd_start_t; __arg: pointer): longint; cdecl; external libc;
function thrd_equal(__lhs: Tthrd_t; __rhs: Tthrd_t): longint; cdecl; external libc;
function thrd_current: Tthrd_t; cdecl; external libc;
function thrd_sleep(__time_point: Ptimespec; __remaining: Ptimespec): longint; cdecl; external libc;
procedure thrd_exit(__res: longint); cdecl; external libc;
function thrd_detach(__thr: Tthrd_t): longint; cdecl; external libc;
function thrd_join(__thr: Tthrd_t; __res: Plongint): longint; cdecl; external libc;
procedure thrd_yield; cdecl; external libc;

function mtx_init(__mutex: Pmtx_t; __type: longint): longint; cdecl; external libc;
function mtx_lock(__mutex: Pmtx_t): longint; cdecl; external libc;
function mtx_timedlock(__mutex: Pmtx_t; __time_point: Ptimespec): longint; cdecl; external libc;
function mtx_trylock(__mutex: Pmtx_t): longint; cdecl; external libc;
function mtx_unlock(__mutex: Pmtx_t): longint; cdecl; external libc;
procedure mtx_destroy(__mutex: Pmtx_t); cdecl; external libc;

type
  Tonce_func = procedure;

procedure call_once(__flag: Ponce_flag; __func: Tonce_func); cdecl; external libc;
function cnd_init(__cond: Pcnd_t): longint; cdecl; external libc;
function cnd_signal(__cond: Pcnd_t): longint; cdecl; external libc;
function cnd_broadcast(__cond: Pcnd_t): longint; cdecl; external libc;
function cnd_wait(__cond: Pcnd_t; __mutex: Pmtx_t): longint; cdecl; external libc;

function cnd_timedwait(__cond: Pcnd_t; __mutex: Pmtx_t; __time_point: Ptimespec): longint; cdecl; external libc;
procedure cnd_destroy(__COND: Pcnd_t); cdecl; external libc;
function tss_create(__tss_id: Ptss_t; __destructor: Ttss_dtor_t): longint; cdecl; external libc;
function tss_get(__tss_id: Ttss_t): pointer; cdecl; external libc;
function tss_set(__tss_id: Ttss_t; __val: pointer): longint; cdecl; external libc;
procedure tss_delete(__tss_id: Ttss_t); cdecl; external libc;

// === Konventiert am: 8-8-25 14:52:35 ===


implementation



end.
