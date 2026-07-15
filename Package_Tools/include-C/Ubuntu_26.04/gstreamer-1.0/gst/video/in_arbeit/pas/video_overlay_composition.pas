unit video_overlay_composition;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Video Overlay Composition
 * Copyright (C) 2011 Intel Corporation
 * Copyright (C) 2011 Collabora Ltd.
 * Copyright (C) 2011 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_VIDEO_OVERLAY_COMPOSITION_H__}
{$define __GST_VIDEO_OVERLAY_COMPOSITION_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{*
 * GstVideoOverlayRectangle:
 *
 * An opaque video overlay rectangle object. A rectangle contains a single
 * overlay rectangle which can be added to a composition.
  }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY_RECTANGLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj : longint) : PGstVideoOverlayRectangle;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_RECTANGLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY_RECTANGLE(obj : longint) : longint;

type
{*
 * GstVideoOverlayFormatFlags:
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_NONE: no flags
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_PREMULTIPLIED_ALPHA: RGB are premultiplied by A/255.
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA: a global-alpha value != 1 is set.
 *
 * Overlay format flags.
  }

  PGstVideoOverlayFormatFlags = ^TGstVideoOverlayFormatFlags;
  TGstVideoOverlayFormatFlags =  Longint;
  Const
    GST_VIDEO_OVERLAY_FORMAT_FLAG_NONE = 0;
    GST_VIDEO_OVERLAY_FORMAT_FLAG_PREMULTIPLIED_ALPHA = 1 shl 0;
    GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA = 1 shl 1;
;
  GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION = 'meta:GstVideoOverlayComposition';  
{*
  * GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB:
  *
  * Supported RGB overlay video format.
   }
{$if G_BYTE_ORDER == G_LITTLE_ENDIAN}

const
  GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB = GST_VIDEO_FORMAT_BGRA;  
{$else}

const
  GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB = GST_VIDEO_FORMAT_ARGB;  
{$endif}
{*
  * GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_YUV:
  *
  * Supported YUV overlay video format.
   }

const
  GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_YUV = GST_VIDEO_FORMAT_AYUV;  
{*
 * GST_VIDEO_OVERLAY_COMPOSITION_BLEND_FORMATS:
 *
 * Video formats supported by gst_video_overlay_composition_blend(), for
 * use in overlay elements' pad template caps.
 *
 * Since: 1.2
  }
  GST_VIDEO_OVERLAY_COMPOSITION_BLEND_FORMATS = GST_VIDEO_FORMATS_ALL;  

function gst_video_overlay_rectangle_get_type:TGType;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_new_raw(pixels:PGstBuffer; render_x:Tgint; render_y:Tgint; render_width:Tguint; render_height:Tguint; 
           flags:TGstVideoOverlayFormatFlags):PGstVideoOverlayRectangle;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_copy(rectangle:PGstVideoOverlayRectangle):PGstVideoOverlayRectangle;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_seqnum(rectangle:PGstVideoOverlayRectangle):Tguint;cdecl;external libgstvideo;
procedure gst_video_overlay_rectangle_set_render_rectangle(rectangle:PGstVideoOverlayRectangle; render_x:Tgint; render_y:Tgint; render_width:Tguint; render_height:Tguint);cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_render_rectangle(rectangle:PGstVideoOverlayRectangle; render_x:Pgint; render_y:Pgint; render_width:Pguint; render_height:Pguint):Tgboolean;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_raw(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_argb(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_ayuv(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_raw(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_argb(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_ayuv(rectangle:PGstVideoOverlayRectangle; flags:TGstVideoOverlayFormatFlags):PGstBuffer;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_flags(rectangle:PGstVideoOverlayRectangle):TGstVideoOverlayFormatFlags;cdecl;external libgstvideo;
function gst_video_overlay_rectangle_get_global_alpha(rectangle:PGstVideoOverlayRectangle):Tgfloat;cdecl;external libgstvideo;
procedure gst_video_overlay_rectangle_set_global_alpha(rectangle:PGstVideoOverlayRectangle; global_alpha:Tgfloat);cdecl;external libgstvideo;
{*
 * GstVideoOverlayComposition:
 *
 * An opaque video overlay composition object. A composition contains
 * multiple overlay rectangles.
  }
{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY_COMPOSITION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj : longint) : PGstVideoOverlayComposition;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_COMPOSITION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY_COMPOSITION(obj : longint) : longint;

type

function gst_video_overlay_composition_get_type:TGType;cdecl;external libgstvideo;
function gst_video_overlay_composition_copy(comp:PGstVideoOverlayComposition):PGstVideoOverlayComposition;cdecl;external libgstvideo;
function gst_video_overlay_composition_make_writable(comp:PGstVideoOverlayComposition):PGstVideoOverlayComposition;cdecl;external libgstvideo;
function gst_video_overlay_composition_new(rectangle:PGstVideoOverlayRectangle):PGstVideoOverlayComposition;cdecl;external libgstvideo;
procedure gst_video_overlay_composition_add_rectangle(comp:PGstVideoOverlayComposition; rectangle:PGstVideoOverlayRectangle);cdecl;external libgstvideo;
function gst_video_overlay_composition_n_rectangles(comp:PGstVideoOverlayComposition):Tguint;cdecl;external libgstvideo;
function gst_video_overlay_composition_get_rectangle(comp:PGstVideoOverlayComposition; n:Tguint):PGstVideoOverlayRectangle;cdecl;external libgstvideo;
function gst_video_overlay_composition_get_seqnum(comp:PGstVideoOverlayComposition):Tguint;cdecl;external libgstvideo;
{ blend composition onto raw video buffer  }
function gst_video_overlay_composition_blend(comp:PGstVideoOverlayComposition; video_buf:PGstVideoFrame):Tgboolean;cdecl;external libgstvideo;
{ attach/retrieve composition from buffers  }
{ was #define dname def_expr }
function GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_OVERLAY_COMPOSITION_META_INFO : longint; { return type might be wrong }

type
{*
 * GstVideoOverlayCompositionMeta:
 * @meta: parent #GstMeta
 * @overlay: the attached #GstVideoOverlayComposition
 *
 * Extra buffer metadata describing image overlay data.
  }
  PGstVideoOverlayCompositionMeta = ^TGstVideoOverlayCompositionMeta;
  TGstVideoOverlayCompositionMeta = record
      meta : TGstMeta;
      overlay : PGstVideoOverlayComposition;
    end;


function gst_video_overlay_composition_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_overlay_composition_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
function gst_buffer_add_video_overlay_composition_meta(buf:PGstBuffer; comp:PGstVideoOverlayComposition):PGstVideoOverlayCompositionMeta;cdecl;external libgstvideo;
{$ifndef GST_DISABLE_DEPRECATED}
{*
 * gst_buffer_get_video_overlay_composition_meta:
 * @b: a #GstBuffer
 *
 * Gets the first video composition meta.
 *
 * Deprecated: It is common to have multiple video composition metas, it is thus
 *  recommended to use use gst_buffer_iterate_meta() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function gst_buffer_get_video_overlay_composition_meta(b : longint) : PGstVideoOverlayCompositionMeta;

{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_buffer_remove_video_overlay_composition_meta(b,m : longint) : longint;

{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoOverlayComposition, gst_video_overlay_composition_unref) }
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoOverlayRectangle, gst_video_overlay_rectangle_unref) }
{$endif}
{ __GST_VIDEO_OVERLAY_COMPOSITION_H__  }

// === Konventiert am: 15-7-26 13:39:13 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY_RECTANGLE : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_OVERLAY_RECTANGLE:=gst_video_overlay_rectangle_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj : longint) : PGstVideoOverlayRectangle;
begin
  GST_VIDEO_OVERLAY_RECTANGLE_CAST:=PGstVideoOverlayRectangle(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_RECTANGLE(obj : longint) : longint;
begin
  GST_VIDEO_OVERLAY_RECTANGLE:=GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY_RECTANGLE(obj : longint) : longint;
begin
  GST_IS_VIDEO_OVERLAY_RECTANGLE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_VIDEO_OVERLAY_RECTANGLE);
end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY_COMPOSITION : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_OVERLAY_COMPOSITION:=gst_video_overlay_composition_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj : longint) : PGstVideoOverlayComposition;
begin
  GST_VIDEO_OVERLAY_COMPOSITION_CAST:=PGstVideoOverlayComposition(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_COMPOSITION(obj : longint) : longint;
begin
  GST_VIDEO_OVERLAY_COMPOSITION:=GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY_COMPOSITION(obj : longint) : longint;
begin
  GST_IS_VIDEO_OVERLAY_COMPOSITION:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_VIDEO_OVERLAY_COMPOSITION);
end;

{ was #define dname def_expr }
function GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE:=gst_video_overlay_composition_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_OVERLAY_COMPOSITION_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_OVERLAY_COMPOSITION_META_INFO:=gst_video_overlay_composition_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_overlay_composition_meta(b : longint) : PGstVideoOverlayCompositionMeta;
begin
  gst_buffer_get_video_overlay_composition_meta:=PGstVideoOverlayCompositionMeta(gst_buffer_get_meta(b,GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_remove_video_overlay_composition_meta(b,m : longint) : longint;
begin
  gst_buffer_remove_video_overlay_composition_meta:=gst_buffer_remove_meta(b,PGstMeta(m));
end;


end.
