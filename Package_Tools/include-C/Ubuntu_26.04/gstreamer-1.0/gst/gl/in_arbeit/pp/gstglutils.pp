
unit gstglutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglutils.h
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
Pgfloat  = ^gfloat;
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstGLContext  = ^GstGLContext;
PGstGLDisplay  = ^GstGLDisplay;
PGstGLDrmFormatFlags  = ^GstGLDrmFormatFlags;
PGstQuery  = ^GstQuery;
PGstVideoAffineTransformationMeta  = ^GstVideoAffineTransformationMeta;
PGstVideoAlignment  = ^GstVideoAlignment;
PGstVideoInfo  = ^GstVideoInfo;
PGValue  = ^GValue;
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
{$ifndef __GST_GL_UTILS_H__}
{$define __GST_GL_UTILS_H__}
{$include <gst/video/video.h>}
{$include <gst/video/gstvideoaffinetransformationmeta.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_ensure_element_data(element:Tgpointer; display_ptr:PPGstGLDisplay; other_context_ptr:PPGstGLContext):Tgboolean;cdecl;external;
function gst_gl_handle_set_context(element:PGstElement; context:PGstContext; display:PPGstGLDisplay; other_context:PPGstGLContext):Tgboolean;cdecl;external;
function gst_gl_handle_context_query(element:PGstElement; query:PGstQuery; display:PGstGLDisplay; context:PGstGLContext; other_context:PGstGLContext):Tgboolean;cdecl;external;
function gst_gl_query_local_gl_context(element:PGstElement; direction:TGstPadDirection; context_ptr:PPGstGLContext):Tgboolean;cdecl;external;
procedure gst_gl_element_propagate_display_context(element:PGstElement; display:PGstGLDisplay);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_gl_get_plane_data_size(info:PGstVideoInfo; align:PGstVideoAlignment; plane:Tguint):Tgsize;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_gl_get_plane_start(info:PGstVideoInfo; valign:PGstVideoAlignment; plane:Tguint):Tgsize;cdecl;external;
function gst_gl_value_set_texture_target_from_mask(value:PGValue; target_mask:TGstGLTextureTarget):Tgboolean;cdecl;external;
function gst_gl_value_set_texture_target(value:PGValue; target:TGstGLTextureTarget):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_gl_value_get_texture_target_mask(value:PGValue):TGstGLTextureTarget;cdecl;external;
procedure gst_gl_get_affine_transformation_meta_as_ndc(meta:PGstVideoAffineTransformationMeta; matrix:Pgfloat);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_set_affine_transformation_meta_from_ndc(meta:PGstVideoAffineTransformationMeta; matrix:Pgfloat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_multiply_matrix4(a:Pgfloat; b:Pgfloat; result:Pgfloat);cdecl;external;
{*
 * GstGLDrmFormatFlags:
 * @GST_GL_DRM_FORMAT_INCLUDE_EXTERNAL: include external-only formats (Since: 1.26)
 * @GST_GL_DRM_FORMAT_LINEAR_ONLY: only include formats with linear modifier (Since: 1.26)
 * @GST_GL_DRM_FORMAT_INCLUDE_EMULATED: include emulated formats (Since: 1.26)
 * @GST_GL_DRM_FORMAT_DIRECT_IMPORT: EGL is doing the color convertion (Since: 1.28)
 *
 * Since: 1.26
  }
{*
   * GST_GL_DRM_FORMAT_INCLUDE_EXTERNAL:
   *
   * include external-only formats
   *
   * Since: 1.26
    }
{*
  * GST_GL_DRM_FORMAT_LINEAR_ONLY:
  *
  * only include formats with linear modifier
  *
  * Since: 1.26
   }
{*
   * GST_GL_DRM_FORMAT_INCLUDE_EMULATED:
   *
   * include emulated formats
   *
   * Since: 1.26
    }
{*
   * GST_GL_DRM_FORMAT_DIRECT_IMPORT:
   *
   * EGL is responsible for the colorspace conversion. In this case, all
   * supported modifiers get translated to RGBA.
   *
   * Since: 1.28
    }
type
  PGstGLDrmFormatFlags = ^TGstGLDrmFormatFlags;
  TGstGLDrmFormatFlags =  Longint;
  Const
    GST_GL_DRM_FORMAT_INCLUDE_EXTERNAL = 1 shl 0;
    GST_GL_DRM_FORMAT_LINEAR_ONLY = 1 shl 1;
    GST_GL_DRM_FORMAT_INCLUDE_EMULATED = 1 shl 2;
    GST_GL_DRM_FORMAT_DIRECT_IMPORT = 1 shl 3;
;
(* Const before type ignored *)

function gst_gl_dma_buf_transform_gst_formats_to_drm_formats(context:PGstGLContext; src:PGValue; flags:TGstGLDrmFormatFlags; dst:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_gl_dma_buf_transform_drm_formats_to_gst_formats(context:PGstGLContext; src:PGValue; flags:TGstGLDrmFormatFlags; dst:PGValue):Tgboolean;cdecl;external;
{$endif}
{ __GST_GL_UTILS_H__  }

implementation


end.
