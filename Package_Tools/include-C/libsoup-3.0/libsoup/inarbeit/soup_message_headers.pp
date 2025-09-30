
unit soup_message_headers;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_message_headers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_message_headers.h
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
Pgoffset  = ^goffset;
Plongint  = ^longint;
PSoupEncoding  = ^SoupEncoding;
PSoupExpectation  = ^SoupExpectation;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PSoupMessageHeadersIter  = ^SoupMessageHeadersIter;
PSoupMessageHeadersType  = ^SoupMessageHeadersType;
PSoupRange  = ^SoupRange;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2005 Novell, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type

function soup_message_headers_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_HEADERS : longint; { return type might be wrong }

type
  PSoupMessageHeadersType = ^TSoupMessageHeadersType;
  TSoupMessageHeadersType =  Longint;
  Const
    SOUP_MESSAGE_HEADERS_REQUEST = 0;
    SOUP_MESSAGE_HEADERS_RESPONSE = 1;
    SOUP_MESSAGE_HEADERS_MULTIPART = 2;
;

function soup_message_headers_new(_type:TSoupMessageHeadersType):PSoupMessageHeaders;cdecl;external;
function soup_message_headers_ref(hdrs:PSoupMessageHeaders):PSoupMessageHeaders;cdecl;external;
procedure soup_message_headers_unref(hdrs:PSoupMessageHeaders);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_message_headers_append(hdrs:PSoupMessageHeaders; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_message_headers_replace(hdrs:PSoupMessageHeaders; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
procedure soup_message_headers_remove(hdrs:PSoupMessageHeaders; name:Pchar);cdecl;external;
procedure soup_message_headers_clear(hdrs:PSoupMessageHeaders);cdecl;external;
procedure soup_message_headers_clean_connection_headers(hdrs:PSoupMessageHeaders);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_headers_get_one(hdrs:PSoupMessageHeaders; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_headers_get_list(hdrs:PSoupMessageHeaders; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_headers_header_contains(hdrs:PSoupMessageHeaders; name:Pchar; token:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_headers_header_equals(hdrs:PSoupMessageHeaders; name:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TSoupMessageHeadersForeachFunc = procedure (name:Pchar; value:Pchar; user_data:Tgpointer);cdecl;

procedure soup_message_headers_foreach(hdrs:PSoupMessageHeaders; func:TSoupMessageHeadersForeachFunc; user_data:Tgpointer);cdecl;external;
function soup_message_headers_get_headers_type(hdrs:PSoupMessageHeaders):TSoupMessageHeadersType;cdecl;external;
{< private > }
type
  PSoupMessageHeadersIter = ^TSoupMessageHeadersIter;
  TSoupMessageHeadersIter = record
      dummy : array[0..2] of Tgpointer;
    end;

procedure soup_message_headers_iter_init(iter:PSoupMessageHeadersIter; hdrs:PSoupMessageHeaders);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_headers_iter_next(iter:PSoupMessageHeadersIter; name:PPchar; value:PPchar):Tgboolean;cdecl;external;
{ Specific headers  }
type
  PSoupEncoding = ^TSoupEncoding;
  TSoupEncoding =  Longint;
  Const
    SOUP_ENCODING_UNRECOGNIZED = 0;
    SOUP_ENCODING_NONE = 1;
    SOUP_ENCODING_CONTENT_LENGTH = 2;
    SOUP_ENCODING_EOF = 3;
    SOUP_ENCODING_CHUNKED = 4;
    SOUP_ENCODING_BYTERANGES = 5;
;

function soup_message_headers_get_encoding(hdrs:PSoupMessageHeaders):TSoupEncoding;cdecl;external;
procedure soup_message_headers_set_encoding(hdrs:PSoupMessageHeaders; encoding:TSoupEncoding);cdecl;external;
function soup_message_headers_get_content_length(hdrs:PSoupMessageHeaders):Tgoffset;cdecl;external;
procedure soup_message_headers_set_content_length(hdrs:PSoupMessageHeaders; content_length:Tgoffset);cdecl;external;
type
  PSoupExpectation = ^TSoupExpectation;
  TSoupExpectation =  Longint;
  Const
    SOUP_EXPECTATION_UNRECOGNIZED = 1 shl 0;
    SOUP_EXPECTATION_CONTINUE = 1 shl 1;
;

function soup_message_headers_get_expectations(hdrs:PSoupMessageHeaders):TSoupExpectation;cdecl;external;
procedure soup_message_headers_set_expectations(hdrs:PSoupMessageHeaders; expectations:TSoupExpectation);cdecl;external;
type
  PSoupRange = ^TSoupRange;
  TSoupRange = record
      start : Tgoffset;
      end : Tgoffset;
    end;

function soup_message_headers_get_ranges(hdrs:PSoupMessageHeaders; total_length:Tgoffset; ranges:PPSoupRange; length:Plongint):Tgboolean;cdecl;external;
procedure soup_message_headers_free_ranges(hdrs:PSoupMessageHeaders; ranges:PSoupRange);cdecl;external;
procedure soup_message_headers_set_ranges(hdrs:PSoupMessageHeaders; ranges:PSoupRange; length:longint);cdecl;external;
procedure soup_message_headers_set_range(hdrs:PSoupMessageHeaders; start:Tgoffset; end:Tgoffset);cdecl;external;
function soup_message_headers_get_content_range(hdrs:PSoupMessageHeaders; start:Pgoffset; end:Pgoffset; total_length:Pgoffset):Tgboolean;cdecl;external;
procedure soup_message_headers_set_content_range(hdrs:PSoupMessageHeaders; start:Tgoffset; end:Tgoffset; total_length:Tgoffset);cdecl;external;
(* Const before type ignored *)
function soup_message_headers_get_content_type(hdrs:PSoupMessageHeaders; params:PPGHashTable):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_message_headers_set_content_type(hdrs:PSoupMessageHeaders; content_type:Pchar; params:PGHashTable);cdecl;external;
function soup_message_headers_get_content_disposition(hdrs:PSoupMessageHeaders; disposition:PPchar; params:PPGHashTable):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure soup_message_headers_set_content_disposition(hdrs:PSoupMessageHeaders; disposition:Pchar; params:PGHashTable);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_HEADERS : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MESSAGE_HEADERS:=soup_message_headers_get_type;
  end;


end.
