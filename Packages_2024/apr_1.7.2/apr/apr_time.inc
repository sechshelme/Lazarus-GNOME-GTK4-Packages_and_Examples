{$IFDEF read_interface}


const
  APR_USEC_PER_SEC = int64(1000000);

const
  APR_RFC822_DATE_LEN = 30;
  APR_CTIME_LEN = 25;

var
  apr_month_snames: array[0..11] of array[0..3] of char; cvar;external libapr;
  apr_day_snames: array[0..6] of array[0..3] of char; cvar;external libapr;

type
  Papr_time_t = ^Tapr_time_t;
  Tapr_time_t = Tapr_int64_t;

  Papr_interval_time_t = ^Tapr_interval_time_t;
  Tapr_interval_time_t = Tapr_int64_t;

  Papr_short_interval_time_t = ^Tapr_short_interval_time_t;
  Tapr_short_interval_time_t = Tapr_int32_t;

type
  Papr_time_exp_t = ^Tapr_time_exp_t;
  Tapr_time_exp_t = record
    tm_usec: Tapr_int32_t;
    tm_sec: Tapr_int32_t;
    tm_min: Tapr_int32_t;
    tm_hour: Tapr_int32_t;
    tm_mday: Tapr_int32_t;
    tm_mon: Tapr_int32_t;
    tm_year: Tapr_int32_t;
    tm_wday: Tapr_int32_t;
    tm_yday: Tapr_int32_t;
    tm_isdst: Tapr_int32_t;
    tm_gmtoff: Tapr_int32_t;
  end;

function apr_time_now: Tapr_time_t; cdecl; external libapr;
function apr_time_ansi_put(result: Papr_time_t; input: Ttime_t): Tapr_status_t; cdecl; external libapr;
function apr_time_exp_tz(result: Papr_time_exp_t; input: Tapr_time_t; offs: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_time_exp_gmt(result: Papr_time_exp_t; input: Tapr_time_t): Tapr_status_t; cdecl; external libapr;
function apr_time_exp_lt(result: Papr_time_exp_t; input: Tapr_time_t): Tapr_status_t; cdecl; external libapr;
function apr_time_exp_get(result: Papr_time_t; input: Papr_time_exp_t): Tapr_status_t; cdecl; external libapr;
function apr_time_exp_gmt_get(result: Papr_time_t; input: Papr_time_exp_t): Tapr_status_t; cdecl; external libapr;
procedure apr_sleep(t: Tapr_interval_time_t); cdecl; external libapr;

function apr_rfc822_date(date_str: pchar; t: Tapr_time_t): Tapr_status_t; cdecl; external libapr;
function apr_ctime(date_str: pchar; t: Tapr_time_t): Tapr_status_t; cdecl; external libapr;
function apr_strftime(s: pchar; retsize: Papr_size_t; max: Tapr_size_t; format: pchar; tm: Papr_time_exp_t): Tapr_status_t; cdecl; external libapr;
procedure apr_time_clock_hires(p: Papr_pool_t); cdecl; external libapr;

function APR_TIME_C(val: int64): Tapr_time_t; inline;
function apr_time_sec(time: Tapr_time_t): int64; inline;
function apr_time_as_msec(time: Tapr_time_t): int64; inline;
function apr_time_from_msec(msec: int64): Tapr_time_t; inline;
function apr_time_from_sec(sec: int64): Tapr_time_t; inline;
function apr_time_make(sec, usec: int64): Tapr_time_t; inline;

// === Konventiert am: 10-9-26 16:58:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function APR_TIME_C(val: int64): Tapr_time_t; inline;
begin
  Result := Tapr_time_t(val);
end;

function apr_time_sec(time: Tapr_time_t): int64; inline;
begin
  Result := time div APR_USEC_PER_SEC;
end;

function apr_time_as_msec(time: Tapr_time_t): int64; inline;
begin
  Result := time div 1000;
end;

function apr_time_from_msec(msec: int64): Tapr_time_t; inline;
begin
  Result := Tapr_time_t(msec) * 1000;
end;

function apr_time_from_sec(sec: int64): Tapr_time_t; inline;
begin
  Result := Tapr_time_t(sec) * APR_USEC_PER_SEC;
end;

function apr_time_make(sec, usec: int64): Tapr_time_t; inline;
begin
  Result := (Tapr_time_t(sec) * APR_USEC_PER_SEC) + Tapr_time_t(usec);
end;

{$ENDIF read_implementation}
