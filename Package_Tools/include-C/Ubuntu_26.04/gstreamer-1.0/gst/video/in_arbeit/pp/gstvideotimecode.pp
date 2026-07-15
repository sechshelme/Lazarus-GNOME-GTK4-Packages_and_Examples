
unit gstvideotimecode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideotimecode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideotimecode.h
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
PGDateTime  = ^GDateTime;
PGstVideoTimeCode  = ^GstVideoTimeCode;
PGstVideoTimeCodeConfig  = ^GstVideoTimeCodeConfig;
PGstVideoTimeCodeFlags  = ^GstVideoTimeCodeFlags;
PGstVideoTimeCodeInterval  = ^GstVideoTimeCodeInterval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2016> Vivia Nikolaidou <vivia@toolsonair.com>
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
{$ifndef __GST_VIDEO_TIME_CODE_H__}
{$define __GST_VIDEO_TIME_CODE_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
type
{*
 * GstVideoTimeCodeFlags:
 * @GST_VIDEO_TIME_CODE_FLAGS_NONE: No flags
 * @GST_VIDEO_TIME_CODE_FLAGS_DROP_FRAME: Whether we have drop frame rate
 * @GST_VIDEO_TIME_CODE_FLAGS_INTERLACED: Whether we have interlaced video
 *
 * Flags related to the time code information.
 * For drop frame, only 30000/1001 and 60000/1001 frame rates are supported.
 *
 * Since: 1.10
  }
{ Not supported yet:
   * GST_VIDEO_TIME_CODE_ALLOW_MORE_THAN_24H = (1<<2)
   * GST_VIDEO_TIME_CODE_ALLOW_NEGATIVE = (1<<3)
    }

  PGstVideoTimeCodeFlags = ^TGstVideoTimeCodeFlags;
  TGstVideoTimeCodeFlags =  Longint;
  Const
    GST_VIDEO_TIME_CODE_FLAGS_NONE = 0;
    GST_VIDEO_TIME_CODE_FLAGS_DROP_FRAME = 1 shl 0;
    GST_VIDEO_TIME_CODE_FLAGS_INTERLACED = 1 shl 1;
;
{*
 * GstVideoTimeCodeConfig:
 * @fps_n: Numerator of the frame rate
 * @fps_d: Denominator of the frame rate
 * @flags: the corresponding #GstVideoTimeCodeFlags
 * @latest_daily_jam: The latest daily jam information, if present, or NULL
 *
 * Supported frame rates: 30000/1001, 60000/1001 (both with and without drop
 * frame), and integer frame rates e.g. 25/1, 30/1, 50/1, 60/1.
 *
 * The configuration of the time code.
 *
 * Since: 1.10
  }
type
  PGstVideoTimeCodeConfig = ^TGstVideoTimeCodeConfig;
  TGstVideoTimeCodeConfig = record
      fps_n : Tguint;
      fps_d : Tguint;
      flags : TGstVideoTimeCodeFlags;
      latest_daily_jam : PGDateTime;
    end;

{*
 * GstVideoTimeCode:
 * @hours: the hours field of #GstVideoTimeCode
 * @minutes: the minutes field of #GstVideoTimeCode
 * @seconds: the seconds field of #GstVideoTimeCode
 * @frames: the frames field of #GstVideoTimeCode
 * @field_count: Interlaced video field count
 * @config: the corresponding #GstVideoTimeCodeConfig
 *
 * @field_count must be 0 for progressive video and 1 or 2 for interlaced.
 *
 * A representation of a SMPTE time code.
 *
 * @hours must be positive and less than 24. Will wrap around otherwise.
 * @minutes and @seconds must be positive and less than 60.
 * @frames must be less than or equal to @config.fps_n / @config.fps_d
 * These values are *NOT* automatically normalized.
 *
 * Since: 1.10
  }
  PGstVideoTimeCode = ^TGstVideoTimeCode;
  TGstVideoTimeCode = record
      config : TGstVideoTimeCodeConfig;
      hours : Tguint;
      minutes : Tguint;
      seconds : Tguint;
      frames : Tguint;
      field_count : Tguint;
    end;

{*
 * GstVideoTimeCodeInterval:
 * @hours: the hours field of #GstVideoTimeCodeInterval
 * @minutes: the minutes field of #GstVideoTimeCodeInterval
 * @seconds: the seconds field of #GstVideoTimeCodeInterval
 * @frames: the frames field of #GstVideoTimeCodeInterval
 *
 * A representation of a difference between two #GstVideoTimeCode instances.
 * Will not necessarily correspond to a real timecode (e.g. 00:00:10;00)
 *
 * Since: 1.12
  }
  PGstVideoTimeCodeInterval = ^TGstVideoTimeCodeInterval;
  TGstVideoTimeCodeInterval = record
      hours : Tguint;
      minutes : Tguint;
      seconds : Tguint;
      frames : Tguint;
    end;

{xxxxxx #define GST_VIDEO_TIME_CODE_INIT  0, 0, 0, NULL, 0, 0, 0, 0, 0  }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_TIME_CODE : longint; { return type might be wrong }

function gst_video_time_code_get_type:TGType;cdecl;external;
function gst_video_time_code_new(fps_n:Tguint; fps_d:Tguint; latest_daily_jam:PGDateTime; flags:TGstVideoTimeCodeFlags; hours:Tguint; 
           minutes:Tguint; seconds:Tguint; frames:Tguint; field_count:Tguint):PGstVideoTimeCode;cdecl;external;
function gst_video_time_code_new_empty:PGstVideoTimeCode;cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_new_from_string(tc_str:Pgchar):PGstVideoTimeCode;cdecl;external;
{xxxxx GST_VIDEO_DEPRECATED_FOR(gst_video_time_code_new_from_date_time_full) }
function gst_video_time_code_new_from_date_time(fps_n:Tguint; fps_d:Tguint; dt:PGDateTime; flags:TGstVideoTimeCodeFlags; field_count:Tguint):PGstVideoTimeCode;cdecl;external;
function gst_video_time_code_new_from_date_time_full(fps_n:Tguint; fps_d:Tguint; dt:PGDateTime; flags:TGstVideoTimeCodeFlags; field_count:Tguint):PGstVideoTimeCode;cdecl;external;
procedure gst_video_time_code_free(tc:PGstVideoTimeCode);cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_copy(tc:PGstVideoTimeCode):PGstVideoTimeCode;cdecl;external;
procedure gst_video_time_code_init(tc:PGstVideoTimeCode; fps_n:Tguint; fps_d:Tguint; latest_daily_jam:PGDateTime; flags:TGstVideoTimeCodeFlags; 
            hours:Tguint; minutes:Tguint; seconds:Tguint; frames:Tguint; field_count:Tguint);cdecl;external;
{xxxxxxx GST_VIDEO_DEPRECATED_FOR(gst_video_time_code_init_from_date_time_full) }
procedure gst_video_time_code_init_from_date_time(tc:PGstVideoTimeCode; fps_n:Tguint; fps_d:Tguint; dt:PGDateTime; flags:TGstVideoTimeCodeFlags; 
            field_count:Tguint);cdecl;external;
function gst_video_time_code_init_from_date_time_full(tc:PGstVideoTimeCode; fps_n:Tguint; fps_d:Tguint; dt:PGDateTime; flags:TGstVideoTimeCodeFlags; 
           field_count:Tguint):Tgboolean;cdecl;external;
procedure gst_video_time_code_clear(tc:PGstVideoTimeCode);cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_is_valid(tc:PGstVideoTimeCode):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_time_code_compare(tc1:PGstVideoTimeCode; tc2:PGstVideoTimeCode):Tgint;cdecl;external;
procedure gst_video_time_code_increment_frame(tc:PGstVideoTimeCode);cdecl;external;
procedure gst_video_time_code_add_frames(tc:PGstVideoTimeCode; frames:Tgint64);cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_to_string(tc:PGstVideoTimeCode):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_to_date_time(tc:PGstVideoTimeCode):PGDateTime;cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_nsec_since_daily_jam(tc:PGstVideoTimeCode):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_frames_since_daily_jam(tc:PGstVideoTimeCode):Tguint64;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_time_code_add_interval(tc:PGstVideoTimeCode; tc_inter:PGstVideoTimeCodeInterval):PGstVideoTimeCode;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VIDEO_TIME_CODE_INTERVAL : longint; { return type might be wrong }

function gst_video_time_code_interval_get_type:TGType;cdecl;external;
function gst_video_time_code_interval_new(hours:Tguint; minutes:Tguint; seconds:Tguint; frames:Tguint):PGstVideoTimeCodeInterval;cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_interval_new_from_string(tc_inter_str:Pgchar):PGstVideoTimeCodeInterval;cdecl;external;
procedure gst_video_time_code_interval_free(tc:PGstVideoTimeCodeInterval);cdecl;external;
(* Const before type ignored *)
function gst_video_time_code_interval_copy(tc:PGstVideoTimeCodeInterval):PGstVideoTimeCodeInterval;cdecl;external;
procedure gst_video_time_code_interval_init(tc:PGstVideoTimeCodeInterval; hours:Tguint; minutes:Tguint; seconds:Tguint; frames:Tguint);cdecl;external;
procedure gst_video_time_code_interval_clear(tc:PGstVideoTimeCodeInterval);cdecl;external;
{$endif}
{ __GST_VIDEO_TIME_CODE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_TIME_CODE : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_TIME_CODE:=gst_video_time_code_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_TIME_CODE_INTERVAL : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_TIME_CODE_INTERVAL:=gst_video_time_code_interval_get_type;
  end;


end.
