
unit gdkgltexturebuilder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkgltexturebuilder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkgltexturebuilder.h
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
PGdkColorState  = ^GdkColorState;
PGdkGLContext  = ^GdkGLContext;
PGdkGLTextureBuilder  = ^GdkGLTextureBuilder;
PGdkTexture  = ^GdkTexture;
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

{ was #define dname def_expr }
function GDK_TYPE_GL_TEXTURE_BUILDER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GdkGLTextureBuilder, gdk_gl_texture_builder, GDK, GL_TEXTURE_BUILDER, GObject) }
function gdk_gl_texture_builder_new:PGdkGLTextureBuilder;cdecl;external;
function gdk_gl_texture_builder_get_context(self:PGdkGLTextureBuilder):PGdkGLContext;cdecl;external;
procedure gdk_gl_texture_builder_set_context(self:PGdkGLTextureBuilder; context:PGdkGLContext);cdecl;external;
function gdk_gl_texture_builder_get_id(self:PGdkGLTextureBuilder):Tguint;cdecl;external;
procedure gdk_gl_texture_builder_set_id(self:PGdkGLTextureBuilder; id:Tguint);cdecl;external;
function gdk_gl_texture_builder_get_width(self:PGdkGLTextureBuilder):longint;cdecl;external;
procedure gdk_gl_texture_builder_set_width(self:PGdkGLTextureBuilder; width:longint);cdecl;external;
function gdk_gl_texture_builder_get_height(self:PGdkGLTextureBuilder):longint;cdecl;external;
procedure gdk_gl_texture_builder_set_height(self:PGdkGLTextureBuilder; height:longint);cdecl;external;
function gdk_gl_texture_builder_get_format(self:PGdkGLTextureBuilder):TGdkMemoryFormat;cdecl;external;
procedure gdk_gl_texture_builder_set_format(self:PGdkGLTextureBuilder; format:TGdkMemoryFormat);cdecl;external;
function gdk_gl_texture_builder_get_has_mipmap(self:PGdkGLTextureBuilder):Tgboolean;cdecl;external;
procedure gdk_gl_texture_builder_set_has_mipmap(self:PGdkGLTextureBuilder; has_mipmap:Tgboolean);cdecl;external;
function gdk_gl_texture_builder_get_sync(self:PGdkGLTextureBuilder):Tgpointer;cdecl;external;
procedure gdk_gl_texture_builder_set_sync(self:PGdkGLTextureBuilder; sync:Tgpointer);cdecl;external;
function gdk_gl_texture_builder_get_color_state(self:PGdkGLTextureBuilder):PGdkColorState;cdecl;external;
procedure gdk_gl_texture_builder_set_color_state(self:PGdkGLTextureBuilder; color_state:PGdkColorState);cdecl;external;
function gdk_gl_texture_builder_get_update_texture(self:PGdkGLTextureBuilder):PGdkTexture;cdecl;external;
procedure gdk_gl_texture_builder_set_update_texture(self:PGdkGLTextureBuilder; texture:PGdkTexture);cdecl;external;
function gdk_gl_texture_builder_get_update_region(self:PGdkGLTextureBuilder):Pcairo_region_t;cdecl;external;
procedure gdk_gl_texture_builder_set_update_region(self:PGdkGLTextureBuilder; region:Pcairo_region_t);cdecl;external;
function gdk_gl_texture_builder_build(self:PGdkGLTextureBuilder; destroy:TGDestroyNotify; data:Tgpointer):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_GL_TEXTURE_BUILDER : longint; { return type might be wrong }
  begin
    GDK_TYPE_GL_TEXTURE_BUILDER:=gdk_gl_texture_builder_get_type;
  end;


end.
