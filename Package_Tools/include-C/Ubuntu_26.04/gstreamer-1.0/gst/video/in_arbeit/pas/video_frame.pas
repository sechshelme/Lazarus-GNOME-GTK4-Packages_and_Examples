unit video_frame;

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
{$ifndef __GST_VIDEO_FRAME_H__}
{$define __GST_VIDEO_FRAME_H__}
{$include <gst/video/video-enumtypes.h>}
type
{*
 * GstVideoFrameFlags:
 * @GST_VIDEO_FRAME_FLAG_NONE: no flags
 * @GST_VIDEO_FRAME_FLAG_INTERLACED: The video frame is interlaced. In mixed
 *           interlace-mode, this flag specifies if the frame is interlaced or
 *           progressive.
 * @GST_VIDEO_FRAME_FLAG_TFF: The video frame has the top field first
 * @GST_VIDEO_FRAME_FLAG_RFF: The video frame has the repeat flag
 * @GST_VIDEO_FRAME_FLAG_ONEFIELD: The video frame has one field
 * @GST_VIDEO_FRAME_FLAG_MULTIPLE_VIEW: The video contains one or
 *     more non-mono views
 * @GST_VIDEO_FRAME_FLAG_FIRST_IN_BUNDLE: The video frame is the first
 *     in a set of corresponding views provided as sequential frames.
 * @GST_VIDEO_FRAME_FLAG_TOP_FIELD: The video frame has the top field only. This
 *     is the same as GST_VIDEO_FRAME_FLAG_TFF | GST_VIDEO_FRAME_FLAG_ONEFIELD
 *     (Since: 1.16).
 * @GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD: The video frame has the bottom field
 *     only. This is the same as GST_VIDEO_FRAME_FLAG_ONEFIELD
 *     (GST_VIDEO_FRAME_FLAG_TFF flag unset) (Since: 1.16).
 *
 * Extra video frame flags
  }

  PGstVideoFrameFlags = ^TGstVideoFrameFlags;
  TGstVideoFrameFlags =  Longint;
  Const
    GST_VIDEO_FRAME_FLAG_NONE = 0;
    GST_VIDEO_FRAME_FLAG_INTERLACED = 1 shl 0;
    GST_VIDEO_FRAME_FLAG_TFF = 1 shl 1;
    GST_VIDEO_FRAME_FLAG_RFF = 1 shl 2;
    GST_VIDEO_FRAME_FLAG_ONEFIELD = 1 shl 3;
    GST_VIDEO_FRAME_FLAG_MULTIPLE_VIEW = 1 shl 4;
    GST_VIDEO_FRAME_FLAG_FIRST_IN_BUNDLE = 1 shl 5;
    GST_VIDEO_FRAME_FLAG_TOP_FIELD = GST_VIDEO_FRAME_FLAG_TFF or GST_VIDEO_FRAME_FLAG_ONEFIELD;
    GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD = GST_VIDEO_FRAME_FLAG_ONEFIELD;
;
{ circular dependency, need to include this after defining the enums  }
{$include <gst/video/video-format.h>}
{$include <gst/video/video-info.h>}
{*
 * GstVideoFrame:
 * @info: the #GstVideoInfo
 * @flags: #GstVideoFrameFlags for the frame
 * @buffer: the mapped buffer
 * @meta: pointer to metadata if any
 * @id: id of the mapped frame. the id can for example be used to
 *   identify the frame in case of multiview video.
 * @data: pointers to the plane data
 * @map: mappings of the planes
 *
 * A video frame obtained from gst_video_frame_map()
  }
{< private > }
type
  PGstVideoFrame = ^TGstVideoFrame;
  TGstVideoFrame = record
      info : TGstVideoInfo;
      flags : TGstVideoFrameFlags;
      buffer : PGstBuffer;
      meta : Tgpointer;
      id : Tgint;
      data : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgpointer;
      map : array[0..(GST_VIDEO_MAX_PLANES)-1] of TGstMapInfo;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_VIDEO_FRAME_INIT:
 *
 * Initializer for #GstVideoFrame
 *
 * Since: 1.22
  }
{xxxxxxx #define GST_VIDEO_FRAME_INIT   NULL, ,  }

function gst_video_frame_map(frame:PGstVideoFrame; info:PGstVideoInfo; buffer:PGstBuffer; flags:TGstMapFlags):Tgboolean;cdecl;external libgstvideo;
function gst_video_frame_map_id(frame:PGstVideoFrame; info:PGstVideoInfo; buffer:PGstBuffer; id:Tgint; flags:TGstMapFlags):Tgboolean;cdecl;external libgstvideo;
procedure gst_video_frame_unmap(frame:PGstVideoFrame);cdecl;external libgstvideo;
function gst_video_frame_copy(dest:PGstVideoFrame; src:PGstVideoFrame):Tgboolean;cdecl;external libgstvideo;
function gst_video_frame_copy_plane(dest:PGstVideoFrame; src:PGstVideoFrame; plane:Tguint):Tgboolean;cdecl;external libgstvideo;
{ general info  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FORMAT(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_WIDTH(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_HEIGHT(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_SIZE(f : longint) : longint;

{ flags  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FLAGS(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FLAG_IS_SET(f,fl : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_INTERLACED(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_TFF(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_RFF(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_ONEFIELD(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_TOP_FIELD(f : longint) : longint;

{  GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD is a subset of
 *  GST_VIDEO_FRAME_FLAG_TOP_FIELD so needs to be checked accordingly.  }
const
  _GST_VIDEO_FRAME_FLAG_FIELD_MASK = GST_VIDEO_FRAME_FLAG_TOP_FIELD;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_FRAME_IS_BOTTOM_FIELD(f : longint) : longint;

{ dealing with planes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_N_PLANES(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_DATA(f,p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_OFFSET(f,p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_STRIDE(f,p : longint) : longint;

{ dealing with components  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_N_COMPONENTS(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_DEPTH(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_DATA(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_STRIDE(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_OFFSET(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_WIDTH(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_HEIGHT(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_PLANE(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_PSTRIDE(f,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_POFFSET(f,c : longint) : longint;

{ buffer flags  }
{*
 * GstVideoBufferFlags:
 * @GST_VIDEO_BUFFER_FLAG_INTERLACED:  If the #GstBuffer is interlaced. In mixed
 *                                     interlace-mode, this flags specifies if the frame is
 *                                     interlaced or progressive.
 * @GST_VIDEO_BUFFER_FLAG_TFF:         If the #GstBuffer is interlaced, then the first field
 *                                     in the video frame is the top field.  If unset, the
 *                                     bottom field is first.
 * @GST_VIDEO_BUFFER_FLAG_RFF:         If the #GstBuffer is interlaced, then the first field
 *                                     (as defined by the %GST_VIDEO_BUFFER_FLAG_TFF flag setting)
 *                                     is repeated.
 * @GST_VIDEO_BUFFER_FLAG_ONEFIELD:    If the #GstBuffer is interlaced, then only the
 *                                     first field (as defined by the %GST_VIDEO_BUFFER_FLAG_TFF
 *                                     flag setting) is to be displayed (Since: 1.16).
 * @GST_VIDEO_BUFFER_FLAG_MULTIPLE_VIEW: The #GstBuffer contains one or more specific views,
 *                                     such as left or right eye view. This flags is set on
 *                                     any buffer that contains non-mono content - even for
 *                                     streams that contain only a single viewpoint. In mixed
 *                                     mono / non-mono streams, the absence of the flag marks
 *                                     mono buffers.
 * @GST_VIDEO_BUFFER_FLAG_FIRST_IN_BUNDLE: When conveying stereo/multiview content with
 *                                     frame-by-frame methods, this flag marks the first buffer
 *                                      in a bundle of frames that belong together.
 * @GST_VIDEO_BUFFER_FLAG_TOP_FIELD:   The video frame has the top field only. This is the
 *                                     same as GST_VIDEO_BUFFER_FLAG_TFF |
 *                                     GST_VIDEO_BUFFER_FLAG_ONEFIELD (Since: 1.16).
 *                                     Use GST_VIDEO_BUFFER_IS_TOP_FIELD() to check for this flag.
 * @GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD: The video frame has the bottom field only. This is
 *                                     the same as GST_VIDEO_BUFFER_FLAG_ONEFIELD
 *                                     (GST_VIDEO_BUFFER_FLAG_TFF flag unset) (Since: 1.16).
 *                                     Use GST_VIDEO_BUFFER_IS_BOTTOM_FIELD() to check for this flag.
 * @GST_VIDEO_BUFFER_FLAG_MARKER:      The #GstBuffer contains the end of a video field or frame
 *                                     boundary such as the last subframe or packet (Since: 1.18).
 * @GST_VIDEO_BUFFER_FLAG_LAST:        Offset to define more flags
 *
 * Additional video buffer flags. These flags can potentially be used on any
 * buffers carrying closed caption data, or video data - even encoded data.
 *
 * Note that these are only valid for #GstCaps of type: video/... and caption/...
 * They can conflict with other extended buffer flags.
  }
type
  PGstVideoBufferFlags = ^TGstVideoBufferFlags;
  TGstVideoBufferFlags =  Longint;
  Const
    GST_VIDEO_BUFFER_FLAG_INTERLACED = GST_BUFFER_FLAG_LAST shl 0;
    GST_VIDEO_BUFFER_FLAG_TFF = GST_BUFFER_FLAG_LAST shl 1;
    GST_VIDEO_BUFFER_FLAG_RFF = GST_BUFFER_FLAG_LAST shl 2;
    GST_VIDEO_BUFFER_FLAG_ONEFIELD = GST_BUFFER_FLAG_LAST shl 3;
    GST_VIDEO_BUFFER_FLAG_MULTIPLE_VIEW = GST_BUFFER_FLAG_LAST shl 4;
    GST_VIDEO_BUFFER_FLAG_FIRST_IN_BUNDLE = GST_BUFFER_FLAG_LAST shl 5;
    GST_VIDEO_BUFFER_FLAG_TOP_FIELD = GST_VIDEO_BUFFER_FLAG_TFF or GST_VIDEO_BUFFER_FLAG_ONEFIELD;
    GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD = GST_VIDEO_BUFFER_FLAG_ONEFIELD;
    GST_VIDEO_BUFFER_FLAG_MARKER = GST_BUFFER_FLAG_MARKER;
    GST_VIDEO_BUFFER_FLAG_LAST = GST_BUFFER_FLAG_LAST shl 8;
;
{ GST_VIDEO_BUFFER_FLAG_TOP_FIELD is a subset of
 * GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD so needs to be checked accordingly.  }
  _GST_VIDEO_BUFFER_FLAG_FIELD_MASK = GST_VIDEO_BUFFER_FLAG_TOP_FIELD;  
{*
 * GST_VIDEO_BUFFER_IS_TOP_FIELD:
 * @buf: a #GstBuffer
 *
 * Check if GST_VIDEO_BUFFER_FLAG_TOP_FIELD is set on @buf (Since: 1.18).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_BUFFER_IS_TOP_FIELD(buf : longint) : longint;

{*
 * GST_VIDEO_BUFFER_IS_BOTTOM_FIELD:
 * @buf: a #GstBuffer
 *
 * Check if GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD is set on @buf (Since: 1.18).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_BUFFER_IS_BOTTOM_FIELD(buf : longint) : longint;

{*
 * GstVideoFrameMapFlags:
 * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
 *                                    the GstVideoFrame. This makes sure that the buffer stays
 *                                    writable while the frame is mapped, but requires that the
 *                                    buffer reference stays valid until the frame is unmapped again.
 * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
 *
 * Additional mapping flags for gst_video_frame_map().
 *
 * Since: 1.6
  }
{ 8 more flags possible afterwards  }
type
  PGstVideoFrameMapFlags = ^TGstVideoFrameMapFlags;
  TGstVideoFrameMapFlags =  Longint;
  Const
    GST_VIDEO_FRAME_MAP_FLAG_NO_REF = GST_MAP_FLAG_LAST shl 0;
    GST_VIDEO_FRAME_MAP_FLAG_LAST = GST_MAP_FLAG_LAST shl 8;
;
{$endif}
{ __GST_VIDEO_FRAME_H__  }

// === Konventiert am: 15-7-26 13:35:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FORMAT(f : longint) : longint;
begin
  GST_VIDEO_FRAME_FORMAT:=GST_VIDEO_INFO_FORMAT(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_WIDTH(f : longint) : longint;
begin
  GST_VIDEO_FRAME_WIDTH:=GST_VIDEO_INFO_WIDTH(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_HEIGHT(f : longint) : longint;
begin
  GST_VIDEO_FRAME_HEIGHT:=GST_VIDEO_INFO_HEIGHT(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_SIZE(f : longint) : longint;
begin
  GST_VIDEO_FRAME_SIZE:=GST_VIDEO_INFO_SIZE(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FLAGS(f : longint) : longint;
begin
  GST_VIDEO_FRAME_FLAGS:=f^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_FLAG_IS_SET(f,fl : longint) : longint;
begin
  GST_VIDEO_FRAME_FLAG_IS_SET:=((GST_VIDEO_FRAME_FLAGS(f)) and fl)=fl;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_INTERLACED(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_INTERLACED:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_INTERLACED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_TFF(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_TFF:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_TFF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_RFF(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_RFF:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_RFF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_ONEFIELD(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_ONEFIELD:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_ONEFIELD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_TOP_FIELD(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_TOP_FIELD:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_TOP_FIELD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_IS_BOTTOM_FIELD(f : longint) : longint;
begin
  GST_VIDEO_FRAME_IS_BOTTOM_FIELD:=((f^.flags) and _GST_VIDEO_FRAME_FLAG_FIELD_MASK)=GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_N_PLANES(f : longint) : longint;
begin
  GST_VIDEO_FRAME_N_PLANES:=GST_VIDEO_INFO_N_PLANES(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_DATA(f,p : longint) : longint;
begin
  GST_VIDEO_FRAME_PLANE_DATA:=f^.(data[p]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_OFFSET(f,p : longint) : longint;
begin
  GST_VIDEO_FRAME_PLANE_OFFSET:=GST_VIDEO_INFO_PLANE_OFFSET(@(f^.info),p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_PLANE_STRIDE(f,p : longint) : longint;
begin
  GST_VIDEO_FRAME_PLANE_STRIDE:=GST_VIDEO_INFO_PLANE_STRIDE(@(f^.info),p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_N_COMPONENTS(f : longint) : longint;
begin
  GST_VIDEO_FRAME_N_COMPONENTS:=GST_VIDEO_INFO_N_COMPONENTS(@(f^.info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_DEPTH(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_DEPTH:=GST_VIDEO_INFO_COMP_DEPTH(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_DATA(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_DATA:=GST_VIDEO_INFO_COMP_DATA(@(f^.info),f^.data,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_STRIDE(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_STRIDE:=GST_VIDEO_INFO_COMP_STRIDE(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_OFFSET(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_OFFSET:=GST_VIDEO_INFO_COMP_OFFSET(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_WIDTH(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_WIDTH:=GST_VIDEO_INFO_COMP_WIDTH(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_HEIGHT(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_HEIGHT:=GST_VIDEO_INFO_COMP_HEIGHT(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_PLANE(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_PLANE:=GST_VIDEO_INFO_COMP_PLANE(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_PSTRIDE(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_PSTRIDE:=GST_VIDEO_INFO_COMP_PSTRIDE(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FRAME_COMP_POFFSET(f,c : longint) : longint;
begin
  GST_VIDEO_FRAME_COMP_POFFSET:=GST_VIDEO_INFO_COMP_POFFSET(@(f^.info),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_BUFFER_IS_TOP_FIELD(buf : longint) : longint;
begin
  GST_VIDEO_BUFFER_IS_TOP_FIELD:=((GST_BUFFER_FLAGS(buf)) and _GST_VIDEO_BUFFER_FLAG_FIELD_MASK)=GST_VIDEO_BUFFER_FLAG_TOP_FIELD;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_BUFFER_IS_BOTTOM_FIELD(buf : longint) : longint;
begin
  GST_VIDEO_BUFFER_IS_BOTTOM_FIELD:=((GST_BUFFER_FLAGS(buf)) and _GST_VIDEO_BUFFER_FLAG_FIELD_MASK)=GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD;
end;


end.
