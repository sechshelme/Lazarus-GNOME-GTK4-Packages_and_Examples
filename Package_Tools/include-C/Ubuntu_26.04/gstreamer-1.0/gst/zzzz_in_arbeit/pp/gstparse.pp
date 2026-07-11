
unit gstparse;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstparse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstparse.h
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
PGError  = ^GError;
PGstElement  = ^GstElement;
PGstParseContext  = ^GstParseContext;
PGstParseError  = ^GstParseError;
PGstParseFlags  = ^GstParseFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstparse.h: get a pipeline from a text pipeline description
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
{$ifndef __GST_PARSE_H__}
{$define __GST_PARSE_H__}
{$include <gst/gstelement.h>}

function gst_parse_error_quark:TGQuark;cdecl;external;
{*
 * GST_PARSE_ERROR:
 *
 * Get access to the error quark of the parse subsystem.
  }
{ was #define dname def_expr }
function GST_PARSE_ERROR : longint; { return type might be wrong }

{ FIXME 2.0: rename to GstParseLaunchError, this is not only related to
 *parsing  }
{*
 * GstParseError:
 * @GST_PARSE_ERROR_SYNTAX: A syntax error occurred.
 * @GST_PARSE_ERROR_NO_SUCH_ELEMENT: The description contained an unknown element
 * @GST_PARSE_ERROR_NO_SUCH_PROPERTY: An element did not have a specified property
 * @GST_PARSE_ERROR_LINK: There was an error linking two pads.
 * @GST_PARSE_ERROR_COULD_NOT_SET_PROPERTY: There was an error setting a property
 * @GST_PARSE_ERROR_EMPTY_BIN: An empty bin was specified.
 * @GST_PARSE_ERROR_EMPTY: An empty description was specified
 * @GST_PARSE_ERROR_DELAYED_LINK: A delayed link did not get resolved.
 *
 * The different parsing errors that can occur.
  }
type
  PGstParseError = ^TGstParseError;
  TGstParseError =  Longint;
  Const
    GST_PARSE_ERROR_SYNTAX = 0;
    GST_PARSE_ERROR_NO_SUCH_ELEMENT = 1;
    GST_PARSE_ERROR_NO_SUCH_PROPERTY = 2;
    GST_PARSE_ERROR_LINK = 3;
    GST_PARSE_ERROR_COULD_NOT_SET_PROPERTY = 4;
    GST_PARSE_ERROR_EMPTY_BIN = 5;
    GST_PARSE_ERROR_EMPTY = 6;
    GST_PARSE_ERROR_DELAYED_LINK = 7;
;
{*
 * GstParseFlags:
 * @GST_PARSE_FLAG_NONE: Do not use any special parsing options.
 * @GST_PARSE_FLAG_FATAL_ERRORS: Always return %NULL when an error occurs
 *     (default behaviour is to return partially constructed bins or elements
 *      in some cases)
 * @GST_PARSE_FLAG_NO_SINGLE_ELEMENT_BINS: If a bin only has a single element,
 *     just return the element.
 * @GST_PARSE_FLAG_PLACE_IN_BIN: If more than one toplevel element is described
 *     by the pipeline description string, put them in a #GstBin instead of a
 *     #GstPipeline. (Since: 1.10)
 *
 * Parsing options.
  }
type
  PGstParseFlags = ^TGstParseFlags;
  TGstParseFlags =  Longint;
  Const
    GST_PARSE_FLAG_NONE = 0;
    GST_PARSE_FLAG_FATAL_ERRORS = 1 shl 0;
    GST_PARSE_FLAG_NO_SINGLE_ELEMENT_BINS = 1 shl 1;
    GST_PARSE_FLAG_PLACE_IN_BIN = 1 shl 2;
;

{ was #define dname def_expr }
function GST_TYPE_PARSE_CONTEXT : longint; { return type might be wrong }

{*
 * GstParseContext:
 *
 * Opaque structure.
  }
type
{ create, process and free a parse context  }

function gst_parse_context_get_type:TGType;cdecl;external;
function gst_parse_context_new:PGstParseContext;cdecl;external;
function gst_parse_context_get_missing_elements(context:PGstParseContext):^Pgchar;cdecl;external;
procedure gst_parse_context_free(context:PGstParseContext);cdecl;external;
(* Const before type ignored *)
function gst_parse_context_copy(context:PGstParseContext):PGstParseContext;cdecl;external;
{ parse functions  }
(* Const before type ignored *)
function gst_parse_launch(pipeline_description:Pgchar; error:PPGError):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_parse_launchv(argv:PPgchar; error:PPGError):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_parse_launch_full(pipeline_description:Pgchar; context:PGstParseContext; flags:TGstParseFlags; error:PPGError):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_parse_launchv_full(argv:PPgchar; context:PGstParseContext; flags:TGstParseFlags; error:PPGError):PGstElement;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstParseContext, gst_parse_context_free) }
{$endif}
{ __GST_PARSE_H__  }

implementation

{ was #define dname def_expr }
function GST_PARSE_ERROR : longint; { return type might be wrong }
  begin
    GST_PARSE_ERROR:=gst_parse_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_PARSE_CONTEXT : longint; { return type might be wrong }
  begin
    GST_TYPE_PARSE_CONTEXT:=gst_parse_context_get_type;
  end;


end.
