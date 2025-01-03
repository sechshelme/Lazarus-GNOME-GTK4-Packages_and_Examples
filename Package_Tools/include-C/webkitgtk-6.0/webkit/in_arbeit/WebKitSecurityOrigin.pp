
unit WebKitSecurityOrigin;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitSecurityOrigin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitSecurityOrigin.h
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
PWebKitSecurityOrigin  = ^WebKitSecurityOrigin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017 Igalia S.L.
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
{$ifndef WebKitSecurityOrigin_h}
{$define WebKitSecurityOrigin_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_SECURITY_ORIGIN : longint; { return type might be wrong }

type

function webkit_security_origin_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function webkit_security_origin_new(protocol:Pgchar; host:Pgchar; port:Tguint16):PWebKitSecurityOrigin;cdecl;external;
(* Const before type ignored *)
function webkit_security_origin_new_for_uri(uri:Pgchar):PWebKitSecurityOrigin;cdecl;external;
function webkit_security_origin_ref(origin:PWebKitSecurityOrigin):PWebKitSecurityOrigin;cdecl;external;
procedure webkit_security_origin_unref(origin:PWebKitSecurityOrigin);cdecl;external;
(* Const before type ignored *)
function webkit_security_origin_get_protocol(origin:PWebKitSecurityOrigin):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_security_origin_get_host(origin:PWebKitSecurityOrigin):Pgchar;cdecl;external;
function webkit_security_origin_get_port(origin:PWebKitSecurityOrigin):Tguint16;cdecl;external;
function webkit_security_origin_to_string(origin:PWebKitSecurityOrigin):Pgchar;cdecl;external;
{$endif}
{ WebKitSecurityOrigin_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_SECURITY_ORIGIN : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SECURITY_ORIGIN:=webkit_security_origin_get_type;
  end;


end.
