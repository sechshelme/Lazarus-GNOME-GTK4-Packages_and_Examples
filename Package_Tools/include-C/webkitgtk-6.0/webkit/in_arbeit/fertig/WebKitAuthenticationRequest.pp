
unit WebKitAuthenticationRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitAuthenticationRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitAuthenticationRequest.h
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
PWebKitAuthenticationRequest  = ^WebKitAuthenticationRequest;
PWebKitAuthenticationScheme  = ^WebKitAuthenticationScheme;
PWebKitCredential  = ^WebKitCredential;
PWebKitSecurityOrigin  = ^WebKitSecurityOrigin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2013 Samsung Electronics Inc. All rights reserved.
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
{$ifndef WebKitAuthenticationRequest_h}
{$define WebKitAuthenticationRequest_h}
{$include <webkit/WebKitCredential.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitSecurityOrigin.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_AUTHENTICATION_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitAuthenticationRequest, webkit_authentication_request, WEBKIT, AUTHENTICATION_REQUEST, GObject) }
{*
 * WebKitAuthenticationScheme:
 * @WEBKIT_AUTHENTICATION_SCHEME_DEFAULT: The default authentication scheme of WebKit.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC: Basic authentication scheme as defined in RFC 2617.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST: Digest authentication scheme as defined in RFC 2617.
 * @WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM: HTML Form authentication.
 * @WEBKIT_AUTHENTICATION_SCHEME_NTLM: NTLM Microsoft proprietary authentication scheme.
 * @WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE: Negotiate (or SPNEGO) authentication scheme as defined in RFC 4559.
 * @WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED: Client Certificate Authentication (see RFC 2246).
 * @WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED: Server Trust Authentication.
 * @WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED: Client certificate PIN required for use. Since: 2.34
 * @WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN: Authentication scheme unknown.
 *
 * Enum values representing the authentication scheme.
 *
 * Since: 2.2
  }
type
  PWebKitAuthenticationScheme = ^TWebKitAuthenticationScheme;
  TWebKitAuthenticationScheme =  Longint;
  Const
    WEBKIT_AUTHENTICATION_SCHEME_DEFAULT = 1;
    WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC = 2;
    WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST = 3;
    WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM = 4;
    WEBKIT_AUTHENTICATION_SCHEME_NTLM = 5;
    WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE = 6;
    WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED = 7;
    WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED = 8;
    WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED = 9;
    WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN = 100;
;

function webkit_authentication_request_can_save_credentials(request:PWebKitAuthenticationRequest):Tgboolean;cdecl;external;
procedure webkit_authentication_request_set_can_save_credentials(request:PWebKitAuthenticationRequest; enabled:Tgboolean);cdecl;external;
function webkit_authentication_request_get_proposed_credential(request:PWebKitAuthenticationRequest):PWebKitCredential;cdecl;external;
procedure webkit_authentication_request_set_proposed_credential(request:PWebKitAuthenticationRequest; credential:PWebKitCredential);cdecl;external;
(* Const before type ignored *)
function webkit_authentication_request_get_host(request:PWebKitAuthenticationRequest):Pgchar;cdecl;external;
function webkit_authentication_request_get_port(request:PWebKitAuthenticationRequest):Tguint;cdecl;external;
function webkit_authentication_request_get_security_origin(request:PWebKitAuthenticationRequest):PWebKitSecurityOrigin;cdecl;external;
(* Const before type ignored *)
function webkit_authentication_request_get_realm(request:PWebKitAuthenticationRequest):Pgchar;cdecl;external;
function webkit_authentication_request_get_scheme(request:PWebKitAuthenticationRequest):TWebKitAuthenticationScheme;cdecl;external;
function webkit_authentication_request_is_for_proxy(request:PWebKitAuthenticationRequest):Tgboolean;cdecl;external;
function webkit_authentication_request_is_retry(request:PWebKitAuthenticationRequest):Tgboolean;cdecl;external;
procedure webkit_authentication_request_authenticate(request:PWebKitAuthenticationRequest; credential:PWebKitCredential);cdecl;external;
procedure webkit_authentication_request_cancel(request:PWebKitAuthenticationRequest);cdecl;external;
function webkit_authentication_request_get_certificate_pin_flags(request:PWebKitAuthenticationRequest):TGTlsPasswordFlags;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_AUTHENTICATION_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_AUTHENTICATION_REQUEST:=webkit_authentication_request_get_type;
  end;


end.
