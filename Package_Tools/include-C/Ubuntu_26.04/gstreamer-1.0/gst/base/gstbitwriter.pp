
unit gstbitwriter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbitwriter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbitwriter.h
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
PGstBitWriter  = ^GstBitWriter;
PGstBuffer  = ^GstBuffer;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 *  gstbitwriter.h - bitstream writer
 *
 *  Copyright (C) 2013 Intel Corporation
 *  Copyright (C) 2018 Igalia, S. L.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 *  Boston, MA 02110-1301 USA
  }
{$ifndef GST_BIT_WRITER_H}
{$define GST_BIT_WRITER_H}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
{$include <string.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BIT_WRITER_DATA(writer : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIT_WRITER_BIT_SIZE(writer : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BIT_WRITER(writer : longint) : PGstBitWriter;

type
{*
 * GstBitWriter:
 * @data: Allocated @data for bit writer to write
 * @bit_size: Size of written @data in bits
 *
 * A bit writer instance.
 *
 * Since: 1.16
  }
{< private > }
{ Capacity of the allocated data  }
{ Whether space can auto grow  }
  PGstBitWriter = ^TGstBitWriter;
  TGstBitWriter = record
      data : Pguint8;
      bit_size : Tguint;
      bit_capacity : Tguint;
      auto_grow : Tgboolean;
      owned : Tgboolean;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_bit_writer_new:PGstBitWriter;cdecl;external;
function gst_bit_writer_new_with_size(size:Tguint32; fixed:Tgboolean):PGstBitWriter;cdecl;external;
function gst_bit_writer_new_with_data(data:Pguint8; size:Tguint; initialized:Tgboolean):PGstBitWriter;cdecl;external;
procedure gst_bit_writer_free(bitwriter:PGstBitWriter);cdecl;external;
function gst_bit_writer_free_and_get_data(bitwriter:PGstBitWriter):Pguint8;cdecl;external;
function gst_bit_writer_free_and_get_buffer(bitwriter:PGstBitWriter):PGstBuffer;cdecl;external;
procedure gst_bit_writer_init(bitwriter:PGstBitWriter);cdecl;external;
procedure gst_bit_writer_init_with_size(bitwriter:PGstBitWriter; size:Tguint32; fixed:Tgboolean);cdecl;external;
procedure gst_bit_writer_init_with_data(bitwriter:PGstBitWriter; data:Pguint8; size:Tguint; initialized:Tgboolean);cdecl;external;
procedure gst_bit_writer_reset(bitwriter:PGstBitWriter);cdecl;external;
function gst_bit_writer_reset_and_get_data(bitwriter:PGstBitWriter):Pguint8;cdecl;external;
function gst_bit_writer_reset_and_get_buffer(bitwriter:PGstBitWriter):PGstBuffer;cdecl;external;
(* Const before type ignored *)
function gst_bit_writer_get_size(bitwriter:PGstBitWriter):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_bit_writer_get_data(bitwriter:PGstBitWriter):Pguint8;cdecl;external;
function gst_bit_writer_set_pos(bitwriter:PGstBitWriter; pos:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_bit_writer_get_remaining(bitwriter:PGstBitWriter):Tguint;cdecl;external;
function gst_bit_writer_put_bits_uint8(bitwriter:PGstBitWriter; value:Tguint8; nbits:Tguint):Tgboolean;cdecl;external;
function gst_bit_writer_put_bits_uint16(bitwriter:PGstBitWriter; value:Tguint16; nbits:Tguint):Tgboolean;cdecl;external;
function gst_bit_writer_put_bits_uint32(bitwriter:PGstBitWriter; value:Tguint32; nbits:Tguint):Tgboolean;cdecl;external;
function gst_bit_writer_put_bits_uint64(bitwriter:PGstBitWriter; value:Tguint64; nbits:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_bit_writer_put_bytes(bitwriter:PGstBitWriter; data:Pguint8; nbytes:Tguint):Tgboolean;cdecl;external;
function gst_bit_writer_align_bytes(bitwriter:PGstBitWriter; trailing_bit:Tguint8):Tgboolean;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIT_WRITER_DATA(writer : longint) : longint;
begin
  GST_BIT_WRITER_DATA:=writer^.data;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BIT_WRITER_BIT_SIZE(writer : longint) : longint;
begin
  GST_BIT_WRITER_BIT_SIZE:=writer^.bit_size;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BIT_WRITER(writer : longint) : PGstBitWriter;
begin
  GST_BIT_WRITER:=PGstBitWriter(writer);
end;


end.
