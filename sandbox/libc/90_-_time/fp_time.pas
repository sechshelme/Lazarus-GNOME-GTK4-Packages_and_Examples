unit fp_time;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  // /usr/include/time.h

type
  Psigevent = type Pointer;

const
  TIME_UTC = 1;

function clock: Tclock_t; cdecl; external libc;
function time(__timer: Ptime_t): Ttime_t; cdecl; external libc;
function difftime(__time1: Ttime_t; __time0: Ttime_t): double; cdecl; external libc;
function mktime(__tp: Ptm): Ttime_t; cdecl; external libc;
function strftime(__s: pchar; __maxsize: Tsize_t; __format: pchar; __tp: Ptm): Tsize_t; cdecl; external libc;
function strptime(__s: pchar; __fmt: pchar; __tp: Ptm): pchar; cdecl; external libc;
function strftime_l(__s: pchar; __maxsize: Tsize_t; __format: pchar; __tp: Ptm; __loc: Plocale_t): Tsize_t; cdecl; external libc;
function strptime_l(__s: pchar; __fmt: pchar; __tp: Ptm; __loc: Plocale_t): pchar; cdecl; external libc;
function gmtime(__timer: Ptime_t): Ptm; cdecl; external libc;
function localtime(__timer: Ptime_t): Ptm; cdecl; external libc;
function gmtime_r(__timer: Ptime_t; __tp: Ptm): Ptm; cdecl; external libc;
function localtime_r(__timer: Ptime_t; __tp: Ptm): Ptm; cdecl; external libc;
function asctime(__tp: Ptm): pchar; cdecl; external libc;
function ctime(__timer: Ptime_t): pchar; cdecl; external libc;
function asctime_r(__tp: Ptm; __buf: pchar): pchar; cdecl; external libc;

var
  tzname: array[0..1] of pchar; cvar;external libc;

procedure tzset; cdecl; external libc;

var
  daylight: longint; cvar;external libc;
  timezone: longint; cvar;external libc;

function timegm(__tp: Ptm): Ttime_t; cdecl; external libc;
function timelocal(__tp: Ptm): Ttime_t; cdecl; external libc;
function dysize(__year: longint): longint; cdecl; external libc;
function nanosleep(__requested_time: Ptimespec; __remaining: Ptimespec): longint; cdecl; external libc;
function clock_getres(__clock_id: Tclockid_t; __res: Ptimespec): longint; cdecl; external libc;
function clock_gettime(__clock_id: Tclockid_t; __tp: Ptimespec): longint; cdecl; external libc;
function clock_settime(__clock_id: Tclockid_t; __tp: Ptimespec): longint; cdecl; external libc;
function clock_nanosleep(__clock_id: Tclockid_t; __flags: longint; __req: Ptimespec; __rem: Ptimespec): longint; cdecl; external libc;
function clock_getcpuclockid(__pid: Tpid_t; __clock_id: Pclockid_t): longint; cdecl; external libc;
function timer_create(__clock_id: Tclockid_t; __evp: Psigevent; __timerid: Ptimer_t): longint; cdecl; external libc;
function timer_delete(__timerid: Ttimer_t): longint; cdecl; external libc;
function timer_settime(__timerid: Ttimer_t; __flags: longint; __value: Pitimerspec; __ovalue: Pitimerspec): longint; cdecl; external libc;
function timer_gettime(__timerid: Ttimer_t; __value: Pitimerspec): longint; cdecl; external libc;
function timer_getoverrun(__timerid: Ttimer_t): longint; cdecl; external libc;
function timespec_get(__ts: Ptimespec; __base: longint): longint; cdecl; external libc;
function timespec_getres(__ts: Ptimespec; __base: longint): longint; cdecl; external libc;

var
  getdate_err: longint; cvar;external libc;

function getdate(__string: pchar): Ptm; cdecl; external libc;
function getdate_r(__string: pchar; __resbufp: Ptm): longint; cdecl; external libc;


// /usr/include/x86_64-linux-gnu/bits/time.h

const
  CLOCKS_PER_SEC = Tclock_t(1000000);

function __sysconf(para1: longint): longint; cdecl; external libc;
function CLK_TCK: Tclock_t;

const
  CLOCK_REALTIME = 0;
  CLOCK_MONOTONIC = 1;
  CLOCK_PROCESS_CPUTIME_ID = 2;
  CLOCK_THREAD_CPUTIME_ID = 3;
  CLOCK_MONOTONIC_RAW = 4;
  CLOCK_REALTIME_COARSE = 5;
  CLOCK_MONOTONIC_COARSE = 6;
  CLOCK_BOOTTIME = 7;
  CLOCK_REALTIME_ALARM = 8;
  CLOCK_BOOTTIME_ALARM = 9;
  CLOCK_TAI = 11;
  TIMER_ABSTIME = 1;

function clock_adjtime(__clock_id: Tclockid_t; __utx: Ptimex): longint; cdecl; external libc;

// === Konventiert am: 4-8-25 19:07:25 ===


implementation

function CLK_TCK: Tclock_t;
begin
  CLK_TCK := Tclock_t(__sysconf(2));
end;


end.
