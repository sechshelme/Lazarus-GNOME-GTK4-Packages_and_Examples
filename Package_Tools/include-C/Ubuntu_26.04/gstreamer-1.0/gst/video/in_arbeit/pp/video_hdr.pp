
unit video_hdr;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_hdr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_hdr.h
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
PGstVideoContentLightLevel  = ^GstVideoContentLightLevel;
PGstVideoMasteringDisplayInfo  = ^GstVideoMasteringDisplayInfo;
PGstVideoMasteringDisplayInfoCoordinates  = ^GstVideoMasteringDisplayInfoCoordinates;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018-2019> Seungha Yang <seungha.yang@navercorp.com>
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
{$ifndef __GST_VIDEO_HDR_H__}
{$define __GST_VIDEO_HDR_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
type
{*
 * GstVideoMasteringDisplayInfoCoordinates:
 * @x: the x coordinate of CIE 1931 color space in unit of 0.00002.
 * @y: the y coordinate of CIE 1931 color space in unit of 0.00002.
 *
 * Used to represent display_primaries and white_point of
 * #GstVideoMasteringDisplayInfo struct. See #GstVideoMasteringDisplayInfo
 *
 * Since: 1.18
  }
  PGstVideoMasteringDisplayInfoCoordinates = ^TGstVideoMasteringDisplayInfoCoordinates;
  TGstVideoMasteringDisplayInfoCoordinates = record
      x : Tguint16;
      y : Tguint16;
    end;

{*
 * GstVideoMasteringDisplayInfo:
 * @display_primaries: (array fixed-size=3): the xy coordinates of primaries in the CIE 1931 color space.
 *   the index 0 contains red, 1 is for green and 2 is for blue.
 *   each value is normalized to 50000 (meaning that in unit of 0.00002)
 * @white_point: the xy coordinates of white point in the CIE 1931 color space.
 *   each value is normalized to 50000 (meaning that in unit of 0.00002)
 * @max_display_mastering_luminance: the maximum value of display luminance
 *   in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
 * @min_display_mastering_luminance: the minimum value of display luminance
 *   in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
 *
 * Mastering display color volume information defined by SMPTE ST 2086
 * (a.k.a static HDR metadata).
 *
 * Since: 1.18
  }
{< private > }
  PGstVideoMasteringDisplayInfo = ^TGstVideoMasteringDisplayInfo;
  TGstVideoMasteringDisplayInfo = record
      display_primaries : array[0..2] of TGstVideoMasteringDisplayInfoCoordinates;
      white_point : TGstVideoMasteringDisplayInfoCoordinates;
      max_display_mastering_luminance : Tguint32;
      min_display_mastering_luminance : Tguint32;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_video_mastering_display_info_init(minfo:PGstVideoMasteringDisplayInfo);cdecl;external;
(* Const before type ignored *)
function gst_video_mastering_display_info_from_string(minfo:PGstVideoMasteringDisplayInfo; mastering:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_mastering_display_info_to_string(minfo:PGstVideoMasteringDisplayInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_mastering_display_info_is_equal(minfo:PGstVideoMasteringDisplayInfo; other:PGstVideoMasteringDisplayInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_mastering_display_info_from_caps(minfo:PGstVideoMasteringDisplayInfo; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_mastering_display_info_add_to_caps(minfo:PGstVideoMasteringDisplayInfo; caps:PGstCaps):Tgboolean;cdecl;external;
{*
 * GstVideoContentLightLevel:
 * @max_content_light_level: the maximum content light level
 *   (abbreviated to MaxCLL) in candelas per square meter (cd/m^2 and nit)
 * @max_frame_average_light_level: the maximum frame average light level
 *   (abbreviated to MaxFLL) in candelas per square meter (cd/m^2 and nit)
 *
 * Content light level information specified in CEA-861.3, Appendix A.
 *
 * Since: 1.18
  }
{< private > }
type
  PGstVideoContentLightLevel = ^TGstVideoContentLightLevel;
  TGstVideoContentLightLevel = record
      max_content_light_level : Tguint16;
      max_frame_average_light_level : Tguint16;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_video_content_light_level_init(linfo:PGstVideoContentLightLevel);cdecl;external;
(* Const before type ignored *)
function gst_video_content_light_level_from_string(linfo:PGstVideoContentLightLevel; level:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_content_light_level_to_string(linfo:PGstVideoContentLightLevel):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_content_light_level_is_equal(linfo:PGstVideoContentLightLevel; other:PGstVideoContentLightLevel):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_content_light_level_from_caps(linfo:PGstVideoContentLightLevel; caps:PGstCaps):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_content_light_level_add_to_caps(linfo:PGstVideoContentLightLevel; caps:PGstCaps):Tgboolean;cdecl;external;
{$endif}
{ __GST_VIDEO_HDR_H__  }

implementation


end.
