
unit gstav1bitwriter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstav1bitwriter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstav1bitwriter.h
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
PGstAV1BitWriterResult  = ^GstAV1BitWriterResult;
PGstAV1FrameHeaderOBU  = ^GstAV1FrameHeaderOBU;
PGstAV1MetadataOBU  = ^GstAV1MetadataOBU;
PGstAV1SequenceHeaderOBU  = ^GstAV1SequenceHeaderOBU;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *  Copyright (C) 2022 Intel Corporation
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
{$ifndef __GST_AV1_BIT_WRITER_H__}
{$define __GST_AV1_BIT_WRITER_H__}
{$include <gst/codecparsers/gstav1parser.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{*
 * GstAV1BitWriterResult:
 * @GST_AV1_BIT_WRITER_OK: The writing succeeded
 * @GST_AV1_BIT_WRITER_INVALID_DATA: The input data to write is invalid
 * @GST_AV1_BIT_WRITER_NO_MORE_SPACE: The output does not have enough size
 * @GST_AV1_BIT_WRITER_ERROR: An general error occurred when writing
 *
 * The result of writing AV1 data into bit stream.
 *
 * Since: 1.24
  }
type
  PGstAV1BitWriterResult = ^TGstAV1BitWriterResult;
  TGstAV1BitWriterResult =  Longint;
  Const
    GST_AV1_BIT_WRITER_OK = 0;
    GST_AV1_BIT_WRITER_INVALID_DATA = 1;
    GST_AV1_BIT_WRITER_NO_MORE_SPACE = 2;
    GST_AV1_BIT_WRITER_ERROR = 3;
;
(* Const before type ignored *)

function gst_av1_bit_writer_sequence_header_obu(seq_hdr:PGstAV1SequenceHeaderOBU; size_field:Tgboolean; data:Pguint8; size:Pguint):TGstAV1BitWriterResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_av1_bit_writer_frame_header_obu(frame_hdr:PGstAV1FrameHeaderOBU; seq_hdr:PGstAV1SequenceHeaderOBU; temporal_id:Tguint8; spatial_id:Tguint8; size_field:Tgboolean; 
           data:Pguint8; size:Pguint):TGstAV1BitWriterResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_av1_bit_writer_frame_header_obu_with_offsets(frame_hdr:PGstAV1FrameHeaderOBU; seq_hdr:PGstAV1SequenceHeaderOBU; temporal_id:Tguint8; spatial_id:Tguint8; size_field:Tgboolean; 
           size_field_size:Tguint; qindex_offset:Pguint; segmentation_offset:Pguint; lf_offset:Pguint; cdef_offset:Pguint; 
           cdef_size:Pguint; data:Pguint8; size:Pguint):TGstAV1BitWriterResult;cdecl;external;
function gst_av1_bit_writer_temporal_delimiter_obu(size_field:Tgboolean; data:Pguint8; size:Pguint):TGstAV1BitWriterResult;cdecl;external;
(* Const before type ignored *)
function gst_av1_bit_writer_metadata_obu(metadata:PGstAV1MetadataOBU; temporal_id:Tguint8; spatial_id:Tguint8; size_field:Tgboolean; data:Pguint8; 
           size:Pguint):TGstAV1BitWriterResult;cdecl;external;
{$endif}
{ __GST_AV1_BIT_WRITER_H__  }

implementation


end.
