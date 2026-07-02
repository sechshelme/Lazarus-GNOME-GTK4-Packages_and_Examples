
unit gdkgltexture;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkgltexture.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkgltexture.h
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
PGdkGLContext  = ^GdkGLContext;
PGdkGLTexture  = ^GdkGLTexture;
PGdkTexture  = ^GdkTexture;
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

{ was #define dname def_expr }
function GDK_TYPE_GL_TEXTURE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_GL_TEXTURE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_GL_TEXTURE(obj : longint) : longint;

type

function gdk_gl_texture_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(GdkGLTextureBuilder) }
function gdk_gl_texture_new(context:PGdkGLContext; id:Tguint; width:longint; height:longint; destroy:TGDestroyNotify; 
           data:Tgpointer):PGdkTexture;cdecl;external;
procedure gdk_gl_texture_release(self:PGdkGLTexture);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkGLTexture, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_GL_TEXTURE : longint; { return type might be wrong }
  begin
    GDK_TYPE_GL_TEXTURE:=gdk_gl_texture_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_GL_TEXTURE(obj : longint) : longint;
begin
  GDK_GL_TEXTURE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_GL_TEXTURE,GdkGLTexture);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_GL_TEXTURE(obj : longint) : longint;
begin
  GDK_IS_GL_TEXTURE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_GL_TEXTURE);
end;


end.
