
unit gdkdrawcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdrawcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdrawcontext.h
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
Pcairo_region_t  = ^cairo_region_t;
PGdkDisplay  = ^GdkDisplay;
PGdkDrawContext  = ^GdkDrawContext;
PGdkSurface  = ^GdkSurface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * gdkdrawcontext.h: base class for rendering system support
 *
 * Copyright © 2016  Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_DRAW_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DRAW_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DRAW_CONTEXT(obj : longint) : longint;

function gdk_draw_context_get_type:TGType;cdecl;external;
function gdk_draw_context_get_display(context:PGdkDrawContext):PGdkDisplay;cdecl;external;
function gdk_draw_context_get_surface(context:PGdkDrawContext):PGdkSurface;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
(* Const before type ignored *)
procedure gdk_draw_context_begin_frame(context:PGdkDrawContext; region:Pcairo_region_t);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
procedure gdk_draw_context_end_frame(context:PGdkDrawContext);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
function gdk_draw_context_is_in_frame(context:PGdkDrawContext):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
(* Const before type ignored *)
function gdk_draw_context_get_frame_region(context:PGdkDrawContext):Pcairo_region_t;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDrawContext, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_DRAW_CONTEXT : longint; { return type might be wrong }
  begin
    GDK_TYPE_DRAW_CONTEXT:=gdk_draw_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DRAW_CONTEXT(obj : longint) : longint;
begin
  GDK_DRAW_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_DRAW_CONTEXT,GdkDrawContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DRAW_CONTEXT(obj : longint) : longint;
begin
  GDK_IS_DRAW_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_DRAW_CONTEXT);
end;


end.
