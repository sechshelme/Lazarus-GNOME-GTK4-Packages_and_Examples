
unit gstrtsprange;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtsprange.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtsprange.h
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
PGstClockTime  = ^GstClockTime;
PGstRTSPRangeUnit  = ^GstRTSPRangeUnit;
PGstRTSPTime  = ^GstRTSPTime;
PGstRTSPTime2  = ^GstRTSPTime2;
PGstRTSPTimeRange  = ^GstRTSPTimeRange;
PGstRTSPTimeType  = ^GstRTSPTimeType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2005,2006> Wim Taymans <wim@fluendo.com>
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
{
 * Unless otherwise indicated, Source Code is licensed under MIT license.
 * See further explanation attached in License Statement (distributed in the file
 * LICENSE).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
  }
{$ifndef __GST_RTSP_RANGE_H__}
{$define __GST_RTSP_RANGE_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include <gst/rtsp/gstrtspdefs.h>}
{*
 * GstRTSPRangeUnit:
 * @GST_RTSP_RANGE_SMPTE: SMPTE timecode
 * @GST_RTSP_RANGE_SMPTE_30_DROP: 29.97 frames per second
 * @GST_RTSP_RANGE_SMPTE_25: 25 frames per second
 * @GST_RTSP_RANGE_NPT: Normal play time
 * @GST_RTSP_RANGE_CLOCK: Absolute time expressed as ISO 8601 timestamps
 *
 * Different possible time range units.
  }
type
  PGstRTSPRangeUnit = ^TGstRTSPRangeUnit;
  TGstRTSPRangeUnit =  Longint;
  Const
    GST_RTSP_RANGE_SMPTE = 0;
    GST_RTSP_RANGE_SMPTE_30_DROP = 1;
    GST_RTSP_RANGE_SMPTE_25 = 2;
    GST_RTSP_RANGE_NPT = 3;
    GST_RTSP_RANGE_CLOCK = 4;
;
type
{*
 * GstRTSPTimeType:
 * @GST_RTSP_TIME_SECONDS: seconds
 * @GST_RTSP_TIME_NOW: now
 * @GST_RTSP_TIME_END: end
 * @GST_RTSP_TIME_FRAMES: frames and subframes
 * @GST_RTSP_TIME_UTC: UTC time
 *
 * Possible time types.
  }

  PGstRTSPTimeType = ^TGstRTSPTimeType;
  TGstRTSPTimeType =  Longint;
  Const
    GST_RTSP_TIME_SECONDS = 0;
    GST_RTSP_TIME_NOW = 1;
    GST_RTSP_TIME_END = 2;
    GST_RTSP_TIME_FRAMES = 3;
    GST_RTSP_TIME_UTC = 4;
;
{*
 * GstRTSPTime:
 * @type: the time of the time
 * @seconds: seconds when @type is GST_RTSP_TIME_SECONDS,
 *           GST_RTSP_TIME_UTC and GST_RTSP_TIME_FRAMES
 *
 * A time indication.
  }
type
  PGstRTSPTime = ^TGstRTSPTime;
  TGstRTSPTime = record
      _type : TGstRTSPTimeType;
      seconds : Tgdouble;
    end;

{*
 * GstRTSPTime2:
 * @frames: frames and subframes when type in GstRTSPTime is
 *          GST_RTSP_TIME_FRAMES
 * @year: year when type is GST_RTSP_TIME_UTC
 * @month: month when type is GST_RTSP_TIME_UTC
 * @day: day when type is GST_RTSP_TIME_UTC
 *
 * Extra fields for a time indication.
 *
 * Since: 1.2
  }
  PGstRTSPTime2 = ^TGstRTSPTime2;
  TGstRTSPTime2 = record
      frames : Tgdouble;
      year : Tguint;
      month : Tguint;
      day : Tguint;
    end;

{*
 * GstRTSPTimeRange:
 * @unit: the time units used
 * @min: the minimum interval
 * @max: the maximum interval
 * @min2: extra fields in the minimum interval (Since: 1.2)
 * @max2: extra fields in the maximum interval (Since: 1.2)
 *
 * A time range.
  }
  PGstRTSPTimeRange = ^TGstRTSPTimeRange;
  TGstRTSPTimeRange = record
      unit : TGstRTSPRangeUnit;
      min : TGstRTSPTime;
      max : TGstRTSPTime;
      min2 : TGstRTSPTime2;
      max2 : TGstRTSPTime2;
    end;

(* Const before type ignored *)

function gst_rtsp_range_parse(rangestr:Pgchar; range:PPGstRTSPTimeRange):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_range_to_string(range:PGstRTSPTimeRange):Pgchar;cdecl;external;
procedure gst_rtsp_range_free(range:PGstRTSPTimeRange);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_range_get_times(range:PGstRTSPTimeRange; min:PGstClockTime; max:PGstClockTime):Tgboolean;cdecl;external;
function gst_rtsp_range_convert_units(range:PGstRTSPTimeRange; unit:TGstRTSPRangeUnit):Tgboolean;cdecl;external;
{$endif}
{ __GST_RTSP_RANGE_H__  }

implementation


end.
