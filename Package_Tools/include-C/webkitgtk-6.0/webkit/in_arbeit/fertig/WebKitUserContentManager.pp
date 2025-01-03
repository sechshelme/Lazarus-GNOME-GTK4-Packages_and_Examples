
unit WebKitUserContentManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitUserContentManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitUserContentManager.h
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
Pgchar  = ^gchar;
PJSCValue  = ^JSCValue;
PWebKitScriptMessageReply  = ^WebKitScriptMessageReply;
PWebKitUserContentFilter  = ^WebKitUserContentFilter;
PWebKitUserContentManager  = ^WebKitUserContentManager;
PWebKitUserScript  = ^WebKitUserScript;
PWebKitUserStyleSheet  = ^WebKitUserStyleSheet;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014, 2020 Igalia S.L.
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
{$ifndef WebKitUserContentManager_h}
{$define WebKitUserContentManager_h}
{$include <glib-object.h>}
{$include <jsc/jsc.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitUserContent.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_MANAGER : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentManager, webkit_user_content_manager, WEBKIT, USER_CONTENT_MANAGER, GObject) }
function webkit_user_content_manager_new:PWebKitUserContentManager;cdecl;external;
procedure webkit_user_content_manager_add_style_sheet(manager:PWebKitUserContentManager; stylesheet:PWebKitUserStyleSheet);cdecl;external;
procedure webkit_user_content_manager_remove_style_sheet(manager:PWebKitUserContentManager; stylesheet:PWebKitUserStyleSheet);cdecl;external;
procedure webkit_user_content_manager_remove_all_style_sheets(manager:PWebKitUserContentManager);cdecl;external;
{*
 * webkit_user_content_manager_register_script_message_handler:
 * @manager: A #WebKitUserContentManager
 * @name: Name of the script message channel
 * @world_name: (nullable): the name of a #WebKitScriptWorld
 *
 * Registers a new user script message handler in script world.
 *
 * After it is registered,
 * scripts can use `window.webkit.messageHandlers.<name>.postMessage(value)`
 * to send messages. Those messages are received by connecting handlers
 * to the #WebKitUserContentManager::script-message-received signal. The
 * handler name is used as the detail of the signal. To avoid race
 * conditions between registering the handler name, and starting to
 * receive the signals, it is recommended to connect to the signal
 * *before* registering the handler name:
 *
 * ```c
 * WebKitWebView *view = webkit_web_view_new ();
 * WebKitUserContentManager *manager = webkit_web_view_get_user_content_manager ();
 * g_signal_connect (manager, "script-message-received::foobar",
 *                   G_CALLBACK (handle_script_message), NULL);
 * webkit_user_content_manager_register_script_message_handler (manager, "foobar");
 * ```
 *
 * Registering a script message handler will fail if the requested
 * name has been already registered before.
 *
 * If %NULL is passed as the @world_name, the default world will be used.
 *
 * The registered handler can be unregistered by using
 * webkit_user_content_manager_unregister_script_message_handler().
 *
 * Returns: %TRUE if message handler was registered successfully, or %FALSE otherwise.
 *
 * Since: 2.40
  }
(* Const before type ignored *)
(* Const before type ignored *)
function webkit_user_content_manager_register_script_message_handler(manager:PWebKitUserContentManager; name:Pchar; world_name:Pchar):Tgboolean;cdecl;external;
{*
 * webkit_user_content_manager_unregister_script_message_handler:
 * @manager: A #WebKitUserContentManager
 * @name: Name of the script message channel
 * @world_name: (nullable): the name of a #WebKitScriptWorld
 *
 * Unregisters a previously registered message handler in script world with name @world_name.
 * If %NULL is passed as the @world_name, the default world will be used.
 *
 * Note that this does *not* disconnect handlers for the
 * #WebKitUserContentManager::script-message-received signal;
 * they will be kept connected, but the signal will not be emitted
 * unless the handler name is registered again.
 *
 * See also webkit_user_content_manager_register_script_message_handler().
 *
 * Since: 2.40
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure webkit_user_content_manager_unregister_script_message_handler(manager:PWebKitUserContentManager; name:Pgchar; world_name:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function webkit_user_content_manager_register_script_message_handler_with_reply(manager:PWebKitUserContentManager; name:Pchar; world_name:Pchar):Tgboolean;cdecl;external;
procedure webkit_user_content_manager_add_script(manager:PWebKitUserContentManager; script:PWebKitUserScript);cdecl;external;
procedure webkit_user_content_manager_remove_script(manager:PWebKitUserContentManager; script:PWebKitUserScript);cdecl;external;
procedure webkit_user_content_manager_remove_all_scripts(manager:PWebKitUserContentManager);cdecl;external;
procedure webkit_user_content_manager_add_filter(manager:PWebKitUserContentManager; filter:PWebKitUserContentFilter);cdecl;external;
procedure webkit_user_content_manager_remove_filter(manager:PWebKitUserContentManager; filter:PWebKitUserContentFilter);cdecl;external;
(* Const before type ignored *)
procedure webkit_user_content_manager_remove_filter_by_id(manager:PWebKitUserContentManager; filter_id:Pchar);cdecl;external;
procedure webkit_user_content_manager_remove_all_filters(manager:PWebKitUserContentManager);cdecl;external;
{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY : longint; { return type might be wrong }

type

function webkit_script_message_reply_get_type:TGType;cdecl;external;
function webkit_script_message_reply_ref(script_message_reply:PWebKitScriptMessageReply):PWebKitScriptMessageReply;cdecl;external;
procedure webkit_script_message_reply_unref(script_message_reply:PWebKitScriptMessageReply);cdecl;external;
procedure webkit_script_message_reply_return_value(script_message_reply:PWebKitScriptMessageReply; reply_value:PJSCValue);cdecl;external;
(* Const before type ignored *)
procedure webkit_script_message_reply_return_error_message(script_message_reply:PWebKitScriptMessageReply; error_message:Pchar);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_CONTENT_MANAGER:=webkit_user_content_manager_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY:=webkit_script_message_reply_get_type;
  end;


end.
