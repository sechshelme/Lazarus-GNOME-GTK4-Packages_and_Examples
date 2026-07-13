unit gstbitreader;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2008 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
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
{$ifndef __GST_BIT_READER_H__}
{$define __GST_BIT_READER_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
{ FIXME: inline functions  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_BIT_READER(reader : longint) : PGstBitReader;

{*
 * GstBitReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 * @bit: Bit position in the current byte
 *
 * A bit reader instance.
  }
{ Byte position  }
{ Bit position in the current byte  }
{ < private >  }
type
  PGstBitReader = ^TGstBitReader;
  TGstBitReader = record
      data : Pguint8;
      size : Tguint;
      byte : Tguint;
      bit : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_bit_reader_new(data:Pguint8; size:Tguint):PGstBitReader;cdecl;external libgstbase;
procedure gst_bit_reader_free(reader:PGstBitReader);cdecl;external libgstbase;
procedure gst_bit_reader_init(reader:PGstBitReader; data:Pguint8; size:Tguint);cdecl;external libgstbase;
function gst_bit_reader_set_pos(reader:PGstBitReader; pos:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_get_pos(reader:PGstBitReader):Tguint;cdecl;external libgstbase;
function gst_bit_reader_get_remaining(reader:PGstBitReader):Tguint;cdecl;external libgstbase;
function gst_bit_reader_get_size(reader:PGstBitReader):Tguint;cdecl;external libgstbase;
function gst_bit_reader_skip(reader:PGstBitReader; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_skip_to_byte(reader:PGstBitReader):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_get_bits_uint8(reader:PGstBitReader; val:Pguint8; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_get_bits_uint16(reader:PGstBitReader; val:Pguint16; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_get_bits_uint32(reader:PGstBitReader; val:Pguint32; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_get_bits_uint64(reader:PGstBitReader; val:Pguint64; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_peek_bits_uint8(reader:PGstBitReader; val:Pguint8; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_peek_bits_uint16(reader:PGstBitReader; val:Pguint16; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_peek_bits_uint32(reader:PGstBitReader; val:Pguint32; nbits:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_bit_reader_peek_bits_uint64(reader:PGstBitReader; val:Pguint64; nbits:Tguint):Tgboolean;cdecl;external libgstbase;

// === Konventiert am: 13-7-26 19:26:11 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BIT_READER(reader : longint) : PGstBitReader;
begin
  GST_BIT_READER:=PGstBitReader(reader);
end;


end.
