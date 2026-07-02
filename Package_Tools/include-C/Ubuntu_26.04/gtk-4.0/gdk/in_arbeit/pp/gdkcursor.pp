
unit gdkcursor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkcursor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkcursor.h
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
Pchar  = ^char;
PGdkCursor  = ^GdkCursor;
PGdkCursorGetTextureCallback  = ^GdkCursorGetTextureCallback;
PGdkTexture  = ^GdkTexture;
Plongint  = ^longint;
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

{ was #define dname def_expr }
function GDK_TYPE_CURSOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CURSOR(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CURSOR(object : longint) : longint;

{ Cursors
  }
function gdk_cursor_get_type:TGType;cdecl;external;
function gdk_cursor_new_from_texture(texture:PGdkTexture; hotspot_x:longint; hotspot_y:longint; fallback:PGdkCursor):PGdkCursor;cdecl;external;
(* Const before type ignored *)
function gdk_cursor_new_from_name(name:Pchar; fallback:PGdkCursor):PGdkCursor;cdecl;external;
{*
 * GdkCursorGetTextureCallback:
 * @cursor: the `GdkCursor`
 * @cursor_size: the nominal cursor size, in application pixels
 * @scale: the device scale
 * @width: (out): return location for the actual cursor width,
 *   in application pixels
 * @height: (out): return location for the actual cursor height,
 *   in application pixels
 * @hotspot_x: (out): return location for the hotspot X position,
 *   in application pixels
 * @hotspot_y: (out): return location for the hotspot Y position,
 *   in application pixels
 * @data: User data for the callback
 *
 * The type of callback used by a dynamic `GdkCursor` to generate
 * a texture for the cursor image at the given @cursor_size
 * and @scale.
 *
 * The actual cursor size in application pixels may be different
 * from @cursor_size x @cursor_size, and will be returned in
 * @width, @height. The returned texture should have a size that
 * corresponds to the actual cursor size, in device pixels (i.e.
 * application pixels, multiplied by @scale).
 *
 * This function may fail and return `NULL`, in which case
 * the fallback cursor will be used.
 *
 * Returns: (nullable) (transfer full): the cursor image, or
 *   `NULL` if none could be produced.
  }
type
  PGdkCursorGetTextureCallback = ^TGdkCursorGetTextureCallback;
  TGdkCursorGetTextureCallback = function (cursor:PGdkCursor; cursor_size:longint; scale:Tdouble; width:Plongint; height:Plongint; 
               hotspot_x:Plongint; hotspot_y:Plongint; data:Tgpointer):PGdkTexture;cdecl;

function gdk_cursor_new_from_callback(callback:TGdkCursorGetTextureCallback; data:Tgpointer; destroy:TGDestroyNotify; fallback:PGdkCursor):PGdkCursor;cdecl;external;
function gdk_cursor_get_fallback(cursor:PGdkCursor):PGdkCursor;cdecl;external;
(* Const before type ignored *)
function gdk_cursor_get_name(cursor:PGdkCursor):Pchar;cdecl;external;
function gdk_cursor_get_texture(cursor:PGdkCursor):PGdkTexture;cdecl;external;
function gdk_cursor_get_hotspot_x(cursor:PGdkCursor):longint;cdecl;external;
function gdk_cursor_get_hotspot_y(cursor:PGdkCursor):longint;cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkCursor, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_CURSOR : longint; { return type might be wrong }
  begin
    GDK_TYPE_CURSOR:=gdk_cursor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_CURSOR(object : longint) : longint;
begin
  GDK_CURSOR:=G_TYPE_CHECK_INSTANCE_CAST(object,GDK_TYPE_CURSOR,GdkCursor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_CURSOR(object : longint) : longint;
begin
  GDK_IS_CURSOR:=G_TYPE_CHECK_INSTANCE_TYPE(object,GDK_TYPE_CURSOR);
end;


end.
