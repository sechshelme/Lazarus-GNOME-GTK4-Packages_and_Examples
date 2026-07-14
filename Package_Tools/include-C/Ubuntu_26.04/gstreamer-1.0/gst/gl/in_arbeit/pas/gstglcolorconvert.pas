unit gstglcolorconvert;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystree00@gmail.com>
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
{$ifndef __GST_GL_COLOR_CONVERT_H__}
{$define __GST_GL_COLOR_CONVERT_H__}
{$include <gst/video/video.h>}
{$include <gst/gstmemory.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_color_convert_get_type:TGType;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_COLOR_CONVERT_CAST(obj : longint) : PGstGLColorConvert;

{*
 * GstGLColorConvert
 *
 * Opaque #GstGLColorConvert object
  }
{< private > }
{ input data  }
{ used for the conversion  }
{< private > }
type
  PGstGLColorConvert = ^TGstGLColorConvert;
  TGstGLColorConvert = record
      parent : TGstObject;
      context : PGstGLContext;
      in_info : TGstVideoInfo;
      out_info : TGstVideoInfo;
      initted : Tgboolean;
      passthrough : Tgboolean;
      inbuf : PGstBuffer;
      outbuf : PGstBuffer;
      fbo : PGstGLFramebuffer;
      shader : PGstGLShader;
      priv : PGstGLColorConvertPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLColorConvertClass:
 *
 * The #GstGLColorConvertClass struct only contains private data
  }
{< private > }
  PGstGLColorConvertClass = ^TGstGLColorConvertClass;
  TGstGLColorConvertClass = record
      object_class : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_GL_COLOR_CONVERT_EXT_FORMATS: (skip)
 *
  }
{*
 * GST_GL_COLOR_CONVERT_VIDEO_CAPS:
 *
 * The currently supported #GstCaps that can be converted
  }

function gst_gl_color_convert_new(context:PGstGLContext):PGstGLColorConvert;cdecl;external libgstgl;
function gst_gl_color_convert_transform_caps(context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external libgstgl;
function gst_gl_color_convert_fixate_caps(context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; other:PGstCaps):PGstCaps;cdecl;external libgstgl;
function gst_gl_color_convert_set_caps(convert:PGstGLColorConvert; in_caps:PGstCaps; out_caps:PGstCaps):Tgboolean;cdecl;external libgstgl;
function gst_gl_color_convert_decide_allocation(convert:PGstGLColorConvert; query:PGstQuery):Tgboolean;cdecl;external libgstgl;
function gst_gl_color_convert_perform(convert:PGstGLColorConvert; inbuf:PGstBuffer):PGstBuffer;cdecl;external libgstgl;
function gst_gl_color_convert_swizzle_shader_string(context:PGstGLContext):Pgchar;cdecl;external libgstgl;
function gst_gl_color_convert_yuv_to_rgb_shader_string(context:PGstGLContext):Pgchar;cdecl;external libgstgl;
{$endif}
{ __GST_GL_COLOR_CONVERT_H__  }

// === Konventiert am: 14-7-26 12:54:12 ===

function GST_TYPE_GL_COLOR_CONVERT : TGType;
function GST_GL_COLOR_CONVERT(obj : Pointer) : PGstGLColorConvert;
function GST_GL_COLOR_CONVERT_CLASS(klass : Pointer) : PGstGLColorConvertClass;
function GST_IS_GL_COLOR_CONVERT(obj : Pointer) : Tgboolean;
function GST_IS_GL_COLOR_CONVERT_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_COLOR_CONVERT : TGType;
  begin
    GST_TYPE_GL_COLOR_CONVERT:=gst_gl_color_convert_get_type;
  end;

function GST_GL_COLOR_CONVERT(obj : Pointer) : PGstGLColorConvert;
begin
  Result := PGstGLColorConvert(g_type_check_instance_cast(obj, GST_TYPE_GL_COLOR_CONVERT));
end;

function GST_GL_COLOR_CONVERT_CLASS(klass : Pointer) : PGstGLColorConvertClass;
begin
  Result := PGstGLColorConvertClass(g_type_check_class_cast(klass, GST_TYPE_GL_COLOR_CONVERT));
end;

function GST_IS_GL_COLOR_CONVERT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_COLOR_CONVERT);
end;

function GST_IS_GL_COLOR_CONVERT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_COLOR_CONVERT);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_COLOR_CONVERT_CAST(obj : longint) : PGstGLColorConvert;
begin
  GST_GL_COLOR_CONVERT_CAST:=PGstGLColorConvert(obj);
end;


end.
