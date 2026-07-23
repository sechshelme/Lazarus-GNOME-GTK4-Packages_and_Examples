
unit descriptions;
interface

{
  Automatically converted by H2Pas 1.0.0 from descriptions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    descriptions.h
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
PGstCaps  = ^GstCaps;
PGstPbUtilsCapsDescriptionFlags  = ^GstPbUtilsCapsDescriptionFlags;
PGstTagList  = ^GstTagList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer base utils library source/sink/codec description support
 * Copyright (C) 2006 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_PB_UTILS_DESCRIPTIONS_H__}
{$define __GST_PB_UTILS_DESCRIPTIONS_H__}
{$include <gst/gsttaglist.h>}
{$include <gst/gstcaps.h>}
{$include <gst/pbutils/pbutils-prelude.h>}
{*
 * GstPbUtilsCapsDescriptionFlags:
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_CONTAINER: Caps describe a container format.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_AUDIO: Caps describe an audio format, or a
 *     container format that can store audio.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_VIDEO: Caps describe an video format, or a
 *     container format that can store video.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_IMAGE: Caps describe an image format, or a
 *     container format that can store image.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_SUBTITLE: Caps describe an subtitle format, or a
 *     container format that can store subtitles.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_TAG: Container format is a tags container.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_GENERIC: Container format can store any kind of
 *     stream type.
 * @GST_PBUTILS_CAPS_DESCRIPTION_FLAG_METADATA: Caps describe a metadata
 *     format, or a container format that can store metadata.
 *
 * Flags that are returned by gst_pb_utils_get_caps_description_flags() and
 * describe the format of the caps.
 *
 * Since: 1.20
  }
{*
   * GST_PBUTILS_CAPS_DESCRIPTION_FLAG_METADATA:
   *
   * Caps describe a metadata format, or a container format that can store
   * metadata.
   *
   * Since: 1.22
    }
type
  PGstPbUtilsCapsDescriptionFlags = ^TGstPbUtilsCapsDescriptionFlags;
  TGstPbUtilsCapsDescriptionFlags =  Longint;
  Const
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_CONTAINER = 1 shl 0;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_AUDIO = 1 shl 1;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_VIDEO = 1 shl 2;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_IMAGE = 1 shl 3;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_SUBTITLE = 1 shl 4;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_TAG = 1 shl 5;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_GENERIC = 1 shl 6;
    GST_PBUTILS_CAPS_DESCRIPTION_FLAG_METADATA = 1 shl 7;
;
{
 * functions for use by demuxers or decoders to add CODEC tags to tag lists
 * from caps
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gst_pb_utils_add_codec_description_to_tag_list(taglist:PGstTagList; codec_tag:Pgchar; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_codec_description(caps:PGstCaps):Pgchar;cdecl;external;
{
 * functions mainly used by the missing plugins message creation functions to
 * find descriptions of what exactly is missing
  }
(* Const before type ignored *)
function gst_pb_utils_get_source_description(protocol:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_sink_description(protocol:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_decoder_description(caps:PGstCaps):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_encoder_description(caps:PGstCaps):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_element_description(factory_name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_caps_description_flags(caps:PGstCaps):TGstPbUtilsCapsDescriptionFlags;cdecl;external;
(* Const before type ignored *)
function gst_pb_utils_get_file_extension_from_caps(caps:PGstCaps):Pgchar;cdecl;external;
{$endif}
{ __GST_PB_UTILS_DESCRIPTIONS_H__  }

implementation


end.
