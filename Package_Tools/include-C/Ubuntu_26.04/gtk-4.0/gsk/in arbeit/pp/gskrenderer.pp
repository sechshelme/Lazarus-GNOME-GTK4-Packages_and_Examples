
unit gskrenderer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskrenderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskrenderer.h
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
PGdkSurface  = ^GdkSurface;
PGdkTexture  = ^GdkTexture;
PGError  = ^GError;
Pgraphene_rect_t  = ^graphene_rect_t;
PGskRenderer  = ^GskRenderer;
PGskRenderNode  = ^GskRenderNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}
{$include <gsk/gskrendernode.h>}

{ was #define dname def_expr }
function GSK_TYPE_RENDERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_RENDERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_IS_RENDERER(obj : longint) : longint;

type

function gsk_renderer_get_type:TGType;cdecl;external;
function gsk_renderer_new_for_surface(surface:PGdkSurface):PGskRenderer;cdecl;external;
function gsk_renderer_get_surface(renderer:PGskRenderer):PGdkSurface;cdecl;external;
function gsk_renderer_realize(renderer:PGskRenderer; surface:PGdkSurface; error:PPGError):Tgboolean;cdecl;external;
function gsk_renderer_realize_for_display(renderer:PGskRenderer; display:PGdkDisplay; error:PPGError):Tgboolean;cdecl;external;
procedure gsk_renderer_unrealize(renderer:PGskRenderer);cdecl;external;
function gsk_renderer_is_realized(renderer:PGskRenderer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsk_renderer_render_texture(renderer:PGskRenderer; root:PGskRenderNode; viewport:Pgraphene_rect_t):PGdkTexture;cdecl;external;
(* Const before type ignored *)
procedure gsk_renderer_render(renderer:PGskRenderer; root:PGskRenderNode; region:Pcairo_region_t);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskRenderer, g_object_unref) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_RENDERER : longint; { return type might be wrong }
  begin
    GSK_TYPE_RENDERER:=gsk_renderer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_RENDERER(obj : longint) : longint;
begin
  GSK_RENDERER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GSK_TYPE_RENDERER,GskRenderer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_IS_RENDERER(obj : longint) : longint;
begin
  GSK_IS_RENDERER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GSK_TYPE_RENDERER);
end;


end.
