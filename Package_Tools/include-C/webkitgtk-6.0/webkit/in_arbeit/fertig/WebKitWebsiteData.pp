
unit WebKitWebsiteData;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebsiteData.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebsiteData.h
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
PWebKitWebsiteData  = ^WebKitWebsiteData;
PWebKitWebsiteDataTypes  = ^WebKitWebsiteDataTypes;
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
{$ifndef WebKitWebsiteData_h}
{$define WebKitWebsiteData_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_DATA : longint; { return type might be wrong }

type

  PWebKitWebsiteDataTypes = ^TWebKitWebsiteDataTypes;
  TWebKitWebsiteDataTypes =  Longint;
  Const
    WEBKIT_WEBSITE_DATA_MEMORY_CACHE = 1 shl 0;
    WEBKIT_WEBSITE_DATA_DISK_CACHE = 1 shl 1;
    WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE = 1 shl 2;
    WEBKIT_WEBSITE_DATA_SESSION_STORAGE = 1 shl 3;
    WEBKIT_WEBSITE_DATA_LOCAL_STORAGE = 1 shl 4;
    WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES = 1 shl 5;
    WEBKIT_WEBSITE_DATA_COOKIES = 1 shl 6;
    WEBKIT_WEBSITE_DATA_DEVICE_ID_HASH_SALT = 1 shl 7;
    WEBKIT_WEBSITE_DATA_HSTS_CACHE = 1 shl 8;
    WEBKIT_WEBSITE_DATA_ITP = 1 shl 9;
    WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS = 1 shl 10;
    WEBKIT_WEBSITE_DATA_DOM_CACHE = 1 shl 11;
    WEBKIT_WEBSITE_DATA_ALL = (1 shl 12)-1;
;

function webkit_website_data_get_type:TGType;cdecl;external;
function webkit_website_data_ref(website_data:PWebKitWebsiteData):PWebKitWebsiteData;cdecl;external;
procedure webkit_website_data_unref(website_data:PWebKitWebsiteData);cdecl;external;
(* Const before type ignored *)
function webkit_website_data_get_name(website_data:PWebKitWebsiteData):Pchar;cdecl;external;
function webkit_website_data_get_types(website_data:PWebKitWebsiteData):TWebKitWebsiteDataTypes;cdecl;external;
function webkit_website_data_get_size(website_data:PWebKitWebsiteData; types:TWebKitWebsiteDataTypes):Tguint64;cdecl;external;
{$endif}
{ WebKitWebsiteData_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_DATA : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEBSITE_DATA:=webkit_website_data_get_type;
  end;


end.
