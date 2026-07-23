
unit gstdiscoverer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdiscoverer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdiscoverer.h
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
PGError  = ^GError;
PGList  = ^GList;
PGObject  = ^GObject;
PGstCaps  = ^GstCaps;
PGstDiscoverer  = ^GstDiscoverer;
PGstDiscovererAudioInfo  = ^GstDiscovererAudioInfo;
PGstDiscovererAudioInfoClass  = ^GstDiscovererAudioInfoClass;
PGstDiscovererClass  = ^GstDiscovererClass;
PGstDiscovererContainerInfo  = ^GstDiscovererContainerInfo;
PGstDiscovererContainerInfoClass  = ^GstDiscovererContainerInfoClass;
PGstDiscovererInfo  = ^GstDiscovererInfo;
PGstDiscovererInfoClass  = ^GstDiscovererInfoClass;
PGstDiscovererPrivate  = ^GstDiscovererPrivate;
PGstDiscovererResult  = ^GstDiscovererResult;
PGstDiscovererSerializeFlags  = ^GstDiscovererSerializeFlags;
PGstDiscovererStreamInfo  = ^GstDiscovererStreamInfo;
PGstDiscovererStreamInfoClass  = ^GstDiscovererStreamInfoClass;
PGstDiscovererSubtitleInfo  = ^GstDiscovererSubtitleInfo;
PGstDiscovererSubtitleInfoClass  = ^GstDiscovererSubtitleInfoClass;
PGstDiscovererVideoInfo  = ^GstDiscovererVideoInfo;
PGstDiscovererVideoInfoClass  = ^GstDiscovererVideoInfoClass;
PGstElement  = ^GstElement;
PGstStructure  = ^GstStructure;
PGstTagList  = ^GstTagList;
PGstToc  = ^GstToc;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
{$ifndef _GST_DISCOVERER_H_}
{$define _GST_DISCOVERER_H_}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_STREAM_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_STREAM_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_STREAM_INFO(obj : longint) : longint;

type

  PGstDiscovererStreamInfoClass = ^TGstDiscovererStreamInfoClass;
  TGstDiscovererStreamInfoClass = TGObjectClass;

function gst_discoverer_stream_info_get_type:TGType;cdecl;external;
{*
 * GstDiscovererStreamInfo:
 *
 * Base structure for information concerning a media stream. Depending on the
 * stream type, one can find more media-specific information in
 * #GstDiscovererAudioInfo, #GstDiscovererVideoInfo, and
 * #GstDiscovererContainerInfo.
 *
 * The #GstDiscovererStreamInfo represents the topology of the stream. Siblings
 * can be iterated over with gst_discoverer_stream_info_get_next() and
 * gst_discoverer_stream_info_get_previous(). Children (sub-streams) of a
 * stream can be accessed using the #GstDiscovererContainerInfo API.
 *
 * As a simple example, if you run #GstDiscoverer on an AVI file with one audio
 * and one video stream, you will get a #GstDiscovererContainerInfo
 * corresponding to the AVI container, which in turn will have a
 * #GstDiscovererAudioInfo sub-stream and a #GstDiscovererVideoInfo sub-stream
 * for the audio and video streams respectively.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_discoverer_stream_info_ref(info : longint) : PGstDiscovererStreamInfo;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_stream_info_unref(info : longint) : longint;

function gst_discoverer_stream_info_get_previous(info:PGstDiscovererStreamInfo):PGstDiscovererStreamInfo;cdecl;external;
function gst_discoverer_stream_info_get_next(info:PGstDiscovererStreamInfo):PGstDiscovererStreamInfo;cdecl;external;
function gst_discoverer_stream_info_get_caps(info:PGstDiscovererStreamInfo):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_stream_info_get_tags(info:PGstDiscovererStreamInfo):PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_stream_info_get_toc(info:PGstDiscovererStreamInfo):PGstToc;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_stream_info_get_stream_id(info:PGstDiscovererStreamInfo):Pgchar;cdecl;external;
{xxxxxx GST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details) }
(* Const before type ignored *)
function gst_discoverer_stream_info_get_misc(info:PGstDiscovererStreamInfo):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_stream_info_get_stream_type_nick(info:PGstDiscovererStreamInfo):Pgchar;cdecl;external;
function gst_discoverer_stream_info_get_stream_number(info:PGstDiscovererStreamInfo):Tgint;cdecl;external;
{*
 * GstDiscovererContainerInfo:
 *
 * #GstDiscovererStreamInfo specific to container streams.
  }
{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_CONTAINER_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_CONTAINER_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_CONTAINER_INFO(obj : longint) : longint;

type

  PGstDiscovererContainerInfoClass = ^TGstDiscovererContainerInfoClass;
  TGstDiscovererContainerInfoClass = TGObjectClass;

function gst_discoverer_container_info_get_type:TGType;cdecl;external;
function gst_discoverer_container_info_get_streams(info:PGstDiscovererContainerInfo):PGList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_container_info_get_tags(info:PGstDiscovererContainerInfo):PGstTagList;cdecl;external;
{*
 * GstDiscovererAudioInfo:
 *
 * #GstDiscovererStreamInfo specific to audio streams.
  }
{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_AUDIO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_AUDIO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_AUDIO_INFO(obj : longint) : longint;

type

  PGstDiscovererAudioInfoClass = ^TGstDiscovererAudioInfoClass;
  TGstDiscovererAudioInfoClass = TGObjectClass;

function gst_discoverer_audio_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_channels(info:PGstDiscovererAudioInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_channel_mask(info:PGstDiscovererAudioInfo):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_sample_rate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_depth(info:PGstDiscovererAudioInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_bitrate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_audio_info_get_max_bitrate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_audio_info_get_language(info:PGstDiscovererAudioInfo):Pgchar;cdecl;external;
{*
 * GstDiscovererVideoInfo:
 *
 * #GstDiscovererStreamInfo specific to video streams (this includes images).
  }
{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_VIDEO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_VIDEO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_VIDEO_INFO(obj : longint) : longint;

type

  PGstDiscovererVideoInfoClass = ^TGstDiscovererVideoInfoClass;
  TGstDiscovererVideoInfoClass = TGObjectClass;

function gst_discoverer_video_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_width(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_height(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_depth(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_framerate_num(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_framerate_denom(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_par_num(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_par_denom(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_is_interlaced(info:PGstDiscovererVideoInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_bitrate(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_get_max_bitrate(info:PGstDiscovererVideoInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_video_info_is_image(info:PGstDiscovererVideoInfo):Tgboolean;cdecl;external;
{*
 * GstDiscovererSubtitleInfo:
 *
 * #GstDiscovererStreamInfo specific to subtitle streams (this includes text and
 * image based ones).
  }
{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_SUBTITLE_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_SUBTITLE_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_SUBTITLE_INFO(obj : longint) : longint;

type

  PGstDiscovererSubtitleInfoClass = ^TGstDiscovererSubtitleInfoClass;
  TGstDiscovererSubtitleInfoClass = TGObjectClass;

function gst_discoverer_subtitle_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_subtitle_info_get_language(info:PGstDiscovererSubtitleInfo):Pgchar;cdecl;external;
{*
 * GstDiscovererResult:
 * @GST_DISCOVERER_OK: The discovery was successful
 * @GST_DISCOVERER_URI_INVALID: the URI is invalid
 * @GST_DISCOVERER_ERROR: an error happened and the GError is set
 * @GST_DISCOVERER_TIMEOUT: the discovery timed-out
 * @GST_DISCOVERER_BUSY: the discoverer was already discovering a file
 * @GST_DISCOVERER_MISSING_PLUGINS: Some plugins are missing for full discovery
 *
 * Result values for the discovery process.
  }
type
  PGstDiscovererResult = ^TGstDiscovererResult;
  TGstDiscovererResult =  Longint;
  Const
    GST_DISCOVERER_OK = 0;
    GST_DISCOVERER_URI_INVALID = 1;
    GST_DISCOVERER_ERROR = 2;
    GST_DISCOVERER_TIMEOUT = 3;
    GST_DISCOVERER_BUSY = 4;
    GST_DISCOVERER_MISSING_PLUGINS = 5;
;
{*
 * GstDiscovererSerializeFlags:
 * @GST_DISCOVERER_SERIALIZE_BASIC: Serialize only basic information, excluding
 * caps, tags and miscellaneous information
 * @GST_DISCOVERER_SERIALIZE_CAPS: Serialize the caps for each stream
 * @GST_DISCOVERER_SERIALIZE_TAGS: Serialize the tags for each stream
 * @GST_DISCOVERER_SERIALIZE_MISC: Serialize miscellaneous information for each stream
 * @GST_DISCOVERER_SERIALIZE_ALL: Serialize all the available info, including
 * caps, tags and miscellaneous information
 *
 * You can use these flags to control what is serialized by
 * gst_discoverer_info_to_variant()
 *
 * Since: 1.6
  }
type
  PGstDiscovererSerializeFlags = ^TGstDiscovererSerializeFlags;
  TGstDiscovererSerializeFlags =  Longint;
  Const
    GST_DISCOVERER_SERIALIZE_BASIC = 0;
    GST_DISCOVERER_SERIALIZE_CAPS = 1 shl 0;
    GST_DISCOVERER_SERIALIZE_TAGS = 1 shl 1;
    GST_DISCOVERER_SERIALIZE_MISC = 1 shl 2;
    GST_DISCOVERER_SERIALIZE_ALL = (GST_DISCOVERER_SERIALIZE_CAPS or GST_DISCOVERER_SERIALIZE_TAGS) or GST_DISCOVERER_SERIALIZE_MISC;
;
{*
 * GstDiscovererInfo:
 *
 * Structure containing the information of a URI analyzed by #GstDiscoverer.
  }
type

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_INFO(obj : longint) : longint;

type
  PGstDiscovererInfoClass = ^TGstDiscovererInfoClass;
  TGstDiscovererInfoClass = TGObjectClass;

function gst_discoverer_info_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_unref(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_ref(info : longint) : longint;

function gst_discoverer_info_copy(ptr:PGstDiscovererInfo):PGstDiscovererInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_info_get_uri(info:PGstDiscovererInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_info_get_result(info:PGstDiscovererInfo):TGstDiscovererResult;cdecl;external;
function gst_discoverer_info_get_stream_info(info:PGstDiscovererInfo):PGstDiscovererStreamInfo;cdecl;external;
function gst_discoverer_info_get_stream_list(info:PGstDiscovererInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_info_get_duration(info:PGstDiscovererInfo):TGstClockTime;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_info_get_seekable(info:PGstDiscovererInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_discoverer_info_get_live(info:PGstDiscovererInfo):Tgboolean;cdecl;external;
{xxxxGST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details) }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_info_get_misc(info:PGstDiscovererInfo):PGstStructure;cdecl;external;
{xxxxxGST_PBUTILS_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_info_get_tags(info:PGstDiscovererInfo):PGstTagList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_info_get_toc(info:PGstDiscovererInfo):PGstToc;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_discoverer_info_get_missing_elements_installer_details(info:PGstDiscovererInfo):^Pgchar;cdecl;external;
function gst_discoverer_info_get_streams(info:PGstDiscovererInfo; streamtype:TGType):PGList;cdecl;external;
function gst_discoverer_info_get_audio_streams(info:PGstDiscovererInfo):PGList;cdecl;external;
function gst_discoverer_info_get_video_streams(info:PGstDiscovererInfo):PGList;cdecl;external;
function gst_discoverer_info_get_subtitle_streams(info:PGstDiscovererInfo):PGList;cdecl;external;
function gst_discoverer_info_get_container_streams(info:PGstDiscovererInfo):PGList;cdecl;external;
function gst_discoverer_info_to_variant(info:PGstDiscovererInfo; flags:TGstDiscovererSerializeFlags):PGVariant;cdecl;external;
function gst_discoverer_info_from_variant(variant:PGVariant):PGstDiscovererInfo;cdecl;external;
procedure gst_discoverer_stream_info_list_free(infos:PGList);cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_DISCOVERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_CLASS(klass : longint) : longint;

type
{*
 * GstDiscoverer:
 *
 * The #GstDiscoverer structure.
 * }
{< private > }
  PGstDiscoverer = ^TGstDiscoverer;
  TGstDiscoverer = record
      parent : TGObject;
      priv : PGstDiscovererPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ signals  }
(* Const before type ignored *)
{*
   * GstDiscovererClass::load_serialize_info:
   * @dc: the #GstDiscoverer
   * @uri: the uri to load the info from
   *
   * Loads the serialized info from the given uri.
   *
   * Returns: (transfer full): the #GstDiscovererInfo or %NULL if it could not be loaded
   *
   * Since: 1.24
    }
  PGstDiscovererClass = ^TGstDiscovererClass;
  TGstDiscovererClass = record
      parentclass : TGObjectClass;
      finished : procedure (discoverer:PGstDiscoverer);cdecl;
      starting : procedure (discoverer:PGstDiscoverer);cdecl;
      discovered : procedure (discoverer:PGstDiscoverer; info:PGstDiscovererInfo; err:PGError);cdecl;
      source_setup : procedure (discoverer:PGstDiscoverer; source:PGstElement);cdecl;
      load_serialize_info : function (dc:PGstDiscoverer; uri:Pgchar):PGstDiscovererInfo;cdecl;
      _reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_discoverer_get_type:TGType;cdecl;external;
function gst_discoverer_new(timeout:TGstClockTime; err:PPGError):PGstDiscoverer;cdecl;external;
{ Asynchronous API  }
procedure gst_discoverer_start(discoverer:PGstDiscoverer);cdecl;external;
procedure gst_discoverer_stop(discoverer:PGstDiscoverer);cdecl;external;
(* Const before type ignored *)
function gst_discoverer_discover_uri_async(discoverer:PGstDiscoverer; uri:Pgchar):Tgboolean;cdecl;external;
{ Synchronous API  }
(* Const before type ignored *)
function gst_discoverer_discover_uri(discoverer:PGstDiscoverer; uri:Pgchar; err:PPGError):PGstDiscovererInfo;cdecl;external;
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscoverer, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererAudioInfo, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererContainerInfo, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererInfo, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererStreamInfo, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererSubtitleInfo, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstDiscovererVideoInfo, gst_object_unref) }
{$endif}
{ _GST_DISCOVERER_H  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_STREAM_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_STREAM_INFO:=gst_discoverer_stream_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_STREAM_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_STREAM_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_STREAM_INFO,GstDiscovererStreamInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_STREAM_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_STREAM_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_STREAM_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_discoverer_stream_info_ref(info : longint) : PGstDiscovererStreamInfo;
begin
  gst_discoverer_stream_info_ref:=PGstDiscovererStreamInfo(g_object_ref(PGObject(info)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_stream_info_unref(info : longint) : longint;
begin
  gst_discoverer_stream_info_unref:=g_object_unref(PGObject(info));
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_CONTAINER_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_CONTAINER_INFO:=gst_discoverer_container_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_CONTAINER_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_CONTAINER_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_CONTAINER_INFO,GstDiscovererContainerInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_CONTAINER_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_CONTAINER_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_CONTAINER_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_AUDIO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_AUDIO_INFO:=gst_discoverer_audio_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_AUDIO_INFO,GstDiscovererAudioInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_AUDIO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_VIDEO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_VIDEO_INFO:=gst_discoverer_video_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_VIDEO_INFO,GstDiscovererVideoInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_VIDEO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_SUBTITLE_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_SUBTITLE_INFO:=gst_discoverer_subtitle_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_SUBTITLE_INFO,GstDiscovererSubtitleInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_SUBTITLE_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER_INFO:=gst_discoverer_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_INFO(obj : longint) : longint;
begin
  GST_DISCOVERER_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER_INFO,GstDiscovererInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_INFO(obj : longint) : longint;
begin
  GST_IS_DISCOVERER_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_unref(info : longint) : longint;
begin
  gst_discoverer_info_unref:=g_object_unref(PGObject(info));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_ref(info : longint) : longint;
begin
  gst_discoverer_info_ref:=g_object_ref(PGObject(info));
end;

{ was #define dname def_expr }
function GST_TYPE_DISCOVERER : longint; { return type might be wrong }
  begin
    GST_TYPE_DISCOVERER:=gst_discoverer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER(obj : longint) : longint;
begin
  GST_DISCOVERER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DISCOVERER,GstDiscoverer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DISCOVERER_CLASS(klass : longint) : longint;
begin
  GST_DISCOVERER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DISCOVERER,GstDiscovererClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER(obj : longint) : longint;
begin
  GST_IS_DISCOVERER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DISCOVERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DISCOVERER_CLASS(klass : longint) : longint;
begin
  GST_IS_DISCOVERER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DISCOVERER);
end;


end.
