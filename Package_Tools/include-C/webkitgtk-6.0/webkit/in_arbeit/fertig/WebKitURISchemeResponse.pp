
unit WebKitURISchemeResponse;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitURISchemeResponse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitURISchemeResponse.h
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
PGInputStream  = ^GInputStream;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PWebKitURISchemeResponse  = ^WebKitURISchemeResponse;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Zixing Liu
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
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitURISchemeResponse_h}
{$define WebKitURISchemeResponse_h}
{$include <glib-object.h>}
{$include <libsoup/soup.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_SCHEME_RESPONSE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitURISchemeResponse, webkit_uri_scheme_response, WEBKIT, URI_SCHEME_RESPONSE, GObject) }
function webkit_uri_scheme_response_new(input_stream:PGInputStream; stream_length:Tgint64):PWebKitURISchemeResponse;cdecl;external;
(* Const before type ignored *)
procedure webkit_uri_scheme_response_set_status(response:PWebKitURISchemeResponse; status_code:Tguint; reason_phrase:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure webkit_uri_scheme_response_set_content_type(response:PWebKitURISchemeResponse; content_type:Pgchar);cdecl;external;
procedure webkit_uri_scheme_response_set_http_headers(response:PWebKitURISchemeResponse; headers:PSoupMessageHeaders);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_SCHEME_RESPONSE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_URI_SCHEME_RESPONSE:=webkit_uri_scheme_response_get_type;
  end;


end.
