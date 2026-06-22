
unit gdatetime;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdatetime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdatetime.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
Pgint  = ^gint;
PGTimeSpan  = ^GTimeSpan;
PGTimeVal  = ^GTimeVal;
PGTimeZone  = ^GTimeZone;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2009-2010 Christian Hergert <chris@dronelabs.com>
 * Copyright © 2010 Codethink Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of the
 * licence, or (at your option) any later version.
 *
 * This is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Christian Hergert <chris@dronelabs.com>
 *          Thiago Santos <thiago.sousa.santos@collabora.co.uk>
 *          Emmanuele Bassi <ebassi@linux.intel.com>
 *          Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_DATE_TIME_H__}
{$define __G_DATE_TIME_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtimezone.h>}
{*
 * G_TIME_SPAN_DAY:
 *
 * Evaluates to a time span of one day.
 *
 * Since: 2.26
  }

{ was #define dname def_expr }
function G_TIME_SPAN_DAY : longint; { return type might be wrong }

{*
 * G_TIME_SPAN_HOUR:
 *
 * Evaluates to a time span of one hour.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TIME_SPAN_HOUR : longint; { return type might be wrong }

{*
 * G_TIME_SPAN_MINUTE:
 *
 * Evaluates to a time span of one minute.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TIME_SPAN_MINUTE : longint; { return type might be wrong }

{*
 * G_TIME_SPAN_SECOND:
 *
 * Evaluates to a time span of one second.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TIME_SPAN_SECOND : longint; { return type might be wrong }

{*
 * G_TIME_SPAN_MILLISECOND:
 *
 * Evaluates to a time span of one millisecond.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TIME_SPAN_MILLISECOND : longint; { return type might be wrong }

{*
 * GTimeSpan:
 *
 * A value representing an interval of time, in microseconds.
 *
 * Since: 2.26
  }
type
  PGTimeSpan = ^TGTimeSpan;
  TGTimeSpan = Tgint64;
{*
 * GDateTime:
 *
 * `GDateTime` is a structure that combines a Gregorian date and time
 * into a single structure.
 *
 * `GDateTime` provides many conversion and methods to manipulate dates and times.
 * Time precision is provided down to microseconds and the time can range
 * (proleptically) from 0001-01-01 00:00:00 to 9999-12-31 23:59:59.999999.
 * `GDateTime` follows POSIX time in the sense that it is oblivious to leap
 * seconds.
 *
 * `GDateTime` is an immutable object; once it has been created it cannot
 * be modified further. All modifiers will create a new `GDateTime`.
 * Nearly all such functions can fail due to the date or time going out
 * of range, in which case %NULL will be returned.
 *
 * `GDateTime` is reference counted: the reference count is increased by calling
 * [method@GLib.DateTime.ref] and decreased by calling [method@GLib.DateTime.unref].
 * When the reference count drops to 0, the resources allocated by the `GDateTime`
 * structure are released.
 *
 * Many parts of the API may produce non-obvious results. As an
 * example, adding two months to January 31st will yield March 31st
 * whereas adding one month and then one month again will yield either
 * March 28th or March 29th.  Also note that adding 24 hours is not
 * always the same as adding one day (since days containing daylight
 * savings time transitions are either 23 or 25 hours in length).
 *
 * Since: 2.26
  }

procedure g_date_time_unref(datetime:PGDateTime);cdecl;external;
function g_date_time_ref(datetime:PGDateTime):PGDateTime;cdecl;external;
function g_date_time_new_now(tz:PGTimeZone):PGDateTime;cdecl;external;
function g_date_time_new_now_local:PGDateTime;cdecl;external;
function g_date_time_new_now_utc:PGDateTime;cdecl;external;
function g_date_time_new_from_unix_local(t:Tgint64):PGDateTime;cdecl;external;
function g_date_time_new_from_unix_utc(t:Tgint64):PGDateTime;cdecl;external;
function g_date_time_new_from_unix_local_usec(usecs:Tgint64):PGDateTime;cdecl;external;
function g_date_time_new_from_unix_utc_usec(usecs:Tgint64):PGDateTime;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_time_new_from_unix_local) }
(* Const before type ignored *)
function g_date_time_new_from_timeval_local(tv:PGTimeVal):PGDateTime;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_time_new_from_unix_utc) }
(* Const before type ignored *)
function g_date_time_new_from_timeval_utc(tv:PGTimeVal):PGDateTime;cdecl;external;
(* Const before type ignored *)
function g_date_time_new_from_iso8601(text:Pgchar; default_tz:PGTimeZone):PGDateTime;cdecl;external;
function g_date_time_new(tz:PGTimeZone; year:Tgint; month:Tgint; day:Tgint; hour:Tgint; 
           minute:Tgint; seconds:Tgdouble):PGDateTime;cdecl;external;
function g_date_time_new_local(year:Tgint; month:Tgint; day:Tgint; hour:Tgint; minute:Tgint; 
           seconds:Tgdouble):PGDateTime;cdecl;external;
function g_date_time_new_utc(year:Tgint; month:Tgint; day:Tgint; hour:Tgint; minute:Tgint; 
           seconds:Tgdouble):PGDateTime;cdecl;external;
function g_date_time_add(datetime:PGDateTime; timespan:TGTimeSpan):PGDateTime;cdecl;external;
function g_date_time_add_years(datetime:PGDateTime; years:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_months(datetime:PGDateTime; months:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_weeks(datetime:PGDateTime; weeks:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_days(datetime:PGDateTime; days:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_hours(datetime:PGDateTime; hours:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_minutes(datetime:PGDateTime; minutes:Tgint):PGDateTime;cdecl;external;
function g_date_time_add_seconds(datetime:PGDateTime; seconds:Tgdouble):PGDateTime;cdecl;external;
function g_date_time_add_full(datetime:PGDateTime; years:Tgint; months:Tgint; days:Tgint; hours:Tgint; 
           minutes:Tgint; seconds:Tgdouble):PGDateTime;cdecl;external;
function g_date_time_compare(dt1:Tgconstpointer; dt2:Tgconstpointer):Tgint;cdecl;external;
function g_date_time_difference(end:PGDateTime; begin:PGDateTime):TGTimeSpan;cdecl;external;
function g_date_time_hash(datetime:Tgconstpointer):Tguint;cdecl;external;
function g_date_time_equal(dt1:Tgconstpointer; dt2:Tgconstpointer):Tgboolean;cdecl;external;
procedure g_date_time_get_ymd(datetime:PGDateTime; year:Pgint; month:Pgint; day:Pgint);cdecl;external;
function g_date_time_get_year(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_month(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_day_of_month(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_week_numbering_year(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_week_of_year(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_day_of_week(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_day_of_year(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_hour(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_minute(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_second(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_microsecond(datetime:PGDateTime):Tgint;cdecl;external;
function g_date_time_get_seconds(datetime:PGDateTime):Tgdouble;cdecl;external;
function g_date_time_to_unix(datetime:PGDateTime):Tgint64;cdecl;external;
function g_date_time_to_unix_usec(datetime:PGDateTime):Tgint64;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_time_to_unix) }
function g_date_time_to_timeval(datetime:PGDateTime; tv:PGTimeVal):Tgboolean;cdecl;external;
function g_date_time_get_utc_offset(datetime:PGDateTime):TGTimeSpan;cdecl;external;
function g_date_time_get_timezone(datetime:PGDateTime):PGTimeZone;cdecl;external;
(* Const before type ignored *)
function g_date_time_get_timezone_abbreviation(datetime:PGDateTime):Pgchar;cdecl;external;
function g_date_time_is_daylight_savings(datetime:PGDateTime):Tgboolean;cdecl;external;
function g_date_time_to_timezone(datetime:PGDateTime; tz:PGTimeZone):PGDateTime;cdecl;external;
function g_date_time_to_local(datetime:PGDateTime):PGDateTime;cdecl;external;
function g_date_time_to_utc(datetime:PGDateTime):PGDateTime;cdecl;external;
(* Const before type ignored *)
function g_date_time_format(datetime:PGDateTime; format:Pgchar):Pgchar;cdecl;external;
function g_date_time_format_iso8601(datetime:PGDateTime):Pgchar;cdecl;external;
{$endif}
{ __G_DATE_TIME_H__  }

implementation

{ was #define dname def_expr }
function G_TIME_SPAN_DAY : longint; { return type might be wrong }
  begin
    G_TIME_SPAN_DAY:=G_GINT64_CONSTANT(86400000000);
  end;

{ was #define dname def_expr }
function G_TIME_SPAN_HOUR : longint; { return type might be wrong }
  begin
    G_TIME_SPAN_HOUR:=G_GINT64_CONSTANT(3600000000);
  end;

{ was #define dname def_expr }
function G_TIME_SPAN_MINUTE : longint; { return type might be wrong }
  begin
    G_TIME_SPAN_MINUTE:=G_GINT64_CONSTANT(60000000);
  end;

{ was #define dname def_expr }
function G_TIME_SPAN_SECOND : longint; { return type might be wrong }
  begin
    G_TIME_SPAN_SECOND:=G_GINT64_CONSTANT(1000000);
  end;

{ was #define dname def_expr }
function G_TIME_SPAN_MILLISECOND : longint; { return type might be wrong }
  begin
    G_TIME_SPAN_MILLISECOND:=G_GINT64_CONSTANT(1000);
  end;


end.
