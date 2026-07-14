
unit gstglframebuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglframebuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglframebuffer.h
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
PGArray  = ^GArray;
PGstGLBaseMemory  = ^GstGLBaseMemory;
PGstGLContext  = ^GstGLContext;
PGstGLFramebuffer  = ^GstGLFramebuffer;
PGstGLFramebufferClass  = ^GstGLFramebufferClass;
PGstGLFramebufferPrivate  = ^GstGLFramebufferPrivate;
PGstGLMemory  = ^GstGLMemory;
Pguint  = ^guint;
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

function gst_gl_framebuffer_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_FRAMEBUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FRAMEBUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FRAMEBUFFER_CLASS(klass : longint) : longint;

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


function gst_gl_framebuffer_new(context:PGstGLContext):PGstGLFramebuffer;cdecl;external;
function gst_gl_framebuffer_new_with_default_depth(context:PGstGLContext; width:Tguint; height:Tguint):PGstGLFramebuffer;cdecl;external;
function gst_gl_framebuffer_get_id(fb:PGstGLFramebuffer):Tguint;cdecl;external;
procedure gst_gl_framebuffer_attach(fb:PGstGLFramebuffer; attachment_point:Tguint; mem:PGstGLBaseMemory);cdecl;external;
procedure gst_gl_framebuffer_bind(fb:PGstGLFramebuffer);cdecl;external;
procedure gst_gl_context_clear_framebuffer(context:PGstGLContext);cdecl;external;
procedure gst_gl_framebuffer_get_effective_dimensions(fb:PGstGLFramebuffer; width:Pguint; height:Pguint);cdecl;external;
function gst_gl_context_check_framebuffer_status(context:PGstGLContext; fbo_target:Tguint):Tgboolean;cdecl;external;
function gst_gl_framebuffer_draw_to_texture(fb:PGstGLFramebuffer; mem:PGstGLMemory; func:TGstGLFramebufferFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLFramebuffer, gst_object_unref) }
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_FRAMEBUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_FRAMEBUFFER:=gst_gl_framebuffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FRAMEBUFFER(obj : longint) : longint;
begin
  GST_GL_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_FRAMEBUFFER,GstGLFramebuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FRAMEBUFFER_CLASS(klass : longint) : longint;
begin
  GST_GL_FRAMEBUFFER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_FRAMEBUFFER,GstGLFramebufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FRAMEBUFFER(obj : longint) : longint;
begin
  GST_IS_GL_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_FRAMEBUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FRAMEBUFFER_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_FRAMEBUFFER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_FRAMEBUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_FRAMEBUFFER_CAST(obj : longint) : PGstGLFramebuffer;
begin
  GST_GL_FRAMEBUFFER_CAST:=PGstGLFramebuffer(obj);
end;


end.
