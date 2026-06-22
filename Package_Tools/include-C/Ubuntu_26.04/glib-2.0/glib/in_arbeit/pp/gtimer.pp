
unit gtimer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtimer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtimer.h
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
PGTimer  = ^GTimer;
PGTimeVal  = ^GTimeVal;
Pgulong  = ^gulong;
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
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
{$ifndef __G_TIMER_H__}
{$define __G_TIMER_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{ Timer
  }
{ microseconds per second  }
type

const
  G_USEC_PER_SEC = 1000000;  

{ was #define dname def_expr }
function G_NSEC_PER_SEC : longint; { return type might be wrong }

function g_timer_new:PGTimer;cdecl;external;
procedure g_timer_destroy(timer:PGTimer);cdecl;external;
procedure g_timer_start(timer:PGTimer);cdecl;external;
procedure g_timer_stop(timer:PGTimer);cdecl;external;
procedure g_timer_reset(timer:PGTimer);cdecl;external;
procedure g_timer_continue(timer:PGTimer);cdecl;external;
function g_timer_elapsed(timer:PGTimer; microseconds:Pgulong):Tgdouble;cdecl;external;
function g_timer_is_active(timer:PGTimer):Tgboolean;cdecl;external;
procedure g_usleep(microseconds:Tgulong);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62 }
procedure g_time_val_add(time_:PGTimeVal; microseconds:Tglong);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_time_new_from_iso8601) }
(* Const before type ignored *)
function g_time_val_from_iso8601(iso_date:Pgchar; time_:PGTimeVal):Tgboolean;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_date_time_format) }
function g_time_val_to_iso8601(time_:PGTimeVal):Pgchar;cdecl;external;
{$endif}
{ __G_TIMER_H__  }

implementation

{ was #define dname def_expr }
function G_NSEC_PER_SEC : longint; { return type might be wrong }
  begin
    G_NSEC_PER_SEC:=G_GUINT64_CONSTANT(1000000000);
  end;


end.
