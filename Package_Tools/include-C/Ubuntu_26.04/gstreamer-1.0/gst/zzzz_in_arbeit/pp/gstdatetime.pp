
unit gstdatetime;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdatetime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdatetime.h
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
PGstDateTime  = ^GstDateTime;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010 Thiago Santos <thiago.sousa.santos@collabora.co.uk>
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
{$ifndef __GST_DATE_TIME_H__}
{$define __GST_DATE_TIME_H__}
{$include <gst/gstconfig.h>}
{$include <time.h>}
{$include <glib.h>}
{$include <glib-object.h>}
{*
 * GstDateTime:
 *
 * Opaque, immutable, refcounted struct that stores date, time and timezone
 * information. It currently supports ranges from `0001-01-01` to
 * `9999-12-31` in the Gregorian proleptic calendar.
 *
 * Use the accessor functions to get the stored values.
  }
type
  var
    _gst_date_time_type : TGType;cvar;external;
{*
 * GST_TYPE_DATE_TIME:
 *
 * a boxed #GValue type for #GstDateTime that represents a date and time.
 *
 * Returns: the #GType of GstDateTime
  }

const
  GST_TYPE_DATE_TIME = _gst_date_time_type;  

function gst_date_time_get_type:TGType;cdecl;external;
{ query which fields are set  }
(* Const before type ignored *)
function gst_date_time_has_year(datetime:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_date_time_has_month(datetime:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_date_time_has_day(datetime:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_date_time_has_time(datetime:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_date_time_has_second(datetime:PGstDateTime):Tgboolean;cdecl;external;
{ field getters  }
(* Const before type ignored *)
function gst_date_time_get_year(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_month(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_day(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_hour(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_minute(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_second(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_microsecond(datetime:PGstDateTime):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_date_time_get_time_zone_offset(datetime:PGstDateTime):Tgfloat;cdecl;external;
{ constructors  }
function gst_date_time_new_from_unix_epoch_local_time(secs:Tgint64):PGstDateTime;cdecl;external;
function gst_date_time_new_from_unix_epoch_utc(secs:Tgint64):PGstDateTime;cdecl;external;
function gst_date_time_new_from_unix_epoch_local_time_usecs(usecs:Tgint64):PGstDateTime;cdecl;external;
function gst_date_time_new_from_unix_epoch_utc_usecs(usecs:Tgint64):PGstDateTime;cdecl;external;
function gst_date_time_new_local_time(year:Tgint; month:Tgint; day:Tgint; hour:Tgint; minute:Tgint; 
           seconds:Tgdouble):PGstDateTime;cdecl;external;
function gst_date_time_new_y(year:Tgint):PGstDateTime;cdecl;external;
function gst_date_time_new_ym(year:Tgint; month:Tgint):PGstDateTime;cdecl;external;
function gst_date_time_new_ymd(year:Tgint; month:Tgint; day:Tgint):PGstDateTime;cdecl;external;
function gst_date_time_new(tzoffset:Tgfloat; year:Tgint; month:Tgint; day:Tgint; hour:Tgint; 
           minute:Tgint; seconds:Tgdouble):PGstDateTime;cdecl;external;
function gst_date_time_new_now_local_time:PGstDateTime;cdecl;external;
function gst_date_time_new_now_utc:PGstDateTime;cdecl;external;
function gst_date_time_to_iso8601_string(datetime:PGstDateTime):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_date_time_new_from_iso8601_string(_string:Pgchar):PGstDateTime;cdecl;external;
function gst_date_time_to_g_date_time(datetime:PGstDateTime):PGDateTime;cdecl;external;
function gst_date_time_new_from_g_date_time(dt:PGDateTime):PGstDateTime;cdecl;external;
{ refcounting  }
function gst_date_time_ref(datetime:PGstDateTime):PGstDateTime;cdecl;external;
procedure gst_date_time_unref(datetime:PGstDateTime);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDateTime, gst_date_time_unref) }
{$endif}
{ __GST_DATE_TIME_H__  }

implementation


end.
