
unit gsth264bitwriter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsth264bitwriter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsth264bitwriter.h
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
PGArray  = ^GArray;
PGstH264BitWriterResult  = ^GstH264BitWriterResult;
PGstH264PPS  = ^GstH264PPS;
PGstH264SliceHdr  = ^GstH264SliceHdr;
PGstH264SPS  = ^GstH264SPS;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *  Copyright (C) 2020 Intel Corporation
 *     Author: He Junyan <junyan.he@intel.com>
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
 * License along with this library; if not, write to the0
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_H264_BIT_WRITER_H__}
{$define __GST_H264_BIT_WRITER_H__}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{$include <gst/codecparsers/gsth264parser.h>}
{*
 * GstH264BitWriterResult:
 * @GST_H264_BIT_WRITER_OK: The writing succeeded
 * @GST_H264_BIT_WRITER_INVALID_DATA: The input data to write is invalid
 * @GST_H264_BIT_WRITER_NO_MORE_SPACE: The output does not have enough size
 * @GST_H264_BIT_WRITER_ERROR: An general error occurred when writing
 *
 * The result of writing H264 data into bit stream.
 *
 * Since: 1.22
  }
type
  PGstH264BitWriterResult = ^TGstH264BitWriterResult;
  TGstH264BitWriterResult =  Longint;
  Const
    GST_H264_BIT_WRITER_OK = 0;
    GST_H264_BIT_WRITER_INVALID_DATA = 1;
    GST_H264_BIT_WRITER_NO_MORE_SPACE = 2;
    GST_H264_BIT_WRITER_ERROR = 3;
;
(* Const before type ignored *)

function gst_h264_bit_writer_sps(sps:PGstH264SPS; start_code:Tgboolean; data:Pguint8; size:Pguint):TGstH264BitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_bit_writer_pps(pps:PGstH264PPS; start_code:Tgboolean; data:Pguint8; size:Pguint):TGstH264BitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_bit_writer_slice_hdr(slice:PGstH264SliceHdr; start_code:Tgboolean; nal_type:TGstH264NalUnitType; is_ref:Tgboolean; data:Pguint8; 
           size:Pguint; trail_bits_num:Pguint):TGstH264BitWriterResult;cdecl;external;
function gst_h264_bit_writer_sei(sei_messages:PGArray; start_code:Tgboolean; data:Pguint8; size:Pguint):TGstH264BitWriterResult;cdecl;external;
function gst_h264_bit_writer_aud(primary_pic_type:Tguint8; start_code:Tgboolean; data:Pguint8; size:Pguint):TGstH264BitWriterResult;cdecl;external;
function gst_h264_bit_writer_filler(start_code:Tgboolean; num:Tguint; data:Pguint8; size:Pguint):TGstH264BitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_bit_writer_convert_to_nal(nal_prefix_size:Tguint; packetized:Tgboolean; has_startcode:Tgboolean; add_trailings:Tgboolean; raw_data:Pguint8; 
           raw_size:Tgsize; nal_data:Pguint8; nal_size:Pguint):TGstH264BitWriterResult;cdecl;external;
{$endif}
{ __GST_H264_BIT_WRITER_H__  }

implementation


end.
