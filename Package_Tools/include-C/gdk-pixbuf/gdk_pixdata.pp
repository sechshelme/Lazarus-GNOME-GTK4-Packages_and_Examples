
unit gdk_pixdata;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixdata.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixdata.h
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
PGdkPixbuf  = ^GdkPixbuf;
PGdkPixdata  = ^GdkPixdata;
PGdkPixdataDumpType  = ^GdkPixdataDumpType;
PGdkPixdataType  = ^GdkPixdataType;
PGError  = ^GError;
PGString  = ^GString;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GdkPixbuf library - GdkPixdata - functions for inlined pixbuf handling
 * Copyright (C) 1999, 2001 Tim Janik
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __GDK_PIXDATA_H__}
{$define __GDK_PIXDATA_H__}
{$ifndef GDK_PIXBUF_DISABLE_DEPRECATED}
{$include        <gdk-pixbuf/gdk-pixbuf.h>}
{*
 * GDK_PIXBUF_MAGIC_NUMBER:
 *
 * Magic number for #GdkPixdata structures.
 * }
{ 'GdkP'  }

const
  GDK_PIXBUF_MAGIC_NUMBER = $47646b50;  
{*
 * GdkPixdataType:
 * @GDK_PIXDATA_COLOR_TYPE_RGB:  each pixel has red, green and blue samples.
 * @GDK_PIXDATA_COLOR_TYPE_RGBA: each pixel has red, green and blue samples 
 *    and an alpha value.
 * @GDK_PIXDATA_COLOR_TYPE_MASK: mask for the colortype flags of the enum.
 * @GDK_PIXDATA_SAMPLE_WIDTH_8: each sample has 8 bits.
 * @GDK_PIXDATA_SAMPLE_WIDTH_MASK: mask for the sample width flags of the enum.
 * @GDK_PIXDATA_ENCODING_RAW: the pixel data is in raw form. 
 * @GDK_PIXDATA_ENCODING_RLE: the pixel data is run-length encoded. Runs may 
 *    be up to 127 bytes long; their length is stored in a single byte 
 *    preceding the pixel data for the run. If a run is constant, its length
 *    byte has the high bit set and the pixel data consists of a single pixel
 *    which must be repeated. 
 * @GDK_PIXDATA_ENCODING_MASK: mask for the encoding flags of the enum.
 *
 * An enumeration containing three sets of flags for a #GdkPixdata struct: 
 * one for the used colorspace, one for the width of the samples and one 
 * for the encoding of the pixel data.
 *
 * Deprecated: 2.32
 * }
{ colorspace + alpha  }
{ width, support 8bits only currently  }
{ encoding  }
type
  PGdkPixdataType = ^TGdkPixdataType;
  TGdkPixdataType =  Longint;
  Const
    GDK_PIXDATA_COLOR_TYPE_RGB = $01;
    GDK_PIXDATA_COLOR_TYPE_RGBA = $02;
    GDK_PIXDATA_COLOR_TYPE_MASK = $ff;
    GDK_PIXDATA_SAMPLE_WIDTH_8 = $01 shl 16;
    GDK_PIXDATA_SAMPLE_WIDTH_MASK = $0f shl 16;
    GDK_PIXDATA_ENCODING_RAW = $01 shl 24;
    GDK_PIXDATA_ENCODING_RLE = $02 shl 24;
    GDK_PIXDATA_ENCODING_MASK = $0f shl 24;
;
type
{ GDK_PIXBUF_MAGIC_NUMBER  }
{ <1 to disable length checks, otherwise:
			 * GDK_PIXDATA_HEADER_LENGTH + pixel_data length
			  }
{ GdkPixdataType  }
  PGdkPixdata = ^TGdkPixdata;
  TGdkPixdata = record
      magic : Tguint32;
      length : Tgint32;
      pixdata_type : Tguint32;
      rowstride : Tguint32;
      width : Tguint32;
      height : Tguint32;
      pixel_data : Pguint8;
    end;

{*
 * GDK_PIXDATA_HEADER_LENGTH:
 *
 * The length of a #GdkPixdata structure without the @pixel_data pointer.
 *
 * Deprecated: 2.32
 * }

const
  GDK_PIXDATA_HEADER_LENGTH = ((((4+4)+4)+4)+4)+4;  
{ the returned stream is plain htonl of GdkPixdata members + pixel_data  }
(* Const before type ignored *)

function gdk_pixdata_serialize(pixdata:PGdkPixdata; stream_length_p:Pguint):Pguint8;cdecl;external;
(* Const before type ignored *)
function gdk_pixdata_deserialize(pixdata:PGdkPixdata; stream_length:Tguint; stream:Pguint8; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gdk_pixdata_from_pixbuf(pixdata:PGdkPixdata; pixbuf:PGdkPixbuf; use_rle:Tgboolean):Tgpointer;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_from_pixdata(pixdata:PGdkPixdata; copy_pixels:Tgboolean; error:PPGError):PGdkPixbuf;cdecl;external;
{* 
 * GdkPixdataDumpType:
 * @GDK_PIXDATA_DUMP_PIXDATA_STREAM: Generate pixbuf data stream (a single 
 *    string containing a serialized #GdkPixdata structure in network byte 
 *    order).
 * @GDK_PIXDATA_DUMP_PIXDATA_STRUCT: Generate #GdkPixdata structure (needs 
 *    the #GdkPixdata structure definition from gdk-pixdata.h).
 * @GDK_PIXDATA_DUMP_MACROS: Generate <function>*_ROWSTRIDE</function>,     
 *    <function>*_WIDTH</function>, <function>*_HEIGHT</function>,
 *    <function>*_BYTES_PER_PIXEL</function> and 
 *    <function>*_RLE_PIXEL_DATA</function> or <function>*_PIXEL_DATA</function>
 *    macro definitions for the image.
 * @GDK_PIXDATA_DUMP_GTYPES: Generate GLib data types instead of 
 *    standard C data types.
 * @GDK_PIXDATA_DUMP_CTYPES: Generate standard C data types instead of 
 *    GLib data types.
 * @GDK_PIXDATA_DUMP_STATIC: Generate static symbols.
 * @GDK_PIXDATA_DUMP_CONST: Generate const symbols.
 * @GDK_PIXDATA_DUMP_RLE_DECODER: Provide a <function>*_RUN_LENGTH_DECODE(image_buf, rle_data, size, bpp)</function> 
 *    macro definition  to  decode  run-length encoded image data.
 *  
 * An enumeration which is used by gdk_pixdata_to_csource() to
 * determine the form of C source to be generated. The three values
 * @GDK_PIXDATA_DUMP_PIXDATA_STREAM, @GDK_PIXDATA_DUMP_PIXDATA_STRUCT
 * and @GDK_PIXDATA_DUMP_MACROS are mutually exclusive, as are
 * @GDK_PIXBUF_DUMP_GTYPES and @GDK_PIXBUF_DUMP_CTYPES. The remaining
 * elements are optional flags that can be freely added.
 *
 * Deprecated: 2.32
 * }
{ type of source to save  }
{ type of variables to use  }
{ save RLE decoder macro?  }
type
  PGdkPixdataDumpType = ^TGdkPixdataDumpType;
  TGdkPixdataDumpType =  Longint;
  Const
    GDK_PIXDATA_DUMP_PIXDATA_STREAM = 0;
    GDK_PIXDATA_DUMP_PIXDATA_STRUCT = 1;
    GDK_PIXDATA_DUMP_MACROS = 2;
    GDK_PIXDATA_DUMP_GTYPES = 0;
    GDK_PIXDATA_DUMP_CTYPES = 1 shl 8;
    GDK_PIXDATA_DUMP_STATIC = 1 shl 9;
    GDK_PIXDATA_DUMP_CONST = 1 shl 10;
    GDK_PIXDATA_DUMP_RLE_DECODER = 1 shl 16;
;
(* Const before type ignored *)

function gdk_pixdata_to_csource(pixdata:PGdkPixdata; name:Pgchar; dump_type:TGdkPixdataDumpType):PGString;cdecl;external;
{$endif}
{ GDK_PIXBUF_DISABLE_DEPRECATED  }
{$endif}
{ __GDK_PIXDATA_H__  }

implementation


end.
