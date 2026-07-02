unit gdkframeclock;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2010.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdkframetimings.h>}

type
{*
 * GdkFrameClockPhase:
 * @GDK_FRAME_CLOCK_PHASE_NONE: no phase
 * @GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS: corresponds to GdkFrameClock::flush-events. Should not be handled by applications.
 * @GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT: corresponds to GdkFrameClock::before-paint. Should not be handled by applications.
 * @GDK_FRAME_CLOCK_PHASE_UPDATE: corresponds to GdkFrameClock::update.
 * @GDK_FRAME_CLOCK_PHASE_LAYOUT: corresponds to GdkFrameClock::layout. Should not be handled by applications.
 * @GDK_FRAME_CLOCK_PHASE_PAINT: corresponds to GdkFrameClock::paint.
 * @GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS: corresponds to GdkFrameClock::resume-events. Should not be handled by applications.
 * @GDK_FRAME_CLOCK_PHASE_AFTER_PAINT: corresponds to GdkFrameClock::after-paint. Should not be handled by applications.
 *
 * Used to represent the different paint clock phases that can be requested.
 *
 * The elements of the enumeration correspond to the signals of `GdkFrameClock`.
  }

  PGdkFrameClockPhase = ^TGdkFrameClockPhase;
  TGdkFrameClockPhase =  Longint;
  Const
    GDK_FRAME_CLOCK_PHASE_NONE = 0;
    GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS = 1 shl 0;
    GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT = 1 shl 1;
    GDK_FRAME_CLOCK_PHASE_UPDATE = 1 shl 2;
    GDK_FRAME_CLOCK_PHASE_LAYOUT = 1 shl 3;
    GDK_FRAME_CLOCK_PHASE_PAINT = 1 shl 4;
    GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS = 1 shl 5;
    GDK_FRAME_CLOCK_PHASE_AFTER_PAINT = 1 shl 6;
;

function gdk_frame_clock_get_type:TGType;cdecl;external libgtk4;
function gdk_frame_clock_get_frame_time(frame_clock:PGdkFrameClock):Tgint64;cdecl;external libgtk4;
procedure gdk_frame_clock_request_phase(frame_clock:PGdkFrameClock; phase:TGdkFrameClockPhase);cdecl;external libgtk4;
procedure gdk_frame_clock_begin_updating(frame_clock:PGdkFrameClock);cdecl;external libgtk4;
procedure gdk_frame_clock_end_updating(frame_clock:PGdkFrameClock);cdecl;external libgtk4;
{ Frame history  }
function gdk_frame_clock_get_frame_counter(frame_clock:PGdkFrameClock):Tgint64;cdecl;external libgtk4;
function gdk_frame_clock_get_history_start(frame_clock:PGdkFrameClock):Tgint64;cdecl;external libgtk4;
function gdk_frame_clock_get_timings(frame_clock:PGdkFrameClock; frame_counter:Tgint64):PGdkFrameTimings;cdecl;external libgtk4;
function gdk_frame_clock_get_current_timings(frame_clock:PGdkFrameClock):PGdkFrameTimings;cdecl;external libgtk4;
procedure gdk_frame_clock_get_refresh_info(frame_clock:PGdkFrameClock; base_time:Tgint64; refresh_interval_return:Pgint64; presentation_time_return:Pgint64);cdecl;external libgtk4;
function gdk_frame_clock_get_fps(frame_clock:PGdkFrameClock):Tdouble;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkFrameClock, g_object_unref) }

// === Konventiert am: 2-7-26 19:19:30 ===

function GDK_TYPE_FRAME_CLOCK : TGType;
function GDK_FRAME_CLOCK(obj : Pointer) : PGdkFrameClock;
function GDK_FRAME_CLOCK_CLASS(klass : Pointer) : PGdkFrameClockClass;
function GDK_IS_FRAME_CLOCK(obj : Pointer) : Tgboolean;
function GDK_IS_FRAME_CLOCK_CLASS(klass : Pointer) : Tgboolean;
function GDK_FRAME_CLOCK_GET_CLASS(obj : Pointer) : PGdkFrameClockClass;

implementation

function GDK_TYPE_FRAME_CLOCK : TGType;
  begin
    GDK_TYPE_FRAME_CLOCK:=gdk_frame_clock_get_type;
  end;

function GDK_FRAME_CLOCK(obj : Pointer) : PGdkFrameClock;
begin
  Result := PGdkFrameClock(g_type_check_instance_cast(obj, GDK_TYPE_FRAME_CLOCK));
end;

function GDK_FRAME_CLOCK_CLASS(klass : Pointer) : PGdkFrameClockClass;
begin
  Result := PGdkFrameClockClass(g_type_check_class_cast(klass, GDK_TYPE_FRAME_CLOCK));
end;

function GDK_IS_FRAME_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_FRAME_CLOCK);
end;

function GDK_IS_FRAME_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GDK_TYPE_FRAME_CLOCK);
end;

function GDK_FRAME_CLOCK_GET_CLASS(obj : Pointer) : PGdkFrameClockClass;
begin
  Result := PGdkFrameClockClass(PGTypeInstance(obj)^.g_class);
end;



end.
