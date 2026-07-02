unit gdkdmabuftexture;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkdmabuftexture.h
 *
 * Copyright 2023 Red Hat, Inc.
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
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdktexture.h>}

{ was #define dname def_expr }
function GDK_DMABUF_ERROR : longint; { return type might be wrong }

type

function gdk_dmabuf_texture_get_type:TGType;cdecl;external libgtk4;
function gdk_dmabuf_error_quark:TGQuark;cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkDmabufTexture, g_object_unref) }

// === Konventiert am: 2-7-26 19:12:46 ===

function GDK_TYPE_DMABUF_TEXTURE : TGType;
function GDK_DMABUF_TEXTURE(obj : Pointer) : PGdkDmabufTexture;
function GDK_IS_DMABUF_TEXTURE(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DMABUF_TEXTURE : TGType;
  begin
    GDK_TYPE_DMABUF_TEXTURE:=gdk_dmabuf_texture_get_type;
  end;

function GDK_DMABUF_TEXTURE(obj : Pointer) : PGdkDmabufTexture;
begin
  Result := PGdkDmabufTexture(g_type_check_instance_cast(obj, GDK_TYPE_DMABUF_TEXTURE));
end;

function GDK_IS_DMABUF_TEXTURE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DMABUF_TEXTURE);
end;


{ was #define dname def_expr }
function GDK_DMABUF_ERROR : longint; { return type might be wrong }
  begin
    GDK_DMABUF_ERROR:=gdk_dmabuf_error_quark;
  end;


end.
