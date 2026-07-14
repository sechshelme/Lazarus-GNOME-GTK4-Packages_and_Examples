
unit gstglcolorconvert;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglcolorconvert.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglcolorconvert.h
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
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstGLColorConvert  = ^GstGLColorConvert;
PGstGLColorConvertClass  = ^GstGLColorConvertClass;
PGstGLColorConvertPrivate  = ^GstGLColorConvertPrivate;
PGstGLContext  = ^GstGLContext;
PGstGLFramebuffer  = ^GstGLFramebuffer;
PGstGLShader  = ^GstGLShader;
PGstQuery  = ^GstQuery;
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

function gst_gl_color_convert_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_COLOR_CONVERT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_COLOR_CONVERT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_COLOR_CONVERT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_COLOR_CONVERT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_COLOR_CONVERT_CLASS(klass : longint) : longint;

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

function gst_gl_color_convert_new(context:PGstGLContext):PGstGLColorConvert;cdecl;external;
function gst_gl_color_convert_transform_caps(context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external;
function gst_gl_color_convert_fixate_caps(context:PGstGLContext; direction:TGstPadDirection; caps:PGstCaps; other:PGstCaps):PGstCaps;cdecl;external;
function gst_gl_color_convert_set_caps(convert:PGstGLColorConvert; in_caps:PGstCaps; out_caps:PGstCaps):Tgboolean;cdecl;external;
function gst_gl_color_convert_decide_allocation(convert:PGstGLColorConvert; query:PGstQuery):Tgboolean;cdecl;external;
function gst_gl_color_convert_perform(convert:PGstGLColorConvert; inbuf:PGstBuffer):PGstBuffer;cdecl;external;
function gst_gl_color_convert_swizzle_shader_string(context:PGstGLContext):Pgchar;cdecl;external;
function gst_gl_color_convert_yuv_to_rgb_shader_string(context:PGstGLContext):Pgchar;cdecl;external;
{$endif}
{ __GST_GL_COLOR_CONVERT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_COLOR_CONVERT : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_COLOR_CONVERT:=gst_gl_color_convert_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_COLOR_CONVERT(obj : longint) : longint;
begin
  GST_GL_COLOR_CONVERT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_COLOR_CONVERT,GstGLColorConvert);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_COLOR_CONVERT_CLASS(klass : longint) : longint;
begin
  GST_GL_COLOR_CONVERT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY,GstGLColorConvertClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_COLOR_CONVERT(obj : longint) : longint;
begin
  GST_IS_GL_COLOR_CONVERT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_COLOR_CONVERT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_COLOR_CONVERT_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_COLOR_CONVERT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_COLOR_CONVERT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_COLOR_CONVERT_CAST(obj : longint) : PGstGLColorConvert;
begin
  GST_GL_COLOR_CONVERT_CAST:=PGstGLColorConvert(obj);
end;


end.
