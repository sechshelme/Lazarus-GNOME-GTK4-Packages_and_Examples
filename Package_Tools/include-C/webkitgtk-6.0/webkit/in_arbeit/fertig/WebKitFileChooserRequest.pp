
unit WebKitFileChooserRequest;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitFileChooserRequest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitFileChooserRequest.h
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
PGtkFileFilter  = ^GtkFileFilter;
PWebKitFileChooserRequest  = ^WebKitFileChooserRequest;
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
{$ifndef WebKitFileChooserRequest_h}
{$define WebKitFileChooserRequest_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_FILE_CHOOSER_REQUEST : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitFileChooserRequest, webkit_file_chooser_request, WEBKIT, FILE_CHOOSER_REQUEST, GObject) }
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_file_chooser_request_get_mime_types(request:PWebKitFileChooserRequest):^Pgchar;cdecl;external;
function webkit_file_chooser_request_get_mime_types_filter(request:PWebKitFileChooserRequest):PGtkFileFilter;cdecl;external;
function webkit_file_chooser_request_get_select_multiple(request:PWebKitFileChooserRequest):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure webkit_file_chooser_request_select_files(request:PWebKitFileChooserRequest; files:PPgchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_file_chooser_request_get_selected_files(request:PWebKitFileChooserRequest):^Pgchar;cdecl;external;
procedure webkit_file_chooser_request_cancel(request:PWebKitFileChooserRequest);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_FILE_CHOOSER_REQUEST : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FILE_CHOOSER_REQUEST:=webkit_file_chooser_request_get_type;
  end;


end.
