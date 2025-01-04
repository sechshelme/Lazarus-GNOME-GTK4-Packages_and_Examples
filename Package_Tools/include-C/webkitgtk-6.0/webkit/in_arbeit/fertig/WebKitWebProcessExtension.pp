
unit WebKitWebProcessExtension;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebProcessExtension.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebProcessExtension.h
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
PGError  = ^GError;
PGVariant  = ^GVariant;
PWebKitUserMessage  = ^WebKitUserMessage;
PWebKitWebPage  = ^WebKitWebPage;
PWebKitWebProcessExtension  = ^WebKitWebProcessExtension;
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
{$ifndef WebKitWebProcessExtension_h}
{$define WebKitWebProcessExtension_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitUserMessage.h>}
{$include <webkit/WebKitWebPage.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_PROCESS_EXTENSION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebProcessExtension, webkit_web_process_extension, WEBKIT, WEB_PROCESS_EXTENSION, GObject) }
{*
 * WebKitWebProcessExtensionInitializeFunction:
 * @extension: a #WebKitWebProcessExtension
 *
 * Type definition for a function that will be called to initialize
 * the web extension when the web process starts.
 *
 * Since: 2.40
  }
type

  TWebKitWebProcessExtensionInitializeFunction = procedure (extension:PWebKitWebProcessExtension);cdecl;
{*
 * WebKitWebProcessExtensionInitializeWithUserDataFunction:
 * @extension: a #WebKitWebProcessExtension
 * @user_data: a #GVariant
 *
 * Type definition for a function that will be called to initialize
 * the web extensions when the web process starts, and which receives
 * as additional argument the user data set with
 * webkit_web_context_set_web_process_extensions_initialization_user_data().
 *
 * Since: 2.40
  }
(* Const before type ignored *)

  TWebKitWebProcessExtensionInitializeWithUserDataFunction = procedure (extension:PWebKitWebProcessExtension; user_data:PGVariant);cdecl;

function webkit_web_process_extension_get_page(extension:PWebKitWebProcessExtension; page_id:Tguint64):PWebKitWebPage;cdecl;external;
procedure webkit_web_process_extension_send_message_to_context(extension:PWebKitWebProcessExtension; message:PWebKitUserMessage; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_web_process_extension_send_message_to_context_finish(extension:PWebKitWebProcessExtension; result:PGAsyncResult; error:PPGError):PWebKitUserMessage;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_PROCESS_EXTENSION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_PROCESS_EXTENSION:=webkit_web_process_extension_get_type;
  end;


end.
