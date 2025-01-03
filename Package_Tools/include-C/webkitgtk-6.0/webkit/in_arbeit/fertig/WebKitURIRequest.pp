
unit WebKitURIRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitURIRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitURIRequest.h
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
PSoupMessageHeaders  = ^SoupMessageHeaders;
PWebKitURIRequest  = ^WebKitURIRequest;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011 Igalia S.L.
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
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitURIRequest_h}
{$define WebKitURIRequest_h}
{$include <glib-object.h>}
{$include <libsoup/soup.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitURIRequest, webkit_uri_request, WEBKIT, URI_REQUEST, GObject) }
(* Const before type ignored *)
function webkit_uri_request_new(uri:Pgchar):PWebKitURIRequest;cdecl;external;
(* Const before type ignored *)
function webkit_uri_request_get_uri(request:PWebKitURIRequest):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_uri_request_set_uri(request:PWebKitURIRequest; uri:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_uri_request_get_http_method(request:PWebKitURIRequest):Pgchar;cdecl;external;
function webkit_uri_request_get_http_headers(request:PWebKitURIRequest):PSoupMessageHeaders;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_URI_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_URI_REQUEST:=webkit_uri_request_get_type;
  end;


end.
