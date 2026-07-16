unit gstdsdformat;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2023 Carlos Rafael Giani <crg7475@mailbox.org>
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
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/audio/audio-prelude.h>}
{*
 * GstDsdFormat:
 * @GST_DSD_FORMAT_UNKNOWN: unknown / invalid DSD format
 * @GST_DSD_FORMAT_U8: 8 DSD bits in 1 byte
 * @GST_DSD_FORMAT_U16LE: 16 DSD bits in 2 bytes, little endian order
 * @GST_DSD_FORMAT_U16BE: 16 DSD bits in 2 bytes, big endian order
 * @GST_DSD_FORMAT_U32LE: 32 DSD bits in 4 bytes, little endian order
 * @GST_DSD_FORMAT_U32BE: 32 DSD bits in 4 bytes, big endian order
 * @GST_NUM_DSD_FORMATS: number of valid DSD formats
 * @GST_DSD_FORMAT_U16: 16 DSD bits in 2 bytes, native endianness
 * @GST_DSD_FORMAT_U32: 32 DSD bits in 4 bytes, native endianness
 *
 * Enum value describing how DSD bits are grouped.
 *
 * Since: 1.24
  }
{ native endianness equivalents  }
type
  PGstDsdFormat = ^TGstDsdFormat;
  TGstDsdFormat =  Longint;
  Const
    GST_DSD_FORMAT_UNKNOWN = 0;
    GST_DSD_FORMAT_U8 = 1;
    GST_DSD_FORMAT_U16LE = 2;
    GST_DSD_FORMAT_U16BE = 3;
    GST_DSD_FORMAT_U32LE = 4;
    GST_DSD_FORMAT_U32BE = 5;
    GST_NUM_DSD_FORMATS = 6;
    GST_DSD_FORMAT_U16 = _GST_DSD_FORMAT_NE(U16);
    GST_DSD_FORMAT_U32 = _GST_DSD_FORMAT_NE(U32);
;
{*
 * GST_DSD_FORMATS_ALL:
 *
 * List of all DSD formats, for use in template caps strings.
 *
 * Big endian formats are preferred, since little-endian ones flip around
 * the DSD bytes, and most DSD hardware uses big endian formats.
 *
 * Since: 1.24
  }
  GST_DSD_FORMATS_ALL = '{ DSDU32BE, DSDU16BE, DSDU8, DSDU32LE, DSDU16LE }';  

function gst_dsd_format_from_string(str:Pgchar):TGstDsdFormat;cdecl;external libgstaudio;
function gst_dsd_format_to_string(format:TGstDsdFormat):Pgchar;cdecl;external libgstaudio;
function gst_dsd_format_get_width(format:TGstDsdFormat):Tguint;cdecl;external libgstaudio;

// === Konventiert am: 16-7-26 15:25:41 ===


implementation



end.
