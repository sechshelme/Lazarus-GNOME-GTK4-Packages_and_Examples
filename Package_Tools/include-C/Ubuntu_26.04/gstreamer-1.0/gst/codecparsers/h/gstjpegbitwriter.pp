
unit gstjpegbitwriter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstjpegbitwriter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstjpegbitwriter.h
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
PGstJpegBitWriterResult  = ^GstJpegBitWriterResult;
PGstJpegFrameHdr  = ^GstJpegFrameHdr;
PGstJpegHuffmanTables  = ^GstJpegHuffmanTables;
PGstJpegQuantTables  = ^GstJpegQuantTables;
PGstJpegScanHdr  = ^GstJpegScanHdr;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *  Copyright (C) 2024 Intel Corporation
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
{$ifndef __GST_JPEG_BIT_WRITER_H__}
{$define __GST_JPEG_BIT_WRITER_H__}
{$include <gst/codecparsers/gstjpegparser.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{*
 * GstJpegBitWriterResult:
 * @GST_JPEG_BIT_WRITER_OK: The writing succeeded
 * @GST_JPEG_BIT_WRITER_INVALID_DATA: The input data to write is invalid
 * @GST_JPEG_BIT_WRITER_NO_MORE_SPACE: The output does not have enough size
 * @GST_JPEG_BIT_WRITER_ERROR: An general error occurred when writing
 *
 * The result of writing JPEG data into bit stream.
 *
 * Since: 1.24
  }
type
  PGstJpegBitWriterResult = ^TGstJpegBitWriterResult;
  TGstJpegBitWriterResult =  Longint;
  Const
    GST_JPEG_BIT_WRITER_OK = 0;
    GST_JPEG_BIT_WRITER_INVALID_DATA = 1;
    GST_JPEG_BIT_WRITER_NO_MORE_SPACE = 2;
    GST_JPEG_BIT_WRITER_ERROR = 3;
;
(* Const before type ignored *)

function gst_jpeg_bit_writer_frame_header(frame_hdr:PGstJpegFrameHdr; marker:TGstJpegMarker; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_bit_writer_scan_header(scan_hdr:PGstJpegScanHdr; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_bit_writer_huffman_table(huff_tables:PGstJpegHuffmanTables; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_bit_writer_quantization_table(quant_tables:PGstJpegQuantTables; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
function gst_jpeg_bit_writer_restart_interval(interval:Tguint16; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
function gst_jpeg_bit_writer_segment_with_data(marker:TGstJpegMarker; seg_data:Pguint8; seg_size:Tguint; data:Pguint8; size:Pguint):TGstJpegBitWriterResult;cdecl;external;
{$endif}
{ __GST_JPEG_BIT_WRITER_H__  }

implementation


end.
