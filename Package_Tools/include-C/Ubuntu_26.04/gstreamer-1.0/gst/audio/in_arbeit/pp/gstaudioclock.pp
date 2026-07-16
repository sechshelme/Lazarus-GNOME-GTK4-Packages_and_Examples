
unit gstaudioclock;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudioclock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudioclock.h
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
PGstAudioClock  = ^GstAudioClock;
PGstAudioClockClass  = ^GstAudioClockClass;
PGstClock  = ^GstClock;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstaudioclock.h: Clock for use by audio plugins
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
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_CLOCK_H__}
{$define __GST_AUDIO_CLOCK_H__}
{$include <gst/gst.h>}
{$include <gst/gstsystemclock.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_CLOCK_CAST(obj : longint) : PGstAudioClock;

type
{*
 * GstAudioClockGetTimeFunc:
 * @clock: the #GstAudioClock
 * @user_data: user data
 *
 * This function will be called whenever the current clock time needs to be
 * calculated. If this function returns #GST_CLOCK_TIME_NONE, the last reported
 * time will be returned by the clock.
 *
 * Returns: the current time or #GST_CLOCK_TIME_NONE if the previous time should
 * be used.
  }

  TGstAudioClockGetTimeFunc = function (clock:PGstClock; user_data:Tgpointer):TGstClockTime;cdecl;
{*
 * GstAudioClock:
 *
 * Opaque #GstAudioClock.
  }
{< protected > }
{< private > }
  PGstAudioClock = ^TGstAudioClock;
  TGstAudioClock = record
      clock : TGstSystemClock;cdecl;
      func : TGstAudioClockGetTimeFunc;
      user_data : Tgpointer;
      destroy_notify : TGDestroyNotify;
      last_time : TGstClockTime;
      time_offset : TGstClockTimeDiff;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstAudioClockClass = ^TGstAudioClockClass;
  TGstAudioClockClass = record
      parent_class : TGstSystemClockClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_clock_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_clock_new(name:Pgchar; func:TGstAudioClockGetTimeFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify):PGstClock;cdecl;external;
procedure gst_audio_clock_reset(clock:PGstAudioClock; time:TGstClockTime);cdecl;external;
function gst_audio_clock_get_time(clock:PGstAudioClock):TGstClockTime;cdecl;external;
function gst_audio_clock_adjust(clock:PGstAudioClock; time:TGstClockTime):TGstClockTime;cdecl;external;
procedure gst_audio_clock_invalidate(clock:PGstAudioClock);cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioClock, gst_object_unref) }
{$endif}
{ __GST_AUDIO_CLOCK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_CLOCK : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_CLOCK:=gst_audio_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CLOCK(obj : longint) : longint;
begin
  GST_AUDIO_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_CLOCK,GstAudioClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_CLOCK,GstAudioClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CLOCK(obj : longint) : longint;
begin
  GST_IS_AUDIO_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_CLOCK_CAST(obj : longint) : PGstAudioClock;
begin
  GST_AUDIO_CLOCK_CAST:=PGstAudioClock(obj);
end;


end.
