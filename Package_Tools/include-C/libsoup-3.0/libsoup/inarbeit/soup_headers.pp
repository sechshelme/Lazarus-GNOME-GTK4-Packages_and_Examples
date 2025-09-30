
unit soup_headers;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_headers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_headers.h
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
PGHashTable  = ^GHashTable;
PGSList  = ^GSList;
PGString  = ^GString;
Pguint  = ^guint;
PSoupHTTPVersion  = ^SoupHTTPVersion;
PSoupMessageHeaders  = ^SoupMessageHeaders;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2001-2003, Ximian, Inc.
  }
{$ifndef __SOUP_HEADERS_H__}

const
  __SOUP_HEADERS_H__ = 1;  
{$include <glib.h>}
{$include "soup-message.h"}
{ HTTP Header Parsing  }
(* Const before type ignored *)

function soup_headers_parse(str:Pchar; len:longint; dest:PSoupMessageHeaders):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_headers_parse_request(str:Pchar; len:longint; req_headers:PSoupMessageHeaders; req_method:PPchar; req_path:PPchar; 
           ver:PSoupHTTPVersion):Tguint;cdecl;external;
(* Const before type ignored *)
function soup_headers_parse_status_line(status_line:Pchar; ver:PSoupHTTPVersion; status_code:Pguint; reason_phrase:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_headers_parse_response(str:Pchar; len:longint; headers:PSoupMessageHeaders; ver:PSoupHTTPVersion; status_code:Pguint; 
           reason_phrase:PPchar):Tgboolean;cdecl;external;
{ Individual header parsing  }
(* Const before type ignored *)
function soup_header_parse_list(header:Pchar):PGSList;cdecl;external;
(* Const before type ignored *)
function soup_header_parse_quality_list(header:Pchar; unacceptable:PPGSList):PGSList;cdecl;external;
procedure soup_header_free_list(list:PGSList);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_header_contains(header:Pchar; token:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_header_parse_param_list(header:Pchar):PGHashTable;cdecl;external;
(* Const before type ignored *)
function soup_header_parse_semi_param_list(header:Pchar):PGHashTable;cdecl;external;
(* Const before type ignored *)
function soup_header_parse_param_list_strict(header:Pchar):PGHashTable;cdecl;external;
(* Const before type ignored *)
function soup_header_parse_semi_param_list_strict(header:Pchar):PGHashTable;cdecl;external;
procedure soup_header_free_param_list(param_list:PGHashTable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_header_g_string_append_param(_string:PGString; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_header_g_string_append_param_quoted(_string:PGString; name:Pchar; value:Pchar);cdecl;external;
{$endif}
{ __SOUP_HEADERS_H__  }

implementation


end.
