
unit WebKitPointerLockPermissionRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitPointerLockPermissionRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitPointerLockPermissionRequest.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Igalia S.L.
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
{$ifndef WebKitPointerLockPermissionRequest_h}
{$define WebKitPointerLockPermissionRequest_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitPointerLockPermissionRequest, webkit_pointer_lock_permission_request, WEBKIT, POINTER_LOCK_PERMISSION_REQUEST, GObject) }
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST:=webkit_pointer_lock_permission_request_get_type;
  end;


end.
