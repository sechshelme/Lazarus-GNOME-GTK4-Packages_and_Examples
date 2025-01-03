
unit WebKitPermissionRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitPermissionRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitPermissionRequest.h
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
PWebKitPermissionRequest  = ^WebKitPermissionRequest;
PWebKitPermissionRequestInterface  = ^WebKitPermissionRequestInterface;
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
{$ifndef WebKitPermissionRequest_h}
{$define WebKitPermissionRequest_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_PERMISSION_REQUEST : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (WebKitPermissionRequest, webkit_permission_request, WEBKIT, PERMISSION_REQUEST, GObject) }
type
  PWebKitPermissionRequestInterface = ^TWebKitPermissionRequestInterface;
  TWebKitPermissionRequestInterface = record
      parent_interface : TGTypeInterface;
      allow : procedure (request:PWebKitPermissionRequest);cdecl;
      deny : procedure (request:PWebKitPermissionRequest);cdecl;
    end;


procedure webkit_permission_request_allow(request:PWebKitPermissionRequest);cdecl;external;
procedure webkit_permission_request_deny(request:PWebKitPermissionRequest);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_PERMISSION_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_PERMISSION_REQUEST:=webkit_permission_request_get_type;
  end;


end.
