unit soup_headers;

interface

uses
  fp_glib2, fp_soup;

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

function soup_headers_parse(str:Pchar; len:longint; dest:PSoupMessageHeaders):Tgboolean;cdecl;external libsoup;
function soup_headers_parse_request(str:Pchar; len:longint; req_headers:PSoupMessageHeaders; req_method:PPchar; req_path:PPchar; 
           ver:PSoupHTTPVersion):Tguint;cdecl;external libsoup;
function soup_headers_parse_status_line(status_line:Pchar; ver:PSoupHTTPVersion; status_code:Pguint; reason_phrase:PPchar):Tgboolean;cdecl;external libsoup;
function soup_headers_parse_response(str:Pchar; len:longint; headers:PSoupMessageHeaders; ver:PSoupHTTPVersion; status_code:Pguint; 
           reason_phrase:PPchar):Tgboolean;cdecl;external libsoup;
{ Individual header parsing  }
function soup_header_parse_list(header:Pchar):PGSList;cdecl;external libsoup;
function soup_header_parse_quality_list(header:Pchar; unacceptable:PPGSList):PGSList;cdecl;external libsoup;
procedure soup_header_free_list(list:PGSList);cdecl;external libsoup;
function soup_header_contains(header:Pchar; token:Pchar):Tgboolean;cdecl;external libsoup;
function soup_header_parse_param_list(header:Pchar):PGHashTable;cdecl;external libsoup;
function soup_header_parse_semi_param_list(header:Pchar):PGHashTable;cdecl;external libsoup;
function soup_header_parse_param_list_strict(header:Pchar):PGHashTable;cdecl;external libsoup;
function soup_header_parse_semi_param_list_strict(header:Pchar):PGHashTable;cdecl;external libsoup;
procedure soup_header_free_param_list(param_list:PGHashTable);cdecl;external libsoup;
procedure soup_header_g_string_append_param(_string:PGString; name:Pchar; value:Pchar);cdecl;external libsoup;
procedure soup_header_g_string_append_param_quoted(_string:PGString; name:Pchar; value:Pchar);cdecl;external libsoup;
{$endif}
{ __SOUP_HEADERS_H__  }

// === Konventiert am: 29-9-25 19:44:51 ===


implementation



end.
