unit gstglframebuffer;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ 
 * GStreamer
 * Copyright (C) 2013 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __GST_GL_FRAMEBUFFER_H__}
{$define __GST_GL_FRAMEBUFFER_H__}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_framebuffer_get_type:TGType;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_FRAMEBUFFER_CAST(obj : longint) : PGstGLFramebuffer;

type
{*
 * GstGLFramebufferFunc:
 * @stuff: user data
 *
 * callback definition for operating through a #GstGLFramebuffer object
  }

  TGstGLFramebufferFunc = function (stuff:Tgpointer):Tgboolean;cdecl;
{*
 * GstGLFramebuffer:
 *
 * Opaque #GstGLFramebuffer struct
  }
{< private > }
  PGstGLFramebuffer = ^TGstGLFramebuffer;
  TGstGLFramebuffer = record
      object : TGstObject;cdecl;
      context : PGstGLContext;
      fbo_id : Tguint;
      attachments : PGArray;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
      priv : PGstGLFramebufferPrivate;
    end;

{*
 * GstGLFramebufferClass:
 *
 * Opaque #GstGLFramebufferClass struct
  }
{< private > }
  PGstGLFramebufferClass = ^TGstGLFramebufferClass;
  TGstGLFramebufferClass = record
      object_class : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_framebuffer_new(context:PGstGLContext):PGstGLFramebuffer;cdecl;external libgstgl;
function gst_gl_framebuffer_new_with_default_depth(context:PGstGLContext; width:Tguint; height:Tguint):PGstGLFramebuffer;cdecl;external libgstgl;
function gst_gl_framebuffer_get_id(fb:PGstGLFramebuffer):Tguint;cdecl;external libgstgl;
procedure gst_gl_framebuffer_attach(fb:PGstGLFramebuffer; attachment_point:Tguint; mem:PGstGLBaseMemory);cdecl;external libgstgl;
procedure gst_gl_framebuffer_bind(fb:PGstGLFramebuffer);cdecl;external libgstgl;
procedure gst_gl_context_clear_framebuffer(context:PGstGLContext);cdecl;external libgstgl;
procedure gst_gl_framebuffer_get_effective_dimensions(fb:PGstGLFramebuffer; width:Pguint; height:Pguint);cdecl;external libgstgl;
function gst_gl_context_check_framebuffer_status(context:PGstGLContext; fbo_target:Tguint):Tgboolean;cdecl;external libgstgl;
function gst_gl_framebuffer_draw_to_texture(fb:PGstGLFramebuffer; mem:PGstGLMemory; func:TGstGLFramebufferFunc; user_data:Tgpointer):Tgboolean;cdecl;external libgstgl;
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLFramebuffer, gst_object_unref) }
{$endif}

// === Konventiert am: 14-7-26 13:01:49 ===

function GST_TYPE_GL_FRAMEBUFFER : TGType;
function GST_GL_FRAMEBUFFER(obj : Pointer) : PGstGLFramebuffer;
function GST_GL_FRAMEBUFFER_CLASS(klass : Pointer) : PGstGLFramebufferClass;
function GST_IS_GL_FRAMEBUFFER(obj : Pointer) : Tgboolean;
function GST_IS_GL_FRAMEBUFFER_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_FRAMEBUFFER : TGType;
  begin
    GST_TYPE_GL_FRAMEBUFFER:=gst_gl_framebuffer_get_type;
  end;

function GST_GL_FRAMEBUFFER(obj : Pointer) : PGstGLFramebuffer;
begin
  Result := PGstGLFramebuffer(g_type_check_instance_cast(obj, GST_TYPE_GL_FRAMEBUFFER));
end;

function GST_GL_FRAMEBUFFER_CLASS(klass : Pointer) : PGstGLFramebufferClass;
begin
  Result := PGstGLFramebufferClass(g_type_check_class_cast(klass, GST_TYPE_GL_FRAMEBUFFER));
end;

function GST_IS_GL_FRAMEBUFFER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_FRAMEBUFFER);
end;

function GST_IS_GL_FRAMEBUFFER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_FRAMEBUFFER);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_FRAMEBUFFER_CAST(obj : longint) : PGstGLFramebuffer;
begin
  GST_GL_FRAMEBUFFER_CAST:=PGstGLFramebuffer(obj);
end;


end.
