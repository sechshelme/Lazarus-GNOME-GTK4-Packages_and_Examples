
unit WebKitPermissionStateQuery;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitPermissionStateQuery.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitPermissionStateQuery.h
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
PWebKitPermissionState  = ^WebKitPermissionState;
PWebKitPermissionStateQuery  = ^WebKitPermissionStateQuery;
PWebKitSecurityOrigin  = ^WebKitSecurityOrigin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Igalia S.L.
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
{$ifndef WebKitPermissionStateQuery_h}
{$define WebKitPermissionStateQuery_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitSecurityOrigin.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_PERMISSION_STATE_QUERY : longint; { return type might be wrong }

type
{*
 * WebKitPermissionState:
 * @WEBKIT_PERMISSION_STATE_GRANTED: Access to the feature is granted.
 * @WEBKIT_PERMISSION_STATE_DENIED: Access to the feature is denied.
 * @WEBKIT_PERMISSION_STATE_PROMPT: Access to the feature has to be requested via user prompt.
 *
 * Enum values representing query permission results.
 *
 * Since: 2.40
  }

  PWebKitPermissionState = ^TWebKitPermissionState;
  TWebKitPermissionState =  Longint;
  Const
    WEBKIT_PERMISSION_STATE_GRANTED = 0;
    WEBKIT_PERMISSION_STATE_DENIED = 1;
    WEBKIT_PERMISSION_STATE_PROMPT = 2;
;

function webkit_permission_state_query_get_type:TGType;cdecl;external;
function webkit_permission_state_query_ref(query:PWebKitPermissionStateQuery):PWebKitPermissionStateQuery;cdecl;external;
procedure webkit_permission_state_query_unref(query:PWebKitPermissionStateQuery);cdecl;external;
(* Const before type ignored *)
function webkit_permission_state_query_get_name(query:PWebKitPermissionStateQuery):Pgchar;cdecl;external;
function webkit_permission_state_query_get_security_origin(query:PWebKitPermissionStateQuery):PWebKitSecurityOrigin;cdecl;external;
procedure webkit_permission_state_query_finish(query:PWebKitPermissionStateQuery; state:TWebKitPermissionState);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_PERMISSION_STATE_QUERY : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_PERMISSION_STATE_QUERY:=webkit_permission_state_query_get_type;
  end;


end.
