unit gskcairorenderer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2016  Endless 
 *             2018  Benjamin Otte
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
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <cairo.h>}
{$include <gsk/gskrenderer.h>}

{*
 * GskCairoRenderer:
 *
 * Renders a GSK rendernode tree with cairo.
 *
 * Since it is using cairo, this renderer cannot support
 * 3D transformations.
  }
type

function gsk_cairo_renderer_get_type:TGType;cdecl;external libgtk4;
function gsk_cairo_renderer_new:PGskRenderer;cdecl;external libgtk4;

// === Konventiert am: 4-7-26 20:09:21 ===

function GSK_TYPE_CAIRO_RENDERER : TGType;
function GSK_CAIRO_RENDERER(obj : Pointer) : PGskCairoRenderer;
function GSK_CAIRO_RENDERER_CLASS(klass : Pointer) : PGskCairoRendererClass;
function GSK_IS_CAIRO_RENDERER(obj : Pointer) : Tgboolean;
function GSK_IS_CAIRO_RENDERER_CLASS(klass : Pointer) : Tgboolean;
function GSK_CAIRO_RENDERER_GET_CLASS(obj : Pointer) : PGskCairoRendererClass;

implementation

function GSK_TYPE_CAIRO_RENDERER : TGType;
  begin
    GSK_TYPE_CAIRO_RENDERER:=gsk_cairo_renderer_get_type;
  end;

function GSK_CAIRO_RENDERER(obj : Pointer) : PGskCairoRenderer;
begin
  Result := PGskCairoRenderer(g_type_check_instance_cast(obj, GSK_TYPE_CAIRO_RENDERER));
end;

function GSK_CAIRO_RENDERER_CLASS(klass : Pointer) : PGskCairoRendererClass;
begin
  Result := PGskCairoRendererClass(g_type_check_class_cast(klass, GSK_TYPE_CAIRO_RENDERER));
end;

function GSK_IS_CAIRO_RENDERER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GSK_TYPE_CAIRO_RENDERER);
end;

function GSK_IS_CAIRO_RENDERER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GSK_TYPE_CAIRO_RENDERER);
end;

function GSK_CAIRO_RENDERER_GET_CLASS(obj : Pointer) : PGskCairoRendererClass;
begin
  Result := PGskCairoRendererClass(PGTypeInstance(obj)^.g_class);
end;



end.
