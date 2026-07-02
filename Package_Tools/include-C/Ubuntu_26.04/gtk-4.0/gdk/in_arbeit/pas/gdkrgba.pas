unit gdkrgba;

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
type
  PGdkRGBA = ^TGdkRGBA;
  TGdkRGBA = record
      red : single;
      green : single;
      blue : single;
      alpha : single;
    end;


function gdk_rgba_get_type:TGType;cdecl;external libgtk4;
function gdk_rgba_copy(rgba:PGdkRGBA):PGdkRGBA;cdecl;external libgtk4;
procedure gdk_rgba_free(rgba:PGdkRGBA);cdecl;external libgtk4;
function gdk_rgba_is_clear(rgba:PGdkRGBA):Tgboolean;cdecl;external libgtk4;
function gdk_rgba_is_opaque(rgba:PGdkRGBA):Tgboolean;cdecl;external libgtk4;
function gdk_rgba_hash(p:Tgconstpointer):Tguint;cdecl;external libgtk4;
function gdk_rgba_equal(p1:Tgconstpointer; p2:Tgconstpointer):Tgboolean;cdecl;external libgtk4;
function gdk_rgba_parse(rgba:PGdkRGBA; spec:Pchar):Tgboolean;cdecl;external libgtk4;
function gdk_rgba_to_string(rgba:PGdkRGBA):Pchar;cdecl;external libgtk4;
function gdk_rgba_print(rgba:PGdkRGBA; _string:PGString):PGString;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkRGBA, gdk_rgba_free) }

// === Konventiert am: 2-7-26 19:26:33 ===

function GDK_TYPE_RGBA : TGType;

implementation

function GDK_TYPE_RGBA : TGType;
  begin
    GDK_TYPE_RGBA:=gdk_rgba_get_type;
  end;



end.
