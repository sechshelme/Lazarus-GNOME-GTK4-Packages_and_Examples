unit gstaudioclock;

interface

uses
  fp_glib2, fp_gst;

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


function gst_audio_clock_get_type:TGType;cdecl;external libgstaudio;
function gst_audio_clock_new(name:Pgchar; func:TGstAudioClockGetTimeFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify):PGstClock;cdecl;external libgstaudio;
procedure gst_audio_clock_reset(clock:PGstAudioClock; time:TGstClockTime);cdecl;external libgstaudio;
function gst_audio_clock_get_time(clock:PGstAudioClock):TGstClockTime;cdecl;external libgstaudio;
function gst_audio_clock_adjust(clock:PGstAudioClock; time:TGstClockTime):TGstClockTime;cdecl;external libgstaudio;
procedure gst_audio_clock_invalidate(clock:PGstAudioClock);cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioClock, gst_object_unref) }
{$endif}
{ __GST_AUDIO_CLOCK_H__  }

// === Konventiert am: 16-7-26 15:17:35 ===

function GST_TYPE_AUDIO_CLOCK : TGType;
function GST_AUDIO_CLOCK(obj : Pointer) : PGstAudioClock;
function GST_AUDIO_CLOCK_CLASS(klass : Pointer) : PGstAudioClockClass;
function GST_IS_AUDIO_CLOCK(obj : Pointer) : Tgboolean;
function GST_IS_AUDIO_CLOCK_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_AUDIO_CLOCK : TGType;
  begin
    GST_TYPE_AUDIO_CLOCK:=gst_audio_clock_get_type;
  end;

function GST_AUDIO_CLOCK(obj : Pointer) : PGstAudioClock;
begin
  Result := PGstAudioClock(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_CLOCK));
end;

function GST_AUDIO_CLOCK_CLASS(klass : Pointer) : PGstAudioClockClass;
begin
  Result := PGstAudioClockClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_CLOCK));
end;

function GST_IS_AUDIO_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_AUDIO_CLOCK);
end;

function GST_IS_AUDIO_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_AUDIO_CLOCK);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_CLOCK_CAST(obj : longint) : PGstAudioClock;
begin
  GST_AUDIO_CLOCK_CAST:=PGstAudioClock(obj);
end;


end.
