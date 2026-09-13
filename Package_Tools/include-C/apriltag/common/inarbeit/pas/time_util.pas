unit time_util;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Ptimeutil_rest_t = type Pointer;

  Psuseconds_t = ^Tsuseconds_t;
  Tsuseconds_t = int64;

function timeutil_rest_create: Ptimeutil_rest_t; cdecl; external libapriltag;
procedure timeutil_rest_destroy(rest: Ptimeutil_rest_t); cdecl; external libapriltag;
function utime_now: Tint64_t; cdecl; external libapriltag;
function utime_get_seconds(v: Tint64_t): Tint64_t; cdecl; external libapriltag;
function utime_get_useconds(v: Tint64_t): Tint64_t; cdecl; external libapriltag;
procedure utime_to_timeval(v: Tint64_t; tv: Ptimeval); cdecl; external libapriltag;
procedure utime_to_timespec(v: Tint64_t; ts: Ptimespec); cdecl; external libapriltag;
function timeutil_usleep(useconds: Tint64_t): Tint32_t; cdecl; external libapriltag;
function timeutil_sleep(seconds: dword): Tuint32_t; cdecl; external libapriltag;
function timeutil_sleep_hz(rest: Ptimeutil_rest_t; hz: Tdouble): Tint32_t; cdecl; external libapriltag;
procedure timeutil_timer_reset(rest: Ptimeutil_rest_t); cdecl; external libapriltag;
procedure timeutil_timer_start(rest: Ptimeutil_rest_t); cdecl; external libapriltag;
procedure timeutil_timer_stop(rest: Ptimeutil_rest_t); cdecl; external libapriltag;
function timeutil_timer_timeout(rest: Ptimeutil_rest_t; timeout_s: Tdouble): Tbool; cdecl; external libapriltag;
function time_util_hhmmss_ss_to_utime(time: Tdouble): Tint64_t; cdecl; external libapriltag;
function timeutil_ms_to_us(ms: Tint32_t): Tint64_t; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:28:39 ===


implementation



end.
