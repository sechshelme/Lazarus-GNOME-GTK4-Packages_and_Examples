
unit WebKitFaviconDatabase;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitFaviconDatabase.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitFaviconDatabase.h
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
PGdkTexture  = ^GdkTexture;
PGError  = ^GError;
PWebKitFaviconDatabase  = ^WebKitFaviconDatabase;
PWebKitFaviconDatabaseError  = ^WebKitFaviconDatabaseError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012, 2017 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
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
{$ifndef WebKitFaviconDatabase_h}
{$define WebKitFaviconDatabase_h}
{$include <gio/gio.h>}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_FAVICON_DATABASE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitFaviconDatabase, webkit_favicon_database, WEBKIT, FAVICON_DATABASE, GObject) }
{ was #define dname def_expr }
function WEBKIT_FAVICON_DATABASE_ERROR : longint; { return type might be wrong }

{*
 * WebKitFaviconDatabaseError:
 * @WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED: The #WebKitFaviconDatabase is closed
 * @WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND: There is not an icon available for the requested URL
 * @WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN: There might be an icon for the requested URL, but its data is unknown at the moment
 *
 * Enum values used to denote the various errors related to the #WebKitFaviconDatabase.
 * }
type
  PWebKitFaviconDatabaseError = ^TWebKitFaviconDatabaseError;
  TWebKitFaviconDatabaseError =  Longint;
  Const
    WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED = 0;
    WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND = 1;
    WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN = 2;
;

function webkit_favicon_database_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
procedure webkit_favicon_database_get_favicon(database:PWebKitFaviconDatabase; page_uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_favicon_database_get_favicon_finish(database:PWebKitFaviconDatabase; result:PGAsyncResult; error:PPGError):PGdkTexture;cdecl;external;
(* Const before type ignored *)
function webkit_favicon_database_get_favicon_uri(database:PWebKitFaviconDatabase; page_uri:Pgchar):Pgchar;cdecl;external;
procedure webkit_favicon_database_clear(database:PWebKitFaviconDatabase);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_FAVICON_DATABASE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FAVICON_DATABASE:=webkit_favicon_database_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_FAVICON_DATABASE_ERROR : longint; { return type might be wrong }
  begin
    WEBKIT_FAVICON_DATABASE_ERROR:=webkit_favicon_database_error_quark;
  end;


end.
