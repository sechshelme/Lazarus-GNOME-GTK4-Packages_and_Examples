unit gdate;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_DATE_H__}
{$define __G_DATE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <time.h>}
{$include <glib/gtypes.h>}
{$include <glib/gquark.h>}
type
  PGTime = ^TGTime;
  TGTime = Tgint32;

  PGDateYear = ^TGDateYear;
  TGDateYear = Tguint16;

  PGDateDay = ^TGDateDay;
  TGDateDay = Tguint8;
{ day of the month  }
{ enum used to specify order of appearance in parsed date strings  }

  PGDateDMY = ^TGDateDMY;
  TGDateDMY =  Longint;
  Const
    G_DATE_DAY = 0;
    G_DATE_MONTH = 1;
    G_DATE_YEAR = 2;
;
{ actual week and month values  }
type
  PGDateWeekday = ^TGDateWeekday;
  TGDateWeekday =  Longint;
  Const
    G_DATE_BAD_WEEKDAY = 0;
    G_DATE_MONDAY = 1;
    G_DATE_TUESDAY = 2;
    G_DATE_WEDNESDAY = 3;
    G_DATE_THURSDAY = 4;
    G_DATE_FRIDAY = 5;
    G_DATE_SATURDAY = 6;
    G_DATE_SUNDAY = 7;
;
type
  PGDateMonth = ^TGDateMonth;
  TGDateMonth =  Longint;
  Const
    G_DATE_BAD_MONTH = 0;
    G_DATE_JANUARY = 1;
    G_DATE_FEBRUARY = 2;
    G_DATE_MARCH = 3;
    G_DATE_APRIL = 4;
    G_DATE_MAY = 5;
    G_DATE_JUNE = 6;
    G_DATE_JULY = 7;
    G_DATE_AUGUST = 8;
    G_DATE_SEPTEMBER = 9;
    G_DATE_OCTOBER = 10;
    G_DATE_NOVEMBER = 11;
    G_DATE_DECEMBER = 12;
;
  G_DATE_BAD_JULIAN = 0;  
  G_DATE_BAD_DAY = 0;  
  G_DATE_BAD_YEAR = 0;  
{ Note: directly manipulating structs is generally a bad idea, but
 * in this case it's an *incredibly* bad idea, because all or part
 * of this struct can be invalid at any given time. Use the functions,
 * or you will get hosed, I promise.
  }
{ julian days representation - we use a
                           *  bitfield hoping that 64 bit platforms
                           *  will pack this whole struct in one big
                           *  int
                            }
{ julian is valid  }
{ dmy is valid  }
{ DMY representation  }
type
  PGDate = ^TGDate;
  TGDate = record
      flag0 : longint;
      flag1 : longint;
    end;


const
  bm_TGDate_julian_days = $FFFFFFFF;
  bp_TGDate_julian_days = 0;
  bm_TGDate_julian = $1;
  bp_TGDate_julian = 0;
  bm_TGDate_dmy = $2;
  bp_TGDate_dmy = 1;
  bm_TGDate_day = $FC;
  bp_TGDate_day = 2;
  bm_TGDate_month = $F00;
  bp_TGDate_month = 8;
  bm_TGDate_year = $FFFF000;
  bp_TGDate_year = 12;

function julian_days(var a : TGDate) : Tguint;
procedure set_julian_days(var a : TGDate; __julian_days : Tguint);
function julian(var a : TGDate) : Tguint;
procedure set_julian(var a : TGDate; __julian : Tguint);
function dmy(var a : TGDate) : Tguint;
procedure set_dmy(var a : TGDate; __dmy : Tguint);
function day(var a : TGDate) : Tguint;
procedure set_day(var a : TGDate; __day : Tguint);
function month(var a : TGDate) : Tguint;
procedure set_month(var a : TGDate; __month : Tguint);
function year(var a : TGDate) : Tguint;
procedure set_year(var a : TGDate; __year : Tguint);
{ g_date_new() returns an invalid date, you then have to _set() stuff
 * to get a usable object. You can also allocate a GDate statically,
 * then call g_date_clear() to initialize.
  }

function g_date_new:PGDate;cdecl;external libglib2;
function g_date_new_dmy(day:TGDateDay; month:TGDateMonth; year:TGDateYear):PGDate;cdecl;external libglib2;
function g_date_new_julian(julian_day:Tguint32):PGDate;cdecl;external libglib2;
procedure g_date_free(date:PGDate);cdecl;external libglib2;
function g_date_copy(date:PGDate):PGDate;cdecl;external libglib2;
{ check g_date_valid() after doing an operation that might fail, like
 * _parse.  Almost all g_date operations are undefined on invalid
 * dates (the exceptions are the mutators, since you need those to
 * return to validity).
  }
function g_date_valid(date:PGDate):Tgboolean;cdecl;external libglib2;
function g_date_valid_day(day:TGDateDay):Tgboolean;cdecl;external libglib2;
function g_date_valid_month(month:TGDateMonth):Tgboolean;cdecl;external libglib2;
function g_date_valid_year(year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_valid_weekday(weekday:TGDateWeekday):Tgboolean;cdecl;external libglib2;
function g_date_valid_julian(julian_date:Tguint32):Tgboolean;cdecl;external libglib2;
function g_date_valid_dmy(day:TGDateDay; month:TGDateMonth; year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_get_weekday(date:PGDate):TGDateWeekday;cdecl;external libglib2;
function g_date_get_month(date:PGDate):TGDateMonth;cdecl;external libglib2;
function g_date_get_year(date:PGDate):TGDateYear;cdecl;external libglib2;
function g_date_get_day(date:PGDate):TGDateDay;cdecl;external libglib2;
function g_date_get_julian(date:PGDate):Tguint32;cdecl;external libglib2;
function g_date_get_day_of_year(date:PGDate):Tguint;cdecl;external libglib2;
{ First monday/sunday is the start of week 1; if we haven't reached
 * that day, return 0. These are not ISO weeks of the year; that
 * routine needs to be added.
 * these functions return the number of weeks, starting on the
 * corresponding day
  }
function g_date_get_monday_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
function g_date_get_sunday_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
function g_date_get_week_of_year(date:PGDate; first_day_of_week:TGDateWeekday):Tguint;cdecl;external libglib2;
function g_date_get_iso8601_week_of_year(date:PGDate):Tguint;cdecl;external libglib2;
{ If you create a static date struct you need to clear it to get it
 * in a safe state before use. You can clear a whole array at
 * once with the ndates argument.
  }
procedure g_date_clear(date:PGDate; n_dates:Tguint);cdecl;external libglib2;
{ The parse routine is meant for dates typed in by a user, so it
 * permits many formats but tries to catch common typos. If your data
 * needs to be strictly validated, it is not an appropriate function.
  }
procedure g_date_set_parse(date:PGDate; str:Pgchar);cdecl;external libglib2;
procedure g_date_set_time_t(date:PGDate; timet:Ttime_t);cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_set_time_t) }
procedure g_date_set_time_val(date:PGDate; timeval:PGTimeVal);cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_FOR(g_date_set_time_t) }
procedure g_date_set_time(date:PGDate; time_:TGTime);cdecl;external libglib2;
procedure g_date_set_month(date:PGDate; month:TGDateMonth);cdecl;external libglib2;
procedure g_date_set_day(date:PGDate; day:TGDateDay);cdecl;external libglib2;
procedure g_date_set_year(date:PGDate; year:TGDateYear);cdecl;external libglib2;
procedure g_date_set_dmy(date:PGDate; day:TGDateDay; month:TGDateMonth; y:TGDateYear);cdecl;external libglib2;
procedure g_date_set_julian(date:PGDate; julian_date:Tguint32);cdecl;external libglib2;
function g_date_is_first_of_month(date:PGDate):Tgboolean;cdecl;external libglib2;
function g_date_is_last_of_month(date:PGDate):Tgboolean;cdecl;external libglib2;
{ To go forward by some number of weeks just go forward weeks*7 days  }
procedure g_date_add_days(date:PGDate; n_days:Tguint);cdecl;external libglib2;
procedure g_date_subtract_days(date:PGDate; n_days:Tguint);cdecl;external libglib2;
{ If you add/sub months while day > 28, the day might change  }
procedure g_date_add_months(date:PGDate; n_months:Tguint);cdecl;external libglib2;
procedure g_date_subtract_months(date:PGDate; n_months:Tguint);cdecl;external libglib2;
{ If it's feb 29, changing years can move you to the 28th  }
procedure g_date_add_years(date:PGDate; n_years:Tguint);cdecl;external libglib2;
procedure g_date_subtract_years(date:PGDate; n_years:Tguint);cdecl;external libglib2;
function g_date_is_leap_year(year:TGDateYear):Tgboolean;cdecl;external libglib2;
function g_date_get_days_in_month(month:TGDateMonth; year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_get_monday_weeks_in_year(year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_get_sunday_weeks_in_year(year:TGDateYear):Tguint8;cdecl;external libglib2;
function g_date_get_weeks_in_year(year:TGDateYear; first_day_of_week:TGDateWeekday):Tguint8;cdecl;external libglib2;
{ Returns the number of days between the two dates.  If date2 comes
   before date1, a negative value is return.  }
function g_date_days_between(date1:PGDate; date2:PGDate):Tgint;cdecl;external libglib2;
{ qsort-friendly (with a cast...)  }
function g_date_compare(lhs:PGDate; rhs:PGDate):Tgint;cdecl;external libglib2;
procedure g_date_to_struct_tm(date:PGDate; tm:Ptm);cdecl;external libglib2;
procedure g_date_clamp(date:PGDate; min_date:PGDate; max_date:PGDate);cdecl;external libglib2;
{ Swap date1 and date2's values if date1 > date2.  }
procedure g_date_order(date1:PGDate; date2:PGDate);cdecl;external libglib2;
{ Just like strftime() except you can only use date-related formats.
 *   Using a time format is undefined.
  }
function g_date_strftime(s:Pgchar; slen:Tgsize; format:Pgchar; date:PGDate):Tgsize;cdecl;external libglib2;
{$endif}
{ __G_DATE_H__  }

// === Konventiert am: 22-6-26 16:17:13 ===


implementation


function julian_days(var a : TGDate) : Tguint;
begin
  julian_days:=(a.flag0 and bm_TGDate_julian_days) shr bp_TGDate_julian_days;
end;

procedure set_julian_days(var a : TGDate; __julian_days : Tguint);
begin
  a.flag0:=a.flag0 or ((__julian_days shl bp_TGDate_julian_days) and bm_TGDate_julian_days);
end;

function julian(var a : TGDate) : Tguint;
begin
  julian:=(a.flag0 and bm_TGDate_julian) shr bp_TGDate_julian;
end;

procedure set_julian(var a : TGDate; __julian : Tguint);
begin
  a.flag0:=a.flag0 or ((__julian shl bp_TGDate_julian) and bm_TGDate_julian);
end;

function dmy(var a : TGDate) : Tguint;
begin
  dmy:=(a.flag0 and bm_TGDate_dmy) shr bp_TGDate_dmy;
end;

procedure set_dmy(var a : TGDate; __dmy : Tguint);
begin
  a.flag0:=a.flag0 or ((__dmy shl bp_TGDate_dmy) and bm_TGDate_dmy);
end;

function day(var a : TGDate) : Tguint;
begin
  day:=(a.flag0 and bm_TGDate_day) shr bp_TGDate_day;
end;

procedure set_day(var a : TGDate; __day : Tguint);
begin
  a.flag0:=a.flag0 or ((__day shl bp_TGDate_day) and bm_TGDate_day);
end;

function month(var a : TGDate) : Tguint;
begin
  month:=(a.flag0 and bm_TGDate_month) shr bp_TGDate_month;
end;

procedure set_month(var a : TGDate; __month : Tguint);
begin
  a.flag0:=a.flag0 or ((__month shl bp_TGDate_month) and bm_TGDate_month);
end;

function year(var a : TGDate) : Tguint;
begin
  year:=(a.flag0 and bm_TGDate_year) shr bp_TGDate_year;
end;

procedure set_year(var a : TGDate; __year : Tguint);
begin
  a.flag0:=a.flag0 or ((__year shl bp_TGDate_year) and bm_TGDate_year);
end;


end.
