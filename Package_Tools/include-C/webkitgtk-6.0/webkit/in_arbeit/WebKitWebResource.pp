
unit WebKitWebResource;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebResource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebResource.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
Pgsize  = ^gsize;
Pguchar  = ^guchar;
PWebKitURIResponse  = ^WebKitURIResponse;
PWebKitWebResource  = ^WebKitWebResource;
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
{$ifndef WebKitWebResource_h}
{$define WebKitWebResource_h}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitURIResponse.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_RESOURCE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebResource, webkit_web_resource, WEBKIT, WEB_RESOURCE, GObject) }
(* Const before type ignored *)
function webkit_web_resource_get_uri(resource:PWebKitWebResource):Pgchar;cdecl;external;
function webkit_web_resource_get_response(resource:PWebKitWebResource):PWebKitURIResponse;cdecl;external;
procedure webkit_web_resource_get_data(resource:PWebKitWebResource; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_web_resource_get_data_finish(resource:PWebKitWebResource; result:PGAsyncResult; length:Pgsize; error:PPGError):Pguchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_RESOURCE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_RESOURCE:=webkit_web_resource_get_type;
  end;


end.
