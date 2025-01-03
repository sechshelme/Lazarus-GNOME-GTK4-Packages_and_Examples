
unit WebKitApplicationInfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitApplicationInfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitApplicationInfo.h
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
Pguint64  = ^guint64;
PWebKitApplicationInfo  = ^WebKitApplicationInfo;
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
{$ifndef WebKitApplicationInfo_h}
{$define WebKitApplicationInfo_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_APPLICATION_INFO : longint; { return type might be wrong }

type

function webkit_application_info_get_type:TGType;cdecl;external;
function webkit_application_info_new:PWebKitApplicationInfo;cdecl;external;
function webkit_application_info_ref(info:PWebKitApplicationInfo):PWebKitApplicationInfo;cdecl;external;
procedure webkit_application_info_unref(info:PWebKitApplicationInfo);cdecl;external;
(* Const before type ignored *)
procedure webkit_application_info_set_name(info:PWebKitApplicationInfo; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_application_info_get_name(info:PWebKitApplicationInfo):Pgchar;cdecl;external;
procedure webkit_application_info_set_version(info:PWebKitApplicationInfo; major:Tguint64; minor:Tguint64; micro:Tguint64);cdecl;external;
procedure webkit_application_info_get_version(info:PWebKitApplicationInfo; major:Pguint64; minor:Pguint64; micro:Pguint64);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_APPLICATION_INFO : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_APPLICATION_INFO:=webkit_application_info_get_type;
  end;


end.
