unit gdkglcontext;

interface

uses
  fp_glib2, fp_gtk4;

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
function GDK_GL_ERROR : longint; { return type might be wrong }

function gdk_gl_error_quark:TGQuark;cdecl;external libgtk4;
function gdk_gl_context_get_type:TGType;cdecl;external libgtk4;
function gdk_gl_context_get_display(context:PGdkGLContext):PGdkDisplay;cdecl;external libgtk4;
function gdk_gl_context_get_surface(context:PGdkGLContext):PGdkSurface;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gdk_gl_context_is_shared) }
function gdk_gl_context_get_shared_context(context:PGdkGLContext):PGdkGLContext;cdecl;external libgtk4;
procedure gdk_gl_context_get_version(context:PGdkGLContext; major:Plongint; minor:Plongint);cdecl;external libgtk4;
function gdk_gl_context_is_legacy(context:PGdkGLContext):Tgboolean;cdecl;external libgtk4;
function gdk_gl_context_is_shared(self:PGdkGLContext; other:PGdkGLContext):Tgboolean;cdecl;external libgtk4;
procedure gdk_gl_context_set_required_version(context:PGdkGLContext; major:longint; minor:longint);cdecl;external libgtk4;
procedure gdk_gl_context_get_required_version(context:PGdkGLContext; major:Plongint; minor:Plongint);cdecl;external libgtk4;
procedure gdk_gl_context_set_debug_enabled(context:PGdkGLContext; enabled:Tgboolean);cdecl;external libgtk4;
function gdk_gl_context_get_debug_enabled(context:PGdkGLContext):Tgboolean;cdecl;external libgtk4;
procedure gdk_gl_context_set_forward_compatible(context:PGdkGLContext; compatible:Tgboolean);cdecl;external libgtk4;
function gdk_gl_context_get_forward_compatible(context:PGdkGLContext):Tgboolean;cdecl;external libgtk4;
procedure gdk_gl_context_set_allowed_apis(self:PGdkGLContext; apis:TGdkGLAPI);cdecl;external libgtk4;
function gdk_gl_context_get_allowed_apis(self:PGdkGLContext):TGdkGLAPI;cdecl;external libgtk4;
function gdk_gl_context_get_api(self:PGdkGLContext):TGdkGLAPI;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_6_FOR(gdk_gl_context_set_allowed_apis) }
procedure gdk_gl_context_set_use_es(context:PGdkGLContext; use_es:longint);cdecl;external libgtk4;
function gdk_gl_context_get_use_es(context:PGdkGLContext):Tgboolean;cdecl;external libgtk4;
function gdk_gl_context_realize(context:PGdkGLContext; error:PPGError):Tgboolean;cdecl;external libgtk4;
procedure gdk_gl_context_make_current(context:PGdkGLContext);cdecl;external libgtk4;
function gdk_gl_context_get_current:PGdkGLContext;cdecl;external libgtk4;
procedure gdk_gl_context_clear_current;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkGLContext, g_object_unref) }

// === Konventiert am: 2-7-26 19:19:47 ===

function GDK_TYPE_GL_CONTEXT : TGType;
function GDK_GL_CONTEXT(obj : Pointer) : PGdkGLContext;
function GDK_IS_GL_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_GL_CONTEXT : TGType;
  begin
    GDK_TYPE_GL_CONTEXT:=gdk_gl_context_get_type;
  end;

function GDK_GL_CONTEXT(obj : Pointer) : PGdkGLContext;
begin
  Result := PGdkGLContext(g_type_check_instance_cast(obj, GDK_TYPE_GL_CONTEXT));
end;

function GDK_IS_GL_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_GL_CONTEXT);
end;


{ was #define dname def_expr }
function GDK_GL_ERROR : longint; { return type might be wrong }
  begin
    GDK_GL_ERROR:=gdk_gl_error_quark;
  end;


end.
