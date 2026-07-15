unit gstvideometa;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_META_H__}
{$define __GST_VIDEO_META_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/video/gstvideotimecode.h>}

{ was #define dname def_expr }
function GST_VIDEO_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_META_INFO : longint; { return type might be wrong }

type

const
  GST_CAPS_FEATURE_META_GST_VIDEO_META = 'meta:GstVideoMeta';  

{ was #define dname def_expr }
function GST_VIDEO_CROP_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_CROP_META_INFO : longint; { return type might be wrong }

type
{*
 * GstVideoMeta:
 * @meta: parent #GstMeta
 * @buffer: the buffer this metadata belongs to
 * @flags: additional video flags
 * @format: the video format
 * @id: identifier of the frame
 * @width: the video width
 * @height: the video height
 * @n_planes: the number of planes in the image
 * @offset: array of offsets for the planes. This field might not always be
 *          valid, it is used by the default implementation of @map.
 * @stride: array of strides for the planes. This field might not always be
 *          valid, it is used by the default implementation of @map.
 * @map: map the memory of a plane
 * @unmap: unmap the memory of a plane
 * @alignment: the paddings and alignment constraints of the video buffer.
 * It is up to the caller of `gst_buffer_add_video_meta_full()` to set it
 * using gst_video_meta_set_alignment(), if they did not it defaults
 * to no padding and no alignment. Since: 1.18
 *
 * Extra buffer metadata describing image properties
 *
 * This meta can also be used by downstream elements to specifiy their
 * buffer layout requirements for upstream. Upstream should try to
 * fit those requirements, if possible, in order to prevent buffer copies.
 *
 * This is done by passing a custom #GstStructure to
 * gst_query_add_allocation_meta() when handling the ALLOCATION query.
 * This structure should be named 'video-meta' and can have the following
 * fields:
 * - padding-top (uint): extra pixels on the top
 * - padding-bottom (uint): extra pixels on the bottom
 * - padding-left (uint): extra pixels on the left side
 * - padding-right (uint): extra pixels on the right side
 * - stride-align0 (uint): stride align requirements for plane 0
 * - stride-align1 (uint): stride align requirements for plane 1
 * - stride-align2 (uint): stride align requirements for plane 2
 * - stride-align3 (uint): stride align requirements for plane 3
 * The padding and stride-align fields have the same semantic as #GstVideoMeta.alignment
 * and so represent the paddings and stride-align requested on produced video buffers.
 *
 * Since 1.24 it can be serialized using gst_meta_serialize() and
 * gst_meta_deserialize().
  }
  PGstVideoMeta = ^TGstVideoMeta;
  TGstVideoMeta = record
      meta : TGstMeta;
      buffer : PGstBuffer;
      flags : TGstVideoFrameFlags;
      format : TGstVideoFormat;
      id : Tgint;
      width : Tguint;
      height : Tguint;
      n_planes : Tguint;
      offset : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize;
      stride : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgint;
      map : function (meta:PGstVideoMeta; plane:Tguint; info:PGstMapInfo; data:Pgpointer; stride:Pgint; 
                   flags:TGstMapFlags):Tgboolean;cdecl;
      unmap : function (meta:PGstVideoMeta; plane:Tguint; info:PGstMapInfo):Tgboolean;cdecl;
      alignment : TGstVideoAlignment;
    end;


function gst_video_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
function gst_buffer_get_video_meta(buffer:PGstBuffer):PGstVideoMeta;cdecl;external libgstvideo;
function gst_buffer_get_video_meta_id(buffer:PGstBuffer; id:Tgint):PGstVideoMeta;cdecl;external libgstvideo;
function gst_buffer_add_video_meta(buffer:PGstBuffer; flags:TGstVideoFrameFlags; format:TGstVideoFormat; width:Tguint; height:Tguint):PGstVideoMeta;cdecl;external libgstvideo;
function gst_buffer_add_video_meta_full(buffer:PGstBuffer; flags:TGstVideoFrameFlags; format:TGstVideoFormat; width:Tguint; height:Tguint; 
           n_planes:Tguint; offset:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize; stride:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgint):PGstVideoMeta;cdecl;external libgstvideo;
function gst_video_meta_map(meta:PGstVideoMeta; plane:Tguint; info:PGstMapInfo; data:Pgpointer; stride:Pgint; 
           flags:TGstMapFlags):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_unmap(meta:PGstVideoMeta; plane:Tguint; info:PGstMapInfo):Tgboolean;cdecl;external libgstvideo;
{xxxxxxxxxx GST_VIDEO_DEPRECATED_FOR(gst_video_meta_set_alignment_full) }
function gst_video_meta_set_alignment(meta:PGstVideoMeta; alignment:TGstVideoAlignment):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_set_alignment_full(meta:PGstVideoMeta; alignment:PGstVideoAlignment):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_get_plane_size(meta:PGstVideoMeta; plane_size:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_get_plane_height(meta:PGstVideoMeta; plane_height:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tguint):Tgboolean;cdecl;external libgstvideo;
{*
 * GstVideoCropMeta:
 * @meta: parent #GstMeta
 * @x: the horizontal offset
 * @y: the vertical offset
 * @width: the cropped width
 * @height: the cropped height
 *
 * Extra buffer metadata describing image cropping.
  }
type
  PGstVideoCropMeta = ^TGstVideoCropMeta;
  TGstVideoCropMeta = record
      meta : TGstMeta;
      x : Tguint;
      y : Tguint;
      width : Tguint;
      height : Tguint;
    end;


function gst_video_crop_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_crop_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_crop_meta(b : longint) : PGstVideoCropMeta;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_add_video_crop_meta(b : longint) : PGstVideoCropMeta;

{ video metadata transforms  }
function gst_video_meta_transform_scale_get_quark:TGQuark;cdecl;external libgstvideo;
{*
 * gst_video_meta_transform_scale:
 *
 * GQuark for the video "gst-video-scale" transform.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_META_TRANSFORM_IS_SCALE(_type : longint) : longint;

{*
 * GstVideoMetaTransform:
 * @in_info: the input #GstVideoInfo
 * @out_info: the output #GstVideoInfo
 *
 * Extra data passed to a video transform #GstMetaTransformFunction such as:
 * "gst-video-scale".
 *
 * This transformation can not express letterbox, cropping, or rotations,
 * use #GstVideoMetaTransformMatrix instead
  }
type
  PGstVideoMetaTransform = ^TGstVideoMetaTransform;
  TGstVideoMetaTransform = record
      in_info : PGstVideoInfo;
      out_info : PGstVideoInfo;
    end;

function gst_video_meta_transform_matrix_get_quark:TGQuark;cdecl;external libgstvideo;
{*
 * GST_VIDEO_META_TRANSFORM_IS_MATRIX:
 *
 * Checks if a #GType of a meta transformation is a matrix transformation
 *
 * Returns: TRUE if its a matrix transformation
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_META_TRANSFORM_IS_MATRIX(_type : longint) : longint;

{*
 * GstVideoMetaTransformMatrix:
 * @in_info: the input #GstVideoInfo
 * @in_rectangle: the input #GstVideoRectangle
 * @out_info: the output #GstVideoInfo
 * @out_rectangle: the output #GstVideoRectangle
 * @matrix: a 3x3 matrix representing an homographic transformation
 *
 * Extra data passed to a video transform #GstMetaTransformFunction such as:
 * "gst-video-matrix".
 *
 * The matrix represents a transformation that is applied to the content of
 * @in_rectangle, and its output is put inside @out_rectangle. The coordinate
 * system has it's (0, 0) in the top-left corner of the rectangles and
 * goes down and right from there..
 *
 * It's a programming error to have a singular matrix.
 *
 * Since: 1.28
  }
type
  PGstVideoMetaTransformMatrix = ^TGstVideoMetaTransformMatrix;
  TGstVideoMetaTransformMatrix = record
      in_info : PGstVideoInfo;
      in_rectangle : TGstVideoRectangle;
      out_info : PGstVideoInfo;
      out_rectangle : TGstVideoRectangle;
      matrix : array[0..2] of array[0..2] of Tgfloat;
    end;

procedure gst_video_meta_transform_matrix_init(trans:PGstVideoMetaTransformMatrix; in_info:PGstVideoInfo; in_rectangle:PGstVideoRectangle; out_info:PGstVideoInfo; out_rectangle:PGstVideoRectangle);cdecl;external libgstvideo;
function gst_video_meta_transform_matrix_point(transform:PGstVideoMetaTransformMatrix; x:Pgint; y:Pgint):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_transform_matrix_point_clipped(transform:PGstVideoMetaTransformMatrix; x:Pgint; y:Pgint):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_transform_matrix_rectangle(transform:PGstVideoMetaTransformMatrix; rect:PGstVideoRectangle):Tgboolean;cdecl;external libgstvideo;
function gst_video_meta_transform_matrix_rectangle_clipped(transform:PGstVideoMetaTransformMatrix; rect:PGstVideoRectangle):Tgboolean;cdecl;external libgstvideo;
{*
 * GstVideoGLTextureType:
 * @GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE: Luminance texture, GL_LUMINANCE
 * @GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE_ALPHA: Luminance-alpha texture, GL_LUMINANCE_ALPHA
 * @GST_VIDEO_GL_TEXTURE_TYPE_RGB16: RGB 565 texture, GL_RGB
 * @GST_VIDEO_GL_TEXTURE_TYPE_RGB: RGB texture, GL_RGB
 * @GST_VIDEO_GL_TEXTURE_TYPE_RGBA: RGBA texture, GL_RGBA
 * @GST_VIDEO_GL_TEXTURE_TYPE_R: R texture, GL_RED_EXT
 * @GST_VIDEO_GL_TEXTURE_TYPE_RG: RG texture, GL_RG_EXT
 *
 * The GL texture type.
  }
type
  PGstVideoGLTextureType = ^TGstVideoGLTextureType;
  TGstVideoGLTextureType =  Longint;
  Const
    GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE = 0;
    GST_VIDEO_GL_TEXTURE_TYPE_LUMINANCE_ALPHA = 1;
    GST_VIDEO_GL_TEXTURE_TYPE_RGB16 = 2;
    GST_VIDEO_GL_TEXTURE_TYPE_RGB = 3;
    GST_VIDEO_GL_TEXTURE_TYPE_RGBA = 4;
    GST_VIDEO_GL_TEXTURE_TYPE_R = 5;
    GST_VIDEO_GL_TEXTURE_TYPE_RG = 6;
;
{*
 * GstVideoGLTextureOrientation:
 * @GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_NORMAL: Top line first in memory, left row first
 * @GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_FLIP: Bottom line first in memory, left row first
 * @GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_NORMAL: Top line first in memory, right row first
 * @GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_FLIP: Bottom line first in memory, right row first
 *
 * The orientation of the GL texture.
  }
type
  PGstVideoGLTextureOrientation = ^TGstVideoGLTextureOrientation;
  TGstVideoGLTextureOrientation =  Longint;
  Const
    GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_NORMAL = 0;
    GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_FLIP = 1;
    GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_NORMAL = 2;
    GST_VIDEO_GL_TEXTURE_ORIENTATION_X_FLIP_Y_FLIP = 3;
;

{ was #define dname def_expr }
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO : longint; { return type might be wrong }

type

  TGstVideoGLTextureUpload = function (meta:PGstVideoGLTextureUploadMeta; texture_id:array[0..3] of Tguint):Tgboolean;cdecl;

const
  GST_CAPS_FEATURE_META_GST_VIDEO_GL_TEXTURE_UPLOAD_META = 'meta:GstVideoGLTextureUploadMeta';  
{*
 * GST_BUFFER_POOL_OPTION_VIDEO_GL_TEXTURE_UPLOAD_META:
 *
 * An option that can be activated on a bufferpool to request gl texture upload
 * meta on buffers from the pool.
 *
 * When this option is enabled on the bufferpool,
 * @GST_BUFFER_POOL_OPTION_VIDEO_META should also be enabled.
 *
 * Since: 1.2.2
  }
  GST_BUFFER_POOL_OPTION_VIDEO_GL_TEXTURE_UPLOAD_META = 'GstBufferPoolOptionVideoGLTextureUploadMeta';  
{*
 * GstVideoGLTextureUploadMeta:
 * @meta: parent #GstMeta
 * @texture_orientation: Orientation of the textures
 * @n_textures: Number of textures that are generated
 * @texture_type: Type of each texture
 *
 * Extra buffer metadata for uploading a buffer to an OpenGL texture
 * ID. The caller of gst_video_gl_texture_upload_meta_upload() must
 * have OpenGL set up and call this from a thread where it is valid
 * to upload something to an OpenGL texture.
  }
{ <private>  }
type
  PGstVideoGLTextureUploadMeta = ^TGstVideoGLTextureUploadMeta;
  TGstVideoGLTextureUploadMeta = record
      meta : TGstMeta;cdecl;
      texture_orientation : TGstVideoGLTextureOrientation;
      n_textures : Tguint;
      texture_type : array[0..3] of TGstVideoGLTextureType;
      buffer : PGstBuffer;
      upload : TGstVideoGLTextureUpload;
      user_data : Tgpointer;
      user_data_copy : TGBoxedCopyFunc;
      user_data_free : TGBoxedFreeFunc;
    end;


function gst_video_gl_texture_upload_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_gl_texture_upload_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_gl_texture_upload_meta(b : longint) : PGstVideoGLTextureUploadMeta;

function gst_buffer_add_video_gl_texture_upload_meta(buffer:PGstBuffer; texture_orientation:TGstVideoGLTextureOrientation; n_textures:Tguint; texture_type:array[0..3] of TGstVideoGLTextureType; upload:TGstVideoGLTextureUpload; 
           user_data:Tgpointer; user_data_copy:TGBoxedCopyFunc; user_data_free:TGBoxedFreeFunc):PGstVideoGLTextureUploadMeta;cdecl;external libgstvideo;
function gst_video_gl_texture_upload_meta_upload(meta:PGstVideoGLTextureUploadMeta; texture_id:array[0..3] of Tguint):Tgboolean;cdecl;external libgstvideo;
{*
 * GstVideoRegionOfInterestMeta:
 * @meta: parent #GstMeta
 * @roi_type: GQuark describing the semantic of the Roi (f.i. a face, a pedestrian)
 * @id: identifier of this particular ROI
 * @parent_id: identifier of its parent ROI, used f.i. for ROI hierarchisation.
 * @x: x component of upper-left corner
 * @y: y component of upper-left corner
 * @w: bounding box width
 * @h: bounding box height
 * @params: list of #GstStructure containing element-specific params for downstream,
 *          see gst_video_region_of_interest_meta_add_param(). (Since: 1.14)
 *
 * Extra buffer metadata describing an image region of interest
  }
type
  PGstVideoRegionOfInterestMeta = ^TGstVideoRegionOfInterestMeta;
  TGstVideoRegionOfInterestMeta = record
      meta : TGstMeta;
      roi_type : TGQuark;
      id : Tgint;
      parent_id : Tgint;
      x : Tguint;
      y : Tguint;
      w : Tguint;
      h : Tguint;
      params : PGList;
    end;

function gst_video_region_of_interest_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE : longint; { return type might be wrong }

function gst_video_region_of_interest_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_REGION_OF_INTEREST_META_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_region_of_interest_meta(b : longint) : PGstVideoRegionOfInterestMeta;

function gst_buffer_get_video_region_of_interest_meta_id(buffer:PGstBuffer; id:Tgint):PGstVideoRegionOfInterestMeta;cdecl;external libgstvideo;
function gst_buffer_add_video_region_of_interest_meta(buffer:PGstBuffer; roi_type:Pgchar; x:Tguint; y:Tguint; w:Tguint; 
           h:Tguint):PGstVideoRegionOfInterestMeta;cdecl;external libgstvideo;
function gst_buffer_add_video_region_of_interest_meta_id(buffer:PGstBuffer; roi_type:TGQuark; x:Tguint; y:Tguint; w:Tguint; 
           h:Tguint):PGstVideoRegionOfInterestMeta;cdecl;external libgstvideo;
procedure gst_video_region_of_interest_meta_add_param(meta:PGstVideoRegionOfInterestMeta; s:PGstStructure);cdecl;external libgstvideo;
function gst_video_region_of_interest_meta_get_param(meta:PGstVideoRegionOfInterestMeta; name:Pgchar):PGstStructure;cdecl;external libgstvideo;
{*
 * GstVideoTimeCodeMeta:
 * @meta: parent #GstMeta
 * @tc: the GstVideoTimeCode to attach
 *
 * Extra buffer metadata describing the GstVideoTimeCode of the frame.
 *
 * Each frame is assumed to have its own timecode, i.e. they are not
 * automatically incremented/interpolated.
 *
 * Since: 1.10
  }
type
  PGstVideoTimeCodeMeta = ^TGstVideoTimeCodeMeta;
  TGstVideoTimeCodeMeta = record
      meta : TGstMeta;
      tc : TGstVideoTimeCode;
    end;

function gst_video_time_code_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_TIME_CODE_META_API_TYPE : longint; { return type might be wrong }

function gst_video_time_code_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_TIME_CODE_META_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_time_code_meta(b : longint) : PGstVideoTimeCodeMeta;

function gst_buffer_add_video_time_code_meta(buffer:PGstBuffer; tc:PGstVideoTimeCode):PGstVideoTimeCodeMeta;cdecl;external libgstvideo;
function gst_buffer_add_video_time_code_meta_full(buffer:PGstBuffer; fps_n:Tguint; fps_d:Tguint; latest_daily_jam:PGDateTime; flags:TGstVideoTimeCodeFlags; 
           hours:Tguint; minutes:Tguint; seconds:Tguint; frames:Tguint; field_count:Tguint):PGstVideoTimeCodeMeta;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_META_H__  }

// === Konventiert am: 15-7-26 13:20:34 ===


implementation


{ was #define dname def_expr }
function GST_VIDEO_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_META_API_TYPE:=gst_video_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_META_INFO:=gst_video_meta_get_info;
  end;

{ was #define dname def_expr }
function GST_VIDEO_CROP_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_CROP_META_API_TYPE:=gst_video_crop_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_CROP_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_CROP_META_INFO:=gst_video_crop_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_crop_meta(b : longint) : PGstVideoCropMeta;
begin
  gst_buffer_get_video_crop_meta:=PGstVideoCropMeta(gst_buffer_get_meta(b,GST_VIDEO_CROP_META_API_TYPE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_add_video_crop_meta(b : longint) : PGstVideoCropMeta;
begin
  gst_buffer_add_video_crop_meta:=PGstVideoCropMeta(gst_buffer_add_meta(b,GST_VIDEO_CROP_META_INFO,NULL));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_META_TRANSFORM_IS_SCALE(_type : longint) : longint;
begin
  GST_VIDEO_META_TRANSFORM_IS_SCALE:=_type=(gst_video_meta_transform_scale_get_quark);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_META_TRANSFORM_IS_MATRIX(_type : longint) : longint;
begin
  GST_VIDEO_META_TRANSFORM_IS_MATRIX:=_type=(gst_video_meta_transform_matrix_get_quark);
end;

{ was #define dname def_expr }
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE:=gst_video_gl_texture_upload_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_GL_TEXTURE_UPLOAD_META_INFO:=gst_video_gl_texture_upload_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_gl_texture_upload_meta(b : longint) : PGstVideoGLTextureUploadMeta;
begin
  gst_buffer_get_video_gl_texture_upload_meta:=PGstVideoGLTextureUploadMeta(gst_buffer_get_meta(b,GST_VIDEO_GL_TEXTURE_UPLOAD_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE:=gst_video_region_of_interest_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_REGION_OF_INTEREST_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_REGION_OF_INTEREST_META_INFO:=gst_video_region_of_interest_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_region_of_interest_meta(b : longint) : PGstVideoRegionOfInterestMeta;
begin
  gst_buffer_get_video_region_of_interest_meta:=PGstVideoRegionOfInterestMeta(gst_buffer_get_meta(b,GST_VIDEO_REGION_OF_INTEREST_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_VIDEO_TIME_CODE_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_TIME_CODE_META_API_TYPE:=gst_video_time_code_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_TIME_CODE_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_TIME_CODE_META_INFO:=gst_video_time_code_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_time_code_meta(b : longint) : PGstVideoTimeCodeMeta;
begin
  gst_buffer_get_video_time_code_meta:=PGstVideoTimeCodeMeta(gst_buffer_get_meta(b,GST_VIDEO_TIME_CODE_META_API_TYPE));
end;


end.
