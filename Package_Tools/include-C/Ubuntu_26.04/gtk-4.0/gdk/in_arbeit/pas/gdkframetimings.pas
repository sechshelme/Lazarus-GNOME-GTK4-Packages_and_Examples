unit gdkframetimings;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2012 Red Hat, Inc.
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
type

function gdk_frame_timings_get_type:TGType;cdecl;external libgtk4;
function gdk_frame_timings_ref(timings:PGdkFrameTimings):PGdkFrameTimings;cdecl;external libgtk4;
procedure gdk_frame_timings_unref(timings:PGdkFrameTimings);cdecl;external libgtk4;
function gdk_frame_timings_get_frame_counter(timings:PGdkFrameTimings):Tgint64;cdecl;external libgtk4;
function gdk_frame_timings_get_complete(timings:PGdkFrameTimings):Tgboolean;cdecl;external libgtk4;
function gdk_frame_timings_get_frame_time(timings:PGdkFrameTimings):Tgint64;cdecl;external libgtk4;
function gdk_frame_timings_get_presentation_time(timings:PGdkFrameTimings):Tgint64;cdecl;external libgtk4;
function gdk_frame_timings_get_refresh_interval(timings:PGdkFrameTimings):Tgint64;cdecl;external libgtk4;
function gdk_frame_timings_get_predicted_presentation_time(timings:PGdkFrameTimings):Tgint64;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkFrameTimings, gdk_frame_timings_unref) }

// === Konventiert am: 2-7-26 19:19:39 ===


implementation



end.
