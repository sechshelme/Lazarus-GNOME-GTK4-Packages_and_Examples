unit gmime_parser_options;

interface

uses
  fp_glib2, fp_gmime3;

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
{$ifndef __GMIME_PARSER_OPTIONS_H__}
{$define __GMIME_PARSER_OPTIONS_H__}
{$include <glib.h>}
{$include <glib-object.h>}

{*
 * GMimeRfcComplianceMode:
 * @GMIME_RFC_COMPLIANCE_LOOSE: Attempt to be much more liberal accepting broken and/or invalid formatting.
 * @GMIME_RFC_COMPLIANCE_STRICT: Do not attempt to be overly liberal in accepting broken and/or invalid formatting.
 *
 * An RFC compliance mode.
 * }
type
  PGMimeRfcComplianceMode = ^TGMimeRfcComplianceMode;
  TGMimeRfcComplianceMode =  Longint;
  Const
    GMIME_RFC_COMPLIANCE_LOOSE = 0;
    GMIME_RFC_COMPLIANCE_STRICT = 1;
;
{*
 * GMimeParserWarning:
 * @GMIME_WARN_DUPLICATED_HEADER: Repeated exactly the same header which should exist only once.
 * @GMIME_WARN_DUPLICATED_PARAMETER: Repeated exactly the same header parameter.
 * @GMIME_WARN_UNENCODED_8BIT_HEADER: A header contains unencoded 8-bit characters.
 * @GMIME_WARN_INVALID_CONTENT_TYPE: Invalid content type, assuming `application/octet-stream`.
 * @GMIME_WARN_INVALID_RFC2047_HEADER_VALUE: Invalid RFC 2047 encoded header value.
 * @GMIME_WARN_INVALID_PARAMETER: Invalid header parameter.
 * @GMIME_WARN_MALFORMED_MULTIPART: No child parts detected within a multipart.
 * @GMIME_WARN_TRUNCATED_MESSAGE: The message is truncated.
 * @GMIME_WARN_MALFORMED_MESSAGE: The message is malformed.
 * @GMIME_WARN_INVALID_ADDRESS_LIST: Invalid address list.
 * @GMIME_CRIT_INVALID_HEADER_NAME: Invalid header name, the parser may skip the message or parts of it.
 * @GMIME_CRIT_CONFLICTING_HEADER: Conflicting header.
 * @GMIME_CRIT_CONFLICTING_PARAMETER: Conflicting header parameter.
 * @GMIME_CRIT_MULTIPART_WITHOUT_BOUNDARY: A multipart lacks the required boundary parameter.
 * @GMIME_CRIT_NESTING_OVERFLOW: The maximum MIME nesting level has been exceeded. This is very likely to be an attempt to exploit the MIME parser.
 * @GMIME_WARN_PART_WITHOUT_CONTENT: A MIME part's headers were terminated by a boundary marker.
 * @GMIME_CRIT_PART_WITHOUT_HEADERS_OR_CONTENT: A MIME part was encountered without any headers -or- content. This is very likely to be an attempt to exploit the MIME parser.
 *
 * Issues the @GMimeParser detects. Note that the `GMIME_CRIT_*` issues indicate that some parts of the @GMimeParser input may
 * be ignored or will be interpreted differently by other software products.
 * }
type
  PGMimeParserWarning = ^TGMimeParserWarning;
  TGMimeParserWarning =  Longint;
  Const
    GMIME_WARN_DUPLICATED_HEADER = 1;
    GMIME_WARN_DUPLICATED_PARAMETER = 2;
    GMIME_WARN_UNENCODED_8BIT_HEADER = 3;
    GMIME_WARN_INVALID_CONTENT_TYPE = 4;
    GMIME_WARN_INVALID_RFC2047_HEADER_VALUE = 5;
    GMIME_WARN_MALFORMED_MULTIPART = 6;
    GMIME_WARN_TRUNCATED_MESSAGE = 7;
    GMIME_WARN_MALFORMED_MESSAGE = 8;
    GMIME_CRIT_INVALID_HEADER_NAME = 9;
    GMIME_CRIT_CONFLICTING_HEADER = 10;
    GMIME_CRIT_CONFLICTING_PARAMETER = 11;
    GMIME_CRIT_MULTIPART_WITHOUT_BOUNDARY = 12;
    GMIME_WARN_INVALID_PARAMETER = 13;
    GMIME_WARN_INVALID_ADDRESS_LIST = 14;
    GMIME_CRIT_NESTING_OVERFLOW = 15;
    GMIME_WARN_PART_WITHOUT_CONTENT = 16;
    GMIME_CRIT_PART_WITHOUT_HEADERS_OR_CONTENT = 17;
;
{*
 * GMimeParserOptions:
 *
 * A set of parser options used by #GMimeParser and various other parsing functions.
 * }
type
{*
 * GMimeParserWarningFunc:
 * @offset: parser offset where the issue has been detected, or -1 if it is unknown
 * @errcode: a #GMimeParserWarning
 * @item: a NUL-terminated string containing the value causing the issue, may be %NULL
 * @user_data: User-supplied callback data.
 *
 * The function signature for a callback to g_mime_parser_options_set_warning_callback().
 * }

  TGMimeParserWarningFunc = procedure (offset:Tgint64; errcode:TGMimeParserWarning; item:Pgchar; user_data:Tgpointer);cdecl;

function g_mime_parser_options_get_type:TGType;cdecl;external libgmime3;
function g_mime_parser_options_get_default:PGMimeParserOptions;cdecl;external libgmime3;
function g_mime_parser_options_new:PGMimeParserOptions;cdecl;external libgmime3;
procedure g_mime_parser_options_free(options:PGMimeParserOptions);cdecl;external libgmime3;
function g_mime_parser_options_clone(options:PGMimeParserOptions):PGMimeParserOptions;cdecl;external libgmime3;
function g_mime_parser_options_get_address_compliance_mode(options:PGMimeParserOptions):TGMimeRfcComplianceMode;cdecl;external libgmime3;
procedure g_mime_parser_options_set_address_compliance_mode(options:PGMimeParserOptions; mode:TGMimeRfcComplianceMode);cdecl;external libgmime3;
function g_mime_parser_options_get_allow_addresses_without_domain(options:PGMimeParserOptions):Tgboolean;cdecl;external libgmime3;
procedure g_mime_parser_options_set_allow_addresses_without_domain(options:PGMimeParserOptions; allow:Tgboolean);cdecl;external libgmime3;
function g_mime_parser_options_get_parameter_compliance_mode(options:PGMimeParserOptions):TGMimeRfcComplianceMode;cdecl;external libgmime3;
procedure g_mime_parser_options_set_parameter_compliance_mode(options:PGMimeParserOptions; mode:TGMimeRfcComplianceMode);cdecl;external libgmime3;
function g_mime_parser_options_get_rfc2047_compliance_mode(options:PGMimeParserOptions):TGMimeRfcComplianceMode;cdecl;external libgmime3;
procedure g_mime_parser_options_set_rfc2047_compliance_mode(options:PGMimeParserOptions; mode:TGMimeRfcComplianceMode);cdecl;external libgmime3;
function g_mime_parser_options_get_fallback_charsets(options:PGMimeParserOptions):^Pchar;cdecl;external libgmime3;
procedure g_mime_parser_options_set_fallback_charsets(options:PGMimeParserOptions; charsets:PPchar);cdecl;external libgmime3;
function g_mime_parser_options_get_warning_callback(options:PGMimeParserOptions):TGMimeParserWarningFunc;cdecl;external libgmime3;
procedure g_mime_parser_options_set_warning_callback(options:PGMimeParserOptions; warning_cb:TGMimeParserWarningFunc; user_data:Tgpointer);cdecl;external libgmime3;
{$endif}
{ __GMIME_PARSER_OPTIONS_H__  }

// === Konventiert am: 18-9-25 15:32:48 ===

function GMIME_TYPE_PARSER_OPTIONS : TGType;

implementation

function GMIME_TYPE_PARSER_OPTIONS : TGType;
  begin
    GMIME_TYPE_PARSER_OPTIONS:=gmime_parser_options_get_type;
  end;



end.
