
unit WebKitCookieManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitCookieManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitCookieManager.h
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
PGList  = ^GList;
PSoupCookie  = ^SoupCookie;
PWebKitCookieAcceptPolicy  = ^WebKitCookieAcceptPolicy;
PWebKitCookieManager  = ^WebKitCookieManager;
PWebKitCookiePersistentStorage  = ^WebKitCookiePersistentStorage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
 * Copyright (C) 2017 Endless Mobile, Inc.
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
{$ifndef WebKitCookieManager_h}
{$define WebKitCookieManager_h}
{$include <gio/gio.h>}
{$include <glib-object.h>}
{$include <libsoup/soup.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_COOKIE_MANAGER : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitCookieManager, webkit_cookie_manager, WEBKIT, COOKIE_MANAGER, GObject) }
{*
 * WebKitCookiePersistentStorage:
 * @WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT: Cookies are stored in a text
 *  file in the Mozilla "cookies.txt" format.
 * @WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE: Cookies are stored in a SQLite
 *  file in the current Mozilla format.
 *
 * Enum values used to denote the cookie persistent storage types.
  }
type
  PWebKitCookiePersistentStorage = ^TWebKitCookiePersistentStorage;
  TWebKitCookiePersistentStorage =  Longint;
  Const
    WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT = 0;
    WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE = 1;
;
{*
 * WebKitCookieAcceptPolicy:
 * @WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS: Accept all cookies unconditionally.
 * @WEBKIT_COOKIE_POLICY_ACCEPT_NEVER: Reject all cookies unconditionally.
 * @WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY: Accept only cookies set by the main document loaded.
 *
 * Enum values used to denote the cookie acceptance policies.
  }
type
  PWebKitCookieAcceptPolicy = ^TWebKitCookieAcceptPolicy;
  TWebKitCookieAcceptPolicy =  Longint;
  Const
    WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS = 0;
    WEBKIT_COOKIE_POLICY_ACCEPT_NEVER = 1;
    WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY = 2;
;
(* Const before type ignored *)

procedure webkit_cookie_manager_set_persistent_storage(cookie_manager:PWebKitCookieManager; filename:Pgchar; storage:TWebKitCookiePersistentStorage);cdecl;external;
procedure webkit_cookie_manager_set_accept_policy(cookie_manager:PWebKitCookieManager; policy:TWebKitCookieAcceptPolicy);cdecl;external;
procedure webkit_cookie_manager_get_accept_policy(cookie_manager:PWebKitCookieManager; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_get_accept_policy_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):TWebKitCookieAcceptPolicy;cdecl;external;
procedure webkit_cookie_manager_add_cookie(cookie_manager:PWebKitCookieManager; cookie:PSoupCookie; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_add_cookie_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_cookie_manager_get_cookies(cookie_manager:PWebKitCookieManager; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_get_cookies_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
procedure webkit_cookie_manager_delete_cookie(cookie_manager:PWebKitCookieManager; cookie:PSoupCookie; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_delete_cookie_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure webkit_cookie_manager_replace_cookies(cookie_manager:PWebKitCookieManager; cookies:PGList; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_replace_cookies_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure webkit_cookie_manager_get_all_cookies(cookie_manager:PWebKitCookieManager; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_cookie_manager_get_all_cookies_finish(cookie_manager:PWebKitCookieManager; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_COOKIE_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_COOKIE_MANAGER:=webkit_cookie_manager_get_type;
  end;


end.
