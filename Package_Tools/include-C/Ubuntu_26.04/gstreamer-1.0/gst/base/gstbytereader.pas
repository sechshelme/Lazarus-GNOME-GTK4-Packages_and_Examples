unit gstbytereader;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer byte reader
 *
 * Copyright (C) 2008 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
 * Copyright (C) 2009 Tim-Philipp Müller <tim centricular net>
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
{$ifndef __GST_BYTE_READER_H__}
{$define __GST_BYTE_READER_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_BYTE_READER(reader : longint) : PGstByteReader;

{*
 * GstByteReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 *
 * A byte reader instance.
  }
{ Byte position  }
{ < private >  }
type
  PGstByteReader = ^TGstByteReader;
  TGstByteReader = record
      data : Pguint8;
      size : Tguint;
      byte : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_byte_reader_new(data:Pguint8; size:Tguint):PGstByteReader;cdecl;external libgstbase;
procedure gst_byte_reader_free(reader:PGstByteReader);cdecl;external libgstbase;
procedure gst_byte_reader_init(reader:PGstByteReader; data:Pguint8; size:Tguint);cdecl;external libgstbase;
function gst_byte_reader_peek_sub_reader(reader:PGstByteReader; sub_reader:PGstByteReader; size:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_sub_reader(reader:PGstByteReader; sub_reader:PGstByteReader; size:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_set_pos(reader:PGstByteReader; pos:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_pos(reader:PGstByteReader):Tguint;cdecl;external libgstbase;
function gst_byte_reader_get_remaining(reader:PGstByteReader):Tguint;cdecl;external libgstbase;
function gst_byte_reader_get_size(reader:PGstByteReader):Tguint;cdecl;external libgstbase;
function gst_byte_reader_skip(reader:PGstByteReader; nbytes:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint8(reader:PGstByteReader; val:Pguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int8(reader:PGstByteReader; val:Pgint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint16_le(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int16_le(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint16_be(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int16_be(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint24_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int24_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint24_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int24_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint32_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int32_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint32_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int32_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint64_le(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int64_le(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_uint64_be(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_int64_be(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint8(reader:PGstByteReader; val:Pguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int8(reader:PGstByteReader; val:Pgint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint16_le(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int16_le(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint16_be(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int16_be(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint24_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int24_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint24_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int24_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint32_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int32_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint32_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int32_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint64_le(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int64_le(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_uint64_be(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_int64_be(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_float32_le(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_float32_be(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_float64_le(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_float64_be(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_float32_le(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_float32_be(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_float64_le(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_float64_be(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_dup_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_dup_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_dup_string_utf16(reader:PGstByteReader; str:PPguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_dup_string_utf32(reader:PGstByteReader; str:PPguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_skip_string_utf8(reader:PGstByteReader):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_skip_string_utf16(reader:PGstByteReader):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_skip_string_utf32(reader:PGstByteReader):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_get_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_peek_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external libgstbase;
function gst_byte_reader_masked_scan_uint32(reader:PGstByteReader; mask:Tguint32; pattern:Tguint32; offset:Tguint; size:Tguint):Tguint;cdecl;external libgstbase;
function gst_byte_reader_masked_scan_uint32_peek(reader:PGstByteReader; mask:Tguint32; pattern:Tguint32; offset:Tguint; size:Tguint; 
           value:Pguint32):Tguint;cdecl;external libgstbase;
{ xxxxxxx#define GST_BYTE_READER_INIT(data, size) data, size, 0 }

// === Konventiert am: 13-7-26 19:29:54 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BYTE_READER(reader : longint) : PGstByteReader;
begin
  GST_BYTE_READER:=PGstByteReader(reader);
end;


end.
