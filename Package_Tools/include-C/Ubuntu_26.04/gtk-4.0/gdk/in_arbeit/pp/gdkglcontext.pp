
unit gdkglcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkglcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkglcontext.h
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
PGdkDisplay  = ^GdkDisplay;
PGdkGLContext  = ^GdkGLContext;
PGdkSurface  = ^GdkSurface;
PGError  = ^GError;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * gdkglcontext.h: GL context abstraction
 *
 * Copyright © 2014  Emmanuele Bassi
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
function GDK_TYPE_GL_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_GL_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_GL_CONTEXT(obj : longint) : longint;

{ was #define dname def_expr }
function GDK_GL_ERROR : longint; { return type might be wrong }

function gdk_gl_error_quark:TGQuark;cdecl;external;
function gdk_gl_context_get_type:TGType;cdecl;external;
function gdk_gl_context_get_display(context:PGdkGLContext):PGdkDisplay;cdecl;external;
function gdk_gl_context_get_surface(context:PGdkGLContext):PGdkSurface;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gdk_gl_context_is_shared) }
function gdk_gl_context_get_shared_context(context:PGdkGLContext):PGdkGLContext;cdecl;external;
procedure gdk_gl_context_get_version(context:PGdkGLContext; major:Plongint; minor:Plongint);cdecl;external;
function gdk_gl_context_is_legacy(context:PGdkGLContext):Tgboolean;cdecl;external;
function gdk_gl_context_is_shared(self:PGdkGLContext; other:PGdkGLContext):Tgboolean;cdecl;external;
procedure gdk_gl_context_set_required_version(context:PGdkGLContext; major:longint; minor:longint);cdecl;external;
procedure gdk_gl_context_get_required_version(context:PGdkGLContext; major:Plongint; minor:Plongint);cdecl;external;
procedure gdk_gl_context_set_debug_enabled(context:PGdkGLContext; enabled:Tgboolean);cdecl;external;
function gdk_gl_context_get_debug_enabled(context:PGdkGLContext):Tgboolean;cdecl;external;
procedure gdk_gl_context_set_forward_compatible(context:PGdkGLContext; compatible:Tgboolean);cdecl;external;
function gdk_gl_context_get_forward_compatible(context:PGdkGLContext):Tgboolean;cdecl;external;
procedure gdk_gl_context_set_allowed_apis(self:PGdkGLContext; apis:TGdkGLAPI);cdecl;external;
function gdk_gl_context_get_allowed_apis(self:PGdkGLContext):TGdkGLAPI;cdecl;external;
function gdk_gl_context_get_api(self:PGdkGLContext):TGdkGLAPI;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_6_FOR(gdk_gl_context_set_allowed_apis) }
procedure gdk_gl_context_set_use_es(context:PGdkGLContext; use_es:longint);cdecl;external;
function gdk_gl_context_get_use_es(context:PGdkGLContext):Tgboolean;cdecl;external;
function gdk_gl_context_realize(context:PGdkGLContext; error:PPGError):Tgboolean;cdecl;external;
procedure gdk_gl_context_make_current(context:PGdkGLContext);cdecl;external;
function gdk_gl_context_get_current:PGdkGLContext;cdecl;external;
procedure gdk_gl_context_clear_current;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkGLContext, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_GL_CONTEXT : longint; { return type might be wrong }
  begin
    GDK_TYPE_GL_CONTEXT:=gdk_gl_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_GL_CONTEXT(obj : longint) : longint;
begin
  GDK_GL_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_GL_CONTEXT,GdkGLContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_GL_CONTEXT(obj : longint) : longint;
begin
  GDK_IS_GL_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_GL_CONTEXT);
end;

{ was #define dname def_expr }
function GDK_GL_ERROR : longint; { return type might be wrong }
  begin
    GDK_GL_ERROR:=gdk_gl_error_quark;
  end;


end.
