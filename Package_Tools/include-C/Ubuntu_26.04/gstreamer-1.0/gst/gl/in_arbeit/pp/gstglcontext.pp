
unit gstglcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglcontext.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
PGstGLContext  = ^GstGLContext;
PGstGLContextClass  = ^GstGLContextClass;
PGstGLContextError  = ^GstGLContextError;
PGstGLContextPrivate  = ^GstGLContextPrivate;
PGstGLDisplay  = ^GstGLDisplay;
PGstGLFuncs  = ^GstGLFuncs;
PGstGLWindow  = ^GstGLWindow;
PGstStructure  = ^GstStructure;
PGThread  = ^GThread;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystreet00@gmail.com>
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_GL_CONTEXT_H__}
{$define __GST_GL_CONTEXT_H__}
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_context_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_CONTEXT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT_GET_CLASS(o : longint) : longint;

function gst_gl_context_error_quark:TGQuark;cdecl;external;
{*
 * GST_GL_CONTEXT_ERROR:
 *
 * Error domain for GStreamer's GL context module. Errors in this domain will
 * be from the #GstGLContextError enumeration
  }
{ was #define dname def_expr }
function GST_GL_CONTEXT_ERROR : longint; { return type might be wrong }

{*
 * GstGLContextThreadFunc:
 * @context: a #GstGLContext
 * @data: user data
 *
 * Represents a function to run in the GL thread with @context and @data
  }
type

  TGstGLContextThreadFunc = procedure (context:PGstGLContext; data:Tgpointer);cdecl;

const
  GST_GL_CONTEXT_TYPE_CGL = 'gst.gl.context.CGL';  
  GST_GL_CONTEXT_TYPE_GLX = 'gst.gl.context.GLX';  
  GST_GL_CONTEXT_TYPE_EGL = 'gst.gl.context.EGL';  
  GST_GL_CONTEXT_TYPE_WGL = 'gst.gl.context.WGL';  
  GST_GL_CONTEXT_TYPE_EAGL = 'gst.gl.context.EAGL';  
{*
 * GstGLContextError:
 * @GST_GL_CONTEXT_ERROR_FAILED: Failed for an unspecified reason
 * @GST_GL_CONTEXT_ERROR_WRONG_CONFIG: The configuration requested is not correct
 * @GST_GL_CONTEXT_ERROR_WRONG_API: The OpenGL API requested is not correct
 * @GST_GL_CONTEXT_ERROR_OLD_LIBS: The OpenGL libraries are too old
 * @GST_GL_CONTEXT_ERROR_CREATE_CONTEXT: glXCreateContext (or similar) failed
 * @GST_GL_CONTEXT_ERROR_RESOURCE_UNAVAILABLE: A resource is not available
 *
 * OpenGL context errors.
  }
type
  PGstGLContextError = ^TGstGLContextError;
  TGstGLContextError =  Longint;
  Const
    GST_GL_CONTEXT_ERROR_FAILED = 0;
    GST_GL_CONTEXT_ERROR_WRONG_CONFIG = 1;
    GST_GL_CONTEXT_ERROR_WRONG_API = 2;
    GST_GL_CONTEXT_ERROR_OLD_LIBS = 3;
    GST_GL_CONTEXT_ERROR_CREATE_CONTEXT = 4;
    GST_GL_CONTEXT_ERROR_RESOURCE_UNAVAILABLE = 5;
;
{*
 * GstGLContext:
 * @gl_vtable: a list of OpenGL function pointers
 *
 * Opaque #GstGLContext object
  }
{< private > }
{< public > }
{< private > }
type
  PGstGLContext = ^TGstGLContext;
  TGstGLContext = record
      parent : TGstObject;
      display : PGstGLDisplay;
      window : PGstGLWindow;
      gl_vtable : PGstGLFuncs;
      priv : PGstGLContextPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLContextClass:
 * @get_gl_context: get the backing platform specific OpenGL context
 * @get_gl_api: get the available OpenGL api's that this context can work with
 * @get_proc_address: get an function pointer to an OpenGL function
 * @activate: call eglMakeCurrent or similar
 * @choose_format: choose a format for the framebuffer
 * @create_context: create the OpenGL context
 * @destroy_context: destroy the OpenGL context
 * @swap_buffers: swap the default framebuffer's front/back buffers
  }
{*
 * GstGLContextClass::get_config:
 * @context: the #GstGLContext
 *
 * Retrieve the configuration in use by this context.  See also
 * gst_gl_context_get_config().
 *
 * Returns: (transfer full) (nullable): the configuration chosen for this
 *          #GstGLContext
 *
 * Since: 1.20
  }
{*
 * GstGLContextClass::request_config:
 * @context: the #GstGLContext
 * @gl_config: (nullable) (transfer full): a configuration structure for
 *             configuring on @context
 *
 * Request a configuration for this @context to use.
 *
 * Unknown fields within @gl_config should be ignored by subclasses.
 *
 * See also gst_gl_context_request_config().
 *
 * Returns: Whether @gl_config could be successfull set on @context.
 *
 * Since: 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGstGLContextClass = ^TGstGLContextClass;
  TGstGLContextClass = record
      parent_class : TGstObjectClass;
      get_current_context : function :Tguintptr;cdecl;
      get_gl_context : function (context:PGstGLContext):Tguintptr;cdecl;
      get_gl_api : function (context:PGstGLContext):TGstGLAPI;cdecl;
      get_gl_platform : function (context:PGstGLContext):TGstGLPlatform;cdecl;
      get_proc_address : function (gl_api:TGstGLAPI; name:Pgchar):Tgpointer;cdecl;
      activate : function (context:PGstGLContext; activate:Tgboolean):Tgboolean;cdecl;
      choose_format : function (context:PGstGLContext; error:PPGError):Tgboolean;cdecl;
      create_context : function (context:PGstGLContext; gl_api:TGstGLAPI; other_context:PGstGLContext; error:PPGError):Tgboolean;cdecl;
      destroy_context : procedure (context:PGstGLContext);cdecl;
      swap_buffers : procedure (context:PGstGLContext);cdecl;
      check_feature : function (context:PGstGLContext; feature:Pgchar):Tgboolean;cdecl;
      get_gl_platform_version : procedure (context:PGstGLContext; major:Pgint; minor:Pgint);cdecl;
      get_config : function (context:PGstGLContext):PGstStructure;cdecl;
      request_config : function (context:PGstGLContext; gl_config:PGstStructure):Tgboolean;cdecl;
      _reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;

{ methods  }

function gst_gl_context_new(display:PGstGLDisplay):PGstGLContext;cdecl;external;
function gst_gl_context_new_wrapped(display:PGstGLDisplay; handle:Tguintptr; context_type:TGstGLPlatform; available_apis:TGstGLAPI):PGstGLContext;cdecl;external;
function gst_gl_context_get_config(context:PGstGLContext):PGstStructure;cdecl;external;
function gst_gl_context_request_config(context:PGstGLContext; gl_config:PGstStructure):Tgboolean;cdecl;external;
function gst_gl_context_activate(context:PGstGLContext; activate:Tgboolean):Tgboolean;cdecl;external;
function gst_gl_context_get_thread(context:PGstGLContext):PGThread;cdecl;external;
function gst_gl_context_get_current:PGstGLContext;cdecl;external;
function gst_gl_context_get_display(context:PGstGLContext):PGstGLDisplay;cdecl;external;
(* Const before type ignored *)
function gst_gl_context_get_proc_address(context:PGstGLContext; name:Pgchar):Tgpointer;cdecl;external;
function gst_gl_context_get_gl_platform(context:PGstGLContext):TGstGLPlatform;cdecl;external;
function gst_gl_context_get_gl_api(context:PGstGLContext):TGstGLAPI;cdecl;external;
function gst_gl_context_get_gl_context(context:PGstGLContext):Tguintptr;cdecl;external;
function gst_gl_context_can_share(context:PGstGLContext; other_context:PGstGLContext):Tgboolean;cdecl;external;
procedure gst_gl_context_swap_buffers(context:PGstGLContext);cdecl;external;
function gst_gl_context_create(context:PGstGLContext; other_context:PGstGLContext; error:PPGError):Tgboolean;cdecl;external;
procedure gst_gl_context_destroy(context:PGstGLContext);cdecl;external;
(* Const before type ignored *)
function gst_gl_context_default_get_proc_address(gl_api:TGstGLAPI; name:Pgchar):Tgpointer;cdecl;external;
(* Const before type ignored *)
function gst_gl_context_get_proc_address_with_platform(context_type:TGstGLPlatform; gl_api:TGstGLAPI; name:Pgchar):Tgpointer;cdecl;external;
function gst_gl_context_set_window(context:PGstGLContext; window:PGstGLWindow):Tgboolean;cdecl;external;
function gst_gl_context_get_window(context:PGstGLContext):PGstGLWindow;cdecl;external;
procedure gst_gl_context_get_gl_version(context:PGstGLContext; maj:Pgint; min:Pgint);cdecl;external;
function gst_gl_context_check_gl_version(context:PGstGLContext; api:TGstGLAPI; maj:Tgint; min:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_gl_context_check_feature(context:PGstGLContext; feature:Pgchar):Tgboolean;cdecl;external;
procedure gst_gl_context_get_gl_platform_version(context:PGstGLContext; major:Pgint; minor:Pgint);cdecl;external;
function gst_gl_context_get_current_gl_context(context_type:TGstGLPlatform):Tguintptr;cdecl;external;
function gst_gl_context_get_current_gl_api(platform:TGstGLPlatform; major:Pguint; minor:Pguint):TGstGLAPI;cdecl;external;
function gst_gl_context_is_shared(context:PGstGLContext):Tgboolean;cdecl;external;
procedure gst_gl_context_set_shared_with(context:PGstGLContext; share:PGstGLContext);cdecl;external;
function gst_gl_context_fill_info(context:PGstGLContext; error:PPGError):Tgboolean;cdecl;external;
{ FIXME: remove  }
procedure gst_gl_context_thread_add(context:PGstGLContext; func:TGstGLContextThreadFunc; data:Tgpointer);cdecl;external;
{$endif}
{ __GST_GL_CONTEXT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_CONTEXT : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_CONTEXT:=gst_gl_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT(o : longint) : longint;
begin
  GST_GL_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_GL_CONTEXT,GstGLContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT_CLASS(k : longint) : longint;
begin
  GST_GL_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_GL_CONTEXT,GstGLContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_CONTEXT(o : longint) : longint;
begin
  GST_IS_GL_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_GL_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_CONTEXT_CLASS(k : longint) : longint;
begin
  GST_IS_GL_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_GL_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONTEXT_GET_CLASS(o : longint) : longint;
begin
  GST_GL_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_GL_CONTEXT,GstGLContextClass);
end;

{ was #define dname def_expr }
function GST_GL_CONTEXT_ERROR : longint; { return type might be wrong }
  begin
    GST_GL_CONTEXT_ERROR:=gst_gl_context_error_quark;
  end;


end.
