
unit gdkdrop;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdrop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdrop.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGdkContentFormats  = ^GdkContentFormats;
PGdkDevice  = ^GdkDevice;
PGdkDisplay  = ^GdkDisplay;
PGdkDrag  = ^GdkDrag;
PGdkDrop  = ^GdkDrop;
PGdkSurface  = ^GdkSurface;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_DROP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DROP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DROP(object : longint) : longint;

function gdk_drop_get_type:TGType;cdecl;external;
function gdk_drop_get_display(self:PGdkDrop):PGdkDisplay;cdecl;external;
function gdk_drop_get_device(self:PGdkDrop):PGdkDevice;cdecl;external;
function gdk_drop_get_surface(self:PGdkDrop):PGdkSurface;cdecl;external;
function gdk_drop_get_formats(self:PGdkDrop):PGdkContentFormats;cdecl;external;
function gdk_drop_get_actions(self:PGdkDrop):TGdkDragAction;cdecl;external;
function gdk_drop_get_drag(self:PGdkDrop):PGdkDrag;cdecl;external;
procedure gdk_drop_status(self:PGdkDrop; actions:TGdkDragAction; preferred:TGdkDragAction);cdecl;external;
procedure gdk_drop_finish(self:PGdkDrop; action:TGdkDragAction);cdecl;external;
(* Const before type ignored *)
procedure gdk_drop_read_async(self:PGdkDrop; mime_types:PPchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gdk_drop_read_finish(self:PGdkDrop; result:PGAsyncResult; out_mime_type:PPchar; error:PPGError):PGInputStream;cdecl;external;
procedure gdk_drop_read_value_async(self:PGdkDrop; _type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function gdk_drop_read_value_finish(self:PGdkDrop; result:PGAsyncResult; error:PPGError):PGValue;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDrop, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_DROP : longint; { return type might be wrong }
  begin
    GDK_TYPE_DROP:=gdk_drop_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DROP(object : longint) : longint;
begin
  GDK_DROP:=G_TYPE_CHECK_INSTANCE_CAST(object,GDK_TYPE_DROP,GdkDrop);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DROP(object : longint) : longint;
begin
  GDK_IS_DROP:=G_TYPE_CHECK_INSTANCE_TYPE(object,GDK_TYPE_DROP);
end;


end.
