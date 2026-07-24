
unit gstplayer_media_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstplayer_media_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplayer_media_info.h
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
PGList  = ^GList;
PGstCaps  = ^GstCaps;
PGstPlayerAudioInfo  = ^GstPlayerAudioInfo;
PGstPlayerMediaInfo  = ^GstPlayerMediaInfo;
PGstPlayerStreamInfo  = ^GstPlayerStreamInfo;
PGstPlayerSubtitleInfo  = ^GstPlayerSubtitleInfo;
PGstPlayerVideoInfo  = ^GstPlayerVideoInfo;
PGstSample  = ^GstSample;
PGstTagList  = ^GstTagList;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2015 Brijesh Singh <brijesh.ksingh@gmail.com>
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
{$ifndef __GST_PLAYER_MEDIA_INFO_H__}
{$define __GST_PLAYER_MEDIA_INFO_H__}
{$include <gst/gst.h>}
{$include <gst/player/player-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_PLAYER_STREAM_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_STREAM_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_STREAM_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_STREAM_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_STREAM_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerStreamInfo:
 *
 * Base structure for information concerning a media stream. Depending on
 * the stream type, one can find more media-specific information in
 * #GstPlayerVideoInfo, #GstPlayerAudioInfo, #GstPlayerSubtitleInfo.
  }
type

function gst_player_stream_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_player_stream_info_get_index(info:PGstPlayerStreamInfo):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_stream_info_get_stream_type(info:PGstPlayerStreamInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_player_stream_info_get_tags(info:PGstPlayerStreamInfo):PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_player_stream_info_get_caps(info:PGstPlayerStreamInfo):PGstCaps;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_stream_info_get_codec(info:PGstPlayerStreamInfo):Pgchar;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerVideoInfo:
 *
 * #GstPlayerStreamInfo specific to video streams.
  }
type

function gst_player_video_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_player_video_info_get_bitrate(info:PGstPlayerVideoInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_video_info_get_max_bitrate(info:PGstPlayerVideoInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_video_info_get_width(info:PGstPlayerVideoInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_video_info_get_height(info:PGstPlayerVideoInfo):Tgint;cdecl;external;
(* Const before type ignored *)
procedure gst_player_video_info_get_framerate(info:PGstPlayerVideoInfo; fps_n:Pgint; fps_d:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gst_player_video_info_get_pixel_aspect_ratio(info:PGstPlayerVideoInfo; par_n:Pguint; par_d:Pguint);cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_AUDIO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerAudioInfo:
 *
 * #GstPlayerStreamInfo specific to audio streams.
  }
type

function gst_player_audio_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_player_audio_info_get_channels(info:PGstPlayerAudioInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_audio_info_get_sample_rate(info:PGstPlayerAudioInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_audio_info_get_bitrate(info:PGstPlayerAudioInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_player_audio_info_get_max_bitrate(info:PGstPlayerAudioInfo):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_audio_info_get_language(info:PGstPlayerAudioInfo):Pgchar;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_SUBTITLE_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerSubtitleInfo:
 *
 * #GstPlayerStreamInfo specific to subtitle streams.
  }
type

function gst_player_subtitle_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_subtitle_info_get_language(info:PGstPlayerSubtitleInfo):Pgchar;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_MEDIA_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerMediaInfo:
 *
 * Structure containing the media information of a URI.
  }
type

function gst_player_media_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_uri(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_is_seekable(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_is_live(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_duration(info:PGstPlayerMediaInfo):TGstClockTime;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_stream_list(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_video_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_audio_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_subtitle_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_tags(info:PGstPlayerMediaInfo):PGstTagList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_title(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_container_format(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_image_sample(info:PGstPlayerMediaInfo):PGstSample;cdecl;external;
{xxxxxxxGST_PLAYER_DEPRECATED_FOR(gst_player_media_info_get_video_streams) }
(* Const before type ignored *)
function gst_player_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
{xxxxxxxGST_PLAYER_DEPRECATED_FOR(gst_player_media_info_get_audio_streams) }
(* Const before type ignored *)
function gst_player_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
{xxxxxxxGST_PLAYER_DEPRECATED_FOR(gst_player_media_info_get_subtitle_streams) }
(* Const before type ignored *)
function gst_player_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
{$endif}
{ __GST_PLAYER_MEDIA_INFO_H  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAYER_STREAM_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_STREAM_INFO:=gst_player_stream_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_STREAM_INFO(obj : longint) : longint;
begin
  GST_PLAYER_STREAM_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_STREAM_INFO,GstPlayerStreamInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_STREAM_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_STREAM_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_STREAM_INFO,GstPlayerStreamInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_STREAM_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_STREAM_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_STREAM_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_STREAM_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_STREAM_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_STREAM_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_VIDEO_INFO:=gst_player_video_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_PLAYER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_VIDEO_INFO,GstPlayerVideoInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_VIDEO_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(obj,GST_TYPE_PLAYER_VIDEO_INFO,GstPlayerVideoInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_VIDEO_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(obj,GST_TYPE_PLAYER_VIDEO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_AUDIO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_AUDIO_INFO:=gst_player_audio_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_PLAYER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_AUDIO_INFO,GstPlayerAudioInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_AUDIO_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_AUDIO_INFO,GstPlayerAudioInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_AUDIO_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_AUDIO_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_AUDIO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_SUBTITLE_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_SUBTITLE_INFO:=gst_player_subtitle_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_PLAYER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_SUBTITLE_INFO,GstPlayerSubtitleInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_SUBTITLE_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_SUBTITLE_INFO,GstPlayerSubtitleInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_SUBTITLE_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_MEDIA_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_MEDIA_INFO:=gst_player_media_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO(obj : longint) : longint;
begin
  GST_PLAYER_MEDIA_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_MEDIA_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_MEDIA_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_MEDIA_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_MEDIA_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_MEDIA_INFO);
end;


end.
