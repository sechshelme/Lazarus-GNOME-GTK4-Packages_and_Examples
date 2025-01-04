
unit WebKitFrame;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitFrame.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitFrame.h
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
PJSCContext  = ^JSCContext;
PWebKitFrame  = ^WebKitFrame;
PWebKitScriptWorld  = ^WebKitScriptWorld;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2013 Igalia S.L.
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
{$if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit-web-process-extension.h> can be included directly."}
{$endif}
{$ifndef WebKitFrame_h}
{$define WebKitFrame_h}
{$include <glib-object.h>}
{$include <jsc/jsc.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitScriptWorld.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_FRAME : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitFrame, webkit_frame, WEBKIT, FRAME, GObject) }
function webkit_frame_get_id(frame:PWebKitFrame):Tguint64;cdecl;external;
function webkit_frame_is_main_frame(frame:PWebKitFrame):Tgboolean;cdecl;external;
(* Const before type ignored *)
function webkit_frame_get_uri(frame:PWebKitFrame):Pgchar;cdecl;external;
function webkit_frame_get_js_context(frame:PWebKitFrame):PJSCContext;cdecl;external;
function webkit_frame_get_js_context_for_script_world(frame:PWebKitFrame; world:PWebKitScriptWorld):PJSCContext;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_FRAME : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FRAME:=webkit_frame_get_type;
  end;


end.
