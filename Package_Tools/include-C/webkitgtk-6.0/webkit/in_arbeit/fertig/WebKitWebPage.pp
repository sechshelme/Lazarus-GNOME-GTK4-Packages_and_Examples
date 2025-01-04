
unit WebKitWebPage;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebPage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebPage.h
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
PWebKitFrame  = ^WebKitFrame;
PWebKitScriptWorld  = ^WebKitScriptWorld;
PWebKitUserMessage  = ^WebKitUserMessage;
PWebKitWebEditor  = ^WebKitWebEditor;
PWebKitWebFormManager  = ^WebKitWebFormManager;
PWebKitWebPage  = ^WebKitWebPage;
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
{$if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit-web-process-extension.h> can be included directly."}
{$endif}
{$ifndef WebKitWebPage_h}
{$define WebKitWebPage_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitFrame.h>}
{$include <webkit/WebKitUserMessage.h>}
{$include <webkit/WebKitWebEditor.h>}
{$include <webkit/WebKitWebFormManager.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_PAGE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebPage, webkit_web_page, WEBKIT, WEB_PAGE, GObject) }
{ Forward declarations  }
type

function webkit_web_page_get_id(web_page:PWebKitWebPage):Tguint64;cdecl;external;
(* Const before type ignored *)
function webkit_web_page_get_uri(web_page:PWebKitWebPage):Pgchar;cdecl;external;
function webkit_web_page_get_main_frame(web_page:PWebKitWebPage):PWebKitFrame;cdecl;external;
function webkit_web_page_get_editor(web_page:PWebKitWebPage):PWebKitWebEditor;cdecl;external;
function webkit_web_page_get_form_manager(web_page:PWebKitWebPage; world:PWebKitScriptWorld):PWebKitWebFormManager;cdecl;external;
procedure webkit_web_page_send_message_to_view(web_page:PWebKitWebPage; message:PWebKitUserMessage; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_web_page_send_message_to_view_finish(web_page:PWebKitWebPage; result:PGAsyncResult; error:PPGError):PWebKitUserMessage;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_PAGE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_PAGE:=webkit_web_page_get_type;
  end;


end.
