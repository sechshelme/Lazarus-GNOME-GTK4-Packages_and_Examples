
unit soup_uri_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_uri_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_uri_utils.h
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
PGBytes  = ^GBytes;
PGUri  = ^GUri;
PSoupURIComponent  = ^SoupURIComponent;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ 
 * Copyright 1999-2002 Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type
  PSoupURIComponent = ^TSoupURIComponent;
  TSoupURIComponent =  Longint;
  Const
    SOUP_URI_NONE = 0;
    SOUP_URI_SCHEME = 1;
    SOUP_URI_USER = 2;
    SOUP_URI_PASSWORD = 3;
    SOUP_URI_AUTH_PARAMS = 4;
    SOUP_URI_HOST = 5;
    SOUP_URI_PORT = 6;
    SOUP_URI_PATH = 7;
    SOUP_URI_QUERY = 8;
    SOUP_URI_FRAGMENT = 9;
;
(* Const before type ignored *)

function soup_uri_decode_data_uri(uri:Pchar; content_type:PPchar):PGBytes;cdecl;external;
function soup_uri_equal(uri1:PGUri; uri2:PGUri):Tgboolean;cdecl;external;
function soup_uri_copy(uri:PGUri; first_component:TSoupURIComponent; args:array of const):PGUri;cdecl;external;
function soup_uri_copy(uri:PGUri; first_component:TSoupURIComponent):PGUri;cdecl;external;
const
  SOUP_HTTP_URI_FLAGS = (((G_URI_FLAGS_HAS_PASSWORD or G_URI_FLAGS_ENCODED_PATH) or G_URI_FLAGS_ENCODED_QUERY) or G_URI_FLAGS_ENCODED_FRAGMENT) or G_URI_FLAGS_SCHEME_NORMALIZE;  

implementation


end.
