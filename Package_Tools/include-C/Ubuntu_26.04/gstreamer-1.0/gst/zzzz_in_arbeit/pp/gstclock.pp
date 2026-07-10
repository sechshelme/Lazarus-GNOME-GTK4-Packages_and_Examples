
unit gstclock;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstclock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstclock.h
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
Pgdouble  = ^gdouble;
PGstClock  = ^GstClock;
PGstClockClass  = ^GstClockClass;
PGstClockEntry  = ^GstClockEntry;
PGstClockEntryType  = ^GstClockEntryType;
PGstClockFlags  = ^GstClockFlags;
PGstClockID  = ^GstClockID;
PGstClockPrivate  = ^GstClockPrivate;
PGstClockReturn  = ^GstClockReturn;
PGstClockTime  = ^GstClockTime;
PGstClockTimeDiff  = ^GstClockTimeDiff;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstclock.h: Header for clock subsystem
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_CLOCK_H__}
{$define __GST_CLOCK_H__}
{$include <gst/gstconfig.h>}
{$include <glib.h>}
{ --- standard type macros ---  }

{ was #define dname def_expr }
function GST_TYPE_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK(clock : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CLOCK(clock : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_CLASS(cclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CLOCK_CLASS(cclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_GET_CLASS(clock : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CLOCK_CAST(clock : longint) : PGstClock;

{*
 * GstClockTime:
 *
 * A datatype to hold a time, measured in nanoseconds.
  }
type
  PGstClockTime = ^TGstClockTime;
  TGstClockTime = Tguint64;
{*
 * GST_TYPE_CLOCK_TIME:
 *
 * The #GType of a #GstClockTime.
  }

const
  GST_TYPE_CLOCK_TIME = G_TYPE_UINT64;  
{*
 * GstClockTimeDiff:
 *
 * A datatype to hold a time difference, measured in nanoseconds.
  }
type
  PGstClockTimeDiff = ^TGstClockTimeDiff;
  TGstClockTimeDiff = Tgint64;
{*
 * GstClockID:
 *
 * A datatype to hold the handle to an outstanding sync or async clock callback.
  }

  PGstClockID = ^TGstClockID;
  TGstClockID = Tgpointer;
{*
 * GST_CLOCK_TIME_NONE: (value 18446744073709551615) (type GstClockTime)
 *
 * Constant to define an undefined clock time.
  }

{ was #define dname def_expr }
function GST_CLOCK_TIME_NONE : TGstClockTime;  

{*
 * GST_CLOCK_TIME_IS_VALID:
 * @time: clock time to validate
 *
 * Tests if a given #GstClockTime represents a valid defined time.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_IS_VALID(time : longint) : longint;

{*
 * GST_CLOCK_STIME_NONE: (value -9223372036854775808) (type GstClockTimeDiff)
 *
 * Constant to define an undefined clock time.
  }
{ was #define dname def_expr }
function GST_CLOCK_STIME_NONE : TGstClockTimeDiff;  

{*
 * GST_CLOCK_STIME_IS_VALID:
 * @time: signed clock time to validate
 *
 * Tests if a given #GstClockTimeDiff of #gint64 represents a valid defined time.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_STIME_IS_VALID(time : longint) : longint;

{*
 * GST_SECOND: (value 1000000000) (type GstClockTimeDiff)
 *
 * Constant that defines one GStreamer second.
  }
{xxxxxxx #define GST_SECOND  ((GstClockTimeDiff)(G_USEC_PER_SEC * G_GINT64_CONSTANT (1000))) }
{*
 * GST_MSECOND: (value 1000000) (type GstClockTimeDiff)
 *
 * Constant that defines one GStreamer millisecond.
  }
{ was #define dname def_expr }
function GST_MSECOND : TGstClockTimeDiff;  

{*
 * GST_USECOND: (value 1000) (type GstClockTimeDiff)
 *
 * Constant that defines one GStreamer microsecond.
  }
{ was #define dname def_expr }
function GST_USECOND : TGstClockTimeDiff;  

{*
 * GST_NSECOND: (value 1) (type GstClockTimeDiff)
 *
 * Constant that defines one GStreamer nanosecond
  }
{ was #define dname def_expr }
function GST_NSECOND : TGstClockTimeDiff;  

{*
 * GST_TIME_AS_SECONDS:
 * @time: the time
 *
 * Converts a #GstClockTime to seconds.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_SECONDS(time : longint) : longint;

{*
 * GST_TIME_AS_MSECONDS:
 * @time: the time
 *
 * Converts a #GstClockTime to milliseconds (1/1000 of a second).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_MSECONDS(time : longint) : longint;

{*
 * GST_TIME_AS_USECONDS:
 * @time: the time
 *
 * Converts a #GstClockTime to microseconds (1/1000000 of a second).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_USECONDS(time : longint) : longint;

{*
 * GST_TIME_AS_NSECONDS:
 * @time: the time
 *
 * Converts a #GstClockTime to nanoseconds (1/1000000000 of a second).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_NSECONDS(time : longint) : longint;

{*
 * GST_CLOCK_DIFF:
 * @s: the first time
 * @e: the second time
 *
 * Calculates a difference between two clock times as a #GstClockTimeDiff.
 * The difference is calculated as @e - @s.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CLOCK_DIFF(s,e : longint) : TGstClockTimeDiff;

{*
 * GST_TIMEVAL_TO_TIME:
 * @tv: the timeval to convert
 *
 * Converts a GTimeVal to a #GstClockTime.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TIMEVAL_TO_TIME(tv : longint) : TGstClockTime;

{*xxxxxxx
#define GST_TIME_TO_TIMEVAL(t,tv)                                           \
G_STMT_START                                                               \
  G_STATIC_ASSERT (sizeof ((tv).tv_sec) == 4 || sizeof ((tv).tv_sec) == 8); \
  if (sizeof ((tv).tv_sec) == 4)                                           \
    g_assert ("Value of time " #t " is out of timeval's range" &&           \
        ((t) / GST_SECOND) < G_MAXINT32);                                   \
                                                                           \
  (tv).tv_sec  = (((GstClockTime) (t)) / GST_SECOND);                       \
  (tv).tv_usec = ((((GstClockTime) (t)) -                                   \
                  ((GstClockTime) (tv).tv_sec) * GST_SECOND)                \
                 / GST_USECOND);                                            \
 G_STMT_END
  }
{*
 * GST_TIMESPEC_TO_TIME:
 * @ts: the timespec to convert
 *
 * Converts a struct timespec (see `man pselect`) to a #GstClockTime.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TIMESPEC_TO_TIME(ts : longint) : TGstClockTime;

{*xxxxxxx
#define GST_TIME_TO_TIMESPEC(t,ts)                                          \
G_STMT_START                                                               \
  G_STATIC_ASSERT (sizeof ((ts).tv_sec) == 4 || sizeof ((ts).tv_sec) == 8); \
  if (sizeof ((ts).tv_sec) == 4)                                           \
    g_assert ("Value of time " #t " is out of timespec's range" &&          \
        ((t) / GST_SECOND) < G_MAXINT32);                                   \
                                                                           \
  (ts).tv_sec  =  ((t) / GST_SECOND);                                       \
  (ts).tv_nsec = (((t) - (ts).tv_sec * GST_SECOND) / GST_NSECOND);          \
 G_STMT_END
  }
{ timestamp debugging macros  }
{*
 * GST_TIME_FORMAT: (skip):
 *
 * A string that can be used in printf-like format strings to display a
 * #GstClockTime value in `h:m:s` format.  Use GST_TIME_ARGS() to construct
 * the matching arguments.
 *
 * Example:
 *
 * ``` C
 * printf("%" GST_TIME_FORMAT "\n", GST_TIME_ARGS(ts));
 * ``` 
  }
const
  GST_TIME_FORMAT = 'u:%02u:%02u.%09u';  
{*xxxxxxx
#define GST_TIME_ARGS(t) \
        GST_CLOCK_TIME_IS_VALID (t) ? \
        (guint) (((GstClockTime)(t)) / (GST_SECOND * 60 * 60)) : 99, \
        GST_CLOCK_TIME_IS_VALID (t) ? \
        (guint) ((((GstClockTime)(t)) / (GST_SECOND * 60)) % 60) : 99, \
        GST_CLOCK_TIME_IS_VALID (t) ? \
        (guint) ((((GstClockTime)(t)) / GST_SECOND) % 60) : 99, \
        GST_CLOCK_TIME_IS_VALID (t) ? \
        (guint) (((GstClockTime)(t)) % GST_SECOND) : 999999999
  }
{*
 * GST_STIME_FORMAT: (skip):
 *
 * A string that can be used in printf-like format strings to display a signed
 * #GstClockTimeDiff or #gint64 value in `h:m:s` format.  Use GST_TIME_ARGS() to
 * construct the matching arguments.
 *
 * Example:
 *
 * ``` C
 * printf("%" GST_STIME_FORMAT "\n", GST_STIME_ARGS(ts));
 * ```
 *
 * Since: 1.6
  }
{xxxxxx #define GST_STIME_FORMAT "c%" GST_TIME_FORMAT }
{*
#define GST_STIME_ARGS(t)						\
  ((t) == GST_CLOCK_STIME_NONE || (t) >= 0) ? '+' : '-',		\
    GST_CLOCK_STIME_IS_VALID (t) ?					\
    (guint) (((GstClockTime)(ABS(t))) / (GST_SECOND * 60 * 60)) : 99,	\
    GST_CLOCK_STIME_IS_VALID (t) ?					\
    (guint) ((((GstClockTime)(ABS(t))) / (GST_SECOND * 60)) % 60) : 99,	\
    GST_CLOCK_STIME_IS_VALID (t) ?					\
    (guint) ((((GstClockTime)(ABS(t))) / GST_SECOND) % 60) : 99,	\
    GST_CLOCK_STIME_IS_VALID (t) ?					\
    (guint) (((GstClockTime)(ABS(t))) % GST_SECOND) : 999999999
  }
type
{ --- prototype for async callbacks ---  }
{*
 * GstClockCallback:
 * @clock: The clock that triggered the callback
 * @time: The time it was triggered
 * @id: The #GstClockID that expired
 * @user_data: user data passed in the gst_clock_id_wait_async() function
 *
 * The function prototype of the callback.
 *
 * Returns: %TRUE or %FALSE (currently unused)
  }

  TGstClockCallback = function (clock:PGstClock; time:TGstClockTime; id:TGstClockID; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstClockReturn:
 * @GST_CLOCK_OK: The operation succeeded.
 * @GST_CLOCK_EARLY: The operation was scheduled too late.
 * @GST_CLOCK_UNSCHEDULED: The clockID was unscheduled
 * @GST_CLOCK_BUSY: The ClockID is busy
 * @GST_CLOCK_BADTIME: A bad time was provided to a function.
 * @GST_CLOCK_ERROR: An error occurred
 * @GST_CLOCK_UNSUPPORTED: Operation is not supported
 * @GST_CLOCK_DONE: The ClockID is done waiting
 *
 * The return value of a clock operation.
  }

  PGstClockReturn = ^TGstClockReturn;
  TGstClockReturn =  Longint;
  Const
    GST_CLOCK_OK = 0;
    GST_CLOCK_EARLY = 1;
    GST_CLOCK_UNSCHEDULED = 2;
    GST_CLOCK_BUSY = 3;
    GST_CLOCK_BADTIME = 4;
    GST_CLOCK_ERROR = 5;
    GST_CLOCK_UNSUPPORTED = 6;
    GST_CLOCK_DONE = 7;
;
{*
 * GstClockEntryType:
 * @GST_CLOCK_ENTRY_SINGLE: a single shot timeout
 * @GST_CLOCK_ENTRY_PERIODIC: a periodic timeout request
 *
 * The type of the clock entry
  }
type
  PGstClockEntryType = ^TGstClockEntryType;
  TGstClockEntryType =  Longint;
  Const
    GST_CLOCK_ENTRY_SINGLE = 0;
    GST_CLOCK_ENTRY_PERIODIC = 1;
;
{*
 * GST_CLOCK_ENTRY:
 * @entry: the entry to cast
 *
 * Casts to a clock entry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_CLOCK_ENTRY(entry : longint) : PGstClockEntry;

{$ifndef GST_DISABLE_DEPRECATED}
{*
 * GST_CLOCK_ENTRY_CLOCK:
 * @entry: the entry to query
 *
 * Gets the owner clock of the entry
 *
 * Deprecated: Use gst_clock_id_get_clock() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_CLOCK_ENTRY_CLOCK(entry : longint) : longint;

{$endif}
{*
 * GST_CLOCK_ENTRY_TYPE:
 * @entry: the entry to query
 *
 * Gets the type of the clock entry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_CLOCK_ENTRY_TYPE(entry : longint) : longint;

{*
 * GST_CLOCK_ENTRY_TIME:
 * @entry: the entry to query
 *
 * Gets the requested time of this entry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_TIME(entry : longint) : longint;

{*
 * GST_CLOCK_ENTRY_INTERVAL:
 * @entry: the entry to query
 *
 * Gets the interval of this periodic entry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_INTERVAL(entry : longint) : longint;

{*
 * GST_CLOCK_ENTRY_STATUS:
 * @entry: the entry to query
 *
 * The status of the entry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_STATUS(entry : longint) : longint;

{*
 * GstClockEntry:
 * @refcount: reference counter (read-only)
 *
 * All pending timeouts or periodic notifies are converted into
 * an entry.
 * Note that GstClockEntry should be treated as an opaque structure. It must
 * not be extended or allocated using a custom allocator.
  }
{< private > }
{$ifndef GST_REMOVE_DEPRECATED}
{$ifndef GST_DISABLE_DEPRECATED}
{$else}
{$endif}
{$endif}
{< private > }
type
  PGstClockEntry = ^TGstClockEntry;
  TGstClockEntry = record
      refcount : Tgint;
      clock : PGstClock;
      _clock : Tgpointer;
      _type : TGstClockEntryType;
      time : TGstClockTime;
      interval : TGstClockTime;
      status : TGstClockReturn;
      func : TGstClockCallback;
      user_data : Tgpointer;
      destroy_data : TGDestroyNotify;
      unscheduled : Tgboolean;
      woken_up : Tgboolean;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$include <gst/gstobject.h>}
{*
 * GstClockFlags:
 * @GST_CLOCK_FLAG_CAN_DO_SINGLE_SYNC: clock can do a single sync timeout request
 * @GST_CLOCK_FLAG_CAN_DO_SINGLE_ASYNC: clock can do a single async timeout request
 * @GST_CLOCK_FLAG_CAN_DO_PERIODIC_SYNC: clock can do sync periodic timeout requests
 * @GST_CLOCK_FLAG_CAN_DO_PERIODIC_ASYNC: clock can do async periodic timeout callbacks
 * @GST_CLOCK_FLAG_CAN_SET_RESOLUTION: clock's resolution can be changed
 * @GST_CLOCK_FLAG_CAN_SET_MASTER: clock can be slaved to a master clock
 * @GST_CLOCK_FLAG_LAST: subclasses can add additional flags starting from this flag
 *
 * The capabilities of this clock
  }
{*
   * GST_CLOCK_FLAG_NEEDS_STARTUP_SYNC:
   *
   * clock needs to be synced before it can be used
   *
   * Since: 1.6
    }
{ padding  }
type
  PGstClockFlags = ^TGstClockFlags;
  TGstClockFlags =  Longint;
  Const
    GST_CLOCK_FLAG_CAN_DO_SINGLE_SYNC = GST_OBJECT_FLAG_LAST shl 0;
    GST_CLOCK_FLAG_CAN_DO_SINGLE_ASYNC = GST_OBJECT_FLAG_LAST shl 1;
    GST_CLOCK_FLAG_CAN_DO_PERIODIC_SYNC = GST_OBJECT_FLAG_LAST shl 2;
    GST_CLOCK_FLAG_CAN_DO_PERIODIC_ASYNC = GST_OBJECT_FLAG_LAST shl 3;
    GST_CLOCK_FLAG_CAN_SET_RESOLUTION = GST_OBJECT_FLAG_LAST shl 4;
    GST_CLOCK_FLAG_CAN_SET_MASTER = GST_OBJECT_FLAG_LAST shl 5;
    GST_CLOCK_FLAG_NEEDS_STARTUP_SYNC = GST_OBJECT_FLAG_LAST shl 6;
    GST_CLOCK_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 8;
;
{*
 * GST_CLOCK_FLAGS:
 * @clock: the clock to query
 *
 * Gets the #GstClockFlags clock flags.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_CLOCK_FLAGS(clock : longint) : longint;

{*
 * GstClock:
 * @object: the parent structure
 *
 * #GstClock base structure.
  }
{< private > }
type
  PGstClock = ^TGstClock;
  TGstClock = record
      object : TGstObject;
      priv : PGstClockPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstClockClass:
 * @parent_class: the parent class structure
 *
 * GStreamer clock class. Override the vmethods to implement the clock
 * functionality.
  }
{< public > }
{ vtable  }
{*
   * GstClockClass::change_resolution:
   * @clock: the #GstClock
   * @old_resolution: the previous resolution
   * @new_resolution: the new resolution
   *
   * Change the resolution of the clock. Not all values might
   * be acceptable.
   *
   * Returns: the new resolution
    }
{*
   * GstClockClass::get_resolution:
   * @clock: the #GstClock
   *
   * Get the resolution of the clock.
   *
   * Returns: the current resolution
    }
{*
   * GstClockClass::get_internal_time:
   * @clock: the #GstClock
   *
   * Get the internal unadjusted time of the clock.
   *
   * Implement #GstClockClass::wait instead.
   *
   * Returns: the internal time
    }
{ waiting on an ID  }
{*
   * GstClockClass::wait:
   * @clock: the #GstClock
   * @entry: the entry to wait on
   * @jitter: (out) (allow-none): a pointer that will contain the jitter
   *
   * Perform a blocking wait on the given #GstClockEntry and return
   * the jitter.
   *
   * Returns: the result of the blocking wait. #GST_CLOCK_EARLY will be returned
   * if the current clock time is past the time of @id, #GST_CLOCK_OK if
   * @id was scheduled in time. #GST_CLOCK_UNSCHEDULED if @id was
   * unscheduled with gst_clock_id_unschedule().
    }
{*
   * GstClockClass::wait_async:
   * @clock: the #GstClock
   * @entry: the entry to wait on
   *
   * Perform an asynchronous wait on the given #GstClockEntry.
   *
   * Returns: the result of the non blocking wait.
    }
{*
   * GstClockClass::unschedule:
   * @clock: the #GstClock
   * @entry: the entry to unschedule
   *
   * Unblock a blocking or async wait operation.
    }
{< private > }
  PGstClockClass = ^TGstClockClass;
  TGstClockClass = record
      parent_class : TGstObjectClass;
      change_resolution : function (clock:PGstClock; old_resolution:TGstClockTime; new_resolution:TGstClockTime):TGstClockTime;cdecl;
      get_resolution : function (clock:PGstClock):TGstClockTime;cdecl;
      get_internal_time : function (clock:PGstClock):TGstClockTime;cdecl;
      wait : function (clock:PGstClock; entry:PGstClockEntry; jitter:PGstClockTimeDiff):TGstClockReturn;cdecl;
      wait_async : function (clock:PGstClock; entry:PGstClockEntry):TGstClockReturn;cdecl;
      unschedule : procedure (clock:PGstClock; entry:PGstClockEntry);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_clock_get_type:TGType;cdecl;external;
function gst_clock_set_resolution(clock:PGstClock; resolution:TGstClockTime):TGstClockTime;cdecl;external;
function gst_clock_get_resolution(clock:PGstClock):TGstClockTime;cdecl;external;
function gst_clock_get_time(clock:PGstClock):TGstClockTime;cdecl;external;
procedure gst_clock_set_calibration(clock:PGstClock; internal:TGstClockTime; external:TGstClockTime; rate_num:TGstClockTime; rate_denom:TGstClockTime);cdecl;external;
procedure gst_clock_get_calibration(clock:PGstClock; internal:PGstClockTime; external:PGstClockTime; rate_num:PGstClockTime; rate_denom:PGstClockTime);cdecl;external;
{ master/slave clocks  }
function gst_clock_set_master(clock:PGstClock; master:PGstClock):Tgboolean;cdecl;external;
function gst_clock_get_master(clock:PGstClock):PGstClock;cdecl;external;
procedure gst_clock_set_timeout(clock:PGstClock; timeout:TGstClockTime);cdecl;external;
function gst_clock_get_timeout(clock:PGstClock):TGstClockTime;cdecl;external;
function gst_clock_add_observation(clock:PGstClock; observation_internal:TGstClockTime; observation_external:TGstClockTime; r_squared:Pgdouble):Tgboolean;cdecl;external;
function gst_clock_add_observation_unapplied(clock:PGstClock; observation_internal:TGstClockTime; observation_external:TGstClockTime; r_squared:Pgdouble; internal:PGstClockTime; 
           external:PGstClockTime; rate_num:PGstClockTime; rate_denom:PGstClockTime):Tgboolean;cdecl;external;
{ getting and adjusting internal/external time  }
function gst_clock_get_internal_time(clock:PGstClock):TGstClockTime;cdecl;external;
function gst_clock_adjust_unlocked(clock:PGstClock; internal:TGstClockTime):TGstClockTime;cdecl;external;
function gst_clock_adjust_with_calibration(clock:PGstClock; internal_target:TGstClockTime; cinternal:TGstClockTime; cexternal:TGstClockTime; cnum:TGstClockTime; 
           cdenom:TGstClockTime):TGstClockTime;cdecl;external;
function gst_clock_unadjust_with_calibration(clock:PGstClock; external_target:TGstClockTime; cinternal:TGstClockTime; cexternal:TGstClockTime; cnum:TGstClockTime; 
           cdenom:TGstClockTime):TGstClockTime;cdecl;external;
function gst_clock_unadjust_unlocked(clock:PGstClock; external:TGstClockTime):TGstClockTime;cdecl;external;
{ waiting for, signalling and checking for synchronization  }
function gst_clock_wait_for_sync(clock:PGstClock; timeout:TGstClockTime):Tgboolean;cdecl;external;
function gst_clock_is_synced(clock:PGstClock):Tgboolean;cdecl;external;
{ to be used by subclasses only  }
procedure gst_clock_set_synced(clock:PGstClock; synced:Tgboolean);cdecl;external;
{ creating IDs that can be used to get notifications  }
function gst_clock_new_single_shot_id(clock:PGstClock; time:TGstClockTime):TGstClockID;cdecl;external;
function gst_clock_new_periodic_id(clock:PGstClock; start_time:TGstClockTime; interval:TGstClockTime):TGstClockID;cdecl;external;
{ reference counting  }
function gst_clock_id_ref(id:TGstClockID):TGstClockID;cdecl;external;
procedure gst_clock_id_unref(id:TGstClockID);cdecl;external;
{ operations on IDs  }
function gst_clock_id_compare_func(id1:Tgconstpointer; id2:Tgconstpointer):Tgint;cdecl;external;
function gst_clock_id_get_clock(id:TGstClockID):PGstClock;cdecl;external;
function gst_clock_id_uses_clock(id:TGstClockID; clock:PGstClock):Tgboolean;cdecl;external;
function gst_clock_id_get_time(id:TGstClockID):TGstClockTime;cdecl;external;
function gst_clock_id_wait(id:TGstClockID; jitter:PGstClockTimeDiff):TGstClockReturn;cdecl;external;
function gst_clock_id_wait_async(id:TGstClockID; func:TGstClockCallback; user_data:Tgpointer; destroy_data:TGDestroyNotify):TGstClockReturn;cdecl;external;
procedure gst_clock_id_unschedule(id:TGstClockID);cdecl;external;
function gst_clock_single_shot_id_reinit(clock:PGstClock; id:TGstClockID; time:TGstClockTime):Tgboolean;cdecl;external;
function gst_clock_periodic_id_reinit(clock:PGstClock; id:TGstClockID; start_time:TGstClockTime; interval:TGstClockTime):Tgboolean;cdecl;external;
{$endif}
{ __GST_CLOCK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_CLOCK : longint; { return type might be wrong }
  begin
    GST_TYPE_CLOCK:=gst_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK(clock : longint) : longint;
begin
  GST_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(clock,GST_TYPE_CLOCK,GstClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CLOCK(clock : longint) : longint;
begin
  GST_IS_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(clock,GST_TYPE_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_CLASS(cclass : longint) : longint;
begin
  GST_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(cclass,GST_TYPE_CLOCK,GstClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CLOCK_CLASS(cclass : longint) : longint;
begin
  GST_IS_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(cclass,GST_TYPE_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_GET_CLASS(clock : longint) : longint;
begin
  GST_CLOCK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(clock,GST_TYPE_CLOCK,GstClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CLOCK_CAST(clock : longint) : PGstClock;
begin
  GST_CLOCK_CAST:=PGstClock(clock);
end;

{ was #define dname def_expr }
function GST_CLOCK_TIME_NONE : TGstClockTime;
  begin
    GST_CLOCK_TIME_NONE:=TGstClockTime(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_IS_VALID(time : longint) : longint;
begin
  GST_CLOCK_TIME_IS_VALID:=(TGstClockTime(time))<>GST_CLOCK_TIME_NONE;
end;

{ was #define dname def_expr }
function GST_CLOCK_STIME_NONE : TGstClockTimeDiff;
  begin
    GST_CLOCK_STIME_NONE:=TGstClockTimeDiff(G_MININT64);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_STIME_IS_VALID(time : longint) : longint;
begin
  GST_CLOCK_STIME_IS_VALID:=(TGstClockTimeDiff(time))<>GST_CLOCK_STIME_NONE;
end;

{ was #define dname def_expr }
function GST_MSECOND : TGstClockTimeDiff;
  begin
    GST_MSECOND:=TGstClockTimeDiff(GST_SECOND/(G_GINT64_CONSTANT(1000)));
  end;

{ was #define dname def_expr }
function GST_USECOND : TGstClockTimeDiff;
  begin
    GST_USECOND:=TGstClockTimeDiff(GST_SECOND/(G_GINT64_CONSTANT(1000000)));
  end;

{ was #define dname def_expr }
function GST_NSECOND : TGstClockTimeDiff;
  begin
    GST_NSECOND:=TGstClockTimeDiff(GST_SECOND/(G_GINT64_CONSTANT(1000000000)));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_SECONDS(time : longint) : longint;
begin
  GST_TIME_AS_SECONDS:=time/GST_SECOND;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_MSECONDS(time : longint) : longint;
begin
  GST_TIME_AS_MSECONDS:=time/(G_GINT64_CONSTANT(1000000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_USECONDS(time : longint) : longint;
begin
  GST_TIME_AS_USECONDS:=time/(G_GINT64_CONSTANT(1000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIME_AS_NSECONDS(time : longint) : longint;
begin
  GST_TIME_AS_NSECONDS:=time;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CLOCK_DIFF(s,e : longint) : TGstClockTimeDiff;
begin
  GST_CLOCK_DIFF:=TGstClockTimeDiff(Te(-(s)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TIMEVAL_TO_TIME(tv : longint) : TGstClockTime;
begin
  GST_TIMEVAL_TO_TIME:=TGstClockTime(((tv.tv_sec)*GST_SECOND)+((tv.tv_usec)*GST_USECOND));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TIMESPEC_TO_TIME(ts : longint) : TGstClockTime;
begin
  GST_TIMESPEC_TO_TIME:=TGstClockTime(((ts.tv_sec)*GST_SECOND)+((ts.tv_nsec)*GST_NSECOND));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CLOCK_ENTRY(entry : longint) : PGstClockEntry;
begin
  GST_CLOCK_ENTRY:=PGstClockEntry(entry);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_CLOCK(entry : longint) : longint;
begin
  GST_CLOCK_ENTRY_CLOCK:=entry^.clock;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_TYPE(entry : longint) : longint;
begin
  GST_CLOCK_ENTRY_TYPE:=entry^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_TIME(entry : longint) : longint;
begin
  GST_CLOCK_ENTRY_TIME:=entry^.time;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_INTERVAL(entry : longint) : longint;
begin
  GST_CLOCK_ENTRY_INTERVAL:=entry^.interval;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_ENTRY_STATUS(entry : longint) : longint;
begin
  GST_CLOCK_ENTRY_STATUS:=entry^.status;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_FLAGS(clock : longint) : longint;
begin
  GST_CLOCK_FLAGS:=GST_OBJECT_FLAGS(clock);
end;


end.
