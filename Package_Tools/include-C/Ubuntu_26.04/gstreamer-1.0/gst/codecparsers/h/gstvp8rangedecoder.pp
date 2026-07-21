
unit gstvp8rangedecoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvp8rangedecoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvp8rangedecoder.h
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
PGstVp8RangeDecoder  = ^GstVp8RangeDecoder;
PGstVp8RangeDecoderState  = ^GstVp8RangeDecoderState;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gstvp8rangedecoder.h - VP8 range decoder interface
 *
 * Copyright (C) 2014 Intel Corporation
 *   Author: Gwenole Beauchesne <gwenole.beauchesne@intel.com>
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
{$ifndef GST_VP8_RANGE_DECODER_H}
{$define GST_VP8_RANGE_DECODER_H}
{$include <glib.h>}
{$include <gst/gstconfig.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
type
{*
* GstVp8RangeDecoder:
* @buf: the original bitstream buffer start
* @buf_size: the original bitstream buffer size
*
* Range decoder.
 }
(* Const before type ignored *)
{< private > }
  PGstVp8RangeDecoder = ^TGstVp8RangeDecoder;
  TGstVp8RangeDecoder = record
      buf : Pguchar;
      buf_size : Tguint;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
* GstVp8RangeDecoderState:
* @range: current "Range" value
* @value: current "Value" value
* @count: number of bits left in "Value" for decoding
*
* Range decoder state.
 }
  PGstVp8RangeDecoderState = ^TGstVp8RangeDecoderState;
  TGstVp8RangeDecoderState = record
      range : Tguint8;
      value : Tguint8;
      count : Tguint8;
    end;

(* Const before type ignored *)

function gst_vp8_range_decoder_init(rd:PGstVp8RangeDecoder; buf:Pguchar; buf_size:Tguint):Tgboolean;cdecl;external;
function gst_vp8_range_decoder_read(rd:PGstVp8RangeDecoder; prob:Tguint8):Tgint;cdecl;external;
function gst_vp8_range_decoder_read_literal(rd:PGstVp8RangeDecoder; bits:Tgint):Tgint;cdecl;external;
function gst_vp8_range_decoder_get_pos(rd:PGstVp8RangeDecoder):Tguint;cdecl;external;
procedure gst_vp8_range_decoder_get_state(rd:PGstVp8RangeDecoder; state:PGstVp8RangeDecoderState);cdecl;external;
{$endif}
{ GST_VP8_RANGE_DECODER_H  }

implementation


end.
