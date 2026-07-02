unit gdkgltexturebuilder;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2023 Benjamin Otte
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

{GDK_DECLARE_INTERNAL_TYPE (GdkGLTextureBuilder, gdk_gl_texture_builder, GDK, GL_TEXTURE_BUILDER, GObject) }
function gdk_gl_texture_builder_new:PGdkGLTextureBuilder;cdecl;external libgtk4;
function gdk_gl_texture_builder_get_context(self:PGdkGLTextureBuilder):PGdkGLContext;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_context(self:PGdkGLTextureBuilder; context:PGdkGLContext);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_id(self:PGdkGLTextureBuilder):Tguint;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_id(self:PGdkGLTextureBuilder; id:Tguint);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_width(self:PGdkGLTextureBuilder):longint;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_width(self:PGdkGLTextureBuilder; width:longint);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_height(self:PGdkGLTextureBuilder):longint;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_height(self:PGdkGLTextureBuilder; height:longint);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_format(self:PGdkGLTextureBuilder):TGdkMemoryFormat;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_format(self:PGdkGLTextureBuilder; format:TGdkMemoryFormat);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_has_mipmap(self:PGdkGLTextureBuilder):Tgboolean;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_has_mipmap(self:PGdkGLTextureBuilder; has_mipmap:Tgboolean);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_sync(self:PGdkGLTextureBuilder):Tgpointer;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_sync(self:PGdkGLTextureBuilder; sync:Tgpointer);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_color_state(self:PGdkGLTextureBuilder):PGdkColorState;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_color_state(self:PGdkGLTextureBuilder; color_state:PGdkColorState);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_update_texture(self:PGdkGLTextureBuilder):PGdkTexture;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_update_texture(self:PGdkGLTextureBuilder; texture:PGdkTexture);cdecl;external libgtk4;
function gdk_gl_texture_builder_get_update_region(self:PGdkGLTextureBuilder):Pcairo_region_t;cdecl;external libgtk4;
procedure gdk_gl_texture_builder_set_update_region(self:PGdkGLTextureBuilder; region:Pcairo_region_t);cdecl;external libgtk4;
function gdk_gl_texture_builder_build(self:PGdkGLTextureBuilder; destroy:TGDestroyNotify; data:Tgpointer):PGdkTexture;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:24:38 ===

function GDK_TYPE_GL_TEXTURE_BUILDER: TGType;
function GDK_GL_TEXTURE_BUILDER(obj: Pointer): PGdkGLTextureBuilder;
function GDK_IS_GL_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
function GDK_GL_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkGLTextureBuilderClass;
function GDK_IS_GL_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
function GDK_GL_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkGLTextureBuilderClass;

implementation

function GDK_TYPE_GL_TEXTURE_BUILDER: TGType;
begin
  Result := gdk_gl_texture_builder_get_type;
end;

function GDK_GL_TEXTURE_BUILDER(obj: Pointer): PGdkGLTextureBuilder;
begin
  Result := PGdkGLTextureBuilder(g_type_check_instance_cast(obj, GDK_TYPE_GL_TEXTURE_BUILDER));
end;

function GDK_IS_GL_TEXTURE_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_GL_TEXTURE_BUILDER);
end;

function GDK_GL_TEXTURE_BUILDER_CLASS(klass: Pointer): PGdkGLTextureBuilderClass;
begin
  Result := PGdkGLTextureBuilderClass(g_type_check_class_cast(klass, GDK_TYPE_GL_TEXTURE_BUILDER));
end;

function GDK_IS_GL_TEXTURE_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_GL_TEXTURE_BUILDER);
end;

function GDK_GL_TEXTURE_BUILDER_GET_CLASS(obj: Pointer): PGdkGLTextureBuilderClass;
begin
  Result := PGdkGLTextureBuilderClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGdkGLTextureBuilder = record
  end;
  PGdkGLTextureBuilder = ^TGdkGLTextureBuilder;

  TGdkGLTextureBuilderClass = record
  end;
  PGdkGLTextureBuilderClass = ^TGdkGLTextureBuilderClass;

function gdk_gl_texture_builder_get_type: TGType; cdecl; external libgxxxxxxx;



end.
