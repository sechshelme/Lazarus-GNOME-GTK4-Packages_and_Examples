
unit gmime_format_options;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_format_options.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_format_options.h
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
Pchar  = ^char;
PGMimeFilter  = ^GMimeFilter;
PGMimeFormatOptions  = ^GMimeFormatOptions;
PGMimeNewLineFormat  = ^GMimeNewLineFormat;
PGMimeParamEncodingMethod  = ^GMimeParamEncodingMethod;
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
{$ifndef __GMIME_FORMAT_OPTIONS_H__}
{$define __GMIME_FORMAT_OPTIONS_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FORMAT_OPTIONS : longint; { return type might be wrong }

{*
 * GMimeNewLineFormat:
 * @GMIME_NEWLINE_FORMAT_UNIX: The Unix New-Line format ("\n").
 * @GMIME_NEWLINE_FORMAT_DOS: The DOS New-Line format ("\r\n").
 *
 * There are two commonly used line-endings used by modern Operating Systems.
 * Unix-based systems such as Linux and Mac OS use a single character ('\n' aka LF)
 * to represent the end of line where-as Windows (or DOS) uses a sequence of two
 * characters ("\r\n" aka CRLF). Most text-based network protocols such as SMTP,
 * POP3, and IMAP use the CRLF sequence as well.
 * }
type
  PGMimeNewLineFormat = ^TGMimeNewLineFormat;
  TGMimeNewLineFormat =  Longint;
  Const
    GMIME_NEWLINE_FORMAT_UNIX = 0;
    GMIME_NEWLINE_FORMAT_DOS = 1;
;
{*
 * GMimeParamEncodingMethod:
 * @GMIME_PARAM_ENCODING_METHOD_DEFAULT: Use the default encoding method set on the #GMimeFormatOptions.
 * @GMIME_PARAM_ENCODING_METHOD_RFC2231: Use the encoding method described in rfc2231.
 * @GMIME_PARAM_ENCODING_METHOD_RFC2047: Use the encoding method described in rfc2047.
 *
 * The MIME specifications specify that the proper method for encoding Content-Type and
 * Content-Disposition parameter values is the method described in
 * <a href="https://tools.ietf.org/html/rfc2231">rfc2231</a>. However, it is common for
 * some older email clients to improperly encode using the method described in
 * <a href="https://tools.ietf.org/html/rfc2047">rfc2047</a> instead.
 * }
type
  PGMimeParamEncodingMethod = ^TGMimeParamEncodingMethod;
  TGMimeParamEncodingMethod =  Longint;
  Const
    GMIME_PARAM_ENCODING_METHOD_DEFAULT = 0;
    GMIME_PARAM_ENCODING_METHOD_RFC2231 = 1;
    GMIME_PARAM_ENCODING_METHOD_RFC2047 = 2;
;
{*
 * GMimeFormatOptions:
 *
 * Format options for serializing various GMime objects.
 * }
type

function g_mime_format_options_get_type:TGType;cdecl;external;
function g_mime_format_options_get_default:PGMimeFormatOptions;cdecl;external;
function g_mime_format_options_new:PGMimeFormatOptions;cdecl;external;
procedure g_mime_format_options_free(options:PGMimeFormatOptions);cdecl;external;
function g_mime_format_options_clone(options:PGMimeFormatOptions):PGMimeFormatOptions;cdecl;external;
function g_mime_format_options_get_param_encoding_method(options:PGMimeFormatOptions):TGMimeParamEncodingMethod;cdecl;external;
procedure g_mime_format_options_set_param_encoding_method(options:PGMimeFormatOptions; method:TGMimeParamEncodingMethod);cdecl;external;
function g_mime_format_options_get_newline_format(options:PGMimeFormatOptions):TGMimeNewLineFormat;cdecl;external;
procedure g_mime_format_options_set_newline_format(options:PGMimeFormatOptions; newline:TGMimeNewLineFormat);cdecl;external;
(* Const before type ignored *)
function g_mime_format_options_get_newline(options:PGMimeFormatOptions):Pchar;cdecl;external;
function g_mime_format_options_create_newline_filter(options:PGMimeFormatOptions; ensure_newline:Tgboolean):PGMimeFilter;cdecl;external;
{gboolean g_mime_format_options_get_allow_mixed_charsets (GMimeFormatOptions *options); }
{void g_mime_format_options_set_allow_mixed_charsets (GMimeFormatOptions *options, gboolean allow); }
{gboolean g_mime_format_options_get_allow_international (GMimeFormatOptions *options); }
{void g_mime_format_options_set_allow_international (GMimeFormatOptions *options, gboolean allow); }
{gboolean g_mime_format_options_get_max_line (GMimeFormatOptions *options); }
{void g_mime_format_options_set_max_line (GMimeFormatOptions *options, gboolean maxline); }
(* Const before type ignored *)
function g_mime_format_options_is_hidden_header(options:PGMimeFormatOptions; header:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_mime_format_options_add_hidden_header(options:PGMimeFormatOptions; header:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_mime_format_options_remove_hidden_header(options:PGMimeFormatOptions; header:Pchar);cdecl;external;
procedure g_mime_format_options_clear_hidden_headers(options:PGMimeFormatOptions);cdecl;external;
{$endif}
{ __GMIME_FORMAT_OPTIONS_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FORMAT_OPTIONS : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FORMAT_OPTIONS:=gmime_format_options_get_type;
  end;


end.
