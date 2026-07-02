unit gdkdrawcontext;

interface

uses
  fp_glib2, fp_gtk4;

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

function gdk_draw_context_get_type:TGType;cdecl;external libgtk4;
function gdk_draw_context_get_display(context:PGdkDrawContext):PGdkDisplay;cdecl;external libgtk4;
function gdk_draw_context_get_surface(context:PGdkDrawContext):PGdkSurface;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
procedure gdk_draw_context_begin_frame(context:PGdkDrawContext; region:Pcairo_region_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
procedure gdk_draw_context_end_frame(context:PGdkDrawContext);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
function gdk_draw_context_is_in_frame(context:PGdkDrawContext):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
function gdk_draw_context_get_frame_region(context:PGdkDrawContext):Pcairo_region_t;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDrawContext, g_object_unref) }

// === Konventiert am: 2-7-26 19:17:50 ===

function GDK_TYPE_DRAW_CONTEXT : TGType;
function GDK_DRAW_CONTEXT(obj : Pointer) : PGdkDrawContext;
function GDK_IS_DRAW_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DRAW_CONTEXT : TGType;
  begin
    GDK_TYPE_DRAW_CONTEXT:=gdk_draw_context_get_type;
  end;

function GDK_DRAW_CONTEXT(obj : Pointer) : PGdkDrawContext;
begin
  Result := PGdkDrawContext(g_type_check_instance_cast(obj, GDK_TYPE_DRAW_CONTEXT));
end;

function GDK_IS_DRAW_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DRAW_CONTEXT);
end;



end.
