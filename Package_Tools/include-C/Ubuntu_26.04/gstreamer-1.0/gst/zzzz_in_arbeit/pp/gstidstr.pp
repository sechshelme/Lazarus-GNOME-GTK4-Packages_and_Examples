
unit gstidstr;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstidstr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstidstr.h
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
PGstIdStr  = ^GstIdStr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2024 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_ID_STR_H__}
{$define __GST_ID_STR_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{*
 * GstIdStr:
 *
 * String type optimized for short strings.
 *
 * Strings are usually stack- or inline-allocated, and for short strings smaller
 * than 16 bytes (including NUL terminator) no heap allocations are performed.
 *
 * Since: 1.26
  }
{ < private >  }
{$if GLIB_SIZEOF_VOID_P == 8}
(*** was #elif ****){$else GLIB_SIZEOF_VOID_P == 4}
{  guint8 padding[12]; }
{$else}
{$error "Only 32 bit and 64 bit pointers supported currently"}
{$endif}
type
  PGstIdStr = ^TGstIdStr;
  TGstIdStr = record
      pointer : Tgpointer;
      padding : array[0..7] of Tguint8;
    end;
{*
 * GST_ID_STR_INIT:
 *
 * Initializer for #GstIdStr.
 *
 * Since: 1.26
  }

function gst_id_str_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_id_str_get_len(s:PGstIdStr):Tgsize;cdecl;external;
(* Const before type ignored *)
procedure gst_id_str_set(s:PGstIdStr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_id_str_set_with_len(s:PGstIdStr; value:Pgchar; len:Tgsize);cdecl;external;
(* Const before type ignored *)
procedure gst_id_str_set_static_str(s:PGstIdStr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_id_str_set_static_str_with_len(s:PGstIdStr; value:Pgchar; len:Tgsize);cdecl;external;
procedure gst_id_str_init(s:PGstIdStr);cdecl;external;
procedure gst_id_str_clear(s:PGstIdStr);cdecl;external;
function gst_id_str_new:PGstIdStr;cdecl;external;
(* Const before type ignored *)
function gst_id_str_copy(s:PGstIdStr):PGstIdStr;cdecl;external;
procedure gst_id_str_free(s:PGstIdStr);cdecl;external;
(* Const before type ignored *)
procedure gst_id_str_copy_into(d:PGstIdStr; s:PGstIdStr);cdecl;external;
procedure gst_id_str_move(d:PGstIdStr; s:PGstIdStr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_id_str_as_str(s:PGstIdStr):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_id_str_is_equal(s1:PGstIdStr; s2:PGstIdStr):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_id_str_is_equal_to_str(s1:PGstIdStr; s2:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_id_str_is_equal_to_str_with_len(s1:PGstIdStr; s2:Pgchar; len:Tgsize):Tgboolean;cdecl;external;
{$endif}

implementation


end.
