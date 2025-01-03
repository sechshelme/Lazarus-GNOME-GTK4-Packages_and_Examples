
unit WebKitWebInspector;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebInspector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebInspector.h
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
PWebKitWebInspector  = ^WebKitWebInspector;
PWebKitWebViewBase  = ^WebKitWebViewBase;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$ifndef WebKitWebInspector_h}
{$define WebKitWebInspector_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitWebViewBase.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_INSPECTOR : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebInspector, webkit_web_inspector, WEBKIT, WEB_INSPECTOR, GObject) }
function webkit_web_inspector_get_web_view(inspector:PWebKitWebInspector):PWebKitWebViewBase;cdecl;external;
(* Const before type ignored *)
function webkit_web_inspector_get_inspected_uri(inspector:PWebKitWebInspector):Pchar;cdecl;external;
function webkit_web_inspector_is_attached(inspector:PWebKitWebInspector):Tgboolean;cdecl;external;
procedure webkit_web_inspector_attach(inspector:PWebKitWebInspector);cdecl;external;
procedure webkit_web_inspector_detach(inspector:PWebKitWebInspector);cdecl;external;
procedure webkit_web_inspector_show(inspector:PWebKitWebInspector);cdecl;external;
procedure webkit_web_inspector_close(inspector:PWebKitWebInspector);cdecl;external;
function webkit_web_inspector_get_attached_height(inspector:PWebKitWebInspector):Tguint;cdecl;external;
function webkit_web_inspector_get_can_attach(inspector:PWebKitWebInspector):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_INSPECTOR : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_INSPECTOR:=webkit_web_inspector_get_type;
  end;


end.
