unit apr_time;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_TIME_H}
{$define APR_TIME_H}
{*
 * @file apr_time.h
 * @brief APR Time Library
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_time Time Routines
 * @ingroup APR 
 * @
  }
{* month names  }
  var
    apr_month_snames : array[0..11] of array[0..3] of char;cvar;external libapr;
    apr_day_snames : array[0..6] of array[0..3] of char;cvar;external libapr;
{* number of microseconds since 00:00:00 January 1, 1970 UTC  }
type
  Papr_time_t = ^Tapr_time_t;
  Tapr_time_t = Tapr_int64_t;
{* mechanism to properly type apr_time_t literals  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function APR_TIME_C(val : longint) : longint;

{* mechanism to properly print apr_time_t values  }
const
  APR_TIME_T_FMT = APR_INT64_T_FMT;  
{* intervals for I/O timeouts, in microseconds  }
type
  Papr_interval_time_t = ^Tapr_interval_time_t;
  Tapr_interval_time_t = Tapr_int64_t;
{* short interval for I/O timeouts, in microseconds  }

  Papr_short_interval_time_t = ^Tapr_short_interval_time_t;
  Tapr_short_interval_time_t = Tapr_int32_t;
{* number of microseconds per second  }

{ was #define dname def_expr }
function APR_USEC_PER_SEC : longint; { return type might be wrong }

{* @return apr_time_t as a second  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_sec(time : longint) : longint;

{xxxxxxxxxx }
{#define apr_time_usec(time) ((time) % APR_USEC_PER_SEC) }
{#define apr_time_msec(time) (((time) / 1000) % 1000) }
{* @return apr_time_t as a msec  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_as_msec(time : longint) : longint;

{* @return milliseconds as an apr_time_t  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_from_msec(msec : longint) : longint;

{* @return seconds as an apr_time_t  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_from_sec(sec : longint) : longint;

{* @return a second and usec combination as an apr_time_t  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_make(sec,usec : longint) : longint;

{*
 * @return the current time
  }
function apr_time_now:Tapr_time_t;cdecl;external libapr;
{* @see apr_time_exp_t  }
type
{*
 * a structure similar to ANSI struct tm with the following differences:
 *  - tm_usec isn't an ANSI field
 *  - tm_gmtoff isn't an ANSI field (it's a BSDism)
  }
{* microseconds past tm_sec  }
{* (0-61) seconds past tm_min  }
{* (0-59) minutes past tm_hour  }
{* (0-23) hours past midnight  }
{* (1-31) day of the month  }
{* (0-11) month of the year  }
{* year since 1900  }
{* (0-6) days since Sunday  }
{* (0-365) days since January 1  }
{* daylight saving time  }
{* seconds east of UTC  }
  Papr_time_exp_t = ^Tapr_time_exp_t;
  Tapr_time_exp_t = record
      tm_usec : Tapr_int32_t;
      tm_sec : Tapr_int32_t;
      tm_min : Tapr_int32_t;
      tm_hour : Tapr_int32_t;
      tm_mday : Tapr_int32_t;
      tm_mon : Tapr_int32_t;
      tm_year : Tapr_int32_t;
      tm_wday : Tapr_int32_t;
      tm_yday : Tapr_int32_t;
      tm_isdst : Tapr_int32_t;
      tm_gmtoff : Tapr_int32_t;
    end;

{ Delayed the include to avoid a circular reference  }
{$include "apr_pools.h"}
{*
 * Convert an ansi time_t to an apr_time_t
 * @param result the resulting apr_time_t
 * @param input the time_t to convert
  }

function apr_time_ansi_put(result:Papr_time_t; input:Ttime_t):Tapr_status_t;cdecl;external libapr;
{*
 * Convert a time to its human readable components using an offset
 * from GMT.
 * @param result the exploded time
 * @param input the time to explode
 * @param offs the number of seconds offset to apply
  }
function apr_time_exp_tz(result:Papr_time_exp_t; input:Tapr_time_t; offs:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{*
 * Convert a time to its human readable components (GMT).
 * @param result the exploded time
 * @param input the time to explode
  }
function apr_time_exp_gmt(result:Papr_time_exp_t; input:Tapr_time_t):Tapr_status_t;cdecl;external libapr;
{*
 * Convert a time to its human readable components in the local timezone.
 * @param result the exploded time
 * @param input the time to explode
  }
function apr_time_exp_lt(result:Papr_time_exp_t; input:Tapr_time_t):Tapr_status_t;cdecl;external libapr;
{*
 * Convert time value from human readable format to a numeric apr_time_t
 * (elapsed microseconds since the epoch).
 * @param result the resulting imploded time
 * @param input the input exploded time
  }
function apr_time_exp_get(result:Papr_time_t; input:Papr_time_exp_t):Tapr_status_t;cdecl;external libapr;
{*
 * Convert time value from human readable format to a numeric apr_time_t that
 * always represents GMT.
 * @param result the resulting imploded time
 * @param input the input exploded time
  }
function apr_time_exp_gmt_get(result:Papr_time_t; input:Papr_time_exp_t):Tapr_status_t;cdecl;external libapr;
{*
 * Sleep for the specified number of micro-seconds.
 * @param t desired amount of time to sleep.
 * @warning May sleep for longer than the specified time. 
  }
procedure apr_sleep(t:Tapr_interval_time_t);cdecl;external libapr;
{* length of a RFC822 Date  }
const
  APR_RFC822_DATE_LEN = 30;  
{*
 * apr_rfc822_date formats dates in the RFC822
 * format in an efficient manner.  It is a fixed length
 * format which requires APR_RFC822_DATA_LEN bytes of storage,
 * including the trailing NUL terminator.
 * @param date_str String to write to.
 * @param t the time to convert 
  }

function apr_rfc822_date(date_str:Pchar; t:Tapr_time_t):Tapr_status_t;cdecl;external libapr;
{* length of a CTIME date  }
const
  APR_CTIME_LEN = 25;  
{*
 * apr_ctime formats dates in the ctime() format
 * in an efficient manner.  It is a fixed length format
 * and requires APR_CTIME_LEN bytes of storage including
 * the trailing NUL terminator.
 * Unlike ANSI/ISO C ctime(), apr_ctime() does not include
 * a \\n at the end of the string.
 * @param date_str String to write to.
 * @param t the time to convert 
  }

function apr_ctime(date_str:Pchar; t:Tapr_time_t):Tapr_status_t;cdecl;external libapr;
{*
 * Formats the exploded time according to the format specified
 * @param s string to write to
 * @param retsize The length of the returned string
 * @param max The maximum length of the string
 * @param format The format for the time string
 * @param tm The time to convert
  }
function apr_strftime(s:Pchar; retsize:Papr_size_t; max:Tapr_size_t; format:Pchar; tm:Papr_time_exp_t):Tapr_status_t;cdecl;external libapr;
{*
 * Improve the clock resolution for the lifetime of the given pool.
 * Generally this is only desirable on benchmarking and other very
 * time-sensitive applications, and has no impact on most platforms.
 * @param p The pool to associate the finer clock resolution 
  }
procedure apr_time_clock_hires(p:Papr_pool_t);cdecl;external libapr;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_TIME_H  }

// === Konventiert am: 10-9-26 16:58:35 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_TIME_C(val : longint) : longint;
begin
  APR_TIME_C:=APR_INT64_C(val);
end;

{ was #define dname def_expr }
function APR_USEC_PER_SEC : longint; { return type might be wrong }
  begin
    APR_USEC_PER_SEC:=APR_TIME_C(1000000);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_sec(time : longint) : longint;
begin
  apr_time_sec:=time/APR_USEC_PER_SEC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_as_msec(time : longint) : longint;
begin
  apr_time_as_msec:=time/1000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_from_msec(msec : longint) : longint;
begin
  apr_time_from_msec:=(Tapr_time_t(msec))*1000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_from_sec(sec : longint) : longint;
begin
  apr_time_from_sec:=(Tapr_time_t(sec))*APR_USEC_PER_SEC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_time_make(sec,usec : longint) : longint;
begin
  apr_time_make:=((Tapr_time_t(sec))*APR_USEC_PER_SEC)+(Tapr_time_t(usec));
end;


end.
