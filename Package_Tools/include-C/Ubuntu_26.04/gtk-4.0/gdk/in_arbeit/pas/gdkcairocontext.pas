unit gdkcairocontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * gdkcairocontext.h:  specific Cairo wrappers
 *
 * Copyright © 2018  Benjamin Otte
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
function GDK_CAIRO_ERROR : longint; { return type might be wrong }

function gdk_cairo_context_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_18_FOR(gsk_cairo_node_get_draw_context) }
function gdk_cairo_context_cairo_create(self:PGdkCairoContext):Pcairo_t;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 17:35:42 ===

function GDK_TYPE_CAIRO_CONTEXT : TGType;
function GDK_CAIRO_CONTEXT(obj : Pointer) : PGdkCairoContext;
function GDK_IS_CAIRO_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_CAIRO_CONTEXT : TGType;
  begin
    GDK_TYPE_CAIRO_CONTEXT:=gdk_cairo_context_get_type;
  end;

function GDK_CAIRO_CONTEXT(obj : Pointer) : PGdkCairoContext;
begin
  Result := PGdkCairoContext(g_type_check_instance_cast(obj, GDK_TYPE_CAIRO_CONTEXT));
end;

function GDK_IS_CAIRO_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_CAIRO_CONTEXT);
end;


{ was #define dname def_expr }
function GDK_CAIRO_ERROR : longint; { return type might be wrong }
  begin
    GDK_CAIRO_ERROR:=gdk_cairo_error_quark;
  end;


end.
