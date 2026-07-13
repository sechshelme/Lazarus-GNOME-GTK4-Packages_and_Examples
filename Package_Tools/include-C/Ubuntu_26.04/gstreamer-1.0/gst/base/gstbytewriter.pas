unit gstbytewriter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer byte writer
 *
 * Copyright (C) 2009 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
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
{$ifndef __GST_BYTE_WRITER_H__}
{$define __GST_BYTE_WRITER_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstbytereader.h>}
{$include <string.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_BYTE_WRITER(writer : longint) : PGstByteWriter;

{*
 * GstByteWriter:
 * @parent: #GstByteReader parent
 * @alloc_size: Allocation size of the data
 * @fixed: If %TRUE no reallocations are allowed
 * @owned: If %FALSE no reallocations are allowed and copies of data are returned
 *
 * A byte writer instance.
  }
{ < private >  }
type
  PGstByteWriter = ^TGstByteWriter;
  TGstByteWriter = record
      parent : TGstByteReader;
      alloc_size : Tguint;
      fixed : Tgboolean;
      owned : Tgboolean;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_byte_writer_new:PGstByteWriter;cdecl;external libgstbase;
function gst_byte_writer_new_with_size(size:Tguint; fixed:Tgboolean):PGstByteWriter;cdecl;external libgstbase;
function gst_byte_writer_new_with_data(data:Pguint8; size:Tguint; initialized:Tgboolean):PGstByteWriter;cdecl;external libgstbase;
procedure gst_byte_writer_init(writer:PGstByteWriter);cdecl;external libgstbase;
procedure gst_byte_writer_init_with_size(writer:PGstByteWriter; size:Tguint; fixed:Tgboolean);cdecl;external libgstbase;
procedure gst_byte_writer_init_with_data(writer:PGstByteWriter; data:Pguint8; size:Tguint; initialized:Tgboolean);cdecl;external libgstbase;
procedure gst_byte_writer_free(writer:PGstByteWriter);cdecl;external libgstbase;
function gst_byte_writer_free_and_get_data(writer:PGstByteWriter):Pguint8;cdecl;external libgstbase;
function gst_byte_writer_free_and_get_buffer(writer:PGstByteWriter):PGstBuffer;cdecl;external libgstbase;
procedure gst_byte_writer_reset(writer:PGstByteWriter);cdecl;external libgstbase;
function gst_byte_writer_reset_and_get_data(writer:PGstByteWriter):Pguint8;cdecl;external libgstbase;
function gst_byte_writer_reset_and_get_buffer(writer:PGstByteWriter):PGstBuffer;cdecl;external libgstbase;
{*
 * gst_byte_writer_get_pos:
 * @writer: #GstByteWriter instance
 *
 * Returns: The current position of the read/write cursor
  }
{*
 * gst_byte_writer_set_pos:
 * @writer: #GstByteWriter instance
 * @pos: new position
 *
 * Sets the current read/write cursor of @writer. The new position
 * can only be between 0 and the current size.
 *
 * Returns: %TRUE if the new position could be set
  }
{*xxxxxxxxx
static inline guint
gst_byte_writer_get_pos (const GstByteWriter *writer)

  return gst_byte_reader_get_pos ((const GstByteReader *) writer);


static inline gboolean
gst_byte_writer_set_pos (GstByteWriter *writer, guint pos)

  return gst_byte_reader_set_pos (GST_BYTE_READER (writer), pos);


static inline guint
gst_byte_writer_get_size (const GstByteWriter *writer)

  return gst_byte_reader_get_size ((const GstByteReader *) writer);

  }
function gst_byte_writer_get_remaining(writer:PGstByteWriter):Tguint;cdecl;external libgstbase;
function gst_byte_writer_ensure_free_space(writer:PGstByteWriter; size:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint8(writer:PGstByteWriter; val:Tguint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int8(writer:PGstByteWriter; val:Tgint8):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint16_be(writer:PGstByteWriter; val:Tguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint16_le(writer:PGstByteWriter; val:Tguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int16_be(writer:PGstByteWriter; val:Tgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int16_le(writer:PGstByteWriter; val:Tgint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint24_be(writer:PGstByteWriter; val:Tguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint24_le(writer:PGstByteWriter; val:Tguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int24_be(writer:PGstByteWriter; val:Tgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int24_le(writer:PGstByteWriter; val:Tgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint32_be(writer:PGstByteWriter; val:Tguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint32_le(writer:PGstByteWriter; val:Tguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int32_be(writer:PGstByteWriter; val:Tgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int32_le(writer:PGstByteWriter; val:Tgint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint64_be(writer:PGstByteWriter; val:Tguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_uint64_le(writer:PGstByteWriter; val:Tguint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int64_be(writer:PGstByteWriter; val:Tgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_int64_le(writer:PGstByteWriter; val:Tgint64):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_float32_be(writer:PGstByteWriter; val:Tgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_float32_le(writer:PGstByteWriter; val:Tgfloat):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_float64_be(writer:PGstByteWriter; val:Tgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_float64_le(writer:PGstByteWriter; val:Tgdouble):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_data(writer:PGstByteWriter; data:Pguint8; size:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_fill(writer:PGstByteWriter; value:Tguint8; size:Tguint):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_string_utf8(writer:PGstByteWriter; data:Pgchar):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_string_utf16(writer:PGstByteWriter; data:Pguint16):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_string_utf32(writer:PGstByteWriter; data:Pguint32):Tgboolean;cdecl;external libgstbase;
function gst_byte_writer_put_buffer(writer:PGstByteWriter; buffer:PGstBuffer; offset:Tgsize; size:Tgssize):Tgboolean;cdecl;external libgstbase;

// === Konventiert am: 13-7-26 19:27:23 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BYTE_WRITER(writer : longint) : PGstByteWriter;
begin
  GST_BYTE_WRITER:=PGstByteWriter(writer);
end;


end.
