
unit WebKitGeolocationManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitGeolocationManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitGeolocationManager.h
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
PWebKitGeolocationManager  = ^WebKitGeolocationManager;
PWebKitGeolocationPosition  = ^WebKitGeolocationPosition;
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
{$ifndef WebKitGeolocationManager_h}
{$define WebKitGeolocationManager_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_GEOLOCATION_MANAGER : longint; { return type might be wrong }

{ WEBKIT_DECLARE_FINAL_TYPE (WebKitGeolocationManager, webkit_geolocation_manager, WEBKIT, GEOLOCATION_MANAGER, GObject) }
{ was #define dname def_expr }
function WEBKIT_TYPE_GEOLOCATION_POSITION : longint; { return type might be wrong }

type

procedure webkit_geolocation_manager_update_position(manager:PWebKitGeolocationManager; position:PWebKitGeolocationPosition);cdecl;external;
(* Const before type ignored *)
procedure webkit_geolocation_manager_failed(manager:PWebKitGeolocationManager; error_message:Pchar);cdecl;external;
function webkit_geolocation_manager_get_enable_high_accuracy(manager:PWebKitGeolocationManager):Tgboolean;cdecl;external;
function webkit_geolocation_position_get_type:TGType;cdecl;external;
function webkit_geolocation_position_new(latitude:Tdouble; longitude:Tdouble; accuracy:Tdouble):PWebKitGeolocationPosition;cdecl;external;
function webkit_geolocation_position_copy(position:PWebKitGeolocationPosition):PWebKitGeolocationPosition;cdecl;external;
procedure webkit_geolocation_position_free(position:PWebKitGeolocationPosition);cdecl;external;
procedure webkit_geolocation_position_set_timestamp(position:PWebKitGeolocationPosition; timestamp:Tguint64);cdecl;external;
procedure webkit_geolocation_position_set_altitude(position:PWebKitGeolocationPosition; altitude:Tdouble);cdecl;external;
procedure webkit_geolocation_position_set_altitude_accuracy(position:PWebKitGeolocationPosition; altitude_accuracy:Tdouble);cdecl;external;
procedure webkit_geolocation_position_set_heading(position:PWebKitGeolocationPosition; heading:Tdouble);cdecl;external;
procedure webkit_geolocation_position_set_speed(position:PWebKitGeolocationPosition; speed:Tdouble);cdecl;external;
{$endif}
{ WebKitGeolocationManager_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_GEOLOCATION_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_GEOLOCATION_MANAGER:=webkit_geolocation_manager_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_GEOLOCATION_POSITION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_GEOLOCATION_POSITION:=webkit_geolocation_position_get_type;
  end;


end.
