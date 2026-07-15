unit video_multiview;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2015> Jan Schmidt <jan@centricular.com>
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
{$ifndef __GST_VIDEO_MULTIVIEW_H__}
{$define __GST_VIDEO_MULTIVIEW_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{*
 * GstVideoMultiviewFlagsSet:
 *
 * See #GstVideoMultiviewFlags.
  }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_MULTIVIEW_FLAGSET : longint; { return type might be wrong }

function gst_video_multiview_flagset_get_type:TGType;cdecl;external libgstvideo;
function gst_video_multiview_mode_to_caps_string(mview_mode:TGstVideoMultiviewMode):Pgchar;cdecl;external libgstvideo;
function gst_video_multiview_mode_from_caps_string(caps_mview_mode:Pgchar):TGstVideoMultiviewMode;cdecl;external libgstvideo;
function gst_video_multiview_get_mono_modes:PGValue;cdecl;external libgstvideo;
function gst_video_multiview_get_unpacked_modes:PGValue;cdecl;external libgstvideo;
function gst_video_multiview_get_doubled_height_modes:PGValue;cdecl;external libgstvideo;
function gst_video_multiview_get_doubled_width_modes:PGValue;cdecl;external libgstvideo;
function gst_video_multiview_get_doubled_size_modes:PGValue;cdecl;external libgstvideo;
procedure gst_video_multiview_video_info_change_mode(info:PGstVideoInfo; out_mview_mode:TGstVideoMultiviewMode; out_mview_flags:TGstVideoMultiviewFlags);cdecl;external libgstvideo;
function gst_video_multiview_guess_half_aspect(mv_mode:TGstVideoMultiviewMode; width:Tguint; height:Tguint; par_n:Tguint; par_d:Tguint):Tgboolean;cdecl;external libgstvideo;
{$if 0 /* Place-holder for later MVC support */}

{ was #define dname def_expr }
function GST_VIDEO_MULTIVIEW_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_VIDEO_MULTIVIEW_META_INFO : longint; { return type might be wrong }

type

function gst_video_multiview_meta_api_get_type:TGType;cdecl;external libgstvideo;
function gst_video_multiview_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
function gst_buffer_add_video_multiview_meta(buffer:PGstBuffer; n_views:Tguint):PGstVideoMultiviewMeta;cdecl;external libgstvideo;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_multiview_meta(b : longint) : PGstVideoMultiviewMeta;

procedure gst_video_multiview_meta_set_n_views(mview_meta:PGstVideoMultiviewMeta; n_views:Tguint);cdecl;external libgstvideo;
type
  PGstVideoMultiviewViewLabel = ^TGstVideoMultiviewViewLabel;
  TGstVideoMultiviewViewLabel =  Longint;
  Const
    GST_VIDEO_MULTIVIEW_VIEW_UNKNOWN = 0;
    GST_VIDEO_MULTIVIEW_VIEW_MONO = 1;
    GST_VIDEO_MULTIVIEW_VIEW_LEFT = 2;
    GST_VIDEO_MULTIVIEW_VIEW_RIGHT = 3;
;
{ id of the GstVideoMeta for this view  }
{< private > }
type
  PGstVideoMultiviewViewInfo = ^TGstVideoMultiviewViewInfo;
  TGstVideoMultiviewViewInfo = record
      view_label : TGstVideoMultiviewViewLabel;
      meta_id : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstVideoMultiviewMeta = ^TGstVideoMultiviewMeta;
  TGstVideoMultiviewMeta = record
      meta : TGstMeta;
      n_views : Tguint;
      view_info : PGstVideoMultiviewViewInfo;
    end;

{$endif}
{$endif}

// === Konventiert am: 15-7-26 13:35:30 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_VIDEO_MULTIVIEW_FLAGSET : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_MULTIVIEW_FLAGSET:=gst_video_multiview_flagset_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_MULTIVIEW_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_MULTIVIEW_META_API_TYPE:=gst_video_multiview_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_MULTIVIEW_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_MULTIVIEW_META_INFO:=gst_video_multiview_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_multiview_meta(b : longint) : PGstVideoMultiviewMeta;
begin
  gst_buffer_get_video_multiview_meta:=PGstVideoMultiviewMeta(gst_buffer_get_meta(b,GST_VIDEO_MULTIVIEW_META_API_TYPE));
end;


end.
