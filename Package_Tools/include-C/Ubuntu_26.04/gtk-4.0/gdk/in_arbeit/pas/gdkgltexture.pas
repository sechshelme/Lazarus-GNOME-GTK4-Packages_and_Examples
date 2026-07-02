unit gdkgltexture;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdktexture.h
 *
 * Copyright 2016  Benjamin Otte
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
{$include <gdk/gdkglcontext.h>}
{$include <gdk/gdktexture.h>}

type

function gdk_gl_texture_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(GdkGLTextureBuilder) }
function gdk_gl_texture_new(context:PGdkGLContext; id:Tguint; width:longint; height:longint; destroy:TGDestroyNotify; 
           data:Tgpointer):PGdkTexture;cdecl;external libgtk4;
procedure gdk_gl_texture_release(self:PGdkGLTexture);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkGLTexture, g_object_unref) }

// === Konventiert am: 2-7-26 19:24:44 ===

function GDK_TYPE_GL_TEXTURE : TGType;
function GDK_GL_TEXTURE(obj : Pointer) : PGdkGLTexture;
function GDK_IS_GL_TEXTURE(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_GL_TEXTURE : TGType;
  begin
    GDK_TYPE_GL_TEXTURE:=gdk_gl_texture_get_type;
  end;

function GDK_GL_TEXTURE(obj : Pointer) : PGdkGLTexture;
begin
  Result := PGdkGLTexture(g_type_check_instance_cast(obj, GDK_TYPE_GL_TEXTURE));
end;

function GDK_IS_GL_TEXTURE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_GL_TEXTURE);
end;



end.
