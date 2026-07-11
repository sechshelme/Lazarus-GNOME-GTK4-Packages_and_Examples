
unit gstformat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstformat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstformat.h
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
PGstFormat  = ^GstFormat;
PGstFormatDefinition  = ^GstFormatDefinition;
PGstIterator  = ^GstIterator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *
 * gstformat.h: Header for GstFormat types used in queries and
 *              seeking.
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
{$ifndef __GST_FORMAT_H__}
{$define __GST_FORMAT_H__}
{$include <glib.h>}
{$include <gst/gstiterator.h>}
{*
 * GstFormat:
 * @GST_FORMAT_UNDEFINED: undefined format
 * @GST_FORMAT_DEFAULT: the default format of the pad/element. This can be
 *    samples for raw audio, frames/fields for raw video (some, but not all,
 *    elements support this; use @GST_FORMAT_TIME if you don't have a good
 *    reason to query for samples/frames)
 * @GST_FORMAT_BYTES: bytes
 * @GST_FORMAT_TIME: time in nanoseconds
 * @GST_FORMAT_BUFFERS: buffers (few, if any, elements implement this as of
 *     May 2009)
 * @GST_FORMAT_PERCENT: percentage of stream (few, if any, elements implement
 *     this as of May 2009)
 *
 * Standard predefined formats
  }
{ NOTE: don't forget to update the table in gstformat.c when changing
 * this enum  }
{ must be first in list  }
type
  PGstFormat = ^TGstFormat;
  TGstFormat =  Longint;
  Const
    GST_FORMAT_UNDEFINED = 0;
    GST_FORMAT_DEFAULT = 1;
    GST_FORMAT_BYTES = 2;
    GST_FORMAT_TIME = 3;
    GST_FORMAT_BUFFERS = 4;
    GST_FORMAT_PERCENT = 5;
;
{ a percentage is always relative to 1000000  }
{*
 * GST_FORMAT_PERCENT_MAX:
 *
 * The PERCENT format is between 0 and this value
  }

{ was #define dname def_expr }
function GST_FORMAT_PERCENT_MAX : longint; { return type might be wrong }

{*
 * GST_FORMAT_PERCENT_SCALE:
 *
 * The value used to scale down the reported PERCENT format value to
 * its real value.
  }
{ was #define dname def_expr }
function GST_FORMAT_PERCENT_SCALE : longint; { return type might be wrong }

type
{*
 * GstFormatDefinition:
 * @value: The unique id of this format
 * @nick: A short nick of the format
 * @description: A longer description of the format
 * @quark: A quark for the nick
 *
 * A format definition
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGstFormatDefinition = ^TGstFormatDefinition;
  TGstFormatDefinition = record
      value : TGstFormat;
      nick : Pgchar;
      description : Pgchar;
      quark : TGQuark;
    end;

(* Const before type ignored *)

function gst_format_get_name(format:TGstFormat):Pgchar;cdecl;external;
function gst_format_to_quark(format:TGstFormat):TGQuark;cdecl;external;
{ register a new format  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_format_register(nick:Pgchar; description:Pgchar):TGstFormat;cdecl;external;
(* Const before type ignored *)
function gst_format_get_by_nick(nick:Pgchar):TGstFormat;cdecl;external;
{ check if a format is in an array of formats  }
(* Const before type ignored *)
function gst_formats_contains(formats:PGstFormat; format:TGstFormat):Tgboolean;cdecl;external;
{ query for format details  }
(* Const before type ignored *)
function gst_format_get_details(format:TGstFormat):PGstFormatDefinition;cdecl;external;
function gst_format_iterate_definitions:PGstIterator;cdecl;external;
{$endif}
{ __GST_FORMAT_H__  }

implementation

{ was #define dname def_expr }
function GST_FORMAT_PERCENT_MAX : longint; { return type might be wrong }
  begin
    GST_FORMAT_PERCENT_MAX:=G_GINT64_CONSTANT(1000000);
  end;

{ was #define dname def_expr }
function GST_FORMAT_PERCENT_SCALE : longint; { return type might be wrong }
  begin
    GST_FORMAT_PERCENT_SCALE:=G_GINT64_CONSTANT(10000);
  end;


end.
