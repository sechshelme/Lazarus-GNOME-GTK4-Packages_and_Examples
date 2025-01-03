
unit WebKitDownload;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitDownload.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitDownload.h
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
PWebKitDownload  = ^WebKitDownload;
PWebKitURIRequest  = ^WebKitURIRequest;
PWebKitURIResponse  = ^WebKitURIResponse;
PWebKitWebView  = ^WebKitWebView;
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
{$ifndef WebKitDownload_h}
{$define WebKitDownload_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitURIRequest.h>}
{$include <webkit/WebKitURIResponse.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_DOWNLOAD : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitDownload, webkit_download, WEBKIT, DOWNLOAD, GObject) }
type

function webkit_download_get_request(download:PWebKitDownload):PWebKitURIRequest;cdecl;external;
(* Const before type ignored *)
function webkit_download_get_destination(download:PWebKitDownload):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_download_set_destination(download:PWebKitDownload; destination:Pgchar);cdecl;external;
function webkit_download_get_response(download:PWebKitDownload):PWebKitURIResponse;cdecl;external;
procedure webkit_download_cancel(download:PWebKitDownload);cdecl;external;
function webkit_download_get_estimated_progress(download:PWebKitDownload):Tgdouble;cdecl;external;
function webkit_download_get_elapsed_time(download:PWebKitDownload):Tgdouble;cdecl;external;
function webkit_download_get_received_data_length(download:PWebKitDownload):Tguint64;cdecl;external;
function webkit_download_get_web_view(download:PWebKitDownload):PWebKitWebView;cdecl;external;
function webkit_download_get_allow_overwrite(download:PWebKitDownload):Tgboolean;cdecl;external;
procedure webkit_download_set_allow_overwrite(download:PWebKitDownload; allowed:Tgboolean);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_DOWNLOAD : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_DOWNLOAD:=webkit_download_get_type;
  end;


end.
