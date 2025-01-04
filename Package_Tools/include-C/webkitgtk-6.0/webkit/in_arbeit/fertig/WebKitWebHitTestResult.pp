
unit WebKitWebHitTestResult;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebHitTestResult.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebHitTestResult.h
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
PJSCValue  = ^JSCValue;
PWebKitScriptWorld  = ^WebKitScriptWorld;
PWebKitWebHitTestResult  = ^WebKitWebHitTestResult;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Igalia S.L.
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
{$ifndef WebKitWebHitTestResult_h}
{$define WebKitWebHitTestResult_h}
{$include <glib-object.h>}
{$include <jsc/jsc.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitHitTestResult.h>}
{$include <webkit/WebKitScriptWorld.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_HIT_TEST_RESULT : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebHitTestResult, webkit_web_hit_test_result, WEBKIT, WEB_HIT_TEST_RESULT, GObject) }
function webkit_web_hit_test_result_get_context(web_hit_test_result:PWebKitWebHitTestResult):Tguint;cdecl;external;
function webkit_web_hit_test_result_context_is_link(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
function webkit_web_hit_test_result_context_is_image(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
function webkit_web_hit_test_result_context_is_media(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
function webkit_web_hit_test_result_context_is_editable(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
function webkit_web_hit_test_result_context_is_selection(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
(* Const before type ignored *)
function webkit_web_hit_test_result_get_link_uri(web_hit_test_result:PWebKitWebHitTestResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_web_hit_test_result_get_link_title(web_hit_test_result:PWebKitWebHitTestResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_web_hit_test_result_get_link_label(web_hit_test_result:PWebKitWebHitTestResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_web_hit_test_result_get_image_uri(web_hit_test_result:PWebKitWebHitTestResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_web_hit_test_result_get_media_uri(web_hit_test_result:PWebKitWebHitTestResult):Pgchar;cdecl;external;
function webkit_web_hit_test_result_context_is_scrollbar(web_hit_test_result:PWebKitWebHitTestResult):Tgboolean;cdecl;external;
function webkit_web_hit_test_result_get_js_node(web_hit_test_result:PWebKitWebHitTestResult; world:PWebKitScriptWorld):PJSCValue;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_HIT_TEST_RESULT : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_HIT_TEST_RESULT:=webkit_web_hit_test_result_get_type;
  end;


end.
