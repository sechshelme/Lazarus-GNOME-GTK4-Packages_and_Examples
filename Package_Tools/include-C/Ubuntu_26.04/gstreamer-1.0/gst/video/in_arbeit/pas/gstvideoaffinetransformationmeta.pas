unit gstvideoaffinetransformationmeta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) Collabora Ltd.
 *   Author: Matthieu Bouron <matthieu.bouron@collabora.com>
 * Copyright (C) 2015, Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VIDEO_AFFINE_TRANSFORMATION_META_H__}
{$define __GST_VIDEO_AFFINE_TRANSFORMATION_META_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}

{ was #define dname def_expr }
function GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO : longint; { return type might be wrong }

type

  TGstVideoAffineTransformationGetMatrix = function (meta:PGstVideoAffineTransformationMeta; matrix:Pgfloat):Tgboolean;cdecl;

const
  GST_CAPS_FEATURE_META_GST_VIDEO_AFFINE_TRANSFORMATION_META = 'meta:GstVideoAffineTransformation';  
  GST_BUFFER_POOL_OPTION_VIDEO_AFFINE_TRANSFORMATION_META = 'GstBufferPoolOptionVideoAffineTransformation';  
{*
 * GstVideoAffineTransformationMeta:
 * @meta: parent #GstMeta
 * @matrix: the column-major 4x4 transformation matrix
 *
 * Extra buffer metadata for performing an affine transformation using a 4x4
 * matrix. The transformation matrix can be composed with
 * gst_video_affine_transformation_meta_apply_matrix().
 *
 * The vertices operated on are all in the range 0 to 1, not in
 * Normalized Device Coordinates (-1 to +1). Transforming points in this space
 * are assumed to have an origin at (0.5, 0.5, 0.5) in a left-handed coordinate
 * system with the x-axis moving horizontally (positive values to the right),
 * the y-axis moving vertically (positive values up the screen) and the z-axis
 * perpendicular to the screen (positive values into the screen).
 *
 * Since: 1.8
  }
type
  PGstVideoAffineTransformationMeta = ^TGstVideoAffineTransformationMeta;
  TGstVideoAffineTransformationMeta = record
      meta : TGstMeta;cdecl;
      matrix : array[0..15] of Tgfloat;
    end;


function gst_video_affine_transformation_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_affine_transformation_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_affine_transformation_meta(b : longint) : PGstVideoAffineTransformationMeta;

function gst_buffer_add_video_affine_transformation_meta(buffer:PGstBuffer):PGstVideoAffineTransformationMeta;cdecl;external libgstvideo;
procedure gst_video_affine_transformation_meta_apply_matrix(meta:PGstVideoAffineTransformationMeta; matrix:array[0..15] of Tgfloat);cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_AFFINE_TRANSFORMATION_META_H__  }

// === Konventiert am: 15-7-26 13:22:05 ===


implementation


{ was #define dname def_expr }
function GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE:=gst_video_affine_transformation_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_AFFINE_TRANSFORMATION_META_INFO:=gst_video_affine_transformation_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_affine_transformation_meta(b : longint) : PGstVideoAffineTransformationMeta;
begin
  gst_buffer_get_video_affine_transformation_meta:=PGstVideoAffineTransformationMeta(gst_buffer_get_meta(b,GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE));
end;


end.
