unit gdkkeys;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

function gdk_keyval_name(keyval:Tguint):Pchar;cdecl;external libgtk4;
function gdk_keyval_from_name(keyval_name:Pchar):Tguint;cdecl;external libgtk4;
procedure gdk_keyval_convert_case(symbol:Tguint; lower:Pguint; upper:Pguint);cdecl;external libgtk4;
function gdk_keyval_to_upper(keyval:Tguint):Tguint;cdecl;external libgtk4;
function gdk_keyval_to_lower(keyval:Tguint):Tguint;cdecl;external libgtk4;
function gdk_keyval_is_upper(keyval:Tguint):Tgboolean;cdecl;external libgtk4;
function gdk_keyval_is_lower(keyval:Tguint):Tgboolean;cdecl;external libgtk4;
function gdk_keyval_to_unicode(keyval:Tguint):Tguint32;cdecl;external libgtk4;
function gdk_unicode_to_keyval(wc:Tguint32):Tguint;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:24:33 ===


implementation



end.
