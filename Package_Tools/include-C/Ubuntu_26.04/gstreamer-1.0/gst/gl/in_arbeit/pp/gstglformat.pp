
unit gstglformat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglformat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglformat.h
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
Pgint  = ^gint;
PGstGLContext  = ^GstGLContext;
PGstGLFormat  = ^GstGLFormat;
PGstVideoInfo  = ^GstVideoInfo;
Pguint  = ^guint;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef _GST_GL_FORMAT_H_}
{$define _GST_GL_FORMAT_H_}
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}
{$include <gst/video/video.h>}
{*
 * GST_GL_TEXTURE_TARGET_2D_STR:
 *
 * String used for %GST_GL_TEXTURE_TARGET_2D in things like caps values
  }

const
  GST_GL_TEXTURE_TARGET_2D_STR = '2D';  
{*
 * GST_GL_TEXTURE_TARGET_RECTANGLE_STR:
 *
 * String used for %GST_GL_TEXTURE_TARGET_RECTANGLE in things like caps values
  }
  GST_GL_TEXTURE_TARGET_RECTANGLE_STR = 'rectangle';  
{*
 * GST_GL_TEXTURE_TARGET_EXTERNAL_OES_STR:
 *
 * String used for %GST_GL_TEXTURE_TARGET_EXTERNAL_OES in things like caps values
  }
  GST_GL_TEXTURE_TARGET_EXTERNAL_OES_STR = 'external-oes';  
{*
 * GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_2D:
 *
 * String used for %GST_GL_TEXTURE_TARGET_2D as a #GstBufferPool pool option
  }
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_2D = 'GstBufferPoolOptionGLTextureTarget2D';  
{*
 * GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_RECTANGLE:
 *
 * String used for %GST_GL_TEXTURE_TARGET_RECTANGLE as a #GstBufferPool pool option
  }
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_RECTANGLE = 'GstBufferPoolOptionGLTextureTargetRectangle';  
{*
 * GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_EXTERNAL_OES:
 *
 * String used for %GST_GL_TEXTURE_TARGET_EXTERNAL_OES as a #GstBufferPool pool option
  }
  GST_BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_EXTERNAL_OES = 'GstBufferPoolOptionGLTextureTargetExternalOES';  
{*
 * GstGLFormat:
 * @GST_GL_LUMINANCE: Single component replicated across R, G, and B textures
 *                    components
 * @GST_GL_ALPHA: Single component stored in the A texture component
 * @GST_GL_LUMINANCE_ALPHA: Combination of #GST_GL_LUMINANCE and #GST_GL_ALPHA
 * @GST_GL_RED: Single component stored in the R texture component
 * @GST_GL_R8: Single 8-bit component stored in the R texture component
 * @GST_GL_RG: Two components stored in the R and G texture components
 * @GST_GL_RG8: Two 8-bit components stored in the R and G texture components
 * @GST_GL_RGB: Three components stored in the R, G, and B texture components
 * @GST_GL_RGB8: Three 8-bit components stored in the R, G, and B
 *               texture components
 * @GST_GL_RGB565: Three components of bit depth 5, 6 and 5 stored in the R, G,
 *                 and B texture components respectively.
 * @GST_GL_RGB16: Three 16-bit components stored in the R, G, and B
 *               texture components
 * @GST_GL_RGBA: Four components stored in the R, G, B, and A texture
 *               components respectively.
 * @GST_GL_RGBA8: Four 8-bit components stored in the R, G, B, and A texture
 *                components respectively.
 * @GST_GL_RGBA16: Four 16-bit components stored in the R, G, B, and A texture
 *                components respectively.
 * @GST_GL_DEPTH_COMPONENT16: A single 16-bit component for depth information.
 * @GST_GL_DEPTH24_STENCIL8: A 24-bit component for depth information and
 *                           a 8-bit component for stencil informat.
 * @GST_GL_RGBA10_A2: Four components of bit depth 10, 10, 10 and 2 stored in the
 *                    R, G, B and A texture components respectively.
 * @GST_GL_R16: Single 16-bit component stored in the R texture component
 * @GST_GL_RG16: Two 16-bit components stored in the R and G texture components
  }
{ values taken from the GL headers  }
type
  PGstGLFormat = ^TGstGLFormat;
  TGstGLFormat =  Longint;
  Const
    GST_GL_LUMINANCE = $1909;
    GST_GL_ALPHA = $1906;
    GST_GL_LUMINANCE_ALPHA = $190A;
    GST_GL_RED = $1903;
    GST_GL_R8 = $8229;
    GST_GL_RG = $8227;
    GST_GL_RG8 = $822B;
    GST_GL_RGB = $1907;
    GST_GL_RGB8 = $8051;
    GST_GL_RGB565 = $8D62;
    GST_GL_RGB16 = $8054;
    GST_GL_RGBA = $1908;
    GST_GL_RGBA8 = $8058;
    GST_GL_RGBA16 = $805B;
    GST_GL_DEPTH_COMPONENT16 = $81A5;
    GST_GL_DEPTH24_STENCIL8 = $88F0;
    GST_GL_RGB10_A2 = $8059;
    GST_GL_R16 = $822A;
    GST_GL_RG16 = $822C;
;

function gst_gl_format_type_n_bytes(format:Tguint; _type:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_gl_format_from_video_info(context:PGstGLContext; vinfo:PGstVideoInfo; plane:Tguint):TGstGLFormat;cdecl;external;
function gst_gl_sized_gl_format_from_gl_format_type(context:PGstGLContext; format:Tguint; _type:Tguint):Tguint;cdecl;external;
procedure gst_gl_format_type_from_sized_gl_format(format:TGstGLFormat; unsized_format:PGstGLFormat; gl_type:Pguint);cdecl;external;
function gst_gl_video_format_swizzle(video_format:TGstVideoFormat; swizzle:Plongint):Tgboolean;cdecl;external;
function gst_gl_format_is_supported(context:PGstGLContext; format:TGstGLFormat):Tgboolean;cdecl;external;
function gst_gl_format_n_components(gl_format:TGstGLFormat):Tguint;cdecl;external;
procedure gst_gl_swizzle_invert(swizzle:Pgint; inversion:Pgint);cdecl;external;
(* Const before type ignored *)
function gst_gl_texture_target_from_string(str:Pgchar):TGstGLTextureTarget;cdecl;external;
(* Const before type ignored *)
function gst_gl_texture_target_to_string(target:TGstGLTextureTarget):Pgchar;cdecl;external;
function gst_gl_texture_target_to_gl(target:TGstGLTextureTarget):Tguint;cdecl;external;
function gst_gl_texture_target_from_gl(target:Tguint):TGstGLTextureTarget;cdecl;external;
(* Const before type ignored *)
function gst_gl_texture_target_to_buffer_pool_option(target:TGstGLTextureTarget):Pgchar;cdecl;external;
{$endif}
{ _GST_GL_FORMAT_H_  }

implementation


end.
