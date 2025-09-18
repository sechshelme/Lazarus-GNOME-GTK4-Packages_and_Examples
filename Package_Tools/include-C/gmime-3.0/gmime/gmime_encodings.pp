
unit gmime_encodings;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_encodings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_encodings.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PGMimeContentEncoding  = ^GMimeContentEncoding;
PGMimeEncoding  = ^GMimeEncoding;
PGMimeEncodingConstraint  = ^GMimeEncodingConstraint;
Pguint32  = ^guint32;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
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
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_ENCODINGS_H__}
{$define __GMIME_ENCODINGS_H__}
{$include <glib.h>}
{$include <sys/types.h>}
{*
 * GMimeContentEncoding:
 * @GMIME_CONTENT_ENCODING_DEFAULT: Default transfer encoding.
 * @GMIME_CONTENT_ENCODING_7BIT: 7bit text transfer encoding.
 * @GMIME_CONTENT_ENCODING_8BIT: 8bit text transfer encoding.
 * @GMIME_CONTENT_ENCODING_BINARY: Binary transfer encoding.
 * @GMIME_CONTENT_ENCODING_BASE64: Base64 transfer encoding.
 * @GMIME_CONTENT_ENCODING_QUOTEDPRINTABLE: Quoted-printable transfer encoding.
 * @GMIME_CONTENT_ENCODING_UUENCODE: Uuencode transfer encoding.
 *
 * A Content-Transfer-Encoding enumeration.
 * }
type
  PGMimeContentEncoding = ^TGMimeContentEncoding;
  TGMimeContentEncoding =  Longint;
  Const
    GMIME_CONTENT_ENCODING_DEFAULT = 0;
    GMIME_CONTENT_ENCODING_7BIT = 1;
    GMIME_CONTENT_ENCODING_8BIT = 2;
    GMIME_CONTENT_ENCODING_BINARY = 3;
    GMIME_CONTENT_ENCODING_BASE64 = 4;
    GMIME_CONTENT_ENCODING_QUOTEDPRINTABLE = 5;
    GMIME_CONTENT_ENCODING_UUENCODE = 6;
;
{*
 * GMimeEncodingConstraint:
 * @GMIME_ENCODING_CONSTRAINT_7BIT: The stream data must fit within the 7bit ASCII range.
 * @GMIME_ENCODING_CONSTRAINT_8BIT: The stream data may have bytes with the high bit set, but no null bytes.
 * @GMIME_ENCODING_CONSTRAINT_BINARY: The stream may contain any binary data.
 *
 * Used with functions like g_mime_filter_best_encoding() and
 * g_mime_object_encode() as the 'constraint' argument. These values
 * provide a means of letting the filter know what the encoding
 * constraints are for the stream.
 * }
type
  PGMimeEncodingConstraint = ^TGMimeEncodingConstraint;
  TGMimeEncodingConstraint =  Longint;
  Const
    GMIME_ENCODING_CONSTRAINT_7BIT = 0;
    GMIME_ENCODING_CONSTRAINT_8BIT = 1;
    GMIME_ENCODING_CONSTRAINT_BINARY = 2;
;
(* Const before type ignored *)

function g_mime_content_encoding_from_string(str:Pchar):TGMimeContentEncoding;cdecl;external;
(* Const before type ignored *)
function g_mime_content_encoding_to_string(encoding:TGMimeContentEncoding):Pchar;cdecl;external;
{*
 * GMIME_BASE64_ENCODE_LEN:
 * @x: Length of the input data to encode
 *
 * Calculates the maximum number of bytes needed to base64 encode the
 * full input buffer of length @x.
 *
 * Returns: the number of output bytes needed to base64 encode an input
 * buffer of size @x.
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_BASE64_ENCODE_LEN(x : longint) : Tsize_t;

{*
 * GMIME_QP_ENCODE_LEN:
 * @x: Length of the input data to encode
 *
 * Calculates the maximum number of bytes needed to encode the full
 * input buffer of length @x using the quoted-printable encoding.
 *
 * Returns: the number of output bytes needed to encode an input buffer
 * of size @x using the quoted-printable encoding.
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_QP_ENCODE_LEN(x : longint) : Tsize_t;

{*
 * GMIME_UUENCODE_LEN:
 * @x: Length of the input data to encode
 *
 * Calculates the maximum number of bytes needed to uuencode the full
 * input buffer of length @x.
 *
 * Returns: the number of output bytes needed to uuencode an input
 * buffer of size @x.
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_UUENCODE_LEN(x : longint) : Tsize_t;

{*
 * GMIME_UUDECODE_STATE_INIT:
 *
 * Initial state for the g_mime_encoding_uudecode_step() function.
 * }
const
  GMIME_UUDECODE_STATE_INIT = 0;  
{*
 * GMIME_UUDECODE_STATE_BEGIN:
 *
 * State for the g_mime_encoding_uudecode_step() function, denoting that
 * the 'begin' line has been found.
 * }
  GMIME_UUDECODE_STATE_BEGIN = 1 shl 16;  
{*
 * GMIME_UUDECODE_STATE_END:
 *
 * State for the g_mime_encoding_uudecode_step() function, denoting that
 * the end of the UU encoded block has been found.
 * }
  GMIME_UUDECODE_STATE_END = 1 shl 17;  
  GMIME_UUDECODE_STATE_MASK = GMIME_UUDECODE_STATE_BEGIN or GMIME_UUDECODE_STATE_END;  
type
{*
 * GMimeEncoding:
 * @encoding: the type of encoding
 * @uubuf: a temporary buffer needed when uuencoding data
 * @encode: %TRUE if encoding or %FALSE if decoding
 * @save: saved bytes from the previous step
 * @state: current encder/decoder state
 *
 * A context used for encoding or decoding data.
 * }
  PGMimeEncoding = ^TGMimeEncoding;
  TGMimeEncoding = record
      encoding : TGMimeContentEncoding;
      uubuf : array[0..59] of byte;
      encode : Tgboolean;
      save : Tguint32;
      state : longint;
    end;


procedure g_mime_encoding_init_encode(state:PGMimeEncoding; encoding:TGMimeContentEncoding);cdecl;external;
procedure g_mime_encoding_init_decode(state:PGMimeEncoding; encoding:TGMimeContentEncoding);cdecl;external;
procedure g_mime_encoding_reset(state:PGMimeEncoding);cdecl;external;
function g_mime_encoding_outlen(state:PGMimeEncoding; inlen:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_step(state:PGMimeEncoding; inbuf:Pchar; inlen:Tsize_t; outbuf:Pchar):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_flush(state:PGMimeEncoding; inbuf:Pchar; inlen:Tsize_t; outbuf:Pchar):Tsize_t;cdecl;external;
{ do incremental base64 (de/en)coding  }
(* Const before type ignored *)
function g_mime_encoding_base64_decode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_base64_encode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_base64_encode_close(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
{ do incremental uu (de/en)coding  }
(* Const before type ignored *)
function g_mime_encoding_uudecode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_uuencode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; uubuf:Pbyte; state:Plongint; 
           save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_uuencode_close(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; uubuf:Pbyte; state:Plongint; 
           save:Pguint32):Tsize_t;cdecl;external;
{ do incremental quoted-printable (de/en)coding  }
(* Const before type ignored *)
function g_mime_encoding_quoted_decode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_quoted_encode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_encoding_quoted_encode_close(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; save:Pguint32):Tsize_t;cdecl;external;
{$endif}
{ __GMIME_ENCODINGS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_BASE64_ENCODE_LEN(x : longint) : Tsize_t;
begin
  GMIME_BASE64_ENCODE_LEN:=Tsize_t((((Tx(+(2)))/57)*77)+77);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_QP_ENCODE_LEN(x : longint) : Tsize_t;
begin
  GMIME_QP_ENCODE_LEN:=Tsize_t(((x/24)*74)+74);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GMIME_UUENCODE_LEN(x : longint) : Tsize_t;
begin
  GMIME_UUENCODE_LEN:=Tsize_t((((Tx(+(2)))/45)*62)+64);
end;


end.
