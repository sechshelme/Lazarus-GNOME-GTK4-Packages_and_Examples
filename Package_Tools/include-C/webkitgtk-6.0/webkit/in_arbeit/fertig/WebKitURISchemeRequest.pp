
unit WebKitURISchemeRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitURISchemeRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitURISchemeRequest.h
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
PGInputStream  = ^GInputStream;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PWebKitURISchemeRequest  = ^WebKitURISchemeRequest;
PWebKitURISchemeResponse  = ^WebKitURISchemeResponse;
PWebKitWebView  = ^WebKitWebView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$ifndef WebKitURISchemeRequest_h}
{$define WebKitURISchemeRequest_h}
{$include <glib-object.h>}
{$include <libsoup/soup.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitURISchemeResponse.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_SCHEME_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitURISchemeRequest, webkit_uri_scheme_request, WEBKIT, URI_SCHEME_REQUEST, GObject) }
type
(* Const before type ignored *)

function webkit_uri_scheme_request_get_scheme(request:PWebKitURISchemeRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_uri_scheme_request_get_uri(request:PWebKitURISchemeRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_uri_scheme_request_get_path(request:PWebKitURISchemeRequest):Pgchar;cdecl;external;
function webkit_uri_scheme_request_get_web_view(request:PWebKitURISchemeRequest):PWebKitWebView;cdecl;external;
(* Const before type ignored *)
function webkit_uri_scheme_request_get_http_method(request:PWebKitURISchemeRequest):Pgchar;cdecl;external;
function webkit_uri_scheme_request_get_http_headers(request:PWebKitURISchemeRequest):PSoupMessageHeaders;cdecl;external;
function webkit_uri_scheme_request_get_http_body(request:PWebKitURISchemeRequest):PGInputStream;cdecl;external;
(* Const before type ignored *)
procedure webkit_uri_scheme_request_finish(request:PWebKitURISchemeRequest; stream:PGInputStream; stream_length:Tgint64; content_type:Pgchar);cdecl;external;
procedure webkit_uri_scheme_request_finish_with_response(request:PWebKitURISchemeRequest; response:PWebKitURISchemeResponse);cdecl;external;
procedure webkit_uri_scheme_request_finish_error(request:PWebKitURISchemeRequest; error:PGError);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_SCHEME_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_URI_SCHEME_REQUEST:=webkit_uri_scheme_request_get_type;
  end;


end.
