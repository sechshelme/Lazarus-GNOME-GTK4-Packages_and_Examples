unit gstglfilter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2007 David Schleef <ds@schleef.org>
 * Copyright (C) 2008 Julien Isorce <julien.isorce@gmail.com>
 * Copyright (C) 2008 Filippo Argiolas <filippo.argiolas@gmail.com>
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
{$ifndef _GST_GL_FILTER_H_}
{$define _GST_GL_FILTER_H_}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/gl/gl.h>}

function gst_gl_filter_get_type:TGType;cdecl;external libgstgl;
{ was #define dname def_expr }
function GST_TYPE_GL_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER_GET_CLASS(obj : longint) : longint;

{*
 * GstGLFilterRenderFunc:
 * @filter: the #GstGLFilter
 * @in_tex: the input #GstGLMemory to render
 * @user_data: user data
 *
 * Returns: whether the render succeeded
 *
 * Since: 1.10
  }
type

  TGstGLFilterRenderFunc = function (filter:PGstGLFilter; in_tex:PGstGLMemory; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstGLFilter:
 * @in_info: the video info for input buffers
 * @out_info: the video info for output buffers
 * @in_texture_target: The texture target of the input buffers (usually 2D)
 * @out_texture_target: The texture target of the output buffers (usually 2D)
 * @out_caps: the output #GstCaps
 * @fbo: #GstGLFramebuffer object used for transformations (only for subclass usage)
  }
{< public > }
{ protected  }
{< private > }
  PGstGLFilter = ^TGstGLFilter;
  TGstGLFilter = record
      parent : TGstGLBaseFilter;cdecl;
      in_info : TGstVideoInfo;
      out_info : TGstVideoInfo;
      in_texture_target : TGstGLTextureTarget;
      out_texture_target : TGstGLTextureTarget;
      out_caps : PGstCaps;
      fbo : PGstGLFramebuffer;
      gl_result : Tgboolean;
      inbuf : PGstBuffer;
      outbuf : PGstBuffer;
      default_shader : PGstGLShader;
      valid_attributes : Tgboolean;
      vao : Tguint;
      vbo_indices : Tguint;
      vertex_buffer : Tguint;
      draw_attr_position_loc : Tgint;
      draw_attr_texture_loc : Tgint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLFilterClass:
 * @set_caps: mirror from #GstBaseTransform
 * @filter: perform operations on the input and output buffers.  In general,
 *          you should avoid using this method if at all possible. One valid
 *          use-case for using this is keeping previous buffers for future calculations.
 *          Note: If @filter exists, then @filter_texture is not run
 * @filter_texture: given @in_tex, transform it into @out_tex.  Not used
 *                  if @filter exists
 * @init_fbo: perform initialization when the Framebuffer object is created
 * @transform_internal_caps: Perform sub-class specific modifications of the
 *   caps to be processed between upload on input and before download for output.
  }
{< public > }
{< private > }
  PGstGLFilterClass = ^TGstGLFilterClass;
  TGstGLFilterClass = record
      parent_class : TGstGLBaseFilterClass;
      set_caps : function (filter:PGstGLFilter; incaps:PGstCaps; outcaps:PGstCaps):Tgboolean;cdecl;
      filter : function (filter:PGstGLFilter; inbuf:PGstBuffer; outbuf:PGstBuffer):Tgboolean;cdecl;
      filter_texture : function (filter:PGstGLFilter; input:PGstGLMemory; output:PGstGLMemory):Tgboolean;cdecl;
      init_fbo : function (filter:PGstGLFilter):Tgboolean;cdecl;
      transform_internal_caps : function (filter:PGstGLFilter; direction:TGstPadDirection; caps:PGstCaps; filter_caps:PGstCaps):PGstCaps;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_gl_filter_add_rgba_pad_templates(klass:PGstGLFilterClass);cdecl;external libgstgl;
function gst_gl_filter_filter_texture(filter:PGstGLFilter; input:PGstBuffer; output:PGstBuffer):Tgboolean;cdecl;external libgstgl;
function gst_gl_filter_render_to_target(filter:PGstGLFilter; input:PGstGLMemory; output:PGstGLMemory; func:TGstGLFilterRenderFunc; data:Tgpointer):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_filter_draw_fullscreen_quad(filter:PGstGLFilter);cdecl;external libgstgl;
procedure gst_gl_filter_render_to_target_with_shader(filter:PGstGLFilter; input:PGstGLMemory; output:PGstGLMemory; shader:PGstGLShader);cdecl;external libgstgl;
{$endif}
{ _GST_GL_FILTER_H_  }

// === Konventiert am: 14-7-26 13:02:13 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_FILTER:=gst_gl_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER(obj : longint) : longint;
begin
  GST_GL_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_FILTER,GstGLFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FILTER(obj : longint) : longint;
begin
  GST_IS_GL_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER_CLASS(klass : longint) : longint;
begin
  GST_GL_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_FILTER,GstGLFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_FILTER,GstGLFilterClass);
end;


end.
