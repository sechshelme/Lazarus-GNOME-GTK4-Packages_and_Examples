
unit gstsystemclock;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstsystemclock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstsystemclock.h
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
PGstClock  = ^GstClock;
PGstClockType  = ^GstClockType;
PGstSystemClock  = ^GstSystemClock;
PGstSystemClockClass  = ^GstSystemClockClass;
PGstSystemClockPrivate  = ^GstSystemClockPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstsystemclock.h: A clock implementation based on system time
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
{$ifndef __GST_SYSTEM_CLOCK_H__}
{$define __GST_SYSTEM_CLOCK_H__}
{$include <gst/gstclock.h>}

{ was #define dname def_expr }
function GST_TYPE_SYSTEM_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SYSTEM_CLOCK_CAST(obj : longint) : PGstSystemClock;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYSTEM_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYSTEM_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK_GET_CLASS(obj : longint) : longint;

type
{*
 * GstClockType:
 * @GST_CLOCK_TYPE_REALTIME: time since Epoch
 * @GST_CLOCK_TYPE_MONOTONIC: monotonic time since some unspecified starting
 *                            point
 * @GST_CLOCK_TYPE_OTHER: some other time source is used (Since: 1.0.5)
 * @GST_CLOCK_TYPE_TAI: time since Epoch, but using International Atomic Time
 *                      as reference (Since: 1.18)
 *
 * The different kind of clocks.
  }

  PGstClockType = ^TGstClockType;
  TGstClockType =  Longint;
  Const
    GST_CLOCK_TYPE_REALTIME = 0;
    GST_CLOCK_TYPE_MONOTONIC = 1;
    GST_CLOCK_TYPE_OTHER = 2;
    GST_CLOCK_TYPE_TAI = 3;
;
{*
 * GstSystemClock:
 *
 * The default implementation of a #GstClock that uses the system time.
  }
{< private > }
type
  PGstSystemClock = ^TGstSystemClock;
  TGstSystemClock = record
      clock : TGstClock;
      priv : PGstSystemClockPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstSystemClockClass = ^TGstSystemClockClass;
  TGstSystemClockClass = record
      parent_class : TGstClockClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_system_clock_get_type:TGType;cdecl;external;
function gst_system_clock_obtain:PGstClock;cdecl;external;
procedure gst_system_clock_set_default(new_clock:PGstClock);cdecl;external;
function gst_clock_is_system_monotonic(clock:PGstClock):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstSystemClock, gst_object_unref) }
{$endif}
{ __GST_SYSTEM_CLOCK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_SYSTEM_CLOCK : longint; { return type might be wrong }
  begin
    GST_TYPE_SYSTEM_CLOCK:=gst_system_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK(obj : longint) : longint;
begin
  GST_SYSTEM_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_SYSTEM_CLOCK,GstSystemClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SYSTEM_CLOCK_CAST(obj : longint) : PGstSystemClock;
begin
  GST_SYSTEM_CLOCK_CAST:=PGstSystemClock(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYSTEM_CLOCK(obj : longint) : longint;
begin
  GST_IS_SYSTEM_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_SYSTEM_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_SYSTEM_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_SYSTEM_CLOCK,GstSystemClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYSTEM_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_IS_SYSTEM_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_SYSTEM_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SYSTEM_CLOCK_GET_CLASS(obj : longint) : longint;
begin
  GST_SYSTEM_CLOCK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_SYSTEM_CLOCK,GstSystemClockClass);
end;


end.
