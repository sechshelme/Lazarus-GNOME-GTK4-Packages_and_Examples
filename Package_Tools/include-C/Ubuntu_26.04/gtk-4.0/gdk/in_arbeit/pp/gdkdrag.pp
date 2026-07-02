
unit gdkdrag;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdrag.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdrag.h
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
PGdkContentFormats  = ^GdkContentFormats;
PGdkContentProvider  = ^GdkContentProvider;
PGdkDevice  = ^GdkDevice;
PGdkDisplay  = ^GdkDisplay;
PGdkDrag  = ^GdkDrag;
PGdkDragCancelReason  = ^GdkDragCancelReason;
PGdkSurface  = ^GdkSurface;
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
{$include <gdk/gdkdevice.h>}
{$include <gdk/gdkevents.h>}

{ was #define dname def_expr }
function GDK_TYPE_DRAG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DRAG(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DRAG(object : longint) : longint;

{*
 * GdkDragCancelReason:
 * @GDK_DRAG_CANCEL_NO_TARGET: There is no suitable drop target.
 * @GDK_DRAG_CANCEL_USER_CANCELLED: Drag cancelled by the user
 * @GDK_DRAG_CANCEL_ERROR: Unspecified error.
 *
 * Used in `GdkDrag` to the reason of a cancelled DND operation.
  }
type
  PGdkDragCancelReason = ^TGdkDragCancelReason;
  TGdkDragCancelReason =  Longint;
  Const
    GDK_DRAG_CANCEL_NO_TARGET = 0;
    GDK_DRAG_CANCEL_USER_CANCELLED = 1;
    GDK_DRAG_CANCEL_ERROR = 2;
;

function gdk_drag_get_type:TGType;cdecl;external;
function gdk_drag_get_display(drag:PGdkDrag):PGdkDisplay;cdecl;external;
function gdk_drag_get_device(drag:PGdkDrag):PGdkDevice;cdecl;external;
function gdk_drag_get_formats(drag:PGdkDrag):PGdkContentFormats;cdecl;external;
function gdk_drag_get_actions(drag:PGdkDrag):TGdkDragAction;cdecl;external;
function gdk_drag_get_selected_action(drag:PGdkDrag):TGdkDragAction;cdecl;external;
function gdk_drag_action_is_unique(action:TGdkDragAction):Tgboolean;cdecl;external;
function gdk_drag_begin(surface:PGdkSurface; device:PGdkDevice; content:PGdkContentProvider; actions:TGdkDragAction; dx:Tdouble; 
           dy:Tdouble):PGdkDrag;cdecl;external;
procedure gdk_drag_drop_done(drag:PGdkDrag; success:Tgboolean);cdecl;external;
function gdk_drag_get_drag_surface(drag:PGdkDrag):PGdkSurface;cdecl;external;
procedure gdk_drag_set_hotspot(drag:PGdkDrag; hot_x:longint; hot_y:longint);cdecl;external;
function gdk_drag_get_content(drag:PGdkDrag):PGdkContentProvider;cdecl;external;
function gdk_drag_get_surface(drag:PGdkDrag):PGdkSurface;cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkDrag, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_DRAG : longint; { return type might be wrong }
  begin
    GDK_TYPE_DRAG:=gdk_drag_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DRAG(object : longint) : longint;
begin
  GDK_DRAG:=G_TYPE_CHECK_INSTANCE_CAST(object,GDK_TYPE_DRAG,GdkDrag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DRAG(object : longint) : longint;
begin
  GDK_IS_DRAG:=G_TYPE_CHECK_INSTANCE_TYPE(object,GDK_TYPE_DRAG);
end;


end.
